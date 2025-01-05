---
draft: false

title:  'What is systemd? What is its general structure?'
date: '2016-04-03T14:49:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /what-is-systemd-what-is-its-general-structure/
 
featured_image: /images/linux1.png
categories:
    - 'Linux Fundamentals'
tags:
    - linux
    - 'linux fundamentals'
    - os
    - systemd
---


If you are using Linux Operating System, you must have come across the term “systemd”. At least you must have come across systemd news. In our search on this subject, we had difficulty finding a detailed Turkish source. For this reason, we did a study about systemd.



## Brief Systemd Story



In 2010, Lennart Poettering explained the subject in a  <a href="http://0pointer.de/blog/projects/systemd.html" target="_blank" rel="noreferrer noopener">blog</a>  post. The first version of the software, developed in the C programming language by Lennart Poettering, Kay Sievers, Harald Hoyer, Daniel Mack, Tom Gundersen, and David Herrmann, was published on March 30, 2010. You can reach the official <a href="http://www.freedesktop.org/wiki/" target="_blank" rel="noreferrer noopener">website</a> of the program  from here.



The program called systemd was developed for Linux operating systems. Its purpose is to organize the operation of systems and services on the computer. It performs this management through tools called systemctl, journalctl, notify, analyze, cgls, cgtop, loginctl and nspawn. We leave the details of these tools to another article.



## The basic approach used by systemd



In Linux systems that do not use systemd , the boot manager, as PID 1, first runs the program that will manage the boot process (init). Other services are then started. For example, the Avahi service needs the D-Bus service. In that case, D-Bus will be started first at boot, and Avahi will wait in line. livirtd and X11 services need the HAL service. In that case, the HAL service will start first. Since all these services need the syslog service, syslog will start first. Classic Linux boot works with this logic.



These programs communicate with each other through sockets. Without D-Bus starting, the socket will not open and Avahi cannot connect to the D-Bus socket. Systemd aims to change this approach. Systemd aims to pre-start the connection points -sockets- needed by all services and services, even if the relevant service does not start, and to eliminate the waiting of other waiting programs in the queue. If X11 is waiting for the HAL socket to open to start, the X11 service is given a socket to connect to. Notice that the HAL service has not actually started. The computer's currently idle processing power is used to the maximum extent possible. Efforts are made to minimize the time loss caused by services waiting for each other. In this case, messages sent by the X11 service are kept in a temporary queue and are fulfilled as the services start.



These processes are not only related to the startup process. We should also mention that the systemd service has many functions related to  the software and hardware that are running during the operation of your operating system. We tried to briefly explain the logic on which the systemd approach is based. We think that it is unnecessary to go into too much detail and turn the text into a technical document for now.



## Objections, reservations



systemd performs these operations described above with precompiled binary programs. It does not allow much user intervention. Although you are allowed to control some parameters, the operations are generally preset. Service programs used before systemd (Upstart or sysvinit) perform the procedures they apply via shell. For this reason, users have the opportunity to make personal adjustments using shell. systemd does not perform operations via shell. For this reason, there is a lot of discussion on its advantages and disadvantages. Those who do not accept it because it is against the logic of open source and free  software , state that systemd is a candidate to become Windows svchost.exe. There are also those who find it usable and include it in their distributions by preference or default. In the last part of the article, a few distributions that have started using systemd are listed.



Paul Venezia, in his article published in InfoWorld in August 2014, stated that the systemd approach violates the Unix philosophy because it is a structure that tries to do all the operations itself, which means "claiming that it is a program that never makes errors."



<a href="http://www.zdnet.com/article/linus-torvalds-and-others-on-linuxs-systemd/" target="_blank" rel="noreferrer noopener">We recommend that you read the ZDNet</a> article that summarizes the thoughts of prominent figures on this subject   . In the article in question, Linus Torvalds seems to be not very clear on the subject and says that these are details.



heartsmagic, Forum Manager and General Manager at the Ubuntu Turkey  <a href="https://forum.ubuntu-tr.net/index.php?topic=45368.5" target="_blank" rel="noreferrer noopener">forum</a> ; “For my part, I can't understand how one project (systemd) tries to do so much work. We are already moving further and further away from the Unix philosophy due to end user decisions of major distributions. Whatever the decisions at the top are, now this has become one of the backbones of the system. In Unix philosophy - if I'm not mistaken - you write a tool and it does whatever its job is. Systemd, thank God, tries to take over everything and works on the binary system, which developers hate - even though I'm not into coding. He expresses his thoughts as follows: "Whether we like it or not, Ubuntu and other major distributions will switch to systemd, with all its merits and demerits." He states that large distributions will switch to this and end users will have to keep up.



Below you can see a few of the Linux distributions  that have started using systemd  by **default**.



## Distribution and start dates



Fedora, May 2011



openSUSE, September 2012



ArchLinux, October 2012



Red Hat Enterprise Release, June 2014



Debian, April 2015



Ubuntu, Nisan 2015



For those who do not accept the use of systemd in Debian, the Devuan distribution has been released without systemd installed. Linux, which has created many different distributions in its historical development, has come to a crossroads on a new issue.



As a brief introduction, in this article where we tried to give some basic information about systemd, we tried to reflect different opinions, both positive and negative. We will follow the developments closely.
