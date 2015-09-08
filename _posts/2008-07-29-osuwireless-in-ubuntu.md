---
layout: home
title: osuwireless in Ubuntu
created: 1217362629
categories: announcements
---
<p>A former member of our club, Paul Betts, created an <a href="http://blog.paulbetts.org/index.php/2007/01/27/the-end-all-definitive-guide-to-getting-wireless-working-in-ubuntu-edgy-eft/">excellent guide</a> explaining how to connect to wireless in Ubuntu. Find a summarized guide for those who aren't having trouble with their closed-source drivers below.</p>
<!--break-->
<p>First, you should have the Gnome Network Manager installed. Most Ubuntu distributions come with this by default, and if it's installed, you will see an icon something like <img src="/sites/default/files/12_04_icon1.png"></a> in the top-right corner of the screen near the date/time. If not, then (from a place where you do have internet access) run:</p>

<p class="code">sudo apt-get install network-manager-gnome</p>

<p>Now that the Network Manager is taken care of, you'll need to ensure you have your OSU internet username handy. If you haven't already, set up your account at <a href="https://my.osu.edu/">here</a> (this only applies if you are an incoming freshman/transfer student who does not have a name.# yet). If you forget your password, rather than re-registering, you can recover it at <a href="https://my.osu.edu/public/ResetPassword">my.osu.edu</a>. In the past, your wireless username and password were different from your OSU username and password. This has changed, and once you are enrolled in the Identify Management System the username and password will be the same. If you have a name.#, it may work for a short time but will not work forever.
<!--
I'll use my username, <script type="text/javascript">document.write(unescape("%73%77%61%6E%65%79%2E%32%39"))
//Javascript here is meant to obfuscate my username from spam bots and spiders
</script><noscript><img src="/sites/default/files/usernamekm5.png" /></noscript>, as an example in this how-to.</p>
-->
<p>Now we're ready to configure your device. Find a place on campus with wireless internet (<a href="http://osuwireless.osu.edu/map.php">map</a>) and click the Network Manager button. Select "osuwireless" from the list. Do <u>not</u> select osuguest or OSUVOICE, as these are off-limits to students. You'll get a prompt that looks something like this. Make sure all of these fields match up, and fill in your OSU username and password (if you haven't already signed up at my.osu.edu, this will not yet work for you).</p>

<p><img src="/sites/default/files/network-manager-example.png" usemap="#map" />
<!--
<map name="map">
<area shape="rect" coords="222,242,408,269" alt="/etc/ssl/certs/Equifax_Secure_CA.pem - click to download" title="/etc/ssl/certs/Equifax_Secure_CA.pem - click to download" href="https://www.geotrust.com/resources/root_certificates/certificates/Equifax_Secure_Certificate_Authority.cer" />
<area shape="rect" coords="71,178,175,194" alt="&quot;EAP Method&quot; in some older versions" title="&quot;EAP Method&quot; in some older versions" style="cursor:help;" />
<area shape="rect" coords="73,321,210,334" alt="Used to be &quot;Phase2 Type&quot;" title="Used to be &quot;Phase2 Type&quot;" style="cursor:help;"/>
<area shape="rect" coords="73,283,166,298" alt="Necessary to work in some cases, but may work without" title="Necessary to work in some cases, but may work without" style="cursor:help;" />
<area shape="rect" coords="73,248,166,262" alt="Strongly recommended for security reasons, but it's still possible connect without this; also removes the annoying &quot;Certificate authority&quot; popups" title="Strongly recommended for security reasons, but it's still possible connect without this; also removes the annoying &quot;Certificate authority&quot; popups" style="cursor:help;" />
</map>
-->
</p>

<p>Now fill in your username and password, leaving the rest of the fields blank. (In this case, replace name.# with your OSU username.number.) If your prompt has a field listed as <b>PEAP Version</b> select "Version 0". Anything else should be as shown above or left blank (default).</p>

<p>If you are asked for a CA certificate file, you may (optionally) want to download and use one. Essentially, it's supposed to help protect you from a <a href="//en.wikipedia.org/wiki/Man-in-the-middle_attack">man-in-the-middle</a> attack, so if you don't download it you might get a security warning when you first connect.
<!--
To use it, run the following commands (you only need to run this once):
<pre><p class="code">wget https://www.geotrust.com/resources/root_certificates/certificates/Equifax_Secure_Certificate_Authority.cer
sudo mv Equifax_Secure_Certificate_Authority.cer /etc/ssl/certs/</p></pre>
-->
To do this, you can select the right certificate authority in the prompt by browsing to <code>/etc/ssl/certs/</code> and selecting <code>AddTrust_External_Root.pem</code>. This certificate is included by default in Ubuntu, and after selection network manager should not give you warnings again. If you get another warning about certificate errors after doing this... well, personally I would call shenanigans on the network if I saw that, since it probably means somebody is doing evil stuff to my connection.</p>

<p>Once the fields are filled in as described, hit connect. If you're within an acceptable range of the wireless access point, you should be able to load your favorite web page within 30 seconds.
<!-- resnet login in dorms no longer required for wireless, wired networks only
If you're in a dorm, you may need to complete an extra step. If so, when you first load a page, you will see a <a href="/sites/default/files/resnet.png" rel="lightbox" class="lightbox">ResNet login prompt</a>. Log in here using your <u>regular</u> OSU username/password.
-->
After you have connected the first time, your computer should automatically connect to osuwireless whenever it's in range. If you attempted to connect to osuguest, Ubuntu will automatically try to connect to that network, possibly before  trying osuwireless, and it won't get anywhere. You can disable it by removing the "osuguest" folder in <code>~/.gconf/system/networking/wireless/networks/</code> and it will forget it ever tried to connect to osuguest. If you are running Ubuntu 9.04 or higher, you can right-click the <a href="/sites/default/files/wireless-icon.png" rel="lightbox" class="lightbox">wireless icon</a>, select the <a href="/sites/default/files/wireless-tab.png" rel="lightbox" class="lightbox">Wireless tab</a>, and delete it from that list. Same with OSUVOICE.</p>
