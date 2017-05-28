---
title: osuwireless in Ubuntu
excerpt: How to get set up using `osuwireless` in Ubuntu
permalink: /tutorials/osuwireless-in-ubuntu/ /tutorials/2008/07/29/osuwireless-in-ubuntu/
---
A former member of our club, Paul Betts, created an [excellent guide](http://blog.paulbetts.org/index.php/2007/01/27/the-end-all-definitive-guide-to-getting-wireless-working-in-ubuntu-edgy-eft/) explaining how to connect to wireless in Ubuntu. Find a summarized guide for those who aren't having trouble with their closed-source drivers below.

First, you should have the Gnome Network Manager installed. Most Ubuntu distributions come with this by default, and if it's installed, you will see a wifi icon in the top-right corner of the screen near the date/time. If not, then (from a place where you do have internet access) run:

```bash
sudo apt-get install network-manager-gnome
```

Now that the Network Manager is taken care of, you'll need to ensure you have your OSU internet username handy. If you haven't already, set up your account at [here](https://my.osu.edu/) (this only applies if you are an incoming freshman/transfer student who does not have a name.# yet). If you forget your password, rather than re-registering, you can recover it at [my.osu.edu](https://my.osu.edu/public/ResetPassword). In the past, your wireless username and password were different from your OSU username and password. This has changed, and once you are enrolled in the Identify Management System the username and password will be the same. If you have a name.#, it may work for a short time but will not work forever.

Now we're ready to configure your device. Find a place on campus with wireless internet and click the Network Manager button. Select "osuwireless" from the list. Do *not* select osuguest or OSUVOICE, as these are off-limits to students. You'll get a prompt that looks something like this. Make sure all of these fields match up, and fill in your OSU username and password (if you haven't already signed up at my.osu.edu, this will not yet work for you).

<!-- ![](/sites/default/files/network-manager-example.png) -->
<!-- todo -->
<!-- add image of gnome wifi manager gui -->

Now fill in your username and password, leaving the rest of the fields blank. (In this case, replace name.# with your OSU username.number.) If your prompt has a field listed as **PEAP Version** select "Version 0". Anything else should be as shown above or left blank (default).

If you are asked for a CA certificate file, you may (optionally) want to download and use one. Essentially, it's supposed to help protect you from a [man-in-the-middle](//en.wikipedia.org/wiki/Man-in-the-middle_attack) attack, so if you don't download it you might get a security warning when you first connect. To do this, you can select the right certificate authority in the prompt by browsing to `/etc/ssl/certs/` and selecting `AddTrust_External_Root.pem`. This certificate is included by default in Ubuntu, and after selection network manager should not give you warnings again. If you get another warning about certificate errors after doing this... well, personally I would call shenanigans on the network if I saw that, since it probably means somebody is doing evil stuff to my connection.

Once the fields are filled in as described, hit connect. If you're within an acceptable range of the wireless access point, you should be able to load your favorite web page within 30 seconds. After you have connected the first time, your computer should automatically connect to osuwireless whenever it's in range. If you attempted to connect to osuguest, Ubuntu will automatically try to connect to that network, possibly before trying osuwireless, and it won't get anywhere. You can disable it by removing the "osuguest" folder in `~/.gconf/system/networking/wireless/networks/` and it will forget it ever tried to connect to osuguest.
