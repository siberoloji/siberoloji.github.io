---
draft: false
title: Metasploit Framework Basic Commands
date: 2017-05-11T12:26:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this article, we will examine the basic commands used in the Metasploit Framework. 
url: /metasploit-framework-temel-komutlar/
featured_image: /images/metasploit.jpg
categories:
   - Metasploit Framework
tags:
   - cybersecurity
   - metasploit
   - metasploit framework
weight: 30
translation_key: basic-metasploit-framework-commands
linkTitle: Basic Commands
---


In this article, we will examine the basic commands used in the Metasploit Framework. You may think that the commands are too many and complicated at first, but I recommend that you give yourself time. You will become familiar with them as you use them and you will start typing them automatically. When writing commands, you can type a few letters of the command and complete the rest automatically with the TAB key. Command and folder path completion in msfconsole works exactly like in the Linux command line.

## back

When you activate a module you have selected using the `use` command, you can stop using the module. In this case, when you want to go back to a higher folder, the `back` command is used. Technically, it is not very necessary because when you select a new module in the module you are in, you exit that module.

```bash
msf auxiliary**(**ms09_001_write**)** > back
msf >
```

## banner

Displays a randomly selected banner.

```bash
msf > banner
 _                                                    _
/     /         __                         _   __  /_/ __
| |  / | _____               ___   _____ | | /   _    
| | /| | | ___ |- -|   /    / __ | -__/ | **||** | **||** | |- -|
|_|   | | | _|__  | |_  / - __    | |    | | __/| |  | |_
      |/  |____/  ___/ / \___/   /     __|    |_  ___

Frustrated with proxy pivoting? Upgrade to layer-2 VPN pivoting with
Metasploit Pro -- type 'go_pro' to launch it now.

       **=[** metasploit v4.11.4-2015071402                   **]**
+ -- --**=[** 1467 exploits - 840 auxiliary - 232 post        **]**
+ -- --**=[** 432 payloads - 37 encoders - 8 nops             **]**
```

## check

Although not every exploit supports this command, let's explain what it does. You have chosen a module and are wondering if it will work on the target system before applying it. After making the necessary settings with the `set` command, you can do a preliminary test with the `check` command.

```bash
msf exploit**(**ms08_067_netapi**)** > show options

Module options **(**exploit/windows/smb/ms08_067_netapi**)**:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOST    172.16.194.134   yes       The target address
   RPORT    445              yes       Set the SMB service port
   SMBPIPE  BROWSER          yes       The pipe name to use **(**BROWSER, SRVSVC**)**

Exploit target:

   Id  Name
   --  ----
   0   Automatic Targeting

msf exploit**(**ms08_067_netapi**)** > check

> Verifying vulnerable status... **(**path: 0x0000005a**)**
> System is not vulnerable **(**status: 0x00000000**)**
> The target is not exploitable.
msf  exploit**(**ms08_067_netapi**)** >
```

## color

It allows you to color the output and information you receive from msfconsole.

```bash
msf > color
Usage: color >'true'|'false'|'auto'>

Enable or disable color output.
```

## connect

We can say that it is a small telnet or netcat program. It has SSL support and you can do file sending etc. To use it, you can reach the remote computer from `msfconsole` if you specify the IP address and port number you want to connect to.

```bash
msf > connect 192.168.1.1 23
> Connected to 192.168.1.1:23
DD-WRT v24 std **(**c**)** 2008 NewMedia-NET GmbH
Release: 07/27/08 **(**SVN revision: 10011**)**
DD-WRT login:
```

You can see detailed options for the `connect` command with the `-h` parameter.

```bash
msf > connect -h
Usage: connect **[**options]  

Communicate with a host, similar to interacting via netcat, taking advantage of any configured session pivoting.

OPTIONS:

    -C        Try to use CRLF **for **EOL sequence.
    -P <opt>  Specify source port.
    -S <opt>  Specify source address.
    -c <opt>  Specify which Comm to use.
    -h        Help banner.
    -i <opt>  Send the contents of a file.
    -p <opt>  List of proxies to use.
    -s        Connect with SSL.
    -u        Switch to a UDP socket.
    -w <opt>  Specify connect timeout.
    -z        Just try to connect, **then return**.

msf >
```

## edit

If you want to make changes to the code of the actively selected module, you can open the text editor with the `edit` command and perform the necessary operations. The Vim editor will open by default.

