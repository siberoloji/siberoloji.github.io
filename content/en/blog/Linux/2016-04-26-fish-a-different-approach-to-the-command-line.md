---
draft: false

title:  'Fish – A Different Approach to the Command Line'
date: '2016-04-26T01:28:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /fish-a-different-approach-to-the-command-line/
 
featured_image: /images/linux-howto.jpg
categories:
    - 'Linux How-to'
tags:
    - 'how-to guides'
    - 'linux how-to'
---


When it comes to Linux, one of the first things that comes to mind is probably the command line and terminal. The shell that processes the statements you write on the command line is offered to users in different versions. Bash, Dash, Zsh, Csh can be given as examples. In this article, we will explain the installation of the Fish shell program.



Fish is a shell program known for being user-friendly. Command completion has the ability to color different forms within the command differently. It offers various recommendations while writing the command and makes these by taking into account the folder you are currently in. You can easily select the suggestions with the arrow keys. One of the features that should be emphasized in terms of ease of use is that it automatically opens help commands in the web browser.



## Fish Installation for Debian:


```bash
---------------- Debian 8 ----------------
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish

---------------- Debian 7 ----------------
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_7.0/ /' >> /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish
```



## Fish Installation for Ubuntu:


```bash
---------------- Ubuntu ----------------
sudo add-apt-repository ppa:fish-shell/nightly-master
sudo apt-get update
sudo apt-get install python-software-properties
sudo apt-get update
sudo apt-get install fish
```



## Fish Installation for Fedora:


```bash
---------------- Fedora 22 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_22/shells:fish:release:2.repo
yum install fish

---------------- Fedora 21 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_21/shells:fish:release:2.repo
yum install fish

---------------- Fedora 20 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_20/shells:fish:release:2.repo
yum install fish
```



## Fish Installation for CentOS:


```bash
---------------- CentOS 7 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
yum install fish

---------------- CentOS 6 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_6/shells:fish:release:2.repo
yum install fish
```



## Fish Installation for RHEL:


```bash
---------------- RHEL 7 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/RHEL_7/shells:fish:release:2.repo
yum install fish

---------------- RHEL 6 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/RedHat_RHEL-6/shells:fish:release:2.repo
yum install fish
```



**To start**


```bash
fish
```



I recommend you try it. Fish takes a different approach to the Command line. You can find detailed usage documentation at the program's <a href="http://fishshell.com/" target="_blank" rel="noreferrer noopener">address</a>.
