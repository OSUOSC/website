# The Open Source Club at The Ohio State University Website

[![Build Status](https://travis-ci.org/OSUOSC/open-source-club-website.svg?branch=master)](https://travis-ci.org/OSUOSC/open-source-club-website)

## Setting up development

### OSX

You'll need to install Ruby 2.2.2, and the easiest way to do this is with [rvm](https://rvm.io/), the Ruby Version Manager.

Assuming you have Homebrew installed:

    brew install gpg
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable
    source ~/.profile
    rvm install 2.2.2

## Development

####Requirements
- java > 1.4
- ruby 2.2.2


####In the root directory of this project:
`gem install bundler`

Install gem dependencies

`bundle install`

Execute `jekyll s` to start a development server accessible at http://localhost:4000/

If you would only like to generate the static site, you may execute: `jekyll b`
