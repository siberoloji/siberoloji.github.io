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
date: "2016-04-21T23:32:00Z"
guid: https://www.siberoloji.com/?p=1357
id: 1357
image: /assets/images/2024/06/linux1.png
tags:
- linux
- linux fundamentals
- os
title: 13 Tips for Your Linux System
url: /13-tips-for-your-linux-system/
---

  We would like to point out that if you have a Linuxsystem to take care ofand want to rest your head comfortably, you should at least take the precautions we recommend below. 
 

<!-- wp:heading {"level":1} -->
# 1-Have a general security policy 
<!-- /wp:heading -->

  You should create a security policy, even if it is not very detailed, about what the authority limits of your system and users are. It would be very useful to have clear boundaries about what cannot be done without your permission, what can be done, or where the limit of which user profile ends. If you do not bother with the authorization process when usingLinuxand start giving root permission as the definitive solution, you may lose sleep. 
 

<!-- wp:heading {"level":1} -->
# 2-Physical System Security 
<!-- /wp:heading -->

  You should make sure that your system is physically secured. I'm not just talking about locking the door. For example, it's a good idea to restrict the system from being opened by USB, CD, etc. in the BIOS settings. The Boot Password, although not used much, helps you protect BIOS settings. 
 

<!-- wp:heading {"level":1} -->
# 3- Feel free to use SSH 
<!-- /wp:heading -->

  Logging in via SSH requires the use of a pub key. In this way, you will be protected as much as possible from Brute Force style password cracking attacks. Once you spend some time and become familiar with using Ssh, you will see that it is quite safe. 
 

<!-- wp:heading {"level":1} -->
# 4-Don't leave the update job for tomorrow 
<!-- /wp:heading -->

  If you want to wait until tomorrow to update your system, you may be too late. If you don't do what you will do with a few lines of command, you may be in a very difficult situation. This evening, there may be a series or a match that you love very much. For some reason, data abuses always coincide with such times. 
 

<!-- wp:heading {"level":1} -->
# 5-Your Open Ports are like the Open Windows of Your Home 
<!-- /wp:heading -->

  The data flow of your system is done through ports. It is very useful to check open ports with the netstat command. After a while, you will become familiar with which service is using which port and oddities will immediately catch your eye. Remember, attackers do not enter your system to do their job in 5 minutes and exit. They usually get authorization and start visiting frequently. Ports provide very useful information for you to detect. Let's state a proverb here. "THE FOX PASSES, THE ROAD BECOMES". The fox should never pass, remember this. 
 

<!-- wp:heading {"level":1} -->
# 6-Forget to log in to ROOT 
<!-- /wp:heading -->

  Sometimes you may want to do the job as quickly as possible. It may also be tempting to log in as root. You should think again. 
 

<!-- wp:heading {"level":1} -->
# 7-What are the uses of system log files? 
<!-- /wp:heading -->

  <a href="https://www.siberoloji.com/linux-sisteminiz-icin-13-tavsiye/#"></a>Log files on yourLinuxsystem are produced for administrators and users to read and review. A healthy Linuxinforms you about the issues it is disturbed by using log files. Be sure to learn to check the records and don't ignore them. 
 

<!-- wp:heading {"level":1} -->
# 8-Backup 
<!-- /wp:heading -->

  This is a very classic advice, but it still wouldn't hurt to say it. Backup is very important. Back up your system. One piece of advice regarding backup is password protection. Store your backup files with password protection. Unprotected backup files can cause major vulnerabilities. 
 

<!-- wp:heading {"level":1} -->
# 9-Do you use IPv6? 
<!-- /wp:heading -->

  If you are not currently using IPv6, turn it off. There is no need to keep something open on your system that you do not use. If IPv6, which is turned on by default in some distributions, is not turned off, malicious people will send malicious packets over IPv6. System administrators generally do not follow IPv6 either. 
 

<!-- wp:heading {"level":1} -->
# 10-You can use SSH Banner. 
<!-- /wp:heading -->

  You can notify users who connect to your system via SSH about minor warnings and important announcements using SSH banners. In fact, it is a very good method for creating user awareness. 
 

<!-- wp:heading {"level":1} -->
# 11-Unnecessary services should be closed. 
<!-- /wp:heading -->

  There is no need to say much about this. You install and try many programs. Then you do not uninstall or stop them. Close the unnecessary ones. For example, Bluetooth? 
 

<!-- wp:heading {"level":1} -->
# 12-SELinux 
<!-- /wp:heading -->

  We recommend using SELinux for your security policies. Some distributions use apparmor but by default it is in permessive mode. You should research and gain knowledge on this subject. 
 

<!-- wp:heading {"level":1} -->
# 13-Less Programs, Less Vulnerabilities 
<!-- /wp:heading -->

  Removing programs you don't need on your system is a very effective approach. There is no need to keep some programs installed on your system even if you do not use them even once a month. When necessary, it is possible to install and run it simply with one or two commands. The fewer programs you have installed, the less vulnerabilities you have. 
 

  If you implemented all these, sleep well. 
 