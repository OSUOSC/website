# [The Open Source Club's Website](https://opensource.osu.edu)

[![Build Status](https://travis-ci.org/OSUOSC/open-source-club-website.svg?branch=master)](https://travis-ci.org/OSUOSC/open-source-club-website)
[![Dependency Status](https://gemnasium.com/OSUOSC/open-source-club-website.svg)](https://gemnasium.com/OSUOSC/open-source-club-website)
[![security](https://hakiri.io/github/OSUOSC/open-source-club-website/master.svg)](https://hakiri.io/github/OSUOSC/open-source-club-website/master)
[![Built with Grunt](https://cdn.gruntjs.com/builtwith.png)](http://gruntjs.com/)

[staging site](https://osuosc.github.io/open-source-club-website/)

This is our repository for our club's [website](https://opensource.osu.edu). It's built with [Jekyll](https://github.com/jekyll/jekyll), [Jade](https://github.com/jadejs/jade), [Sass](https://github.com/sass/sass), [Coffeescript](https://github.com/jashkenas/coffeescript), and [Grunt](https://github.com/gruntjs/grunt).

### How can I contribute?

- report bugs, issues, and documentation inconsistencies
- tag posts
- request features
- hate or love a feature . . . *tell us*
- request topics for future meetings
- fork us, fix an issue and submit a merge request
- refactor suboptimal code

### How do I run the site locally?

Well first you need a few things:

##### ruby 2.2.3
> We suggest installing ruby via [rvm](https://rvm.io/) (*ruby version manager*)

##### node.js 4.2.6
> We suggest installing node via [nvm](https://github.com/creationix/nvm) (*node version manager*)

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
# equivalent to "grunt build" in addition to running a local server
# this is what 99% of people will want to run
grunt serve
```
---

```bash
# fetch dependencies and generate site
grunt build
# this won't be too helpful for most (see grunt serve)
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


Once generated (which takes ~1 minutes) the site will be accessible at `http://localhost:4040`

Don't freak out when you see errors printed to stdout that's normal . . . for now.


```bash
# compile site locally and automatically push to the relative gh-pages branch
rake deploy:ghpages
```

### Additional Information

##### Contributors
when sharing email addresses in posts, refer to the following snippet:
```md
[officers@opensource.osu.edu](mailto:officers@opensource.osu.edu)
```
##### Presenters
- meeting announcements must contain the following information
  - meeting time
  - building and room number
  - meeting topic
  - topic description

If you wish to provide a link to your presentation in your post (we suggest `.pdf`)
save your document with the *exact* same filename convention.

For example if I created `_post/2015-11-12-my-post.md`
the presentation slides/document would be: `downloads/presentations/2015-11-12-my-post.pdf`


To embed a presentation link into the related post use the following:
```
[downloaded here]({{ site.baseurl }}/downloads/presentations/{{ page.path | remove: "_posts/" | replace: '.md', '.pdf' }})
```


##### Specify Environment

currently there are three different environments

  - production
    - assets are automatically minified/compressed
    - the jekyll baseurl is set to an empty string
  - staging
    - assets are automatically minified/compressed
    - the jekyll baseurl is set to our github repository name
  - development
    - assets are uncompressed
    - the jekyll baseurl is set to an empty string

the default behavior is to set the environment to `development`

to build the site in a different environment use the following parameter: `--env=myEnvironment`  

Example

  ```bash
  grunt build --env=staging
  # or
  grunt build --env=production
  # or
  grunt serve --env=staging
  # you get the idea . . .
  ```


##### Deploying to Github Pages

Our staging environment is currently utilizing Github Pages. Anyone can deploy
their own instance of our site in the matter of seconds, without additional setup.

If you haven't already go ahead and fork our repository.

execute the following command to automatically compile and deploy the site to Github Pages.
*you will have to type in your github credentials once the script is nearing completion*

Once completed the site can be found at `https://<username>.github.io/open-source-club-website/`

for example if your github username was `foo`, your site could be reached at `https://foo.github.io/open-source-club-website/`

---

execute the following command to automatically compile and deploy the site to Github Pages

```bash
bundle exec rake deploy:ghpages
```
---


##### Deploying to OSC servers

Only authorized users may deploy to our servers, since it requires access to the
`build` user on Stallman (one of our servers). To request access, contact the
club's system administrator with your public SSH key.


```bash
bundle exec rake deploy:stallman
```

After running the rake task, the site will automatically be built and deployed
on our servers. If by chance something goes wrong, immediately contact the
club's system administrator.

###### Debugging

NOTE: You may see the following error message the first time you attempt to
push:

    Post https://stallman.cse.ohio-state.edu/osc-site-bare.git/info/lfs/objects/batch: dial tcp 164.107.116.179:443: getsockopt: connection refused
    error: failed to push some refs to 'build@stallman.cse.ohio-state.edu:osc-site-bare'

This is due to a pre-push hook inserted by git-lfs that we aren't implementing.
Edit `.git/hooks/pre-push` and comment out the following lines:

```bash
#!/bin/sh
#command -v git-lfs >/dev/null 2>&1 || { echo >&2 "\nThis repository is configured for Git LFS but 'git-lfs' was not found on your path. If you no longer wish to use Git LFS, remove this hook by deleting .git/hooks/pre-push.\n"; exit 2; }
#git lfs pre-push "$@"
```

You should be able to push to the deploy remote now.
