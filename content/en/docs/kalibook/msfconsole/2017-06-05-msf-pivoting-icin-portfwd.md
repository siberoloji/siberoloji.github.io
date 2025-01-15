---
draft: false
title: MSF Portfwd for Pivoting
linkTitle: Portfwd for Pivoting
translationKey: msf-pivoting-portfwd
weight: 310
date: 2017-06-05T13:35:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Portfwd allows you to communicate with devices that are not directly accessible on the network.
url: /msf-pivoting-portfwd/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
## Portfwd

The `portfwd` command used as Port Forwarding is one of the possibilities provided by Meterpreter. It is used to communicate with devices that are normally on the network but cannot be directly communicated with. In order for this to happen, we first need a **pivot** computer.

It allows us to connect to a network device that the computer we call pivot can connect to from our own local machine by doing port forwarding. Let's try to explain how this happens with an example. It is useful to state from the beginning that there are 3 computers in this explanation.

* Our own computer: 192.168.1.162 or 0.0.0.0

* Pivot computer: 172.16.194.144

* Target Computer: 172.16.194.191
What we are trying to do here is to somehow communicate with the **target** computer by doing Port Forwarding via the **pivot** computer that we have logged into meterpreter.

## Displaying Help

You can display help for `portfwd` with the `portfwd –h` command while the meterpreter session is open on the pivot machine.

```bash
meterpreter > portfwd -h
Usage: portfwd [-h] [add | delete | list | flush] [args]
OPTIONS:
-L >opt> The local host to listen on (optional).
-h Help banner.
-l >opt> The local port to listen on.
-p >opt> The remote port to connect on.
-r >opt> The remote host to connect on.
meterpreter >
```

## Options

-L: Indicates the IP address of our own computer that we will be listening to. You can leave this option out if your computer does not have more than one network card. By default, `0.0.0.0` will be used for `localhost`.

-h: Displays the help information.

-l: Indicates the port number that we will listen on our local computer.

-p: Indicates the port number of the target computer.

-r: Indicates the IP address of the target computer.

## Arguments

Add: Used to add a new redirect.

Delete: Used to delete an existing redirect.

List: Used to display a list of all currently redirected addresses.

Flush: Used to cancel all active redirects.

## Adding a Redirect

The command that we will give while we are on the **pivot** computer where we opened the Meterpreter shell session is in the following format.

```bash
meterpreter > portfwd add –l 3389 –p 3389 –r [target host]
```

`-l 3389` The port number that we will listen on our local computer

`-p 3389` The target computer port number.

`-r [target host]` The target computer IP address.

Now let's do the port forwarding.

```bash
meterpreter > portfwd add –l 3389 –p 3389 –r 172.16.194.191
> Local TCP relay created: 0.0.0.0:3389 >-> 172.16.194.191:3389
meterpreter >
```

## Redirect Deletion

We can also perform the deletion process while in the **pivot** computer session as in the example below.

```bash
meterpreter > portfwd delete –l 3389 –p 3389 –r 172.16.194.191
> Successfully stopped TCP relay on 0.0.0.0:3389
meterpreter >
```

## Listing Redirects

We can perform the active redirects with the `portfwd list` command.

```bash
meterpreter > portfwd list
0: 0.0.0.0:3389 -> 172.16.194.191:3389
1: 0.0.0.0:1337 -> 172.16.194.191:1337
2: 0.0.0.0:2222 -> 172.16.194.191:2222

3 total local port forwards.
meterpreter >
```

## Clearing All Forwards

We can cancel all forwards that are active in the system with the `portfwd flush` command.

```bash
meterpreter > portfwd flush
> Successfully stopped TCP relay on 0.0.0.0:3389
> Successfully stopped TCP relay on 0.0.0.0:1337
> Successfully stopped TCP relay on 0.0.0.0:2222
> Successfully flushed 3 rules
meterpreter > portfwd list

0 total local port forwards
meterpreter >
```

## Example

Below you can find an example scenario.

## Target Computer

As seen in the command output below, the target computer has the IP address `172.16.194.141`.

