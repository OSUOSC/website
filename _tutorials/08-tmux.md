---
title: Tmux
excerpt: "How to use tmux effectively"
permalink: /tutorials/tmux/
---

# Tmux vs Screen

Tmux is an evolved implementation of a "terminal multiplexer", as compared to GNU's `screen` utility. This tool allows you to create multiple windows and panes in a terminal much like browser tabbing, or putting one window on the left side of your screen, while having another on the right side (splitting down the middle) - all in the terminal. There are several other advantages that will be explained later.

# Basic Usage

`tmux` can be given commands either by the command line (`<prefix>-:`), or by keybindings, and while most of the following commands will have both, I will most likely only reference my most favored of methods. It is up to you research alternative methods if you don't like my own methods. Alternatively, tmux can be configured with custom keybindings in the file `~/.tmux.conf`. This is advanced usage, but I highly recommend looking into customizing your config.

One of the key parts of `tmux` is its **prefix** character. This is usually a combination of keys. By default it is `Ctrl-b`. GNU's `screen` utility used `Ctrl-a`, and `Ctrl-t` is also a favorite option among tweakers. However, whichever key combination is chosen (or set in the `~/.tmux.conf`), it will be referenced below with **prefix** or `<prefix>`.

## Starting and stopping

`tmux` can be started directly from the command line:

```
$ tmux
```

After starting it, you will see a green bar at the bottom of your terminal, showing various information about windows and panes (see below). To see all running instances for your user:

```
$ tmux ls
```

The first number is the session title (this can be changed - see below) and the second is information on that session. To get out of a running tmux session _without_ killing it:

```
<prefix>-d
```

To finally kill that session:

```
$ tmux kill-session -t <session-title>
```

## Sessions, and windows, and panes, oh my!

**Sessions** contain **windows** which contain **panes**.

- Sessions are groups of windows. They are usually specified with the `-t` flag on the tmux command line.
- Windows are much like workspaces in a display manager - only one can be displayed at a time
- Panes are sub splits of windows

### Sessions

A new session is created with issuing the raw `tmux` command. However, a new session can be created while in an existing tmux session by issuing `new` from the tmux command line (once again, the command line is triggered with `<prefix>-:`).

### Windows

When creating a new session, a new initial window is created as well (as a necessity). However, to create another window, issue the command `new-window` from the tmux command line. To cycle through the windows, you can press `<prefix>-n`, which will go left to right, or enter `prev` from the tmux command line.

The most reliable way to remove a window is by exiting the shell session. This is typically by issuing the command `exit` from the regular command line, which would log off an existing shell session, which also can be done with `Ctrl-d`. Otherwise, you can use tmux commands to close the window - either `<prefix>-&` or `kill-window`.

### Panes

The power in panes is the way they split the terminal so that the output of several shells can be all viewed in one terminal screen. Many current terminal emulators provide the functionality to split the terminal view, and so does tmux. For the basic usage, a vertical split is `<prefix>-%`, and a horizontal split is `<prefix>-"`. And adjusting the size of the splits is done with `<prefix>-(Ctrl-up|down|left|right)`. It is best to hold down the `Ctrl` key, and not lift it inbetween the prefix and the `up|down|left|right` to adjust the pane size).

# Recommended customizations

While the above are the default basics that you _have_ to know about `tmux` in order to start using it, the real fun comes when the default configs are changed. Some recommended configuration options are:

- [Vi mode in tmux](https://sanctum.geek.nz/arabesque/vi-mode-in-tmux/)
- [Use tmux windows like tabs](https://wiki.archlinux.org/index.php/Tmux#Use_tmux_windows_like_tabs)

And besides that there are much _much_ more functionality that tmux provides to users, and I would strongly encourage users to read the tmux man pages to find a workflow that works for them.

# References

- [Arch Wiki - Tmux](https://wiki.archlinux.org/index.php/Tmux)
- [Guide to customizing tmux](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/)
