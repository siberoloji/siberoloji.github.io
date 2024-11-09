---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux Fundamentals
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-04-01T13:53:00Z"
excerpt: If you have Ubuntuoran operating system that usesthe apt package manager,
  you must have usedapt-getupdateand similar commands.We will show that although
  the apt-getupdate,apt-get upgradeandapt-get dist-upgradecommands are similar
  to each other, they have different tasks.
guid: https://www.siberoloji.com/?p=1313
id: 1313
image: /assets/images/2024/06/cyber2.jpg
tags:
- apt-get
- linux
- linux fundamentals
- os
title: What is the difference between apt-get update / upgrade / dist-upgrade?
url: /what-is-the-difference-between-apt-get-update-upgrade-dist-upgrade/
---

  &nbsp;If you have Ubuntu&nbsp;oran operating system that uses&nbsp;the apt package manager, you must have used&nbsp;<em>apt-get&nbsp;update</em>&nbsp;&nbsp;and similar commands.&nbsp;<em>&nbsp;We will show that although the apt-get&nbsp;update</em>,&nbsp;<em>apt-get upgrade</em>&nbsp;and<em>&nbsp;apt-get dist-upgrade</em>&nbsp;commands are similar to each other, they have different tasks.
 

  First of all, our&nbsp;&nbsp;Linux&nbsp;system needs a center to check and update itself. The places to look for these lists are kept in the /etc/apt/sources.list file. Briefly, which package repositories to look at are recorded here. The package repositories located here are checked with the apt-get update command.
 

  Let's run the command below to see which package repositories your system uses to update its packages.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Komut
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
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
# apt get update 
<!-- /wp:heading -->

  &nbsp;Thanks to the apt-get&nbsp;update command, the differences between the packages installed on your system and the versions in the package repository are searched and the list is updated. In fact, the only thing done is updating the list. It is strongly recommended to run it before any update process because it is a necessary process to resolve the necessary updates and dependencies in your system.
 

<!-- wp:quote -->
<blockquote class="wp-block-quote">  <em><a href="https://www.siberoloji.com/apt-get-update-upgrade-dist-upgrade-farki-nedir/#">&nbsp;</a>There is no installation on your system with the&nbsp;apt-get update command.</em>
 </blockquote>
<!-- /wp:quote -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Komut
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
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
# apt-get upgrade 
<!-- /wp:heading -->

  It upgrades all the packages installed on your system tothe latest version in the list you updated with theapt-getupdate command. The point to note here is that the update is performed on the INSTALLEDpackages. It updates the 1.1 version of the A.lib file to 1.2. It only brings the installed packages to the latest version.
 

  Some&nbsp;&nbsp;software&nbsp;developers or system administrators do not want to install packages or kernel files that they do not need, considering the stability of their systems. In such a case, an upgrade is quite useful. Only existing packages are upgraded to the latest version. Another important point is that no packages are deleted from the system. Only existing packages are upgraded to the latest version.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Komut
sudo apt-get upgrade

# Çıktı

Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
# apt-get dist-upgrade 
<!-- /wp:heading -->

  We can say that this command has the most privileges in the&nbsp;&nbsp;apt&nbsp;system. It updates existing packages, installs new dependencies that are not in the system, and deletes unnecessary ones. It can be used to solve dependency problems and upgrade your system to the latest kernel version. The choice is up to the user. Some users may experience problems with the newly installed kernel version.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Komut
sudo apt-get dist-upgrade

# Çıktı

Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.</code></pre>
<!-- /wp:code -->

  &nbsp;The apt-get&nbsp;dist-upgrade command does not upgrade the system version to a new distribution. For example, you cannot switch from version 14.04 to 14.10.&nbsp;
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get update &amp;&amp; sudo apt-get -y upgrade

# veya

sudo apt-get update &amp;&amp; sudo apt-get -y upgrade &amp;&amp; sudo apt-get dist-upgrade</code></pre>
<!-- /wp:code -->