```bash
C:\> ipconfig

Windows IP Configuration

Ethernet adapter Local Area Connection 3:

Connection-specific DNS Suffix . : localdomain
IP Address. . . . . . . . . . 172.16.194.141
Subnet Mask. . . . . . . . . . 255.255.255.0
Default Gateway. . . . . . . . . 172.16.194.2

C:\>
```

## Pivot Computer

**Pivot** computer can connect to both `172.16.194.0/24` network and `192.168.1.0/24` network as seen in the output below. On our local computer it is on the network `192.168.1.0/24`.

```bash
meterpreter > ipconfig

MS TCP Loopback interface
Hardware MAC: 00:00:00:00:00:00
IP Address : 127.0.0.1
Netmask : 255.0.0.0

VMware Accelerated AMD PCNet Adapter - Packet Scheduler Miniport
Hardware MAC: 00:aa:00:aa:00:aa
IP Address : 172.16.194.144
Netmask : 255.0.0.0

AMD PCNET Family PCI Ethernet Adapter - Packet Scheduler Miniport
Hardware MAC: 00:bb:00:bb:00:bb
IP Address : 192.168.1.191
Netmask : 255.0.0.0
```

## Local Computer

As a result of the guidance you will see below We can see that our local computer (IP number 192.168.1.162) can send a `ping` signal to the IP address `172.16.194.141` via the **pivot** machine.

```bash
root@kali:~# ifconfig eth1
eth1 Link encap:Ethernet HWaddr 0a:0b:0c:0d:0e:0f
 inet addr:192.168.1.162 Bcast:192.168.1.255 Mask:255.255.255.0
 inet6 addr: fe80::20c:29ff:fed6:ab38/64 Scope:Link
 UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
 RX packets:1357685 errors:0 dropped:0 overruns:0 frame:0
 TX packets:823428 errors:0 dropped:0 overruns:0 carrier:0
 collisions:0 txqueuelen:1000
 RX bytes:318385612 (303.6 MiB) TX bytes:133752114 (127.5 MiB)
 Interrupt:19 Base address:0x2000
root@kali:~# ping 172.16.194.141
PING 172.16.194.141 (172.16.194.141) 56(84) bytes of data.
64 bytes from 172.16.194.141: icmp_req=1 ttl=128 time=240 ms
64 bytes from 172.16.194.141: icmp_req=2 ttl=128 time=117 ms
64 bytes from 172.16.194.141: icmp_req=3 ttl=128 time=119 ms
^C
--- 172.16.194.141 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 117.759/159.378/240.587/57.430 ms

root@kali:~#
```

So how did we achieve this communication?

## Let's Do Redirection

We performed the following redirection process while we were inside the meterpreter shell that we opened on the **pivot** computer.

```bash
meterpreter > portfwd add –l 3389 –p 3389 –r 172.16.194.141
```

After giving the redirection command on the **pivot** computer, you can check that we are listening on port `3389` with the `netstat -antp` command on our local computer.

```bash
root@kali:~# netstat -antp
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address Foreign Address State PID/Program name
tcp 0 0 0.0.0.0:22 0.0.0.0:***** LISTEN 8397/sshd
.....
tcp 0 0 0.0.0.0:3389 0.0.0.0:***** LISTEN 2045/.ruby.bin
.....
tcp6 0 0 :::22 :::***** LISTEN 8397/sshd
root@kali:~#
```

In this case, we can open a `rdesktop` remote desktop connection from our local computer to the target computer or perform other operations.

For example, we can use the `exploit/windows/smb/ms08_067_netapi` module. We can use the variables in this module by entering the IP address and port number of the target computer that we reached as a result of the redirection.

You may think that the subject is a bit confusing. I recommend that you do some testing and training.

Think of it this way, we open the meterpreter shell on the **pivot** machine to reach the target computer. We first redirect to the service that is active on the other IP address that the **pivot** computer can communicate with (for example SAMBA, port 445). Then we can connect to the target computer from our local computer.

You should be careful to redirect the correct IP and port numbers.
