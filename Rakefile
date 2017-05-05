require "bundler/gem_tasks"
require "jekyll"
require "listen"
require "yaml"

NEWS_PATHNAME = '_multipage/*'

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
        page = YAML.load_file(post)
        page['stories'].each do |story|
            html = ''
            html << <<-HTML
<hr />
# [#{story["title"]}](#{story["link"]})
![](#{story["image"]})
#{story["notes"]}
{% page_break %}
HTML
            File.open(post, 'a') do |file|
                file.puts html
            end
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
  local_render_yaml(NEWS_PATHNAME)
  site = Jekyll::Site.new(options)
  Jekyll::Command.process_site(site)
  proc do |modified, added, removed|
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
      #local_clear_yaml(NEWS_PATHNAME)
    end
  end
end

task :clean do
    local_clear_yaml(NEWS_PATHNAME)
end

task :domenow do
  local_render_yaml(NEWS_PATHNAME)
  base = Pathname.new('.').expand_path
  options = {
    "destination"   => base.join('_site').to_s,
    "force_polling" => false,
    "theme"         => "minimal-mistakes-jekyll",
    "future"        => true
  }
  site = Jekyll::Site.new(options)
  Jekyll::Command.process_site(site)
  local_clear_yaml(NEWS_PATHNAME)
end

task :preview do
  base = Pathname.new('.').expand_path
  options = {
    "destination"   => base.join('_site').to_s,
    "force_polling" => false,
    "serving"       => true,
    "theme"         => "minimal-mistakes-jekyll",
    "future"        => true
  }

  options = Jekyll.configuration(options)

  ENV["LISTEN_GEM_DEBUGGING"] = "1"
  listener = Listen.to(
    base.join("_data"),
    base.join("_includes"),
    base.join("_layouts"),
    base.join("_sass"),
    base.join("assets"),
    options["source"],
    :ignore => listen_ignore_paths(base, options),
    :force_polling => options['force_polling'],
    &(listen_handler(base, options))
  )

  begin
    listener.start
    Jekyll.logger.info "Auto-regeneration:", "enabled for '#{options["source"]}'"

    unless options['serving']
      trap("INT") do
        listener.stop
        puts "     Halting auto-regeneration."
        exit 0
      end

      loop { sleep 1000 }
    end
  rescue ThreadError
    # You pressed Ctrl-C, oh my!
    local_clear_yaml(NEWS_PATHNAME)
  end

  Jekyll::Commands::Serve.process(options)
end
