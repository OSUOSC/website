# [The Open Source Club's Website](https://opensource.osu.edu)

[![Build Status](https://travis-ci.org/OSUOSC/open-source-club-website.svg?branch=master)](https://travis-ci.org/OSUOSC/open-source-club-website)
[![Dependency Status](https://gemnasium.com/OSUOSC/open-source-club-website.svg)](https://gemnasium.com/OSUOSC/open-source-club-website)
[![security](https://hakiri.io/github/OSUOSC/open-source-club-website/master.svg)](https://hakiri.io/github/OSUOSC/open-source-club-website/master)
[![Built with Grunt](https://cdn.gruntjs.com/builtwith.png)](http://gruntjs.com/)

### How can I contribute?

- report bugs, issues, and documentation inconsistencies
- request features
- hate or love a feature . . . *tell us*
- request topics for future meetings
- fork us, fix an issue and submit a merge request
- refactor suboptimal code

### How do I run the site locally?

Well first you need a few things:

##### ruby 2.2.2
> We suggest installing ruby via rvm (*ruby version manager*)

##### node.js 0.12.7
> We suggest installing node via nvm (*node version manager*)

```bash
# clone the repo
git clone https://github.com/OSUOSC/open-source-club-website.git

# change directory
cd open-source-club-website
```

```bash
# if this is your first time, execute the following script
bash init.sh
```
---

```bash
# fetch dependencies and generate site
grunt build
```
---

```bash
# generate a new post from template
grunt new
```
---

```bash
# run tests
grunt test
```
---

```bash
# equivalent to "grunt build" in addition to running a local server
grunt serve
```

Once generated (which takes ~5 minutes) the site will be accessible at `http://localhost:4040`