```bash
msf exploit**(**ms10_061_spoolss**)** > edit
> Launching /usr/bin/vim /usr/share/metasploit-framework/modules/exploits/windows/smb/ms10_061_spoolss.rb

require 'msf/core'
require 'msf/windows_error'

class Metasploit3 > Msf::Exploit::Remote
  Rank = ExcellentRanking

  include Msf::Exploit::Remote::DCERPC
  include Msf::Exploit::Remote::SMB
  include Msf::Exploit::EXE
  include Msf::Exploit::WbemExec

  def initialize(info = {})
```

## exit

Used to exit msfconsole.

```bash
msf exploit**(**ms10_061_spoolss**)** > exit
root@kali:~#
```

## help

It is used to display a list of available commands and their brief descriptions on the screen.

```bash
msf > help

Core Commands
**=============**

    Command       Description
    -------       -----------
    ?             Help menu
    back          Move back from the current context
    banner        Display an awesome metasploit banner
    cd            Change the current working directory
    color         Toggle color
    connect       Communicate with a host
...snip...

Database Backend Commands
**=========================**

    Command           Description
    -------           -----------
    creds             List all credentials **in **the database
    db_connect        Connect to an existing database
    db_disconnect     Disconnect from the current database instance
    db_export         Export a file containing the contents of the database
    db_import         Import a scan result file **(**filetype will be auto-detected**)**
...snip...
```

## info

You can examine detailed information about any module you want with the `info` command. Before using any module, we recommend that you read the module details with the `info` command. You may not be successful just by looking at its name.

```bash
msf  exploit(ms09_050_smb2_negotiate_func_index) > info exploit/windows/smb/ms09_050_smb2_negotiate_func_index 

       Name: Microsoft SRV2.SYS SMB Negotiate ProcessID Function Table Dereference
     Module: exploit/windows/smb/ms09_050_smb2_negotiate_func_index
    Version: 14774
   Platform: Windows
 Privileged: Yes
    License: Metasploit Framework License (BSD)
       Rank: Good

Provided by:
  Laurent Gaffie <laurent.gaffie@gmail.com>
  hdm <hdm@metasploit.com>
  sf <stephen_fewer@harmonysecurity.com>

Available targets:
  Id  Name
  --  ----
  0   Windows Vista SP1/SP2 and Server 2008 (x86)

Basic options:
  Name   Current Setting  Required  Description
  ----   ---------------  --------  -----------
  RHOST                   yes       The target address
  RPORT  445              yes       The target port
  WAIT   180              yes       The number of seconds to wait **for **the attack to complete.

Payload information:
  Space: 1024

Description:
  This module exploits an out of bounds **function **table dereference **in 
  **the SMB request validation code of the SRV2.SYS driver included with 
  Windows Vista, Windows 7 release candidates **(**not RTM**)**, and Windows 
  2008 Server prior to R2. Windows Vista without SP1 does not seem 
  affected by this flaw.

References:
  <a href="http://www.microsoft.com/technet/security/bulletin/MS09-050.mspx">http://www.microsoft.com/technet/security/bulletin/MS09-050.mspx</a>
  <a href="http://cve.mitre.org/cgi-bin/cvename.cgi?name">http://cve.mitre.org/cgi-bin/cvename.cgi?name</a>**=**2009-3103
  <a href="http://www.securityfocus.com/bid/36299">http://www.securityfocus.com/bid/36299</a>
  <a href="http://www.osvdb.org/57799">http://www.osvdb.org/57799</a>
  <a href="http://seclists.org/fulldisclosure/2009/Sep/0039.html">http://seclists.org/fulldisclosure/2009/Sep/0039.html</a>
  <a href="http://www.microsoft.com/technet/security/Bulletin/MS09-050.mspx">http://www.microsoft.com/technet/security/Bulletin/MS09-050.mspx</a>

msf  exploit**(**ms09_050_smb2_negotiate_func_index**)** >
```

## irb

When you issue this command, you go directly to the Ruby script operator. It allows you to write scripts with Ruby from within msfconsole.

```bash
msf > irb
> Starting IRB shell...

**>>** puts "Hello, metasploit!"
Hello, metasploit!
**=>** nil
**>>** Framework::Version
**=>** "4.8.2-2014022601"
```

## jobs

It allows you to list the modules running in the background, shutdown, etc.

