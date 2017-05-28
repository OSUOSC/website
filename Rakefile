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
        html << <<-HTML
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
HTML
        File.open(post, 'a') do |file|
            file.puts html
        end
        page = YAML.load_file(post)
        page['stories'].each do |story|
            html = ''
            html << <<-HTML
{% page_break %}
<hr />
# [#{story["title"]}](#{story["link"]})
![](#{story["image"]})
#{story["notes"]}
HTML
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

def listen_handler(base, options)
  local_clear_yaml(NEWS_PATHNAME)
  local_render_yaml(NEWS_PATHNAME)
  site = Jekyll::Site.new(options)
  Jekyll::Command.process_site(site)
  proc do |modified, added, removed|
    # This causes a loop
    #local_clear_yaml(NEWS_PATHNAME)
    #local_render_yaml(NEWS_PATHNAME)
    t = Time.now
    c = modified + added + removed
    #n = c.length
    relative_paths = c.map{ |p| Pathname.new(p).relative_path_from(base).to_s }
    print Jekyll.logger.message("Regenerating:", "#{relative_paths.join(", ")} changed... ")
    begin

      Jekyll::Command.process_site(site)
      puts "regenerated in #{Time.now - t} seconds."
    rescue => e
      puts "error:"
      Jekyll.logger.warn "Error:", e.message
      Jekyll.logger.warn "Error:", "Run jekyll build --trace for more information."
      local_clear_yaml(NEWS_PATHNAME)
    end
  end
end

task :clean do
    local_clear_yaml(NEWS_PATHNAME)
    basename = Pathname.new('.').expand_path
    FileUtils.rm_rf(basename.join('_site/').to_s)

end

task :gen_site do
  local_render_yaml(NEWS_PATHNAME)
  base = Pathname.new('.').expand_path
  options = {
    "destination"   => base.join('_site').to_s,
    "force_polling" => false,
    "theme"         => "minimal-mistakes-jekyll",
    "future"        => true
  }
  options = Jekyll.configuration(options)
  site = Jekyll::Site.new(options)
  Jekyll::Command.process_site(site)
  local_clear_yaml(NEWS_PATHNAME)
end

task :new_post do
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

#task :preview do
#  base = Pathname.new('.').expand_path
#  options = {
#    "destination"   => base.join('_site').to_s,
#    "force_polling" => false,
#    "serving"       => true,
#    "theme"         => "minimal-mistakes-jekyll",
#    "future"        => true
#  }
#
#  options = Jekyll.configuration(options)
#
#  ENV["LISTEN_GEM_DEBUGGING"] = "1"
#  listener = Listen.to(
#    base.join("_includes"),
#    base.join("_layouts"),
#    base.join("_sass"),
#    base.join("assets"),
#    options["source"],
#    :ignore => listen_ignore_paths(base, options),
#    :force_polling => options['force_polling'],
#    &(listen_handler(base, options))
#  )
#
#  begin
#    listener.start
#    Jekyll.logger.info "Auto-regeneration:", "enabled for '#{options["source"]}'"
#
#    unless options['serving']
#      trap("INT") do
#        listener.stop
#        puts "     Halting auto-regeneration."
#        exit 0
#      end
#
#      loop { sleep 1000 }
#    end
#  rescue ThreadError
#    # You pressed Ctrl-C, oh my!
#    local_clear_yaml(NEWS_PATHNAME)
#  end
#
#  Jekyll::Commands::Serve.process(options)
#end
