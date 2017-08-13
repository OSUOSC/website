---
title: How to SSH into club systems
excerpt: "This is how you utilize the Open Source Club's LAN."
permalink: /tutorials/ssh/
redirect_from:
    - /tutorials/2016/04/14/ssh-into-club-systems/
---

If you do not already have a club account, you may contact our SysAdmin to request one.

## Network

If you are [hanging out with us on IRC](/tutorials/connecting-to-irc) then you are going to want to `ssh` into `idle2`. Otherwise, all other tasks should typically be done on `stallman`. To connect to either, see below.

### instructions

Open up a terminal and enter the following:

```bash
# access stallman
ssh username@stallman.cse.ohio-state.edu

# access Idle2
ssh username@opensource.osu.edu
```

*if you're using mosh replace* `ssh` with `mosh`

if you have no idea what *mosh* is, and would like to learn more
[click here](https://mosh.mit.edu/)
