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
date: "2016-04-03T14:45:00Z"
guid: https://www.siberoloji.com/?p=1329
id: 1329
image: /assets/images/2024/06/linux-howto.jpg
tags:
- linux
- linux fundamentals
- os
- systemd
title: systemd Tools – General Usage Areas
url: /systemd-tools-general-usage-areas/
---

  Nowadays, Debian, Fedora, Red Hat, Ubuntu and ArchLinux etc. Linux operating systems, which are considered the main distribution , have started to use systemd. Developments show that its use will become widespread. Linux users will need to improve themselves in this area. 
 

  When we search for resources on the internet on this subject, we usually come across&nbsp;English manpages (&nbsp;<a href="http://www.freedesktop.org/software/systemd/man/" target="_blank" rel="noreferrer noopener">wiki</a>&nbsp;) or short blog posts prepared by the developers. It is quite difficult to find a detailed source in Turkish. There is no problem for those who use the operating system visually and do not want to interfere with the rest. However, those who are curious about what is going on in the background or want to have knowledge in problem solving will inevitably need to learn systemd tools. Based on this idea, we plan to continue the articles in a sequential order. 
 

  <a href="https://www.siberoloji.com/systemd-nedir-genel-yapisi-nasildir/" target="_blank" rel="noreferrer noopener">In the introduction</a>&nbsp;article about systemd&nbsp;&nbsp;&nbsp;, we tried to give brief explanatory information. In this article, what tools does systemd offer to users? We will explain what these tools are. 
 

  systemd is a program defined as a system and service manager. It is similar to the services program that runs when Windows Operating System users type the services.msc command in the Run box. It can be controlled from the command line and also has a visual user interface (systemd-ui). 
 

 
 ## What can be done about the services available on the computer?</h2>
<!-- /wp:heading -->

  Examples of operations that can be done are Start, Stop, Restart, Disable, Enable. It is possible to do these with systemd. It was already done with sysvinit, but now it can be done faster. At least systemd should be that the main distributions preferred to switch. 
 

  It is important to go step by step and understand the basics about systemd. All of the computer services we have mentioned as services so far are called units in the systemd literature. In our articles, the term "unit" will be used for conceptual integrity. The service expression is used slightly separately from the unit expression in systemd. 
 

 
 ## Systemd Tools</h2>
<!-- /wp:heading -->

  If systemd is running on your system, you can ask any question you want and get an answer. Then, as users, we need to learn how to “ask questions” and know which tool to use to do this. In systemd, there are 8 tools in the outermost layer that interact with the user. These are called systemctl, journalctl, notify, analyze, cgls, cgtop, loginctl and nspawn. You can interact with systemd using the options, parameters and unit names of these tools. You query the status and wait for an answer, and depending on the answer you receive, you can start, stop or disable a service. 
 

  <strong>TIP:</strong>&nbsp;&nbsp;If you want, you can even use the snapshot service to photograph the status of your system's running services and restore your system to this state in case of a malfunction. (Unless you turn off your computer. When you do, the snapshot is deleted.) 
 

 
 ## Systemd Tools</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### systemctl</h3>
<!-- /wp:heading -->

  It refers to the tool that controls the systemd system and its services. 
 

<!-- wp:heading {"level":3} -->
 ### journalctl</h3>
<!-- /wp:heading -->

  It refers to the tool that checks systemd log files to check and report events. 
 

<!-- wp:heading {"level":3} -->
 ### systemd-notify</h3>
<!-- /wp:heading -->

  It is a tool used to notify other services and users when there is a change in the status of the units. It is usually related to errors that occur during startup. 
 

<!-- wp:heading {"level":3} -->
 ### systemd-analyze</h3>
<!-- /wp:heading -->

  It analyzes the statistics and analysis of the time spent during the startup of your system. Kernel startup time and user processes startup time are measured and displayed separately. This is the tool used to analyze times. 
 

<!-- wp:heading {"level":3} -->
 ### systemd-cgls</h3>
<!-- /wp:heading -->

  It is a tool that is used to check the status of control groups in the systemd operating logic and which services are running in which control group and sub-steps. 
 

<!-- wp:heading {"level":3} -->
 ### systemd-cgtop</h3>
<!-- /wp:heading -->

  In the systemd-cgls tool, all main groups and their members are displayed hierarchically, while in the systemd-cgtop tool, the main group and system usage at the top are displayed. It is similar to the “service –status-all” command in sysvinit. 
 

<!-- wp:heading {"level":3} -->
 ### systemd-loginctl</h3>
<!-- /wp:heading -->

  It is the tool that controls the login processes of the Operating System. It can be defined as the login manager. 
 

<!-- wp:heading {"level":3} -->
 ### systemd-nspawn</h3>
<!-- /wp:heading -->

  It is a tool used for debugging and simulation. It is similar to the chroot tool but more. It allows a program, even another operating system, to be run in isolation, without harming the real resources of the system. It is very useful for software developers.<br>In this article, we talked about the most important systemd tools as clearly as possible. In the following articles, we will try to give detailed explanations and examples. 
 