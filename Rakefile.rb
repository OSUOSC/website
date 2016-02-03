#!/usr/bin/env ruby
require "jekyll"

task default: ["helloworld"]

desc "this is a demo test"
task :helloworld do
  puts 'hello word'
end

namespace :deploy do
  # Usage:
  # bundle exec rake deploy:ghpages
  # bundle exec rake deploy:web3

  desc 'deploy to OSC servers'
  task :web3 do
    # Check for rsync before building
    system('which rsync')
    if ($? != 0)
      print "The deploy requires rsync, please install it and try again."
      exit(255)
    end

    puts 'Make sure you are up-to-date with origin/master!'
    sleep(3)

    system 'grunt build --env=production'
    if $? == 0
      system 'rsync -rlptv --delete _site/ build@opensource.osu.edu:/var/www/new-site -e "ssh -p 922"'
    else
      echo "Something went wrong while building. Check the grunt output and try again"
    end
  end

  desc 'deploy to Github Pages'
  task :ghpages do
    `grunt build --env=staging`
    origin = `git config --get remote.origin.url`

    Dir.mktmpdir do |tmp|
      cp_r '_site/.', tmp
      Dir.chdir tmp
      system 'rm -rf downloads'
      system 'git init'
      system "git add . && git commit -m 'Site updated at #{Time.now.utc}'"
      system "git remote add origin #{origin}"
      system 'git push origin master:refs/heads/gh-pages --force'
    end
  end
end
