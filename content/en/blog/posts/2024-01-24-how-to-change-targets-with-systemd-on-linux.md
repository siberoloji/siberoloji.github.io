---
draft: false

title:  'How to change targets with systemd on Linux'
date: '2024-01-24T23:08:33+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'In this article, we will see how we can switch between graphics and console and set the default boot target in a Linux distribution that uses the systemd management system.' 
 
url:  /how-to-change-targets-with-systemd-on-linux/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
burst_total_pageviews_count:
    - '4'
featured_image: /images/bash-6.png
categories:
    - 'Linux How-to'
tags:
    - 'how-to guides'
    - linux
    - 'linux how-to'
---


When you start the Linux operating system, the system that controls the startup processes that occur respectively is called "init system". Some Linux distributions use SysV launcher, and some distributions use systemd. If you're using a desktop computer, you'll want to access the graphical interface once the startup process is complete. If you don't need a desktop on the server computer, you want to access the command line, not the graphical interface. In this article, we will see how we can switch between graphics and console and set the default boot target in a Linux distribution that uses the systemd management system.



First, let's see the target states that are installed and active in our system. You can use the "`systemctl list-units --type=target`" command for this.


```bash
linux@rpi4:~ $ systemctl list-units --type=target
  UNIT                   LOAD   ACTIVE SUB    DESCRIPTION                        
  basic.target           loaded active active Basic System
  cryptsetup.target      loaded active active Local Encrypted Volumes
  getty.target           loaded active active Login Prompts
  graphical.target       loaded active active Graphical Interface
  integritysetup.target  loaded active active Local Integrity Protected Volumes
  local-fs-pre.target    loaded active active Preparation for Local File Systems
  local-fs.target        loaded active active Local File Systems
  machines.target        loaded active active Containers
  multi-user.target      loaded active active Multi-User System
  network-online.target  loaded active active Network is Online
  network.target         loaded active active Network
  nfs-client.target      loaded active active NFS client services
  nss-user-lookup.target loaded active active User and Group Name Lookups
  paths.target           loaded active active Path Units
  remote-fs-pre.target   loaded active active Preparation for Remote File Systems
  remote-fs.target       loaded active active Remote File Systems
  rpc_pipefs.target      loaded active active rpc_pipefs.target
  slices.target          loaded active active Slice Units
  sockets.target         loaded active active Socket Units
  swap.target            loaded active active Swaps
  sysinit.target         loaded active active System Initialization
  time-set.target        loaded active active System Time Set
  timers.target          loaded active active Timer Units
  veritysetup.target     loaded active active Local Verity Protected Volumes

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.
24 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.```



Many of the situations listed above are actually a requirement of the ultimate goal (graphical interface, console interface, etc.). Since the cases we are currently interested in are "graphical.target" and "multi-user.target", we do not take the others into consideration.



First, let's see the boot target set by default in our system. For this we use the "`systemctl get-default`" command.


```bash
$ systemctl get-default 
graphical.target```



You can see that the default opening target set in our system is the graphical interface "graphical.target". The conclusion we can draw from here is that when our system starts, all services will be run respectively and you will access the desktop manager with the graphical interface.



Well, if you don't need the desktop or no longer need it, you may want to stop it and reduce system resource usage. In this case, how do we stop the graphical interface and go to the screen we call console, also called the command line, which we will express as "multi-user.target" in our commands.



## from graphical.target to multiuser-target



Our system is currently running in the graphical interface we call graphical.target. What is done here is not to open a Terminal window on the desktop screen. It is to stop the desktop manager completely. You should pay attention. Thanks to the command below, programs using the desktop manager and graphical interface are now completely stopped. You are at the command line.


```bash
sudo systemctl isolate multi-user.target```



## from multiuser-target to graphical.target



If you want to restart the graphical interface, you can use the command below. As a result of this command, the graphical interface and desktop manager will be restarted.


```bash
sudo systemctl isolate graphical.target```



## First boot default target setup



The transition commands we gave above are used for initialization, termination and transition operations after the system is turned on. Now, let's set which state we want your system to target when it first turns on. For this we will use the "systemctl set-default " command.


<!-- wp:code -->
<pre title="Reaches to multi-user target on boot" class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl set-default multi-user.target```


<!-- wp:code -->
<pre title="Reaches to graphical target on boot" class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl set-default graphical.target```



Thanks to these commands, you can reduce resource usage by stopping the graphical interface at any time and switch between them when you need.
