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

<hr />

<h2>Stories</h2>
<ul>
EOF
        File.open(post, 'a') do |file|
            file.puts html
        end
        page = YAML.load_file(post)
        page['stories'].each_with_index do |story,index|
            html = ''
            html << <<-EOF
  <li><a href="{{ page.multipage.first_path | absolute_url }}#{if index!=1 then "#{index + 2}" + '/' end}">#{story["title"]}</a></li>
EOF
            File.open(post, 'a') do |file|
                file.puts html
            end
        end
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
def local_clear_yaml(pathname)
    basename = Pathname.new('.').expand_path
    Dir[basename.join(pathname).to_s].each do |post|
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

task :clean do
  basename = Pathname.new('.').expand_path
  local_clear_yaml(NEWS_PATHNAME)
  FileUtils.rm_rf(basename.join('_site/').to_s)
end

task :gen_site do
  # Clean shit up first
  basename = Pathname.new('.').expand_path
  local_clear_yaml(NEWS_PATHNAME)
  FileUtils.rm_rf(basename.join('_site/').to_s)

  # Render site
  local_render_yaml(NEWS_PATHNAME)
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
    local_clear_yaml(NEWS_PATHNAME)
    new_post_template()
end
