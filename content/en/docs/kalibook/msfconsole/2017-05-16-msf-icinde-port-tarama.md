---
draft: false
title: Port Scanning in MSF
linktitle: Port Scanning
translationKey: port-scanning-in-msf
weight: 130
date: 2017-05-16T12:51:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this article, we will briefly look at the port scanning modules provided in Metasploit.
url: /port-scanning-in-msf/
featured_image: /images/metasploit.jpg
categories:
   - Metasploit Framework
tags:
   - cybersecurity
   - metasploit framework
---
In this article, we will briefly look at the port scanning modules provided in Metasploit. In addition to Nmap and other port scanning options, we will see what kind of flexibility the port scanning modules provided by Metasploit provide to the user.

## Port Scanning in Metasploit

Scanners and almost all auxiliary modules use the RHOSTS variable instead of RHOST. The RHOSTS variable can take IP ranges that can be entered in different formats.

* IP Ranges (192.168.1.20-192.168.1.30)

* CIDR Notation (192.168.1.0/24),

* Multiple formats (192.168.1.0/24, 192.168.3.0/24),

* IP addresses from a bis file (file:/tmp/hostlist.txt). There should be 1 IP in each line

## THREADS

There is a variable called `THREADS` in the scanning modules used in Metasploit. This variable allows us to determine how many channels the test will be run from during the scan. The `THREADS` variable is set to 1 by default. Increasing this value speeds up the scan. Although it is useful for speeding up the scan and making things faster, it has some limitations. You should consider the recommendations regarding the `THREADS` variable in the list below.

* If the MSF program is running on Win32 systems, set the `THREADS` value to 16 and below.

* If the MSF program is running on a Cygwin system, set the `THREADS` value to 200 and below.

* If the MSF program is running on a Unix-like system, you can set the `THREADS` value to 256.

## Nmap &amp; db_nmap

In Metasploit, you can use the classic `nmap` command as well as the `db_nmap` command. When you use the `db_nmap` command, the results found are automatically transferred to the hosts table. When you scan with `nmap`, if you save the results to a file in formats (xml, grepable and normal) for later use with the `-oA` parameter, you can import that file into Metasplot with the `db_import` command.

Below, you can see an example of using the nmap command. You can use the `nmap` command from the operating system's command line, as well as `nmap` from the `msf >` command line. The `nmap` command in the example will save the results to files named `subnet_1`. You can transfer these files to Metasploit if you want. If you use the `db_nmap -v -sV 192.168.1.0/24` command instead, the results will automatically be saved to the `hosts` table.

```bash
msf > nmap -v -sV 192.168.1.0/24 -oA subnet_1
> exec: nmap -v -sV 192.168.1.0/24 -oA subnet_1

Starting Nmap 5.00 ( <a href="http://nmap.org/">http://nmap.org</a> ) at 2009-08-13 19:29 MDT
NSE: Loaded 3 scripts for **scanning.
Initiating ARP Ping Scan at 19:29
Scanning 101 hosts [1 port/host]
...
Nmap **done**: 256 IP addresses (16 hosts up) scanned **in **499.41 seconds
Raw packets cents: 19973 (877.822KB) | Rcvd: 15125 (609.512KB)
```

## Port Scanning

You don't have to use only `nmap` or `db_nmap` for port scanning. There are also other port scanning modules in Metasploit. You can list them with the `search portscan` command.

```bash
msf > search portscan

Matching Modules
***********************

 Name Disclosure Date Rank Description
 ---- --------------- ---- -----------
 auxiliary/scanner/natpmp/natpmp_portscan normal NAT-PMP External Port Scanner
 auxiliary/scanner/portscan/ack normal TCP ACK Firewall Scanner
 auxiliary/scanner/portscan/ftpbounce normal FTP Bounce Port Scanner
 auxiliary/scanner/portscan/syn normal TCP SYN Port Scanner
 auxiliary/scanner/portscan/tcp normal TCP Port Scanner
 auxiliary/scanner/portscan/xmas normal TCP "XMas" Port Scanner
```

Now a scan made with `nmap` and in Metasploit Let's compare the scan results made with the `auxiliary/scanner/portscan/syn` scan module.

### nmap SYN Scan results

```bash
msf > cat subnet_1.gnmap | grep 80/open | awk '{print $2}'
> exec: cat subnet_1.gnmap | grep 80/open | awk '{print $2}'

192.168.1.1
192.168.1.2
192.168.1.10
192.168.1.109
192.168.1.116
192.168.1.150
```

### Metasploit SYN Module Scan and Results

