---
layout: home
title: New Drupal-based website launched
created: 1158866713
categories: announcements
---
Months ago I made the decision to use <a href="/microwiki">Microwiki</a> as the base of our website, replacing the <a href="/old_site/">old HTML site</a> that we had previously. At around the same time, <a href="http://freegeekcolumbus.org/">Freegeek Columbus</a> switched from <a href="http://www.mediawiki.org">MediaWiki</a> - the software that drives Wikipedia - to Mircowiki, and they seemed happy enough. It seemed a good choice for us. I thought that we should use something small and simple. Microwiki, weighing in at just 163 kilobytes, is undoubtably small and simple.

However, as time wore on, it became clear that MicroWiki was not the best tool for the job. I pressed on, thinking that I could make it work. I never did. Here is a quick list of various problems I ran into:

<ul>
<li>There were woefully few options, which at first I had thought a good idea, but it became obvious that this was a problem.</li>
<li>There was no form of user management - unless you could phpMyAdmin.</li>
<li>Current users could register new users. Eventually this broke, and new users had to be added through database tricks and magic.</li>
<li>File/image upload never actually worked.</li>
<li>External links and images could not be embeded with standard HTML. Wiki syntax <em>had</em> to be used.</li>
<li>It was hard to theme. Different parts of the site were in different places, the CSS was hidden away in the database.</li>
</ul>

A few days ago I made the decision to kick Microwiki to the curb, and I haven't looked back since. Here's a short and sweet list of some new features this Drupal-based website  can offer:

<ul>
<li>User management, including profiles, user roles, and access controls.</li>
<li>Simpler editing tools. HTML!</li>
<li>File uploads now work, and users can attach files to their stories and pages.</li>
<li>Polls! What do you think about tax cuts for the upper tax bracket? Now we can find out!</li>
<li>Extensibility, through hundreds of <a href="http://drupal.org/project/Modules">modules</a>.</li>
<li>Comments, with simple and powerful moderation.</li>
<li>Easy theming. I made this theme by modifying the default Drupal theme with just CSS, in a file!</li>
</ul>

That was just off the top of my head, and I think I will find many modules that will add great new features as time goes on.

Enjoy the new site. It is not complete, I am about 95% of the way there. The last 5% is just tightening things up and changing some things here and there.

Soon I will be posting information about <a href="http://www.ohiolinux.org">Ohio LinuxFest</a> and our participation, so be on the lookout for that soon.

Feel free and <a href="http://opensource.cse.ohio-state.edu/?q=user/register">register</a>, and don't hesitate to leave comments on what you think.

-- Alex
