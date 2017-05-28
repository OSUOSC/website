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

### Creating a new post

Every week, a new post is created for the meeting on Thursday. This is automatically generated in the same way that the site is generated and cleaned, by using `bundle`:

```
$ bundle exec rake new_post
```

The new post is created in the `_posts` directory, under the format `YYYY-MM-DD-meeting.md`, the date being the date of the next meeting (AKA the next Thursday). If you try to run it twice, it will throw an error containing the file that it detected to be the one it was supposed to create.

After that, the page can be edited and content added. The content is broken up into stories for us to go through one at a time at the beginning of the meeting. The format for the file is as follows:

* `title:`
    * The title of the story.
* `link:` (optional)
    * The link to the article, video, or whatever that contains the meat of the content.
* `image` (optional)
    * The image that is displayed (at an automatically adjusted size) in the page that we'll be going over during the meeting. This accepts a URL that is compiled in at the time that the site is generated.
* `notes` (optional)
    * This should be the meat of the content that is put in the file. These are the notes (typically bullet points) that are ran through when announcing the story to the club. As long as there is a pipe (`|`) after the notes keyword, all following lines (before the next story item) will be 'markdownified' - aka formatted from markdown into HTML at the time that the site is generated.
    * **NOTE: The markdown must be indented correctly in order to be properly rendered.**

#### Example:

```
- title: "Android Studio 2.0 Released"
  link: "http://android-developers.blogspot.com/2016/04/android-studio-2-0.html"
  image: "https://1.bp.blogspot.com/-vxXg6Inv_WA/VwaJ0uzSf_I/AAAAAAAACr4/xzszbcRzWRgSaHXpOpYroG7u6bgsFJjqw/s200/image03.png"
  notes: |
    > Instant Run: Changes to a running app appear live.

    * Faster Android emulator and adb.
        * Cloud Test Lab: Test apps on a wide range of physical devices easily.
        * bullet points
            * as far as
                * you could want

    [links work also](https://opensource.osu.edu)

    ## This is a header

    ### This is another header

    ```
    lorem ipsum code
    ```
```

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
