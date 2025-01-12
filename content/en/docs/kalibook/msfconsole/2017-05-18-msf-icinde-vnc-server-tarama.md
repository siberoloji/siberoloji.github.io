---
draft: false
title: VNC Server Scanning in MSF
weight: 180
linkTitle: VNC Server Scanning
tranlsationKey: vnc-server-scanning-in-msf
date: 2017-05-18T13:04:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: VNC Authentication None Scanner module is used to scan VNC Servers that allow guest users to connect without a password.
url: /vnc-server-scanning-in-msf/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
Sometimes system administrators neglect to configure the security settings of the services they install. One of the classic mistakes is not closing the services running on the network to users called `guest`. VNC Server is a service that allows remote connection to a computer.

In the example below, a module is used that searches for a VNC Server running in a certain IP range and allowing access without a password. This module is called **VNC Authentication None Scanner** in Metasploit Framework.

If you are a system administrator, you should keep in mind that there are people constantly looking for such vulnerabilities while configuring your services.

```bash
msf auxiliary(vnc_none_auth) > use auxiliary/scanner/vnc/vnc_none_auth
msf auxiliary(vnc_none_auth) > show options

Module options:

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 RHOSTS yes The target address range or CIDR identifier
 RPORT 5900 yes The target port
 THREADS 1 yes The number of concurrent threads

msf auxiliary(vnc_none_auth) > set RHOSTS 192.168.1.0/24
RHOSTS => 192.168.1.0/24
msf auxiliary(vnc_none_auth) > set THREADS 50
THREADS => 50
msf auxiliary(vnc_none_auth) > run

> 192.168.1.121:5900, VNC server protocol version : RFB 003.008
> 192.168.1.121:5900, VNC server security types supported : None, free access!
> Auxiliary module execution completed
```

As seen in the output, VNC Server at `192.168.1.121:5900` allows connection without password.
