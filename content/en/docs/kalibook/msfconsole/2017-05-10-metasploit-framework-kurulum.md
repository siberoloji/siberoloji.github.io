---
draft: false
title: Metasploit Framework Installation
date: 2017-05-10T02:09:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Metasploit Framework is a software used in penetration testing and security testing. The Pro version of the software developed by Rapid7 is distributed for a fee and has visual interface support.
url: /metasploit-framework-installation/
weight: 10
translation_key: metasploit-framework-installation
featured_image: /images/metasploit.jpg
categories:
  - Metasploit Framework
tags:
  - cybersecurity
  - metasploit framework
linkTitle: Metasploit Framework Installation
---

Metasploit Framework is a software used in penetration testing and security testing. The Pro version of the software developed by Rapid7 is distributed for a fee and has visual interface support.

Metasploit Framework comes installed in Kali etc. distributions. Even if you do not use Kali, you can install it on your own Linux distribution. In this article, we will examine how to install the free version, which is the Community version and works from the command line. It is estimated that the commands used in the explanation will work on all Ubuntu-based distributions. We performed our tests and trials on Linux Mint 18.1 Cinnamon Linux distribution.

## Let's Update Linux Mint

Linux will be updated and restarted with the following commands.

```bash
sudo apt-get update && sudo apt-get dist-upgrade -y
reboot
```

## Let's Install MSF Framework

The following installation script codes provided by Rapid7 will do all the necessary operations.

{{% alert title="Warning" color="warning" %}}
It is not recommended to download such script codes from unsafe sources.
{{% /alert %}}

The following command should be run with root permissions.

```bash
cd
sudo su
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall
```

When the process starts, the screen will continue as follows.

```bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  5394  100  5394    0     0   9248      0 --:--:-- --:--:-- --:--:--  9252
Updating package cache..OK
Checking **for **and installing update..
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  metasploit-framework
0 upgraded, 1 newly installed, 0 to remove and 1 not upgraded.
Need to get 176 MB of archives.
After this operation, 431 MB of additional disk space will be used.
Get:1 <a href="http://downloads.metasploit.com/data/...[176">http://downloads.metasploit.com/data/...[176</a> MB]

```

The above command will add the Rapid7 APT Repository to the system and install the necessary packages.

After the installation, return from root privileges to normal user privileges with the `exit` command. The # sign in the command line should change to $.

```bash
umut-X550JX umut # exit
umut@umut-X550JX ~ $
```

### First run

Run the `msfconsole` command in the command line and create a database: Answer `yes` to the question **Would you like to use and setup a new database (recommended)?**

```bash
user@mint ~ $ msfconsole

  ****** Welcome to Metasploit Framework Initial Setup ******

     Please answer a few questions to get started.

 Would you like to use and setup a new database **(**recommended**)**? yes

 Creating database at /home/user/.msf4/db

 Starting database at /home/user/.msf4/db

 Creating database users

 Creating initial database schema

  ****** Metasploit Framework Initial Setup Complete ******

```

If things went well (which I'm sure they will), you will be greeted with a screen similar to the example below.

```bash
                                                  
     ,           ,
    /             \
   **((**__---,,,---__**))**
      **(**_**)** O O **(**_**)**_________
         \ _ /            |\
          o_o \   M S F   | \
               \   _____  |  *****
                **||**|   WW|||
                **||**|     **||**|


       **=[** metasploit v4.14.17-dev-                        **]**
+ -- --**=[** 1647 exploits - 945 auxiliary - 291 post        **]**
+ -- --**=[** 486 payloads - 40 encoders - 9 nops             **]**
+ -- --**=[** Free Metasploit Pro trial: <a href="http://r-7.co/trymsp">http://r-7.co/trymsp</a> **]**

msf > 
```

###  Let's check the connection to the database.

You can check the database connection with the `msfdb status` command.

```bash
msf > msfdb status
> exec: msfdb status

Database started at /home/umut/.msf4/db
msf > 
```

The database will create the exploit index in a few minutes. Then you will be able to `search` for exploits faster with the search command.

For example, if you are looking for an exploit related to samba, the following `search samba` command may be useful.

```bash
msf > search samba

Matching Modules
**================**

   Name                                            Disclosure Date  Rank       Description
   ----                                            ---------------  ----       -----------
   auxiliary/admin/smb/samba_symlink_traversal                      normal     Samba Symlink Directory Traversal
   auxiliary/dos/samba/lsa_addprivs_heap                            normal     Samba lsa_io_privilege_set Heap Overflow
   auxiliary/dos/samba/lsa_transnames_heap                          normal     Samba lsa_io_trans_names Heap Overflow
   auxiliary/dos/samba/read_nttrans_ea_list                         normal     Samba read_nttrans_ea_list Integer Overflow
   auxiliary/scanner/rsync/modules_list                             normal     List Rsync Modules
   auxiliary/scanner/smb/smb_uninit_cred                            normal     Samba _netr_ServerPasswordSet Uninitialized Credential State
   exploit/freebsd/samba/trans2open                2003-04-07       great      Samba trans2open Overflow **(*******BSD x86**)**
   exploit/linux/samba/chain_reply                 2010-06-16       good       Samba chain_reply Memory Corruption **(**Linux x86**)**
   exploit/linux/samba/lsa_transnames_heap         2007-05-14       good       Samba lsa_io_trans_names Heap Overflow
   exploit/linux/samba/setinfopolicy_heap          2012-04-10       normal     Samba SetInformationPolicy AuditEventsInfo Heap Overflow
   exploit/linux/samba/trans2open                  2003-04-07       great      Samba trans2open Overflow **(**Linux x86**)**
   exploit/multi/samba/nttrans                     2003-04-07       average    Samba 2.2.2 - 2.2.6 nttrans Buffer Overflow
   exploit/multi/samba/usermap_script              2007-05-14       excellent  Samba "username map script" Command Execution
   exploit/osx/samba/lsa_transnames_heap           2007-05-14       average    Samba lsa_io_trans_names Heap Overflow
   exploit/osx/samba/trans2open                    2003-04-07       great      Samba trans2open Overflow **(**Mac OS X PPC**)**
   exploit/solaris/samba/lsa_transnames_heap       2007-05-14       average    Samba lsa_io_trans_names Heap Overflow
   exploit/solaris/samba/trans2open                2003-04-07       great      Samba trans2open Overflow **(**Solaris SPARC**)**
   exploit/unix/misc/distcc_exec                   2002-02-01       excellent  DistCC Daemon Command Execution
   exploit/unix/webapp/citrix_access_gateway_exec  2010-12-21       excellent  Citrix Access Gateway Command Execution
   exploit/windows/fileformat/ms14_060_sandworm    2014-10-14       excellent  MS14-060 Microsoft Windows OLE Package Manager Code Execution
   exploit/windows/http/sambar6_search_results     2003-06-21       normal     Sambar 6 Search Results Buffer Overflow
   exploit/windows/license/calicclnt_getconfig     2005-03-02       average    Computer Associates License Client GETCONFIG Overflow
   exploit/windows/smb/group_policy_startup        2015-01-26       manual     Group Policy Script Execution From Shared Resource
   post/linux/gather/enum_configs                                   normal     Linux Gather Configurations

```

Metasploit Framework is updated very frequently. Since the package repository is added to your system, it can be updated with `apt update` or from within msfconsole You can update it with the `msfupdate` command.

{{<youtube "FZvrukt9B-c">}}
