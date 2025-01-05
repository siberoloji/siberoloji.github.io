---
draft: false

title:  'How to Install AdGuard Home on Rocky Linux 9 and AlmaLinux 9 ?'
date: '2023-06-17T16:01:56+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /how-to-install-adguard-home-on-rocky-linux-9-and-almalinux-9-2/
burst_total_pageviews_count:
    - '78'
featured_image: /images/adguard.webp
categories:
    - 'Linux How-to'
tags:
    - adguard
    - dns
    - 'how-to guides'
    - 'linux how-to'
---


AdGuard Home is open source DNS server software that aims to block advertisement and follower codes in traffic to your network. You can do ad blocking across your entire network by installing it on a server in your home or small office.



In this article, we will share the Adguard Home installation on our server using Rocky Linux 9 and AlmaLinux 9.



You must perform the following steps in order on your command line.


* 
* Let's update the system packages.



```bash
sudo dnf clean all &amp;&amp; sudo dnf update sudo dnf groupinstall "Development Tools"```


* 
* Let's download and install AdGuard packages from GitHub



```bash
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
```


* 
* Let's open the necessary permissions for the firewall.



```bash
sudo firewall-cmd --add-service={dns,http,https} --permanent sudo firewall-cmd --add-port=3000/tcp --permanent sudo firewall-cmd --reload
```



Adguard application has been installed on the server. To make final settings and create a user, you should visit http://localhost:3000 or http://serveripaddress:3000 in a web browser.



Finally, you can enter the IP address of the server you have installed in the DNS IP addresses 
