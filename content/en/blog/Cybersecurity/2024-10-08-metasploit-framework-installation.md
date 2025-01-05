---
draft: false
title: Metasploit Framework Installation
date: 2024-10-08T21:04:27+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /metasploit-framework-installation/
featured_image: /images/metasploit.jpg
categories:
  - Cybersecurity
tags:
  - cybersecurity
  - metasploit framework
---


 Metasploit Framework is a software used in penetration testing and security testing. The Pro version  of the software developed by Rapid7is distributed for a fee and has visual interface support.



Metasploit Framework comes pre-installed in Kali distributions, etc. Even if you don't use Kali, you can install it on your own Linux distribution. In this article, we will examine how to install the free version, which is the Community version and works from the command line. It is estimated that the commands used in the explanation will work in all Ubuntu-based distributions. We performed our tests and trials on the Linux Mint 18.1 Cinnamon Linux distribution.



<h3 class="wp-block-heading" id="linux-mint-güncelleyelim">Let's Update Linux Mint:



Linux will be updated and restarted with the following commands.


```bash
sudo apt-get update &amp;&amp; sudo apt-get dist-upgrade -y
reboot
```



<h3 class="wp-block-heading" id="msf-framework-kuralım">Let's Set Up MSF Framework:



The following installation script codes provided by Rapid7 will do all the necessary operations.



**!!!**  It is not recommended to download such script codes from unsafe sources.



The following command must be run with root privileges.


```bash
cd
sudo su
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb &gt; msfinstall &amp;&amp; \
  chmod 755 msfinstall &amp;&amp; \
  ./msfinstall
```



When the process starts, the screen will continue as follows.


```bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  5394  100  5394    0     0   9248      0 --:--:-- --:--:-- --:--:--  9252
Updating package cache..OK
Checking for and installing update..
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  metasploit-framework
0 upgraded, 1 newly installed, 0 to remove and 1 not upgraded.
Need to get 176 MB of archives.
After this operation, 431 MB of additional disk space will be used.
Get:1 http://downloads.metasploit.com/data/...[176 MB]

```



The above command will add the Rapid7 APT Repository to the system and install the required packages.



After installation,  `exit` return from root privileges to normal user privileges with the command. The # sign in the command line should turn into $.


```bash
umut-X550JX umut # exit
umut@umut-X550JX ~ $
```



<h3 class="wp-block-heading" id="i̇lk-çalıştırma">First run:



Run the command on the command line  `msfconsole` and create a database:   Answer  the question  **Would you like to use and setup a new database (recommended)?**`yes`


```bash
user@mint ~ $ msfconsole

 

  ** Welcome to Metasploit Framework Initial Setup **

     Please answer a few questions to get started.

 Would you like to use and setup a new database (recommended)? yes

 Creating database at /home/user/.msf4/db

 Starting database at /home/user/.msf4/db

 Creating database users

 Creating initial database schema

 

  ** Metasploit Framework Initial Setup Complete **

```



If everything went well (which I'm sure it will), you will be greeted by a screen similar to the example below.


```bash
                                                  
     ,           ,
    /             \
   ((__---,,,---__))
      (_) O O (_)_________
         \ _ /            |\
          o_o \   M S F   | \
               \   _____  |  *
                |||   WW|||
                |||     |||


       =[ metasploit v4.14.17-dev-                        ]
+ -- --=[ 1647 exploits - 945 auxiliary - 291 post        ]
+ -- --=[ 486 payloads - 40 encoders - 9 nops             ]
+ -- --=[ Free Metasploit Pro trial: http://r-7.co/trymsp ]

msf &gt; 
```



<h3 class="wp-block-heading" id="veri-tabanına-bağlantıyı-kontrol-edelim">Let's check the connection to the database.



`msfdb status` You can check the database connection with the command.


```bash
msf &gt; msfdb status
[*] exec: msfdb status

Database started at /home/umut/.msf4/db
msf &gt; 
```



The database will create an exploit index in a few minutes. Then  `search` you will be able to search for exploits faster with the command.



For example, if you are looking for an exploit related to samba, the following  `search samba`command may be useful.


```bash
msf &gt; search samba

Matching Modules
================

   Name                                            Disclosure Date  Rank       Description
   ----                                            ---------------  ----       -----------
   auxiliary/admin/smb/samba_symlink_traversal                      normal     Samba Symlink Directory Traversal
   auxiliary/dos/samba/lsa_addprivs_heap                            normal     Samba lsa_io_privilege_set Heap Overflow
   auxiliary/dos/samba/lsa_transnames_heap                          normal     Samba lsa_io_trans_names Heap Overflow
   auxiliary/dos/samba/read_nttrans_ea_list                         normal     Samba read_nttrans_ea_list Integer Overflow
   auxiliary/scanner/rsync/modules_list                             normal     List Rsync Modules
   auxiliary/scanner/smb/smb_uninit_cred                            normal     Samba _netr_ServerPasswordSet Uninitialized Credential State
   exploit/freebsd/samba/trans2open                2003-04-07       great      Samba trans2open Overflow (*BSD x86)
   exploit/linux/samba/chain_reply                 2010-06-16       good       Samba chain_reply Memory Corruption (Linux x86)
   exploit/linux/samba/lsa_transnames_heap         2007-05-14       good       Samba lsa_io_trans_names Heap Overflow
   exploit/linux/samba/setinfopolicy_heap          2012-04-10       normal     Samba SetInformationPolicy AuditEventsInfo Heap Overflow
   exploit/linux/samba/trans2open                  2003-04-07       great      Samba trans2open Overflow (Linux x86)
   exploit/multi/samba/nttrans                     2003-04-07       average    Samba 2.2.2 - 2.2.6 nttrans Buffer Overflow
   exploit/multi/samba/usermap_script              2007-05-14       excellent  Samba "username map script" Command Execution
   exploit/osx/samba/lsa_transnames_heap           2007-05-14       average    Samba lsa_io_trans_names Heap Overflow
   exploit/osx/samba/trans2open                    2003-04-07       great      Samba trans2open Overflow (Mac OS X PPC)
   exploit/solaris/samba/lsa_transnames_heap       2007-05-14       average    Samba lsa_io_trans_names Heap Overflow
   exploit/solaris/samba/trans2open                2003-04-07       great      Samba trans2open Overflow (Solaris SPARC)
   exploit/unix/misc/distcc_exec                   2002-02-01       excellent  DistCC Daemon Command Execution
   exploit/unix/webapp/citrix_access_gateway_exec  2010-12-21       excellent  Citrix Access Gateway Command Execution
   exploit/windows/fileformat/ms14_060_sandworm    2014-10-14       excellent  MS14-060 Microsoft Windows OLE Package Manager Code Execution
   exploit/windows/http/sambar6_search_results     2003-06-21       normal     Sambar 6 Search Results Buffer Overflow
   exploit/windows/license/calicclnt_getconfig     2005-03-02       average    Computer Associates License Client GETCONFIG Overflow
   exploit/windows/smb/group_policy_startup        2015-01-26       manual     Group Policy Script Execution From Shared Resource
   post/linux/gather/enum_configs                                   normal     Linux Gather Configurations

```



Metasploit Framework is updated very frequently. Since the package repository is added to your system,  you can update it with the command `apt update` or from within msfconsole  `msfupdate` .
