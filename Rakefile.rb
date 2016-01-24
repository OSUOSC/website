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
  # bundle exec rake deploy:stallman

  desc 'deploy to OSC servers'
  task :stallman do
    puts 'Make sure you are up-to-date with origin/master'

    remotes = `git remote -v`
    unless remotes.include? 'build@stallman'
      `git remote add deploy build@stallman.cse.ohio-state.edu:osc-site-bare`
    end

    `git push deploy master`
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