```bash
msf > jobs -h
Usage: jobs **[**options]

Active job manipulation and interaction.

OPTIONS:

    -K        Terminate all running jobs.
    -h        Help banner.
    -i <opt>  Lists detailed information about a running job.
    -k <opt>  Terminate the specified job name.
    -l        List all running jobs.
    -v        Print more detailed info.  Use with -i and -l

msf >
```

## kill

If you give the `job id` number of a running process, it will cause the process to be closed.

```bash
msf exploit**(**ms10_002_aurora**)** > kill 0
Stopping job: 0...

> Server stopped.
```

## load

Allows you to load plugins from Metasploit folders. Parameters must be specified in key=val format.

```bash
msf > load
Usage: load <path> [var=val var=val ...]
```

If you do not give the full path of the plugin with the `load` command, the user folders `~/.msf4/plugins` are first checked. If it is not found there, the metasploit-framework main folders `/usr/share/metasploit-framework/plugins` are checked for the plugin.

```bash
msf > load pcap_log
> PcapLog plugin loaded.
> Successfully loaded plugin: pcap_log
```

## loadpath

Allows you to load a module of your choice while msfconsole is running.

```bash
msf > loadpath /home/secret/modules

Loaded 0 modules.
```

## unload

It ensures that the plugin you loaded with the `load` command is separated from the system.

```bash
msf > unload pcap_log
Unloading plugin pcap_log...unloaded.
```

## resource

Some modules reference external resources from within script commands. For example, you can use the `resource` command to use resources (password dictionary) etc. in msfconsole.

```bash
msf > resource
Usage: resource path1 **[**path2 ...]
```

```bash
msf > resource karma.rc
> Processing karma.rc for ERB directives.
resource (karma.rc_.txt)> db_connect postgres:toor@127.0.0.1/msfbook
resource (karma.rc_.txt)>use auxiliary/server/browser_autopwn
...snip...
```

These types of resource files can speed up your work considerably. You can use the `-r` parameter to send a msfconsole resource file from outside msfconsole.

```bash
root@kali:~# echo version > version.rc
root@kali:~# msfconsole -r version.rc

 _                                                    _
/     /         __                         _   __  /_/ __
| |  / | _____               ___   _____ | | /   _    
| | /| | | ___ |- -|   /    / __ | -__/ | **||** | **||** | |- -|
|_|   | | | _|__  | |_  / - __    | |    | | __/| |  | |_
      |/  |____/  ___/ / \___/   /     __|    |_  ___

Frustrated with proxy pivoting? Upgrade to layer-2 VPN pivoting with
Metasploit Pro -- type 'go_pro' to launch it now.

       **=[** metasploit v4.8.2-2014021901 **[**core:4.8 api:1.0] **]**
+ -- --**=[** 1265 exploits - 695 auxiliary - 202 post **]**
+ -- --**=[** 330 payloads - 32 encoders - 8 nops      **]**

> Processing version.rc **for **ERB directives.
resource **(**version.rc**)>** version
Framework: 4.8.2-2014022601
Console  : 4.8.2-2014022601.15168
msf >
```

## route

The `route` command is used to change the route of communication on the target computer. It has `add`, `delete` and `list` options. You need to send the **subnet**, **netmask**, **gateway** parameters to the command.

```bash
meterpreter > route -h
Usage: route **[**-h**]** command **[**args]
```

When you open a meterpreter session on the target computer, you can see the current communication table if you give the `route` command without parameters.

```bash
Supported commands:

   add    **[**subnet] **[**netmask] **[**gateway]
   delete **[**subnet] **[**netmask] **[**gateway]
   list

meterpreter >
meterpreter > route

Network routes
**==============**

    Subnet           Netmask          Gateway
    ------           -------          -------
    0.0.0.0          0.0.0.0          172.16.1.254
    127.0.0.0        255.0.0.0        127.0.0.1
    172.16.1.0       255.255.255.0    172.16.1.100
    172.16.1.100     255.255.255.255  127.0.0.1
    172.16.255.255   255.255.255.255  172.16.1.100
    224.0.0.0        240.0.0.0        172.16.1.100
    255.255.255.255  255.255.255.255  172.16.1.100
```

## search

It allows you to search within msfconsole. You can simply type any phrase you are looking for, or you can narrow down your search using parameters.

```bash
msf > search usermap_script

Matching Modules
**================**

   Name                                Disclosure Date  Rank       Description
   ----                                ---------------  ----       -----------
   exploit/multi/samba/usermap_script  2007-05-14       excellent  Samba "username map script" Command Execution

msf >
```

