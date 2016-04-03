## New posts

To create a new post, run `/_helpers/new-post.sh` on the command line, or copy an existing post in `/_posts/` and edit it.

Meeting announcements must contain the following information:

- meeting time
- building and room number
- meeting topic
- topic description

If you are manually creating the post, the date in the filename will be the date that the post is published on the site.

**Posts that do not follow this template will be rejected**

When sharing email addresses in posts, refer to the following snippet:

```md
[officers@opensource.osu.edu](mailto:officers@opensource.osu.edu)
```

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

## Run the tests

After creating a new post, run `grunt test`.

## Submit a pull request

When you're happy with your new post, commit it and [submit a pull request](.github/CONTRIBUTING.md).
