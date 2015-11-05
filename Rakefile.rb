#!/usr/bin/env ruby

require "jekyll"

# define the default task ran when executing: rake
task default: ["helloworld"]

desc "this is a demo test"
task :helloworld do
  puts 'hello word'
end


# Github pages publishing.
namespace :deploy do

  # Usage:
  # bundle exec rake deploy:staging
  desc "deploy site to gh-pages"
  task :staging do

    # compile site
    `grunt exec:gh_baseurl`
    `grunt build`

    # Get the origin to which we are going to push the site.
    origin = `git config --get remote.origin.url`

    # Make a temporary directory for the build before production release.
    # This will be torn down once the task is complete.
    Dir.mktmpdir do |tmp|
      # Copy accross our compiled _site directory.
      cp_r "_site/.", tmp

      # Switch in to the tmp dir.
      Dir.chdir tmp

      # Prepare all the content in the repo for deployment.
      system "git init" # Init the repo.
      system "git add . && git commit -m 'Site updated at #{Time.now.utc}'" # Add and commit all the files.

      # Add the origin remote for the parent repo to the tmp folder.
      system "git remote add origin #{origin}"

      #  Force push the files to branch: gh-pages.
      system "git push origin master:refs/heads/gh-pages --force"
    end


  end
end
