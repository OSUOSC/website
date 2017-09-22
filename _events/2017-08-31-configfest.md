---
title: "Configfest"
speaker: "Andrew `smacz` Cziryak"
type: "Meeting"
time: '19:30'
location: 'Caldwell 120'
---
# Browser

## Addons

- [Ublock Origin](https://github.com/gorhill/uBlock#ublock-origin)
- [Https Everywhere](https://www.eff.org/files/https-everywhere-test/index.html)
- [Decentraleyes](https://github.com/Synzvato/decentraleyes/releases)
- [Cookie Autodelete](https://addons.mozilla.org/en-GB/firefox/addon/cookie-autodelete/)
- [Taborama](https://github.com/kesselborn/taborama)
- Tile Tabs
- [xStyle](https://github.com/FirefoxBar/xStyle)

## Custom Settings

### Multi-threading

https://medium.com/mozilla-tech/the-search-for-the-goldilocks-browser-and-why-firefox-may-be-just-right-for-you-1f520506aa35

### Heavy Writing because of Saving Tabs

https://www.servethehome.com/firefox-is-eating-your-ssd-here-is-how-to-fix-it/

### Cache

http://windows7themes.net/en-us/firefox-memory-cache-ssd/
http://forum.notebookreview.com/threads/ssd-owners-set-firefox-to-memory-cache-instead-of-disk.533359/

# Tweak Tools

- [Gnome-tweak-tool](http://www.makeuseof.com/tag/configure-gnome-3-desktop-gnome-tweak-tool/)

- [Ubuntu Settings](https://wiki.ubuntu.com/SystemSettings)

# Email

## [Thunderbird](https://www.mozilla.org/en-US/thunderbird/)

### OSU Buckeyemail

*Always use your full `<name>.#@buckeyemail.osu.edu` address*

- Protocol: IMAP
  Server: `outlook.office365.com`
  Port: 143
  Connection Security: `STARTTLS`
  Authentication Method: Normal Password
- Protocol: SMTP
  Server: `smtp.office365.com`
  Port: 587
  Connection Security: `STARTTLS`
  Authentication Method: Normal Password

## Mutt

![Mutt Screenshot](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Mutt.png/800px-Mutt.png)

# Riot

[Yet another Messaging Platform](https://www.freelock.com/blog/john-locke/2016-12/yet-another-messaging-platform-why-riot)

# Network

## Firewall

[UFW](https://help.ubuntu.com/community/UFW) is the default firewall for Debian distributions

- Turn it on with the defaults:
    - `sudo ufw enable`
- Check the status
    - `sudo ufw status verbose`
- Allow web server
    - `sudo ufw allow 80/tcp`
    - `sudo ufw allow 443/tcp`

[`iptables`](https://wiki.archlinux.org/index.php/Iptables) is the old standard for firewalls

[`nftables`](https://wiki.archlinux.org/index.php/Nftables) is the default for the future

## [VPN](https://wiki.ubuntu.com/VPN)

- [PIA](https://www.privateinternetaccess.com/)
- [AirVPN](https://airvpn.org/)
- [TorrentFreak's Best VPN Services of 2017](https://torrentfreak.com/vpn-anonymous-review-160220/)

# Office

### [LibreOffice](https://www.libreoffice.org/)

# Backups

### [Deja-Dup](https://www.howtogeek.com/108869/how-to-back-up-ubuntu-the-easy-way-with-dj-dup/)

- [Duplicity](http://duplicity.nongnu.org/)

# [Packages](https://www.howtogeek.com/117579/htg-explains-how-software-installation-package-managers-work-on-linux/)

- [Manual Update with Ubuntu/Debian](https://askubuntu.com/questions/196768/how-to-install-updates-via-command-line)
    - `apt update`
    - `apt upgrade`
    - `apt dist-upgrade`

### Auto-updating

- [Debian Unattended Upgrades](https://wiki.debian.org/UnattendedUpgrades)
- [Ubuntu cont-apt](http://www.techrepublic.com/article/automatically-update-your-ubuntu-system-with-cron-apt/)

# CLI

## Tmux

- [OSUOSC Tutorial](https://opensource.osu.edu/tutorials/tmux/)

## SSH

- [OSUOSC Tutorial](https://opensource.osu.edu/tutorials/ssh/)
- [Mozilla Guidelines](https://wiki.mozilla.org/Security/Guidelines/OpenSSH)
