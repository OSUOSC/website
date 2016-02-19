# Contributing
  - report bugs, issues, and documentation inconsistencies
  - tag posts
  - request features
  - hate or love a feature . . . *tell us*
  - request topics for future meetings
  - fork us, fix an issue and submit a merge request
  - refactor suboptimal code

-- 
  
### Fork, then clone the repo:
  ```bash
    git clone git@github.com:your-username/open-source-club-website.git
    cd open-source-club-website
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

##### OR
  
### Build site locally:
  ```
    grunt build
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

--

### Author a new post
  ```bash
    ./_helpers/new-post.sh
  ```
  
  **Posts that do not follow this template will be rejected**
  
  Meeting announcements **must** contain the following information:
    - meeting time
    - building and room number
    - meeting topic
    - topic description
  
  when sharing email addresses in posts, refer to the following snippet:
  ```md
    [officers@opensource.osu.edu](mailto:officers@opensource.osu.edu)
  ```
  
#### Attaching presenations
  
  If you wish to provide a link to your presentation in your post (we suggest `.pdf`)
  save your document with the *exact* same filename convention.

  For example if I created `_post/2015-11-12-my-post.md`
  the presentation slides/document would be: `downloads/presentations/2015-11-12-my-post.pdf`

  To embed a presentation link into the related post use the following:
  ```md
    [downloaded here]({{ site.baseurl }}/downloads/presentations/{{ page.path | remove: "_posts/" | replace: '.md', '.pdf' }})
  ```

--

### Make sure the tests pass:
  ```
    grunt test
  ```
  
--

Push to your fork and [submit a pull request][pr].

Pull request should be assigned to [@egladman](http://github.com/egladman)


[pr]: https://github.com/osuosc/open-source-club-website/compare/

At this point you're waiting on us. We like to at least comment on pull requests
within three business days (and, typically, one business day). We may suggest
some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted:

* Write tests when possible
* Write a [good commit message][commit].

[commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

--

Additionally, you can [create issues](https://github.com/osuosc/open-source-club-website/issues) on this repo to suggest changes or improvements.
