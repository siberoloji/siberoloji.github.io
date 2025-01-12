---
draft: false
title: Service Discovery with Metasploit Framework
translationKey: service-discovery
weight: 140
linkTitle: Service Discovery
date: 2017-05-16T12:54:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Metasploit Framework uses a number of modules to discover services running on specific ports and determine their version numbers.
url: /msf-service-discovery/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
Metasploit Framework includes a number of modules to find services running on specific ports and determine their version numbers. You can use them in some information gathering activities such as service scanning with `nmap`.

## SSH Service

In the example below, we previously ran a scan and found that the `ssh` service was running on two different IP addresses.

```bash
msf > services -p 22 -c name,port,proto

Services
**=========**

host name port proto
---- ---- ---- -----
172.16.194.163 ssh 22 tcp
172.16.194.172 ssh 22 tcp
```

Now let's discover which version of SSH these services are running. For this, we will use the module named `auxiliary/scanner/ssh/ssh_version`.

```bash
msf > use auxiliary/scanner/ssh/ssh_version

msf auxiliary(ssh_version) > set RHOSTS 172.16.194.163 172.16.194.172
RHOSTS => 172.16.194.163 172.16.194.172

msf auxiliary(ssh_version) > show options

Module options (auxiliary/scanner/ssh/ssh_version):

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 RHOSTS 172.16.194.163 172.16.194.172 yes The target address range or CIDR identifier
 RPORT 22 yes The target port
 THREADS 1 yes The number of concurrent threads
TIMEOUT 30 yes Timeout for the SSH probe

msf auxiliary(ssh_version) > run

> 172.16.194.163:22, SSH server version: SSH-2.0-OpenSSH_5.3p1 Debian-3ubuntu7
> Scanned 1 of 2 hosts (050% complete)
> 172.16.194.172:22, SSH server version: SSH-2.0-OpenSSH_4.7p1 Debian-8ubuntu1
> Scanned 2 of 2 hosts (100% complete)
> Auxiliary module execution completed
```

As you can see in the result output, SSH version numbers have been detected.

## FTP Service

The system can be accessed by using the weaknesses of incorrectly configured FTP services. If you see that Port 21 is open on any IP address, it would be useful to check if the FTP service running there allows **Anonymous** access. In the example below, the `ftp_version` module is used. Since only one IP address will be scanned, the `THREADS` variable is set to 1.

First, let's list the IP addresses that have Port 21 open from the `services` table.

```bash
msf > services -p 21 -c name,proto

Services
**=========**

host name proto
---- ---- -----
172.16.194.172 ftp tcp
```

Then, let's use the `auxiliary/scanner/ftp/ftp_version` module.

```bash
msf > use auxiliary/scanner/ftp/ftp_version

msf auxiliary(ftp_version) > set RHOSTS 172.16.194.172
RHOSTS => 172.16.194.172

msf auxiliary(anonymous) > show options
Module options (auxiliary/scanner/ftp/anonymous):

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 FTPPASS mozilla@example.com no The password for the specified username
 FTPUSER anonymous no The username to authenticate as
 RHOSTS 172.16.194.172 yes The target address range or CIDR identifier
 RPORT 21 yes The target port
 THREADS 1 yes The number of concurrent threads

msf auxiliary(anonymous) > run

> 172.16.194.172:21 Anonymous READ (220 (vsFTPd 2.3.4**))**
> Scanned 1 of 1 hosts (100% complete)
> Auxiliary module execution completed
```

As you can see, we have gathered information about SSH and FTP services in a very short time. There are many similar discovery modules in Metasploit Framework. It would be useful to take your time and review the list. You can see the approximate number in the output below.

```bash
msf > use auxiliary/scanner/
Display all 485 possibilities? (y or n)
```
