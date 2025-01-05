---
draft: false

title:  'What is the difference between apt-get update / upgrade / dist-upgrade?'
date: '2016-04-01T13:53:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "\_If you have Ubuntu\_oran operating system that uses\_the apt package manager, you must have used\_apt-get\_update\_\_and similar commands.\_\_We will show that although the apt-get\_update,\_apt-get upgrade\_and\_apt-get dist-upgrade\_commands are similar to each other, they have different tasks." 
 
url:  /what-is-the-difference-between-apt-get-update-upgrade-dist-upgrade/
 
featured_image: /images/cyber2.jpg
categories:
    - 'Linux Fundamentals'
tags:
    - apt-get
    - linux
    - 'linux fundamentals'
    - os
---


 If you have Ubuntu oran operating system that uses the apt package manager, you must have used apt-get update  and similar commands.  We will show that although the apt-get update, apt-get upgrade and apt-get dist-upgrade commands are similar to each other, they have different tasks.



First of all, our  Linux system needs a center to check and update itself. The places to look for these lists are kept in the /etc/apt/sources.list file. Briefly, which package repositories to look at are recorded here. The package repositories located here are checked with the apt-get update command.



Let's run the command below to see which package repositories your system uses to update its packages.


```bash
# Komut
cat /etc/apt/sources.list

# Çıktı

# deb cdrom:[Xubuntu 14.04.2 LTS _Trusty Tahr_ - Release amd64 (20150218.1)]/ trusty main multiverse restricted universe
# deb cdrom:[Xubuntu 14.04.2 LTS _Trusty Tahr_ - Release amd64 (20150218.1)]/ trusty main multiverse restricted universe

# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.
deb http://tr.archive.ubuntu.com/ubuntu/ trusty main restricted
deb-src http://tr.archive.ubuntu.com/ubuntu/ trusty main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://tr.archive.ubuntu.com/ubuntu/ trusty-updates main restricted
deb-src http://tr.archive.ubuntu.com/ubuntu/ trusty-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://tr.archive.ubuntu.com/ubuntu/ trusty universe
deb-src http://tr.archive.ubuntu.com/ubuntu/ trusty universe
deb http://tr.archive.ubuntu.com/ubuntu/ trusty-updates universe
deb-src http://tr.archive.ubuntu.com/ubuntu/ trusty-updates universe
```



# apt get update



 Thanks to the apt-get update command, the differences between the packages installed on your system and the versions in the package repository are searched and the list is updated. In fact, the only thing done is updating the list. It is strongly recommended to run it before any update process because it is a necessary process to resolve the necessary updates and dependencies in your system.


<!-- wp:quote -->
<blockquote class="wp-block-quote">
<a href="https://www.siberoloji.com/apt-get-update-upgrade-dist-upgrade-farki-nedir/#"> </a>There is no installation on your system with the apt-get update command.
</blockquote>
<!-- /wp:quote -->

```bash
# Komut
sudo apt-get update

# Çıktı
      
Get:4 http://mega.nz ./ Release [967 B]                                                   
Hit http://tr.archive.ubuntu.com trusty-updates/restricted i386 Packages       
Get:10 http://security.ubuntu.com trusty-security/main amd64 Packages [344 kB] 
Hit http://tr.archive.ubuntu.com trusty-updates/universe i386 Packages         
Hit http://ppa.launchpad.net trusty Release.gpg                                
Hit http://linux.dropbox.com trusty Release                                    
Hit http://tr.archive.ubuntu.com trusty-updates/multiverse i386 Packages       
Hit http://tr.archive.ubuntu.com trusty-updates/main Translation-en            
Hit http://ppa.launchpad.net trusty Release.gpg                                
Hit http://tr.archive.ubuntu.com trusty-updates/multiverse Translation-en      
Hit http://tr.archive.ubuntu.com trusty-updates/restricted Translation-en      
Hit http://tr.archive.ubuntu.com trusty-updates/universe Translation-en        
Hit http://ppa.launchpad.net trusty Release                                    
Hit http://tr.archive.ubuntu.com trusty-backports/main Sources                 
Hit http://tr.archive.ubuntu.com trusty-backports/restricted Sources           
Hit http://tr.archive.ubuntu.com trusty-backports/universe Sources             
Hit http://ppa.launchpad.net trusty Release                                    
Ign http://extras.ubuntu.com trusty/main Translation-en_US                     
Hit http://tr.archive.ubuntu.com trusty-backports/multiverse Sources           
Get:11 http://security.ubuntu.com trusty-security/restricted amd64 Packages [8.875 B]
Hit http://tr.archive.ubuntu.com trusty-backports/main amd64 Packages          
Hit http://tr.archive.ubuntu.com trusty-backports/restricted amd64 Packages    
Hit http://ppa.launchpad.net trusty Release                                    
Hit http://tr.archive.ubuntu.com trusty-backports/universe amd64 Packages      
Ign http://extras.ubuntu.com trusty/main Translation-en                        
Get:12 http://security.ubuntu.com trusty-security/universe amd64 Packages [117 kB]
Hit http://tr.archive.ubuntu.com trusty-backports/multiverse amd64 Packages    
Hit http://ppa.launchpad.net trusty Release                                    
Hit http://linux.dropbox.com trusty/main amd64 Packages                        
Hit http://tr.archive.ubuntu.com trusty-backports/main i386 Packages           
Hit http://tr.archive.ubuntu.com trusty-backports/restricted i386 Packages     
Get:13 http://security.ubuntu.com trusty-security/multiverse amd64 Packages [3.691 B]

Fetched 1.130 kB in 4s (237 kB/s)
Reading package lists... Done
```



# apt-get upgrade



It upgrades all the packages installed on your system to the latest version in the list you updated with the apt-get update command. The point to note here is that the update is performed on the INSTALLED  packages. It updates the 1.1 version of the A.lib file to 1.2. It only brings the installed packages to the latest version.



Some  software developers or system administrators do not want to install packages or kernel files that they do not need, considering the stability of their systems. In such a case, an upgrade is quite useful. Only existing packages are upgraded to the latest version. Another important point is that no packages are deleted from the system. Only existing packages are upgraded to the latest version.


```bash
# Komut
sudo apt-get upgrade

# Çıktı

Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.```



# apt-get dist-upgrade



We can say that this command has the most privileges in the  apt system. It updates existing packages, installs new dependencies that are not in the system, and deletes unnecessary ones. It can be used to solve dependency problems and upgrade your system to the latest kernel version. The choice is up to the user. Some users may experience problems with the newly installed kernel version.


```bash
# Komut
sudo apt-get dist-upgrade

# Çıktı

Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.```



 The apt-get dist-upgrade command does not upgrade the system version to a new distribution. For example, you cannot switch from version 14.04 to 14.10. 


```bash
sudo apt-get update &amp;&amp; sudo apt-get -y upgrade

# veya

sudo apt-get update &amp;&amp; sudo apt-get -y upgrade &amp;&amp; sudo apt-get dist-upgrade```
