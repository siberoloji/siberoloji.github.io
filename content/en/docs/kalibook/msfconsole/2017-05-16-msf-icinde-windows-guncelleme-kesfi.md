---
draft: false
title: Windows Update Discovery in Metasploit
linkTitle: Windows Update Discovery
weight: 150
translationKey: msf-windows-update-discovery
date: 2017-05-16T13:01:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Discovering which updates and patches are applied to a Windows operating system when you have a Meterpreter shell opened in Metasploit Framework.
url: /msf-windows-update-discovery/
featured_image: /images/metasploit.jpg
categories:
   - Metasploit Framework
tags:
   - cybersecurity
   - metasploit framework
---
When you open the Meterpreter shell on a Windows operating system from within the Metasploit Framework, you may want to discover which updates and patches the operating system has made and which it has not made.

Below you can find an example of the use of the `post/windows/gather/enum_patches` module used for this. The module is a **post exploitation** module, as its name suggests, and first of all, a `meterpreter` must be open on the target computer.

In the output below, the module is loaded with the `use` command and its options are displayed.

```bash
msf exploit(handler) > use post/windows/gather/enum_patches
msf post(enum_patches) > show options

Module options (post/windows/gather/enum_patches):

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 KB KB2871997, KB2928120 yes A comma separated list of KB patches to search for
 MSFLOCALS true yes Search for missing patches for which there is a MSF local module
 SESSION yes The session to run this module on.
```

You can review detailed information about the module with the `show advanced` command.

```bash
msf post(enum_patches) > show advanced

Module advanced options (post/windows/gather/enum_patches):

Name : VERBOSE
Current Setting: true
Description : Enable detailed status messages

Name : WORKSPACE
Current Setting:

Description : Specify the workspace for this module
```

After opening the Meterpreter shell of the Windows operating system using an `exploit`, send the session to the background and load the `enum_patches` module with the `use` command. The `SESSION` variable in the output of the `show options` command below should be the session number of the meterpreter shell that we sent to the background. You can see the sessions in the background with the `sessions -l` command. After making the necessary checks, you can see which updates the Windows computer has made and which ones it has not when you give the `run` command.

```bash
msf post(enum_patches) > show options

Module options (post/windows/gather/enum_patches):

 Name Current Setting Required Description
 ---- --------------- -------- -----------
 KB KB2871997, KB2928120 yes A comma separated list of KB patches to search for
 MSFLOCALS true yes Search for missing patches for which there is a MSF local module
 SESSION 1 yes The session to run this module on.

msf post(enum_patches) > run

> KB2871997 applied
[+] KB2928120 is missing
[+] KB977165 - Possibly vulnerable to MS10-015 kitrap0d if Windows 2K SP4 - Windows 7 (x86)
> KB2305420 applied
[+] KB2592799 - Possibly vulnerable to MS11-080 afdjoinleaf if XP SP2/SP3 Win 2k3 SP2
[+] KB2778930 - Possibly vulnerable to MS13-005 hwnd_broadcast, elevates from Low to Medium integrity
[+] KB2850851 - Possibly vulnerable to MS13-053 schlamperei if x86 Win7 SP0/SP1
[+] KB2870008 - Possibly vulnerable to MS13-081 track_popup_menu if x86 Windows 7 SP0/SP1
> Post module execution completed
```

As seen above, it is reported that updates with a [+] sign at the beginning are not applied to the system.
