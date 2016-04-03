## Getting the website set up on your computer

1. Fork the repository.
2. Clone the repository from your fork:

	```bash
	git clone git@github.com:your-username/open-source-club-website.git
	cd open-source-club-website
	```

3. Install the dependencies:

  - ruby `v2.2.3`
  - node.js `v4.2.6`

3. Run the setup scripts

	```bash
	./init.sh
	npm install -g grunt-cli bower jade
	bower install
	npm install
	```

