---
title: "New Post"
excerpt: Creating a new post for the site
permalink: /tutorials/new-post/
---
## New posts

To create a new post, run `rake new:post` on the command line, **never** copy an existing post in `/_posts/` and edit it.

Meeting announcements must contain the following information:

- meeting time
- building and room number
- meeting topic
- topic description

If you are manually creating the post, the date in the filename will be the date that the post is published on the site.


<br>
#### When sharing email addresses in posts, refer to the following snippet:

```md
[officers@opensource.osu.edu](mailto:officers@opensource.osu.edu)
```

<br>
#### Attaching presenations

  If you wish to provide a link to your presentation in your post (we suggest `.pdf`)
  save your document with the *exact* same filename convention.

  For example if I created `source/_post/2015-11-12-my-post.md`
  the presentation slides/document would be: `downloads/presentations/2015-11-12-my-post.pdf`

  To embed a presentation link into the related post use the following:
  ```md
    [downloaded here]({{ site.baseurl }}/downloads/presentations/{{ page.path | remove: "_posts/" | replace: '.md', '.pdf' }})
  ```


<br>
## Rebuilding the site after creating a new post

There are two ways to do this. You can rebulid the site, which only updates the files, or you can rebuild the site and run a server to watch for future changes.

### Build site locally and run development server

This option allows you to view your changes at http://localhost:4040

After getting [set up](./setup.md), run the following command from the root of the project.

  ```bash
    grunt serve
  ```

To kill the server, press `<control-c>` in your terminal.

### Build site locally:

This option only recompiles the site's files, and does not run a local webserver.
  ```
    grunt build
  ```


## Submit a pull request

When you're happy with your new post, commit it and [submit a pull request](.github/CONTRIBUTING.md).
