---
title: Connecting to IRC
excerpt: How to setup and maintain your presence on IRC
permalink: /tutorials/connecting-to-irc/
---
# Forward

Every meeting, we mention something about our IRC channel. Some of you may not know what that means, so I wanted to clear everything up, as well as explain how to get chatting with us.

## Background

IRC stands for Internet Relay Chat, which is a protocol for communication primarily for group discussion. It is a client-server model, meaning that clients connect to a server and that server tells the client what the other clients are saying. The protocol is also fairly old, originating from 1988.

## Getting Started with WeeChat

WeeChat is an extendable IRC client for GNU/Linux. It utilizes a terminal to render its interface, but is crisp and clean with how it presents information. To install, first get WeeChat from your distribution's package manager. After installation, start weechat from the command line with

```
$ weechat-curses
```

And watch it fire up!

To get connected to `freenode`, type the following into weechat

```
/connect irc.freenode.net
```

You may need to set your name as other users see it, which can be done with

```
/nick yourDesiredNick
```

After you are fully connected to `freenode`, join any room you like with

```
/join #osuosc
```

### Running WeeChat with screen

To **idle** with WeeChat, that is, keep your chat session open without ever leaving, one utility that can be used is `screen`. To start, run:

```
$ screen weechat-curses
```

To detatch from this session, press control+a, then d. To reattach to this session, type

```
$ screen -r
```

Feel free to explore around freenode, and other IRC networks, as there are lots of interesting channels with different topics and projects behind them. I hope this has helped you!

### Running WeeChat with tmux

To **idle** with WeeChat using `tmux` instead of `screen` run:

```
$ tmux
$ weechat
```

To learn more about how tmux works, see [our tmux tutorial]({{ '/tutorials/tmux/' | absolute_url }}).


## Matrix

The Open Source Club is considering adopting the [Matrix Protocol](https://matrix.org/docs/spec/) as its official federated chat protocol. WeeChat is able to utilize this protocol the same as it is able to use IRC. **You must register with another client in order to authenticate using WeeChat**. You may register [here]({{ '/riot/' | absolute_url }}) To use the Matrix Protocol, _before starting weechat_, issue the following:

```
$ mkdir -p ~/.weechat/lua/autoload
$ ln -s /usr/lib/weechat/matrix/matrix.lua ~/.weechat/lua/autoload
```

Then start WeeChat. Once WeeChat is up and running, issue the following commands to get started with it.

```
# Your username should be in the form: @<username>:<homeserver>
# Typically this would look like @my_user:matrix.org
/set plugins.var.lua.matrix.user <username>
/set plugins.var.lua.matrix.password <password>
/matrix connect
```

Here are some handy commands when running Matrix on WeeChat:

```
# to display all the possible WeeChat Matrix settings:
/set plugins.var.lua.matrix.*
# to get a description for each option
/help plugins.var.lua.matrix.local_echo
```

For more information, please visit the [weechat-matrix plugin page on Github](https://github.com/torhve/weechat-matrix-protocol-script)
