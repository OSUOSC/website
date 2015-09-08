---
layout: home
title: Connecting to IRC
created: 1378959734
categories: announcements
---
<h4>Foreward</h4>
<p>Every meeting, we mention something about our IRC channel. Some of you may not know what that means, so I wanted to clear everything up, as well as explain how to get chatting with us.</p>

<h4>Background</h4>
<p>IRC stands for Internet Relay Chat, which is a protocol for communication primarily for group discussion. It is a client-server model, meaning that clients connect to a server and that server tells the client what the other clients are saying. The protocol is also fairly old, originating from 1988.</p>

<h4>Getting Started with WeeChat</h4>
<p>WeeChat is an extendable IRC client for GNU/Linux. It utilizes a terminal to render its interface, but is crisp and clean with how it presents information. To install, first get WeeChat from your distribution's package manager. After installation, start weechat from the command line with
<pre>$ weechat-curses</pre>
and watch it fire up!</p>
<!-- image of weechat -->
<p>To get connected to freenode, type the following into weechat
<pre>/connect irc.freenode.net</pre>
You may need to set your name as other users see it, which can be done with
<pre>/nick yourDesiredNick</pre>
After you are fully connected to freenode, join any room you like with
<pre>/join #osuosc</pre>
</p>

<h4>Running WeeChat with screen</h4>
<p>To <b>idle</b> with WeeChat, that is, keep your chat session open without ever leaving, one utility that can be used is screen. To start, run:
<pre>$ screen weechat-curses</pre>
To detatch from this session, press control+a, then d. To reattach to this session, type
<pre>$ screen -r</pre>
</p>

<p>Feel free to explore around freenode, and other IRC networks, as there are lots of interesting channels with different topics and projects behind them. I hope this has helped you!</p>
