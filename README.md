# [The Open Source Club's Website](https://opensource.osu.edu)

[![Build Status](https://travis-ci.org/OSUOSC/opensource.osu.edu.svg?branch=master)](https://travis-ci.org/OSUOSC/opensource.osu.edu)
[![Dependency Status](https://gemnasium.com/OSUOSC/opensource.osu.edu.svg)](https://gemnasium.com/OSUOSC/opensource.osu.edu)
[![security](https://hakiri.io/github/OSUOSC/opensource.osu.edu/master.svg)](https://hakiri.io/github/OSUOSC/opensource.osu.edu/master)
[![Built with Grunt](https://cdn.gruntjs.com/builtwith.png)](http://gruntjs.com/)


This is our repository for our club's [website](https://opensource.osu.edu). It's built with [Jekyll](https://github.com/jekyll/jekyll), [Jade](https://github.com/jadejs/jade), [Sass](https://github.com/sass/sass), [Coffeescript](https://github.com/jashkenas/coffeescript), and [Grunt](https://github.com/gruntjs/grunt).

[Wiki](https://github.com/OSUOSC/opensource.osu.edu/wiki)

[How to contribute](https://github.com/OSUOSC/opensource.osu.edu/blob/master/.github/CONTRIBUTING.md)

Check out our [staging site](https://osuosc.github.io/opensource.osu.edu/), which may or may not be up-to-date

--

### Fork, then clone the repo:
  ```bash
    git clone git@github.com:your-username/opensource.osu.edu.git
    cd opensource.osu.edu
  ```

--

### Dependencies:
  - ruby `v2.2.3`
  - node.js `v4.2.6`

--

### Set up your machine:
  ```
  ./init.sh
  ```

--

### Build site locally and run development server:
  ```bash
    grunt serve
    # once compiled the site will be accessible at localhost:4040
  ```

--

### Create new post

*POSTS THAT AREN'T GENERATED USING THIS HELPER SCRIPT WILL BE REJECTED*

  ```bash
    ruby _helpers/newPost.rb
  ```

--

for indepth instructions checkout our [wiki](https://github.com/OSUOSC/opensource.osu.edu/wiki/Running-the-Site-Locally)