## help

We can diversify your searches by using keywords.

```bash
msf > help search
Usage: search **[**keywords]

Keywords:
  name      :  Modules with a matching descriptive name
  path      :  Modules with a matching path or reference name
  platform  :  Modules affecting this platform
  type      :  Modules of a specific type **(**exploit, auxiliary, or post**)**
  app       :  Modules that are client or server attacks
  author    :  Modules written by this author
  cve       :  Modules with a matching CVE ID
  bid       :  Modules with a matching Bugtraq ID
  osvdb     :  Modules with a matching OSVDB ID

msf >
```

## name

Search with keyword “name”.

```bash
msf > search name:mysql

Matching Modules
**================**

   Name                                               Disclosure Date  Rank       Description
   ----                                               ---------------  ----       -----------
   auxiliary/admin/mysql/mysql_enum                                    normal     MySQL Enumeration Module
   auxiliary/admin/mysql/mysql_sql                                     normal     MySQL SQL Generic Query
   auxiliary/analyze/jtr_mysql_fast                                    normal     John the Ripper MySQL Password Cracker (Fast Mode)
   auxiliary/scanner/mysql/mysql_authbypass_hashdump  2012-06-09       normal     MySQL Authentication Bypass Password Dump
   auxiliary/scanner/mysql/mysql_hashdump                              normal     MYSQL Password Hashdump
   auxiliary/scanner/mysql/mysql_login                                 normal     MySQL Login Utility
   auxiliary/scanner/mysql/mysql_schemadump                            normal     MYSQL Schema Dump
   auxiliary/scanner/mysql/mysql_version                               normal     MySQL Server Version Enumeration
   exploit/linux/mysql/mysql_yassl_getname            2010-01-25       good       MySQL yaSSL CertDecoder::GetName Buffer Overflow
   exploit/linux/mysql/mysql_yassl_hello              2008-01-04       good       MySQL yaSSL SSL Hello Message Buffer Overflow
   exploit/windows/mysql/mysql_payload                2009-01-16       excellent  Oracle MySQL **for **Microsoft Windows Payload Execution
   exploit/windows/mysql/mysql_yassl_hello            2008-01-04       average    MySQL yaSSL SSL Hello Message Buffer Overflow
msf >
```

## path

Searching module folders with the keyword “path”.

```bash
msf > search path:scada

Matching Modules
**================**

   Name                                                 Disclosure Date  Rank     Description
   ----                                                 ---------------  ----     -----------
   auxiliary/admin/scada/igss_exec_17                   2011-03-21       normal   Interactive Graphical SCADA System Remote Command Injection
   exploit/windows/scada/citect_scada_odbc              2008-06-11       normal   CitectSCADA/CitectFacilities ODBC Buffer Overflow
...snip...
```

## platform

Search with keyword “platform”

```bash
msf > search platform:aix

Matching Modules
**================**

   Name                                  Disclosure Date  Rank    Description
   ----                                  ---------------  ----    -----------
   payload/aix/ppc/shell_bind_tcp                         normal  AIX Command Shell, Bind TCP Inline
   payload/aix/ppc/shell_find_port                        normal  AIX Command Shell, Find Port Inline
   payload/aix/ppc/shell_interact                         normal  AIX execve shell **for **inetd
...snip...
```

## type

Search with keyword “type”

```bash
msf > search type:exploit

Matching Modules
**================**

   Name                                                Disclosure Date  Rank    Description
   ----                                                ---------------  ----    -----------
   post/linux/gather/checkvm                                            normal  Linux Gather Virtual Environment Detection
   post/linux/gather/enum_cron                                          normal  Linux Cron Job Enumeration
   post/linux/gather/enum_linux                                         normal  Linux Gather System Information
...snip...
```

## author

Search by author with the keyword “author”.

```bash
msf > search author:dookie

Matching Modules
**================**

   Name                                                       Disclosure Date  Rank     Description
   ----                                                       ---------------  ----     -----------
   exploit/osx/http/evocam_webserver                          2010-06-01       average  MacOS X EvoCam HTTP GET Buffer Overflow
   exploit/osx/misc/ufo_ai                                    2009-10-28       average  UFO: Alien Invasion IRC Client Buffer Overflow Exploit
   exploit/windows/browser/amaya_bdo                          2009-01-28       normal   Amaya Browser v11.0 bdo tag overflow
...snip...
```

