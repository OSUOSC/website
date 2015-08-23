# The Open Source Club at The Ohio State University Website

[![Build Status](https://travis-ci.org/CWDG/open-source-club-website.svg?branch=master)](https://travis-ci.org/CWDG/open-source-club-website)

## Setting up development

### Linux

    gem install

### OSX

You'll need to install Ruby 2.2.2, and the easiest way to do this is with [rvm](https://rvm.io/), the Ruby Version Manager.

Assuming you have Homebrew installed:

    brew install gpg
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable
    source ~/.profile
    rvm install 2.2.2
    rvm list
    gem install bundler
    cd /path/to/this/repository
    bundle install

## Development

Run `jekyll serve` in the root directory of this project.

# Repositories Used
- [Jekyll](https://github.com/jekyll/jekyll "Jekyll")
- [Jekyll-Assets](https://github.com/ixti/jekyll-assets "Jekyll-Assets")
- [Skel](https://github.com/n33/skel "Skel")
- [Font Awesome](https://github.com/FortAwesome/Font-Awesome "Font Awesome")
- [Simptip](https://github.com/arashmanteghi/simptip "Simptip")
- [YUI Compressor](https://github.com/sstephenson/ruby-yui-compressor "YUI Compressor")
- [Sitemap Generator](https://github.com/kinnetica/jekyll-plugins "Sitemap Generator")

To run locally execute the following command: `jekyll s`
