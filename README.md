# The Open Source Club at The Ohio State University Website

[![Build Status](https://travis-ci.org/OSUOSC/open-source-club-website.svg?branch=master)](https://travis-ci.org/OSUOSC/open-source-club-website)

~~**Live Demo**: http://osc.eligladman.com/~~


### How can I contribute?

- report bugs, issues, and documentation inconsistencies
- request features
- hate or love a feature . . . *tell us*
- request topics for future meetings
- fork us, fix an issue and submit a merge request

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
# if this is your first time execute the following script
./init.sh #this is the dame as "bash init.sh"
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

Once generated (which takes upwards of 5-10 minutes) the site will be accessible at `http://localhost:4040`
