---
title: "Setting up the site"
excerpt: Using `stdlinux` and `lpr` to print black and white papers from the university's free printing service.
permalink: /tutorials/setup/
---
## Getting the website set up on your computer

1. Fork the repository.
2. Clone the repository from your fork:

	```bash
	git clone git@github.com:your-username/website.git
	cd website
	```

3. Install the dependencies:

  - ruby `v2.2.1` or greater than
  - node.js `v4.2.1` or greater than

3. Run the setup scripts

	```bash
	./helpers/init.sh
	```

4. Run the site locally
  ```bash
    grunt serve
  ```
  *once compiled the site will be accessible at localhost:4040*



## Optional

#### Specify Environment

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