```bash
msf > use auxiliary/scanner/portscan/syn
msf auxiliary(syn) > show options

Module options (auxiliary/scanner/portscan/syn):

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 BATCHSIZE 256 yes The number of hosts to scan per set
 DELAY 0 yes The delay between connections, per thread, in milliseconds
 INTERFACE no The name of the interface
 JITTER 0 yes The delay jitter factor (maximum value by which to +/- DELAY) **in **milliseconds.
 PORTS 1-10000 yes Ports to scan (e.g. 22-25,80,110-900)
 RHOSTS yes The target address range or CIDR identifier
 SNAPLEN 65535 yes The number of bytes to capture
 THREADS 1 yes The number of concurrent THREADS
 TIMEOUT 500 yes The reply read timeout **in **milliseconds

msf auxiliary(syn) > set INTERFACE eth0
INTERFACE => eth0
msf auxiliary(syn) > set PORTS 80
PORTS => 80
msf auxiliary(syn) > set RHOSTS 192.168.1.0/24
RHOSTS => 192.168.1.0/24
msf auxiliary(syn) > set THREADS 50
THREADS => 50
msf auxiliary(syn) > run

> TCP OPEN 192.168.1.1:80
> TCP OPEN 192.168.1.2:80
> TCP OPEN 192.168.1.10:80
> TCP OPEN 192.168.1.109:80
> TCP OPEN 192.168.1.116 :80
> TCP OPEN 192.168.1.150:80
> Scanned 256 of 256 hosts (100% complete)
> Auxiliary module execution completed
```

We know that the scan we did above with the Metasploit `auxiliary/scanner/portscan/syn` module was recorded in the `hosts` table Now let's run a TCP scan using these results. Recall that the IP information needed by an active module is transferred to the RHOSTS variable from the `hosts` table with the `hosts -R` command.

```bash
msf > use auxiliary/scanner/portscan/tcp
msf auxiliary(tcp) > show options

Module options (auxiliary/scanner/portscan/tcp):

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 CONCURRENCY 10 yes The number of concurrent ports to check per host
 DELAY 0 yes The delay between connections, per thread, **in **milliseconds
 JITTER 0 yes The delay jitter factor (maximum value by which to +/- DELAY) **in **milliseconds.
 PORTS 1-10000 yes Ports to scan (e.g. 22-25,80,110-900)
 RHOSTS yes The target address range or CIDR identifier
 THREADS 1 yes The number of concurrent THREADS
 TIMEOUT 1000 yes The socket connect timeout **in **milliseconds

msf auxiliary(tcp) > hosts -R

Hosts
**=====**

address mac name os_name os_flavor os_sp purpose info comments
------- --- ---- ------- --------- ----- ------- ---- ---- ----
172.16.194.172 00:0C:29:D1:62:80 Linux Ubuntu server

RHOSTS => 172.16.194.172

msf auxiliary(tcp) > show options

Module options (auxiliary/scanner/portscan/tcp):

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 CONCURRENCY 10 yes The number of concurrent ports to check per host
 FILTER no The filter string for **capturing traffic
 INTERFACE no The name of the interface
 PCAPFILE no The name of the PCAP capture file to process
 PORTS 1-1024 yes Ports to scan (e.g. 22-25,80,110-900)
 RHOSTS 172.16.194.172 yes The target address range or CIDR identifier
 SNAPLEN 65535 yes The number of bytes to capture
 THREADS 10 yes The number of concurrent THREADS
 TIMEOUT 1000 yes The socket connect timeout **in **milliseconds

msf auxiliary(tcp) > run

> 172.16.194.172:25 - TCP OPEN
> 172.16.194.172:23 - TCP OPEN
> 172.16.194.172:22 - TCP OPEN
> 172.16.194.172:21 - TCP OPEN
> 172.16.194.172:53 - TCP OPEN
> 172.16.194.172:80 - TCP OPEN
> 172.16.194.172:111 - TCP OPEN
> 172.16.194.172:139 - TCP OPEN
> 172.16.194.172:445 - TCP OPEN
> 172.16.194.172:514 - TCP OPEN
> 172.16.194.172:513 - TCP OPEN
> 172.16.194.172:512 - TCP OPEN
> Scanned 1 of 1 hosts (100% complete)
> Auxiliary module execution completed
msf auxiliary(tcp) >
```

For computers that do not have `nmap` installed in their operating systems, Metasploit scanning modules provide great convenience.

## SMB Version Scanning

Let's assume that we see that some IP addresses are open and Ports 445 are active in the SYN and TCP scans we perform. In this case, we can use the scan called `smb` for Windows and `samba` for Linux.

