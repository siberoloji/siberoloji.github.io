---
draft: false

title:  'Linux command initialization in background &amp; parameter'
date: '2024-01-16T14:32:40+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'When you enter a command while working on the Linux command line, you have to wait until that command is finished if you want to enter another command. To solve this, you can make new windows and new connections, but there is another solution.' 
 
url:  /linux-command-initialization-in-background-parameter/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
featured_image: /images/linuxbgfgcommands.png
categories:
    - 'Linux Fundamentals'
tags:
    - linux
    - 'linux fundamentals'
    - os
    - software
---


When you enter a command while working on the Linux command line, you have to wait until that command is finished if you want to enter another command. To solve this, you can make new windows and new connections, but there is another solution.



You can start the command you will give first, in the background. For example, if you want to start a long copy process in the background and deal with other tasks, it will be sufficient to put an &amp; sign at the end of the command.


```bash
linux@rpi4:~ $ sudo apt update &amp;
[1] 7336
linux@rpi4:~ $ jobs
[1]+  Stopped                 sudo apt update
linux@rpi4:~ $ fg 1
sudo apt update
[sudo] password for linux: 
Hit:1 http://deb.debian.org/debian bookworm InRelease
Hit:2 http://archive.raspberrypi.com/debian bookworm InRelease
Hit:3 http://deb.debian.org/debian-security bookworm-security InRelease
Hit:4 http://deb.debian.org/debian bookworm-updates InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
linux@rpi4:~ $ 
```



As you can see above, we started the update process in the background with the `sudo apt update &amp;` command. In this case, the system showed us the job number of the job that started in the background as `[1]`. If more than one job is being done in the background, we can see their list with the jobs command. We can also bring a background process back to the foreground with the `fg 1` command. If we want to do the opposite, we can send a running job to the background using the <kbd>Ctrl+z </kbd>keys.



The most important convenience that should be emphasized here is that the command line comes back to our use as soon as we give the command with the `&amp;` sign.
