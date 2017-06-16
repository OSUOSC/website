# [Minimal Mistakes Jekyll Theme](https://mmistakes.github.io/minimal-mistakes/)

## Forked for OSUOSC

This means that all that is needed to add a talk or a news item in a weekly rundown is to issue a PR with the new item under the `_posts` or `_tutorials` directory respectively.

## Updates

The `intro: - title:` in `index.html` file should be kept up to date with the latest info. For instance, while setting this up in summer, it does nobody any good to have it display information about meetings during the school semester. Therefore, I am making sure that it says we'll be back for our the Fall 2017 semester.

------

Minimal Mistakes is a flexible two-column Jekyll theme. Perfect for hosting your personal site, blog, or portfolio on GitHub or self-hosting on your own server. As the name implies --- styling is purposely minimalistic to be enhanced and customized by you :smile:.

For detailed instructions on how to configure, customize, add content, and more read the [theme's documentation](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/).

# Quick Start

## Docker Deploy

* [Install docker](https://docs.docker.com/engine/installation/)
* [Install docker-compose](https://docs.docker.com/compose/install/)

Run the following three commands in the project's root directory:

```
docker-compose up --build [-d]
```

The application will now be accessible on `localhost:8000` with any supported web browser. If the `-d` flag was passed, the container will run in the background. If there is a change to anything, the docker instance must be stopped (`CTRL-C` if not daemonized, otherwise `docker-compose stop`) and the command re-run. This imports the new files into the container and re-runs it with the new content.

NOTE: This is less than ideal, however, for the time being, since the directory needs to be cleaned before it is regenerated, and that's not able to be done in the Rakefile without causing an infinite loop, it's easier to just regenerate the image layer. Also, since the volumes wouldn't be mounted before it generated, it wouldn't generate in the first place. I'd love to find a way around this eventually.

If you want to find out how to run the program in your base OS, take a look at the Dockerfile and follow the steps as appropriate.

### Creating a new post

Every week, a new post is created for the news items to be gone over at the beginning of the meeting on Thursday. This is automatically generated in the same way that the site is generated and cleaned, by using `bundle`:

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

#### NOTE: Since this does require `bundle` to be installed, it is presumed that the file would be created on `stallman2` or by another admin earlier in the week, so the impetus is not on the contributors to do so.

---

# Contributing

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

# TODO:

- Why is it in your personal github space instead of the clubs org space?
    - Could you not have used  a branch of the current web site repo?
- ~~Why do you not have a real cert for it? (https://letsencrypt.org/ ??? better than self signed? Especially without any way to check the self signed cert. )~~
- ~~Where did you get that awful picture of “that”(me) faculty advisor? J~~
    - ~~Please remove it.~~
- Where did the “Volunteering” stuff go? (intended removal or oversight?)
    - A Tutorial about “how to change/update this site” might be a good idea. J

I personally prefer:
    - A fixed left hand gutter/menu.
        - The current site uses this design pattern.
        - **This site does as well on pages that it makes sense for it to be on**
    - A fixed “header”/banner.
        - The current site kind of uses that design then it “hides” at some point when scrolling down the main page. (Sigh.)
        - The proposed site lets the header/banner scroll out of view as soon as possible. (Sigh.)
        - **I find those to be ugly and intrusive**
        - **Minimizing the length of the page will alleviate the need for a fixed header**
    - The bullet list on the “home page” should not be done that way. ( looks out of place/clunky)
        - Maybe move to items on the left gutter?
        - **There is no left gutter on the main page**
        - **But this does have to be fixed**
    - Some text for “hover” like they are links, but they are not.
        - **This is very bad and something I was intending to address**
        - “Systems”
        - “Code”
        - “Hardware”
        - “People list” names on the home page
        - Same for the “Previous” and “Next” buttons on some pages.
            - Might be excusable If they were “real” buttons instead of white rectangles with text in the middle.)
        - This is a real pet peeve of mine. HTML shows links by having the text underlined. I should not have to “hover over it” to find the underline/links. Something that is “underlined” and is not a link should be “color coded” (not ideal, but that is the pattern) to tell the difference.
    - The pictures of the people should be sized the same.
        - And take up less vertical space.
        - Maybe a smaller version that can “drill down” to a full page per person?
            - **No need as these are not bios, but a who's who**
            - **perhaps pictures are not even needed**
        - Maybe http://opic.osu.edu/<name.n> should be used for the source of these images? ( avoid storing them in github. Allows users to update/opt-in/opt-in as desired. Etc..)
    - Did you get a “release” for the email and/or Riot Usernames from those people?
        - **What about the officer's emails on the officer's page?**
    - Some of the links on the left edge (like the “officers” page) do not “highlight/underline” on mouse over. Yet become “bold” when selected.  (Odd UI)
        - **This is the nav sidebar (defined in _config)**
    - ~~The “CLUB INFORMATION” (top link) is not clickable.  (no “go back to the top” path)~~
    - ~~I don’t like how the club icon “dims” when it is in the left hand gutter without focus.~~
        - ~~Your messing with the branding!!!! Stop it. J~~
        - ~~**Definitely was on my todo list**~~
    - I am not sure that I like having the Constitution instead of a link to the GitHub official repo for the document.
        - **This was at the behest of the prezident**
        - And yes, I think the club should publish a PDF, or other directly readable form of the constitution on Github.
            - **We do**
        - Maybe the club should look at https://pages.github.com/ and use that for the constitution repo?
            - **I don't see how that would work?**
    - ~~The Officers page is not updated.~~
        - ~~**D'oy**~~
    - Events, News, and Calendar have a “location pin” icon that points at the club office.
        - CL112F
        - That may not be correct for the things being viewed.
        - Maybe that should be Event, News, Calendar event centric?
    - The pages are generally “to long”(vertical). Splitting up the page to avoid scrolling is a better design. ( Keep it all “above the fold” and use links/tab/switching UI effects.)

I like:
    - The calendar page.
        - **I hope to fix much of this with the css. Fixed width everywhere??**
        - It might need some adjustments if more than one “event”? ended up on the same day. ( I think that would look fairly bad.)
        - It might need some adjustments if events were on all days of the week. ( I think that would look fairly bad.)

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