## multiple

You can search by entering more than one keyword criteria.

```bash
msf > search cve:2011 author:jduck platform:linux

Matching Modules
**================**

   Name                                         Disclosure Date  Rank     Description
   ----                                         ---------------  ----     -----------
   exploit/linux/misc/netsupport_manager_agent  2011-01-08       average  NetSupport Manager Agent Remote Buffer Overflow
```

## sessions

You can manage sessions with the `sessions` command. Sessions are processes that organize the currently active activities of each module you use.

```bash
msf > sessions -h
Usage: sessions [options]

Active session manipulation and interaction.

OPTIONS:

    -K        Terminate all sessions
    -c <opt>  Run a command on the session given with -i, or all
    -d <opt>  Detach an interactive session
    -h        Help banner
    -i <opt>  Interact with the supplied session ID
    -k <opt>  Terminate session
    -l        List all active sessions
    -q        Quiet mode
    -r        Reset the ring buffer for the session given with -i, or all
    -s <opt>  Run a script on the session given with -i, or all
    -u <opt>  Upgrade a win32 shell to a meterpreter session
    -v        List verbose fields
```

You can use the `-l` parameter to see the list of all currently existing sessions.

```bash
msf exploit**(**3proxy**)** > sessions -l

Active sessions
**===============**

  Id  Description    Tunnel
  --  -----------    ------
  1   Command shell  192.168.1.101:33191 -> 192.168.1.104:4444
To interact with a given session, you just need to use the ‘-i’ switch followed by the Id number of the session.

msf exploit**(**3proxy**)** > sessions -i 1
> Starting interaction with 1...

C:WINDOWSsystem32>
```

## set

The `set` command is used to edit the options and parameters that need to be set for the module you have selected and activated with the `use` command.

```bash
msf auxiliary**(**ms09_050_smb2_negotiate_func_index**)** > set RHOST 172.16.194.134
RHOST **=>** 172.16.194.134
msf auxiliary**(**ms09_050_smb2_negotiate_func_index**)** > show options

Module options **(**exploit/windows/smb/ms09_050_smb2_negotiate_func_index**)**:

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   RHOST  172.16.194.134   yes       The target address
   RPORT  445              yes       The target port
   WAIT   180              yes       The number of seconds to wait **for **the attack to complete.

Exploit target:

   Id  Name
   --  ----
   0   Windows Vista SP1/SP2 and Server 2008 **(**x86**)**
```

While you can make the necessary adjustments with the `set` command, you may also want to see the list of `encoders` that the active module can use.

```bash
msf  exploit**(**ms09_050_smb2_negotiate_func_index**)** > show encoders

Compatible Encoders
**===================**

   Name                    Disclosure Date  Rank       Description
   ----                    ---------------  ----       -----------
   generic/none                             normal     The "none" Encoder
   x86/alpha_mixed                          low        Alpha2 Alphanumeric Mixedcase Encoder
   x86/alpha_upper                          low        Alpha2 Alphanumeric Uppercase Encoder
   x86/avoid_utf8_tolower                   manual     Avoid UTF8/tolower
   x86/call4_dword_xor                      normal     Call+4 Dword XOR Encoder
   x86/context_cpuid                        manual     CPUID-based Context Keyed Payload Encoder
   x86/context_stat                         manual     stat(2)-based Context Keyed Payload Encoder
   x86/context_time                         manual     time(2)-based Context Keyed Payload Encoder
   x86/countdown                            normal     Single-byte XOR Countdown Encoder
   x86/fnstenv_mov                          normal     Variable-length Fnstenv/mov Dword XOR Encoder
   x86/jmp_call_additive                    normal     Jump/Call XOR Additive Feedback Encoder
   x86/nonalpha                             low        Non-Alpha Encoder
   x86/nonupper                             low        Non-Upper Encoder
   x86/shikata_ga_nai                       excellent  Polymorphic XOR Additive Feedback Encoder
   x86/single_static_bit                    manual     Single Static Bit
   x86/unicode_mixed                        manual     Alpha2 Alphanumeric Unicode Mixedcase Encoder
   x86/unicode_upper                        manual     Alpha2 Alphanumeric Unicode Uppercase Encoder
```

## unset

It is the opposite of the `set` command and cancels the parameter you set in the previous step. You can cancel all the variables you set with the `unset all` command.

