# [The Open Source Club's Website](https://opensource.osu.edu)

[![Build Status](https://travis-ci.org/OSUOSC/open-source-club-website.svg?branch=master)](https://travis-ci.org/OSUOSC/open-source-club-website)
[![Dependency Status](https://gemnasium.com/OSUOSC/open-source-club-website.svg)](https://gemnasium.com/OSUOSC/open-source-club-website)
[![security](https://hakiri.io/github/OSUOSC/open-source-club-website/master.svg)](https://hakiri.io/github/OSUOSC/open-source-club-website/master)
[![Built with Grunt](https://cdn.gruntjs.com/builtwith.png)](http://gruntjs.com/)


This is our repository for our club's [website](https://opensource.osu.edu). It's built with [Jekyll](https://github.com/jekyll/jekyll), [Jade](https://github.com/jadejs/jade), [Sass](https://github.com/sass/sass), [Coffeescript](https://github.com/jashkenas/coffeescript), and [Grunt](https://github.com/gruntjs/grunt).


[contributing](https://github.com/OSUOSC/open-source-club-website/blob/master/.github/CONTRIBUTING.md)

[staging site](https://osuosc.github.io/open-source-club-website/)

--


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
`build` user on web3 (one of our servers). To request access, contact the club's
system administrator with your public SSH key.


```bash
bundle exec rake deploy:web3
```

After running the rake task, the site will automatically be built and deployed
on our servers. If by chance something goes wrong, immediately contact the
club's system administrator.
