---
title: Connecting to osuwireless with linux
excerpt: Getting set up with osuwireless raw dog.
---

Steps will vary depending on your distro and network manager of choice, but the same principles apply:

*   authentication: Protected EAP (PEAP)
*   inner authentication: MSCHAPv2
*   username: `name.#`
*   password: `foo`

If you are in a CLI only environment (such as a headless Raspberry Pi) you can connect to `osuwireless` using `wpa_supplicant`.

Edit or create `/etc/wpa_supplicant/wpa_supplicant.conf` to be


```
# /etc/wpa_supplicant/wpa_supplicant.conf

ctrl_interface=/var/run/wpa_supplicant
eapol_version=1
ap_scan=1
fast_reauth=1
network={
  ssid="osuwireless"
  scan_ssid=1
  key_mgmt=WPA-EAP
  eap=PEAP
  identity="name.#"
  password="something-secret"
  phase1="peaplabel=0"
  phase2="auth=MSCHAPV2"
}
```

<br>

Replace `identity` and `password` with your relevant information. You may wish to run `chmod 700 /etc/wpa_supplicant/wpa_supplicant.conf` to protect the file from being read by a non-root user.

<br>

Edit `/etc/network/interfaces` to be

```
# /etc/network/interfaces

auto wlan0
iface wlan0 inet dhcp
wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
```

<br>

Now toggle the wireless connection

```
sudo ifdown wlan0
sudo ifup wlan0
```

<br>

And check for an internet connection with

```
ping 8.8.8.8
```

<br>

**Note:** Following the above steps will only allow your computer to connect to `osuwireless`. If you wish to connect to other networks, omit the `wpa-conf` line in `/etc/network/interfaces` and call `wpa_supplicant` from the CLI directly. Please see the `man` pages for `wpa_supplicant` for more information on this.

*You may (optionally) specify the path to the root certificate as it's supposed to combat man-in-the-middle attacks. More information can be found in our [older tutorial](http://opensource.osu.edu/tutorials/2008/07/29/osuwireless-in-ubuntu/)*