```bash
msf > set RHOSTS 192.168.1.0/24
RHOSTS **=>** 192.168.1.0/24
msf > set THREADS 50
THREADS **=>** 50
msf > set

Global
**======**

  Name     Value
  ----     -----
  RHOSTS   192.168.1.0/24
  THREADS  50

msf > unset THREADS
Unsetting THREADS...
msf > unset all
Flushing datastore...
msf > set

Global
**======**

No entries **in **data store.

msf >
```

## setg

You have selected a module and activated it. You will probably set the RHOST variable for that module. You can do this with the `set RHOST` command, but when you switch to a different module, even if your RHOST value (Target IP) has not changed, the setting you made in the previous module will not be carried over to the new module. Here, the `setg` command allows you to use a variable setting, active in all modules, without having to set it again and again. Even if you use this setting, we recommend that you check it with the `show options` command at the end.

```bash
msf > setg LHOST 192.168.1.101
LHOST **=>** 192.168.1.101
msf > setg RHOSTS 192.168.1.0/24
RHOSTS **=>** 192.168.1.0/24
msf > setg RHOST 192.168.1.136
RHOST **=>** 192.168.1.136
```

## save

You have made all the settings and want to exit msfconsole. When you enter again, if you want to use your previous settings again, save them by giving the `save` command. This way you can save time.

```bash
msf > save
Saved configuration to: /root/.msf4/config
msf >
```

## show

If you use the `show` command without any parameters, you can see the list of all modules in metasploit.

```bash
msf > show

Encoders
**========**

   Name                    Disclosure Date  Rank       Description
   ----                    ---------------  ----       -----------
   cmd/generic_sh                           good       Generic Shell Variable Substitution Command Encoder
   cmd/ifs                                  low        Generic **${**IFS**}** Substitution Command Encoder
   cmd/printf_php_mq                        manual     printf**(**1**)** via PHP magic_quotes Utility Command Encoder
...snip...
```

You can also use the `show` command in the following formats.

## show auxiliary

```bash
msf > show auxiliary
Auxiliary
**=========**

   Name                                                  Disclosure Date  Rank    Description
   ----                                                  ---------------  ----    -----------
   admin/2wire/xslt_password_reset                       2007-08-15       normal  2Wire Cross-Site Request Forgery Password Reset Vulnerability
   admin/backupexec/dump                                                  normal  Veritas Backup Exec Windows Remote File Access
   admin/backupexec/registry                                              normal  Veritas Backup Exec Server Registry Access
...snip...
```

## show exploits

```bash
msf > show exploits

Exploits
**========**

   Name                                                           Disclosure Date  Rank       Description
   ----                                                           ---------------  ----       -----------
   aix/rpc_cmsd_opcode21                                          2009-10-07       great      AIX Calendar Manager Service Daemon **(**rpc.cmsd**)** Opcode 21 Buffer Overflow
   aix/rpc_ttdbserverd_realpath                                   2009-06-17       great      ToolTalk rpc.ttdbserverd _tt_internal_realpath Buffer Overflow **(**AIX**)**
   bsdi/softcart/mercantec_softcart                               2004-08-19       great      Mercantec SoftCart CGI Overflow
...snip...
```

## show payloads

```bash
msf > show payloads

Payloads
**========**

   Name                                             Disclosure Date  Rank    Description
   ----                                             ---------------  ----    -----------
   aix/ppc/shell_bind_tcp                                            normal  AIX Command Shell, Bind TCP Inline
   aix/ppc/shell_find_port                                           normal  AIX Command Shell, Find Port Inline
   aix/ppc/shell_interact                                            normal  AIX execve shell **for **inetd
...snip...
```

```bash
msf  exploit**(**ms08_067_netapi**)** > show payloads

Compatible Payloads
**===================**

   Name                                             Disclosure Date  Rank    Description
   ----                                             ---------------  ----    -----------
   generic/custom                                                    normal  Custom Payload
   generic/debug_trap                                                normal  Generic x86 Debug Trap
   generic/shell_bind_tcp                                            normal  Generic Command Shell, Bind TCP Inline
...snip...
```

The `show options` command shows the options and variables that can be set for the active module.

```bash
msf exploit**(**ms08_067_netapi**)** > show options

Module options:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOST                     yes       The target address
   RPORT    445              yes       Set the SMB service port
   SMBPIPE  BROWSER          yes       The pipe name to use **(**BROWSER, SRVSVC**)**

Exploit target:

   Id  Name
   --  ----
   0   Automatic Targeting
```

