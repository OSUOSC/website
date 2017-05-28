# [Minimal Mistakes Jekyll Theme](https://mmistakes.github.io/minimal-mistakes/)

## Forked for OSUOSC

This means that all that is needed to add a talk or a news item in a weekly rundown is to issue a PR with the new item under the `_posts` or `_tutorials` directory respectively.

#### TODO: Get an automated calendar set up.

------

Minimal Mistakes is a flexible two-column Jekyll theme. Perfect for hosting your personal site, blog, or portfolio on GitHub or self-hosting on your own server. As the name implies --- styling is purposely minimalistic to be enhanced and customized by you :smile:.

For detailed instructions on how to configure, customize, add content, and more read the [theme's documentation](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/).

## Quick Start

1. Run Bundler to install the theme gem and dependencies:

```bash
bundle install --path ${HOME}/.gem
```

To test the theme, run `$ bundle exec rake preview` and open your browser at `http://localhost:4000/`. This starts a Jekyll server using content in the repo directory. As modifications are made to the theme, it will regenerate and you should see the changes in the browser after a refresh.

When you are done, or if you have to restart the server, it is recommended to issue an `$ bundle exec rake clean`, which resets the multipage hackery that is run in `_posts/` to generate `/news/`. Go ahead, check out the markdown pages while the server is running.

#### TODO: make a function `$ bundle exec rake new_post`
* Specific format: `YYYY-MM-DD-title-of-post.md`
* YAML front matter
    * `layout: multipage`
    * `collection: news`
    * `date: YYYY-MM-DD`


---

## Contributing

Having trouble working with the theme? Found a typo in the documentation? Interested in adding a feature or [fixing a bug](https://github.com/mmistakes/minimal-mistakes/issues)? Then by all means [submit an issue](https://github.com/mmistakes/minimal-mistakes/issues/new) or [pull request](https://help.github.com/articles/using-pull-requests/). If this is your first pull request, it may be helpful to read up on the [GitHub Flow](https://guides.github.com/introduction/flow/) first.

Minimal Mistakes has been designed as a base for you to customize and fit your site's unique needs. Please keep this in mind when requesting features and/or submitting pull requests. If it's not something that most people will use, I probably won't consider it. When in doubt ask. 

This goes for author sidebar links and "share button" additions -- I have no intention of merging in every possibly option, the essentials are there to get you started :smile:.

### Pull Requests

When submitting a pull request:

1. Clone the repo.
2. Create a branch off of `master` and give it a meaningful name (e.g. `my-awesome-new-post`) and describe the feature or fix.
3. Open a pull request on GitHub.

## Development

To set up your environment to develop this theme, run `bundle install --path ${HOME}/.gem`.

To update the theme run `bundle update`. **Be careful - this may break OSUOSC customizations.**

## Adding new pages

If you go to add new pages to `_pages` the default header info should be:

```
---
layout: archive
title: <title of page>
permalink: /<link name>/
---
```

And make sure that the permalink ends with a slash so that it's generated in the same form as the rest of the site.


---

## Credits

### Creator

**Michael Rose**

- <https://mademistakes.com>
- <https://twitter.com/mmistakes>
- <https://github.com/mmistakes>

### OSUOSC customizations

**AndrewCz**
- <https://andrewcz.com>
- <https://github.com/smacz42>

### Icons + Plugins:

- [The Noun Project](https://thenounproject.com) -- Garrett Knoll, Arthur Shlain, and [tracy tam](https://thenounproject.com/tracytam)
- [Font Awesome](http://fortawesome.github.io/Font-Awesome/)
- [Unsplash](https://unsplash.com/)
- [Multipage](https://github.com/mattgemmell/Jekyll-Multipage)

### Other:

- [Jekyll](http://jekyllrb.com/)
- [jQuery](http://jquery.com/)
- [Susy](http://susy.oddbird.net/)
- [Breakpoint](http://breakpoint-sass.com/)
- [Magnific Popup](http://dimsemenov.com/plugins/magnific-popup/)
- [FitVids.JS](http://fitvidsjs.com/)
- Greedy Navigation - [lukejacksonn](http://codepen.io/lukejacksonn/pen/PwmwWV)
- [jQuery Smooth Scroll](https://github.com/kswedberg/jquery-smooth-scroll)

---

## License

The MIT License (MIT)

Copyright (c) 2017 Michael Rose

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
