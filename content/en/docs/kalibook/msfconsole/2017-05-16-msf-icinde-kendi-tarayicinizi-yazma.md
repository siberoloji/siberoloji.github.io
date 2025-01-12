---
draft: false
title: Creating Your Own Scanner in Metasploit Framework
weight: 100
translationKey: creation-of-your-own-scanner
date: 2017-05-16T12:58:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Metasploit Framework allows you to write your own scanner module for such purposes.
url: /creating-your-own-scanner/
featured_image: /images/metasploit.jpg
categories:
        - Metasploit Framework
tags:
        - cybersecurity
        - metasploit framework
linkTitle: Writing Your Own Scanner
keywords:
        - exploit
---
Sometimes you can't find a module that exactly fits the process you want to do. You want to combine the operations of 2-3 different modules into a single module. For example, you may want to scan your home network for vulnerabilities and record them. Metasploit Framework allows you to write your own scanner module for such purposes.

In programming language, you have access to and use all classes used in Metasploit Framework.

## Some features of scanners

* They provide access to all exploit classes and modules.

* There is proxy, SSL and reporting support.

* THREAD management for the scanner and scanning support at the desired interval

* It is very easy to write and run.

Although it is said to be easy to write and run, knowing how to code will save you a lot of time. Let's also state this. In the example below, TCP Exploit Module is included in the system with the `include` command and the TCP connection variables of this module are used to connect to the desired IP address. After the connection to Port 12345 is established, the “HELLO SERVE” message is sent to the server. Finally, the response given by the server is printed on the screen.

```bash
require 'msf/core'
class Metasploit3 < Msf::Auxiliary
 include Msf::Exploit::Remote::Tcp
 include Msf::Auxiliary::Scanner
 def initialize
 Super(
 'Name' => 'My custom TCP scan',
 'Version' => '$Revision: 1$,
 'Description' => 'My quick scanner',
 'Author' => 'Your name here',
 'License' => MSF_LICENSE
 )
 register_options(
 **[
 Opt::RPORT(12345)
 ], self.class)
 end

 def run_host(ip)
 connect**()**
 greeting = "HELLO SERVER"
sock.puts(greeting)
data = sock.recv(1024)
print_status("Received: #{data} from #{ip}")
disconnect**()**
end
end
```

## Saving the Browser You Wrote

You should save the browser you wrote in the right place. When starting `msfconsole`, modules are loaded from the `./modules/auxuliary/scanner` folder. Then we should save the module we just wrote in the `./modules/auxiliary/scanner/http/` folder with the simple_tcp.rb file name and Ruby extension. For detailed information, you can read the title [Metasploit Basic Commands -loadpath-](/metasploit-framework-temel-komutlar/#loadpath).

You can open a `netcat` listening session to capture the message of the browser module we will try.

```bash
root@kali:~# nc -lnvp 12345 < response.txt
listening on [any] 12345 ...
```

Then we select the new module, set the RHOST variable and run the module.

```bash
msf > use scanner/simple_tcp
msf auxiliary(simple_tcp) > set RHOSTS 192.168.1.100
RHOSTS => 192.168.1.100
msf auxiliary(simple_tcp) > run

> Received: hello metasploit from 192.168.1.100
> Auxiliary module execution completed
```

I recommend you to examine the modules in Metasploit for detailed usage examples.

## Saving Results

The reporting method `report_*()` offers the following possibilities to the user. You must be using a database for this.

* Checks if there is a database connection.

* Checks if there are duplicate records.

* Writes a found record to the table.

To use the report.*() method, you must include the following `include` line in your browser file.

```bash
include Msf::Auxiliary::Report
```

Finally, you can use the report_note() method.

```bash
report_note()
:host => rhost,
:type => "myscanner_password",
:data => data
```