```bash
msf > use auxiliary/scanner/smb/smb_version
msf auxiliary(smb_version) > set RHOSTS 192.168.1.200-210
RHOSTS => 192.168.1.200-210
msf auxiliary(smb_version) > set THREADS 11
THREADS => 11
msf auxiliary(smb_version) > run

> 192.168.1.209:445 is running Windows 2003 R2 Service Pack 2 (language: Unknown) (name:XEN-2K3-FUZZ) (domain:WORKGROUP)
> 192.168.1.201:445 is running Windows XP Service Pack 3 (language: English) (name:V-XP-EXPLOIT) (domain:WORKGROUP)
> 192.168.1.202:445 is running Windows XP Service Pack 3 (language: English) (name:V-XP-DEBUG) (domain:WORKGROUP)
> Scanned 04 of 11 hosts (036% complete)
> Scanned 09 of 11 hosts (081% complete)
> Scanned 11 of 11 hosts (100% complete)
> Auxiliary module execution completed
```

Now if you issue the `hosts` command again, you can see that the latest `smb` scan results have been added to the table.

```bash
msf auxiliary(smb_version) > hosts

Hosts
**=====**

address mac name os_name os_flavor os_sp purpose info comments
------- --- ---- ------- --------- ----- ------- ---- --------
192.168.1.201 Microsoft Windows XP SP3 client
192.168.1.202 Microsoft Windows XP SP3 client
192.168.1.209 Microsoft Windows 2003 R2 SP2 server
```

## Idle Scan

One of the scan types provided to the user by Nmap is Idle scan. In a network, an idle computer is found and other IP addresses on the network are scanned using its IP number. First, we need to find an IP address to use for Idle scan. Let's use the `auxiliary/scanner/ip/ipidseq` module to find it.

```bash
msf > use auxiliary/scanner/ip/ipidseq
msf auxiliary(ipidseq) > show options

Module options (auxiliary/scanner/ip/ipidseq):

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 INTERFACE no The name of the interface
 RHOSTS yes The target address range or CIDR identifier
 RPORT 80 yes The target port
 SNAPLEN 65535 yes The number of bytes to capture
 THREADS 1 yes The number of concurrent THREADS
 TIMEOUT 500 yes The reply read timeout **in **milliseconds

msf auxiliary(ipidseq) > set RHOSTS 192.168.1.0/24
RHOSTS => 192.168.1.0/24
msf auxiliary(ipidseq) > set THREADS 50
THREADS => 50
msf auxiliary(ipidseq) > run

> 192.168.1.1's IPID sequence class: All zeros
[*] 192.168.1.2's IPID sequence class: Incremental!
> 192.168.1.10's IPID sequence class: Incremental!
[*] 192.168.1.104's IPID sequence class: Randomized
> 192.168.1.109's IPID sequence class: Incremental!
[*] 192.168.1.111's IPID sequence class: Incremental!
> 192.168.1.114's IPID sequence class: Incremental!
[*] 192.168.1.116's IPID sequence class: All zeros
> 192.168.1.124's IPID sequence class: Incremental!
[*] 192.168.1.123's IPID sequence class: Incremental!
> 192.168.1.137's IPID sequence class: All zeros
[*] 192.168.1.150's IPID sequence class: All zeros
> 192.168.1.151's IPID sequence class: Incremental!
[*] Auxiliary module execution completed
```

The IP addresses seen in the output can be used for Idle Scanning. In the example below, the IP address `192.168.1.109` was used as a zombie and a port scan was performed on another IP address (`192.168.1.114`) in the system.

```bash
msf auxiliary(ipidseq) > nmap -PN -sI 192.168.1.109 192.168.1.114
> exec: nmap -PN -sI 192.168.1.109 192.168.1.114

Starting Nmap 5.00 ( <a href="http://nmap.org/">http://nmap.org</a> ) at 2009-08-14 05:51 MDT
Idle scan using zombie 192.168.1.109 (192.168.1.109:80); Class: Incremental
Interesting ports on 192.168.1.114:
Not shown: 996 closed|filtered ports
PORT STATE SERVICE
135/tcp open msrpc
139/tcp open netbios-ssn
445/tcp open microsoft-ds
3389/tcp open ms-term-serv
MAC Address: 00:0C:29:41:F2:E8 (VMware)

Nmap **done**: 1 IP address (1 host up) scanned **in **5.56 seconds
```

The open ports and services found as a result of this scan can be seen in the output. You can also do the same with the `db_nmap` command.
