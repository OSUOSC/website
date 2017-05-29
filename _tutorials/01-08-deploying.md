---
title: "Deploying the site"
excerpt: "Github pages doesn't work, but there's a specific way to deploy the site. Maybe."
permalink: /tutorials/deploying/
---
## Deploying to Github Pages


Our [staging site](https://osuosc.github.io/website/) is is on Github Pages.
Anyone can deploy their own instance of our site in the matter of seconds, without additional setup.

If you haven't already, go ahead and [fork our repository](https://help.github.com/articles/fork-a-repo/).


Once completed the site can be found at `https://<username>.github.io/website/`


---

execute the following command to automatically compile and deploy the site to Github Pages
*you will have to type in your github credentials once the script is nearing completion*

```bash
bundle exec rake deploy:ghpages
```

---


## Deploying to OSC servers

Only authorized users may deploy to our servers, since it requires access to the
`build` user on web3 (one of our servers). To request access, contact the club's
system administrator with your public SSH key.


```bash
bundle exec rake deploy:web3
```

After running the rake task, the site will automatically be built and deployed
on our servers. If by chance something goes wrong, immediately contact the
club's system administrator.
