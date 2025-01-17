---
draft: false
title: MSF Meterpreter Script API Calls
linktitle: Meterpreter Script API Calls
translationKey: msf-meterpreter-script-api-calls
weight: 340
date: 2017-06-14
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this article, we will examine the API calls that are constantly used and useful in Meterpreter scripts.
url: /msf-meterpreter-script-api-calls/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
## Useful API Calls

In our previous script editing article, we tried to explain the general architectural structure of the script file used in the meterpreter session. In this article, let's see the API call codes that are constantly used and useful for our business one by one and explain what they do.

You can try these calls by creating your own file, or you can run them directly on the target system using the Ruby entrepreneur with the `irb` command from within the Meterpreter session. You can start the `irb` entrepreneur while the meterpreter session is open, as in the example below.

```bash
meterpreter > irb
> Starting IRB shell
> The 'client' variable holds the meterpreter client

>
```

## client.sys.config.sysinfo

This command allows us to learn some information about the system. Below, you can see a few examples of the `client.sys.config.sysinfo` API call.

```bash
> client.sys.config.sysinfo
=> {"OS"=>"Windows XP (Build 2600, Service Pack 3).", "Computer"=>"WINXPVM01"}
>
```

As seen in the command output, the information displayed on the screen actually has different subclasses. For example, “OS” and “Computer” are subclasses of this call. If we want, we can also learn only this class information. For this, the call command can be used as follows.

```bash
> client.sys.config.sysinfo.class
=> Hash
>
```

```bash
> client.sys.config.sysinfo['OS']
=> "Windows XP (Build 2600, Service Pack 3)."
>
```

## client.sys.config.getuid

This call is used to obtain user information.

```bash
> client.sys.config.getuid
=> "WINXPVM01\labuser"
>
```

## client.sys.process.getpid

With this call, we can learn which program the Meterpreter session is embedded in.

```bash
> client.sys.process.getpid
=> 684
```

## client.net.config.interfaces

With this call, you can obtain information about the target system's network cards and interfaces.

```bash
> client.net.config.interfaces
=> [#, #]
> client.net.config.interfaces.class
=> Array
```

As you can see, the API call uses an array type variable. We can see the results by using this variable type in a loop as follows.

```bash
> interfaces = client.net.config.interfaces
=> [#, #]
> interfaces.each do |i|
?> puts i.pretty
 >end
 MS TCP Loopback interface
 Hardware MAC: 00:00:00:00:00:00
 IP Address: 127.0.0.1
 Netmask: 255.0.0.0 AMD PCNET Family PCI Ethernet Adapter - Packet Scheduler Miniport
 Hardware MAC: 00:0c:29:dc:aa:e4
 IP Address: 192.168.1.104
 Netmask: 255.255.255.0
 ```