If you are not sure which operating systems can use the module you selected, you can use the `show targets` command.

```bash
msf  exploit**(**ms08_067_netapi**)** > show targets

Exploit targets:

   Id  Name
   --  ----
   0   Automatic Targeting
   1   Windows 2000 Universal
   10  Windows 2003 SP1 Japanese **(**NO NX**)**
   11  Windows 2003 SP2 English **(**NO NX**)**
   12  Windows 2003 SP2 English **(**NX**)**
...snip...
```

You can use the `show advanced` command to see the most detailed information about the module.

```bash
msf exploit**(**ms08_067_netapi**)** > show advanced

Module advanced options:

   Name           : CHOST
   Current Setting:
   Description    : The local client address

   Name           : CPORT
   Current Setting:
   Description    : The local client port

...snip...
```

## show encoders

You can use the `show encoders` command to see the list of all encoders you can use in Metasploit.

```bash
msf > show encoders
Compatible Encoders
**===================**

   Name                    Disclosure Date  Rank       Description
   ----                    ---------------  ----       -----------
   cmd/generic_sh                           good       Generic Shell Variable Substitution Command Encoder
   cmd/ifs                                  low        Generic **${**IFS**}** Substitution Command Encoder
   cmd/printf_php_mq                        manual     printf**(**1**)** via PHP magic_quotes Utility Command Encoder
   generic/none                             normal     The "none" Encoder
   mipsbe/longxor                           normal     XOR Encoder
   mipsle/longxor                           normal     XOR Encoder
   php/base64                               great      PHP Base64 encoder
   ppc/longxor                              normal     PPC LongXOR Encoder
   ppc/longxor_tag                          normal     PPC LongXOR Encoder
   sparc/longxor_tag                        normal     SPARC DWORD XOR Encoder
   x64/xor                                  normal     XOR Encoder
   x86/alpha_mixed                          low        Alpha2 Alphanumeric Mixedcase Encoder
   x86/alpha_upper                          low        Alpha2 Alphanumeric Uppercase Encoder
   x86/avoid_utf8_tolower                   manual     Avoid UTF8/tolower
   x86/call4_dword_xor                      normal     Call+4 Dword XOR Encoder
   x86/context_cpuid                        manual     CPUID-based Context Keyed Payload Encoder
   x86/context_stat                         manual     stat**(**2**)**-based Context Keyed Payload Encoder
   x86/context_time                         manual     time**(**2**)**-based Context Keyed Payload Encoder
   x86/countdown                            normal     Single-byte XOR Countdown Encoder
   x86/fnstenv_mov                          normal     Variable-length Fnstenv/mov Dword XOR Encoder
   x86/jmp_call_additive                    normal     Jump/Call XOR Additive Feedback Encoder
   x86/nonalpha                             low        Non-Alpha Encoder
   x86/nonupper                             low        Non-Upper Encoder
   x86/shikata_ga_nai                       excellent  Polymorphic XOR Additive Feedback Encoder
   x86/single_static_bit                    manual     Single Static Bit
   x86/unicode_mixed                        manual     Alpha2 Alphanumeric Unicode Mixedcase Encoder
   x86/unicode_upper                        manual     Alpha2 Alphanumeric Unicode Uppercase Encoder
```

## show nops

You can see the list of code generators called NOP Generator with the `show nops` command.

```bash
msf > show nops
NOP Generators
**==============**

   Name             Disclosure Date  Rank    Description
   ----             ---------------  ----    -----------
   armle/simple                      normal  Simple
   php/generic                       normal  PHP Nop Generator
   ppc/simple                        normal  Simple
   sparc/random                      normal  SPARC NOP generator
   tty/generic                       normal  TTY Nop Generator
   x64/simple                        normal  Simple
   x86/opty2                         normal  Opty2
   x86/single_byte                   normal  Single Byte
```

## use

After your searches, you have decided to use a module. At this point, you can activate the module with the `use` command.

```bash
msf > use dos/windows/smb/ms09_001_write
msf auxiliary**(**ms09_001_write**)** > show options

Module options:

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   RHOST                   yes       The target address
   RPORT  445              yes       Set the SMB service port

msf auxiliary**(**ms09_001_write**)** >
```

When you want to get help with a command during any operation, you can use the `help` command.

## Video Explanation

{{<youtube "UOtw6CfPGlo">}}