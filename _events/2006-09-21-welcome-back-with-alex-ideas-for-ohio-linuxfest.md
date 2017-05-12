---
type: "Meeting"
layout: default
title: Welcome Back with Alex! / Ideas for Ohio LinuxFest
categories: announcements
tags: announcements, ohio linuxfest
---
Date: 09/21/2006
Time: 7:00PM
Room: 480 Dreese Labs

Welcome back for the 2006-2007 school year! Come and find out what we are planning for this year for the Opensource Club and share your thoughts and ideas. Would you like to see less talk and more rock? Then come and voice your opinion! We are especially interesting in your ideas for the upcoming Ohio LinuxFest 2006. Linuxfest is a free conference of over a dozen open-source sponsors and twenty speakers, all celebrating the greatness that in Linux and open source. This year, The Opensource Club will have its very own booth set up for the conference. We need to come up with ideas on how we can use this awesome opportunity to reach out to the greater Linux and open source community. Months ago I made the decision to use [Microwiki](http://opensource.osu.edu/microwiki) as the base of our website, replacing the old HTML site that we had previously. At around the same time, [Freegeek Columbus](http://freegeekcolumbus.org/) switched from [MediaWiki](http://www.mediawiki.org) - the software that drives Wikipedia - to Mircowiki, and they seemed happy enough. It seemed a good choice for us. I thought that we should use something small and simple. Microwiki, weighing in at just 163 kilobytes, is undoubtably small and simple. However, as time wore on, it became clear that MicroWiki was not the best tool for the job. I pressed on, thinking that I could make it work. I never did. Here is a quick list of various problems I ran into:

*   There were woefully few options, which at first I had thought a good idea, but it became obvious that this was a problem.
*   There was no form of user management - unless you could phpMyAdmin.
*   Current users could register new users. Eventually this broke, and new users had to be added through database tricks and magic.
*   File/image upload never actually worked.
*   External links and images could not be embeded with standard HTML. Wiki syntax *had* to be used.
*   It was hard to theme. Different parts of the site were in different places, the CSS was hidden away in the database.

A few days ago I made the decision to kick Microwiki to the curb, and I haven't looked back since. Here's a short and sweet list of some new features this Drupal-based website can offer:

*   User management, including profiles, user roles, and access controls.
*   Simpler editing tools. HTML!
*   File uploads now work, and users can attach files to their stories and pages.
*   Polls! What do you think about tax cuts for the upper tax bracket? Now we can find out!
*   Extensibility, through hundreds of [modules](http://drupal.org/project/Modules).
*   Comments, with simple and powerful moderation.
*   Easy theming. I made this theme by modifying the default Drupal theme with just CSS, in a file!

That was just off the top of my head, and I think I will find many modules that will add great new features as time goes on. Enjoy the new site. It is not complete, I am about 95% of the way there. The last 5% is just tightening things up and changing some things here and there. Soon I will be posting information about [Ohio LinuxFest](http://www.ohiolinux.org) and our participation, so be on the lookout for that soon. Feel free and register, and don't hesitate to leave comments on what you think. -- Alex
