require "bundler/gem_tasks"
require "jekyll"
require "listen"
require "yaml"
require 'fileutils'
require 'date'

NEWS_PATHNAME = '_posts/*'

def listen_ignore_paths(base, options)
  [
    /_config\.ya?ml/,
    /_site/,
    /\.jekyll-metadata/
  ]
end

def local_render_yaml(news_pathname)
    basename = Pathname.new('.').expand_path
    Dir[basename.join(news_pathname).to_s].each do |post|
        html = ''
        html << <<-EOF
<section class="page__content" itemprop="text">
<hr />
<h2>This week in technology, open source, and Linux!</h2>

<h2>Disclaimer</h2>
<ul>
  <li> The views expressed in this presentation are those of the presentator(s).</li>
  <li> They are not endorsed by or affiliated with any of the people, companies, or entities mentioned.</li>
  <li> No guarantees are made that the information in this presentation are free of errors.</li>
</ul>

<h2>Contributing to the weekly rundown</h2>
<ul>
   <li>Have something you'd like to talk about or see on the weekly meetings?</li>
   <li>Feel free to add it to the weekly rundown!</li>
   <li>Repository is available on <a href="https://github.com/OSUOSC/osc-weekly-rundown">Github</a></li>
</ul>
EOF
        File.open(post, 'a') do |file|
            file.puts html
        end
        page = YAML.load_file(post)
        page['stories'].each do |story|
            html = ''
            html << <<-EOF
{% page_break %}
<hr />
# [#{story["title"]}](#{story["link"]})
![](#{story["image"]})
#{story["notes"]}
EOF
            File.open(post, 'a') do |file|
                file.puts html
            end
        end
        html = ''
        html << <<-HTML
{% page_break %}
<hr />
<h1>Fin</h1>
<ul>
  <li>Anything we missed?</li>
  <li>Feel free to share!</li>
</ul>
HTML
        File.open(post, 'a') do |file|
            file.puts html
        end
    end
end

#
# This is the way to get the content of the file after the YAML front matter
#
def local_clear_yaml(news_pathname)
    basename = Pathname.new('.').expand_path
    Dir[basename.join(news_pathname).to_s].each do |post|
        yaml = File.read(post)[/\A---(.|\n)*?---/]
        File.open(post, 'w') do |file|
            file.puts yaml
        end
    end
end

def new_post_template()
    base = Pathname.new('.').expand_path
    skel = ''
    skel << <<-EOF
---
layout: multipage
multipage: true
collection: news
stories:
    - title: ""
      link: ""
      image: ""
      notes: |
---
EOF
    date = Date.parse('Thursday')
    delta = date > Date.today ? 0 : 7
    ndate = date + delta
    file_date = ndate.strftime('%Y-%m-%d')
    if File.exist? File.expand_path "#{base}/_posts/#{file_date}-meeting.md"
        puts "File for the next meeting already exists at: #{base}/_posts/#{file_date}-meeting.md"
    else
        File.open("#{base}/_posts/#{file_date}-meeting.md", 'wb') do |file|
            file.puts skel
        end
    end
end

def enter_event(file, date, event)
    # Get the yaml info fo the post
    page = YAML.load_file(event)
    # default for "meeting" is "success"
    btn_type = "success"
    case page['type']
    when "Convention"
        btn_type = "warning"
    when "Party"
        btn_type = "danger"
    end
    tmp_file = File.open("/tmp/calendar.tmp", 'w')
    #tmp = ''
    File.readlines(file).each do |line|
        idx = line.index(date.strftime(' %d')).to_i
        if idx > 0
            idx = idx + date.strftime(' %d').length
            tmp_file << line.insert(idx, "<br /> [#{page['title']}](/events/#{event.rpartition('/')[2][0..-4]}/){: .btn .btn--#{btn_type}}")
        else
            #tmp << line
            tmp_file << line
        end
    end
    tmp_file.close
    FileUtils.mv(tmp_file, file)
    #puts tmp
end

def calendar_skeleton(basename, date)
    File.open("#{basename}/_calendar/#{date.strftime('%Y-%m')}-01-calendar.md", 'wb') do |file|
        # What day of the week is the first in numbers? Sunday is zero
        first_day_num = Date.new(date.year, date.month, 01).strftime('%w').to_i
        # What is the last day fo the month
        # The append here is actually an "add 'n' to month" command
        last_day_date = Date.new(date.year, (date >> 1).month, 01)
        # A raw '-' subtracts one day from the date
        last_day_num = (last_day_date - 1).strftime('%d').to_i
        # Since we're using the full jekyll file format (YYYY-MM-DD-title.md) to get the date,
        # we are going to make the url pretty.
        table = "---\npermalink: /calendar/#{date.strftime('%Y-%m')}/\n---\n"
        table << <<-EOF
|Sun|Mon|Tue|Wed|Thu|Fri|Sat|
|:---:||:---:|:---:|:---:|:---:|:---:|:---:|
EOF
        # First row - have to factor in first_day_num
        str = "| "
        table << "#{str.ljust((first_day_num * 2 + 2), str)}"
        current_day = 1
        (1..(7 - first_day_num )).each do |i|
            table << "#{i.to_s.rjust(2, "0")} | "
            current_day += 1
        end
        table << "\n"
        # Cycle through the full weeks
        while (eow = (current_day + 7)) < last_day_num do
            while current_day < eow do
                table << "| #{current_day.to_s.rjust(2, "0")}"
                current_day += 1
            end
            table << " |\n"
        end
        # Finish it off
        end_padding = (7 - (last_day_num - current_day))
        ((current_day)..(last_day_num)).each do |i|
            table << "| #{current_day.to_s.rjust(2, "0")}"
            current_day += 1
        end
        str = "| "
        # Fix off-by-one error
        (1..(end_padding)).each do |_|
            #table << "#{str.ljust((end_padding - 1), str)}"
            table << " |"
        end
        file.puts table
    end
end


#
# TODO: Support events with multiple date ranges
#
def populate_calendar(basename)
    calendar_directory = '_calendar/'
    events_directory = '_events/'
    # TODO: Make sure this is ruby-esque
    FileUtils.rm_rf(basename.join(calendar_directory).to_s)
    FileUtils::mkdir_p(basename.join(calendar_directory).to_s)
    Dir[basename.join(events_directory).to_s + "*"].each do |event|
        date = Date.strptime(event.rpartition('/')[2][0..9], '%Y-%m-%d')
        month_file = "#{basename}/_calendar/#{date.strftime('%Y-%m')}-01-calendar.md"
        # Create current month's file right off the bat, b/c we link to that and it _always_ needs to exist, even if it's during the summer, and there are no events that month
        calendar_skeleton(basename, Date.today)
        if File.exist? File.path(month_file)
            enter_event(month_file, date, event)
        else
            # File not yet created - create the calendar skeleton and populate file
            calendar_skeleton(basename, date)
            enter_event(month_file, date, event)
        end
    end
end

task :clean do
    local_clear_yaml(NEWS_PATHNAME)
    basename = Pathname.new('.').expand_path
    FileUtils.rm_rf(basename.join('_site/').to_s)

end

task :gen_site do
  # Clean shit up first
  basename = Pathname.new('.').expand_path
  FileUtils.rm_rf(basename.join('_site/').to_s)
  FileUtils.rm_rf(basename.join('_calendar/').to_s)
  local_clear_yaml(NEWS_PATHNAME)

  # Render site
  local_render_yaml(NEWS_PATHNAME)
  populate_calendar(basename)
  options = {
    "destination"   => basename.join('_site').to_s,
    "theme"         => "minimal-mistakes-jekyll",
    "future"        => true
  }
  options = Jekyll.configuration(options)
  site = Jekyll::Site.new(options)
  Jekyll::Command.process_site(site)

  # Clean up our mess, but leave `_site/`
  local_clear_yaml(NEWS_PATHNAME)
end

task :new_post do
    FileUtils.rm_rf(basename.join('_site/').to_s)
    FileUtils.rm_rf(basename.join('_calendar/').to_s)
    local_clear_yaml(NEWS_PATHNAME)
    new_post_template()
end
