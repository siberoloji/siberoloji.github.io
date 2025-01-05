---
draft: false

title:  'Metasploit Framework Temel Komutlar'
date: '2017-05-11T12:26:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazımızda, Metasploit Framework içerisinde kullanılan temel komutları inceleyeceğiz. Komutların, başlangıçta çok fazla ve karışık olduğunu düşünebilirsiniz ancak kendinize zaman tanımanızı tavsiye ediyorum. Kullandıkça aşina olacak ve artık otomatik olarak yazar hale geleceksiniz. Komutları yazarken, komutun bir kaç harfini yazıp TAB tuşu ile gerisini otomatik tamamlayabilirsiniz. msfconsole içerisinde komut ve klasör yolu tamamlama, aynen Linux komut satırındaki gibi çalışır.' 
 
url:  /tr/metasploit-framework-temel-komutlar/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - metasploit
    - 'metasploit framework'
---


Bu yazımızda, Metasploit Framework içerisinde kullanılan temel komutları inceleyeceğiz. Komutların, başlangıçta çok fazla ve karışık olduğunu düşünebilirsiniz ancak kendinize zaman tanımanızı tavsiye ediyorum. Kullandıkça aşina olacak ve artık otomatik olarak yazar hale geleceksiniz. Komutları yazarken, komutun bir kaç harfini yazıp TAB tuşu ile gerisini otomatik tamamlayabilirsiniz. msfconsole içerisinde komut ve klasör yolu tamamlama, aynen Linux komut satırındaki gibi çalışır.



## back



`use` komutunu kullanarak seçtiğiniz bir modülü aktif ettiğinizde, modülü kullanmaktan vazgeçebilirsiniz. Bu durumda, bir üst klasöre geri gelmek istediğinizde kullanılır. Teknik olarak çok gerekli değildir çünkü bulunduğunuz modülün içinde de yeni modül seçtiğinizde o modülden çıkmış olusunuz.


```bash
msf auxiliary**(**ms09_001_write**)** **&gt;** back
msf **&gt;**
```



## banner



Rastgele seçilen bir banner görüntüler.


```bash
msf **&gt;** banner
 _                                                    _
/     /         __                         _   __  /_/ __
| |  / | _____               ___   _____ | | /   _    
| | /| | | ___ |- -|   /    / __ | -__/ | **||** | **||** | |- -|
|_|   | | | _|__  | |_  / - __    | |    | | __/| |  | |_
      |/  |____/  ___/ / \___/   /     __|    |_  ___

Frustrated with proxy pivoting? Upgrade to layer-2 VPN pivoting with
Metasploit Pro -- type 'go_pro' to launch it now.

       **=[** metasploit v4.11.4-2015071402                   **]**
+ -- --**=[** 1467 exploits - 840 auxiliary - 232 post        **]**
+ -- --**=[** 432 payloads - 37 encoders - 8 nops             **]**
```



## check



Bu komutu her exploit desteklemese de ne işe yaradığını açıklayalım. Bir modül seçtiniz ve hedef sistemde uygulamadan önce işe yarayıp yaramayacağını merak ediyorsunuz. Gerekli ayarları `set` komutuyla yaptıktan sonra `check` komutuyla ön test yapabilirsiniz.


```bash
msf exploit**(**ms08_067_netapi**)** **&gt;** show options

Module options **(**exploit/windows/smb/ms08_067_netapi**)**:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOST    172.16.194.134   yes       The target address
   RPORT    445              yes       Set the SMB service port
   SMBPIPE  BROWSER          yes       The pipe name to use **(**BROWSER, SRVSVC**)**

Exploit target:

   Id  Name
   --  ----
   0   Automatic Targeting

msf exploit**(**ms08_067_netapi**)** **&gt;** check

**[*********]** Verifying vulnerable status... **(**path: 0x0000005a**)**
**[*********]** System is not vulnerable **(**status: 0x00000000**)**
**[*********]** The target is not exploitable.
msf  exploit**(**ms08_067_netapi**)** **&gt;**
```



## color



msfconsole içinden alacağınız çıktı ve bilgilerin renklendirilmesini sağlar.


```bash
msf **&gt;** color
Usage: color **&gt;**'true'|'false'|'auto'**&gt;**

Enable or disable color output.
```



## connect



Küçük bir telnet veya netcat programıdır diyebiliriz. SSL desteği vardır ve dosya gönderme vb. işlemleri yapabilirsiniz. Kulanmak için, bağlanmak istediğiniz IP adresini ve port numarasını belirtmeniz durumunda `msfconsole` içerisinden uzak bilgisayara ulaşabilirsiniz.


```bash
msf **&gt;** connect 192.168.1.1 23
**[*********]** Connected to 192.168.1.1:23
DD-WRT v24 std **(**c**)** 2008 NewMedia-NET GmbH
Release: 07/27/08 **(**SVN revision: 10011**)**
DD-WRT login:
```



`connect` komutu ile ilgili detaylı seçeneklerini `-h` parametresiyle görebilirsiniz.


```bash
msf **&gt;** connect -h
Usage: connect **[**options]  

Communicate with a host, similar to interacting via netcat, taking advantage of
any configured session pivoting.

OPTIONS:

    -C        Try to use CRLF **for **EOL sequence.
    -P &lt;opt&gt;  Specify source port.
    -S &lt;opt&gt;  Specify source address.
    -c &lt;opt&gt;  Specify which Comm to use.
    -h        Help banner.
    -i &lt;opt&gt;  Send the contents of a file.
    -p &lt;opt&gt;  List of proxies to use.
    -s        Connect with SSL.
    -u        Switch to a UDP socket.
    -w &lt;opt&gt;  Specify connect timeout.
    -z        Just try to connect, **then return**.

msf **&gt;**
```



## edit



Aktif olarak seçilmiş modülün kodlarında değişiklik yapmak isterseniz `edit` komutuyla metin editörünü açıp gerekli işlemleri yapabilirsiniz. Varsayılan olarak Vim editör açılacaktır.


```bash
msf exploit**(**ms10_061_spoolss**)** **&gt;** edit
**[*********]** Launching /usr/bin/vim /usr/share/metasploit-framework/modules/exploits/windows/smb/ms10_061_spoolss.rb

##
# This module requires Metasploit: http//metasploit.com/download
# Current source: <a href="https://github.com/rapid7/metasploit-framework">https://github.com/rapid7/metasploit-framework</a>
##

require 'msf/core'
require 'msf/windows_error'

class Metasploit3 **&gt;** Msf::Exploit::Remote
  Rank **=** ExcellentRanking

  include Msf::Exploit::Remote::DCERPC
  include Msf::Exploit::Remote::SMB
  include Msf::Exploit::EXE
  include Msf::Exploit::WbemExec

  def initialize**(**info **=** **{})**
```



## exit



msfconsole’dan çıkmaya yarar.


```bash
msf exploit**(**ms10_061_spoolss**)** **&gt;** exit
root@kali:~#
```



## help



Kullanılabilir durumda olan komutların listesini ve kısa açıklamalarını ekrana görüntülemeye yarar.


```bash
msf **&gt;** help

Core Commands
**=============**

    Command       Description
    -------       -----------
    ?             Help menu
    back          Move back from the current context
    banner        Display an awesome metasploit banner
    cd            Change the current working directory
    color         Toggle color
    connect       Communicate with a host
...snip...

Database Backend Commands
**=========================**

    Command           Description
    -------           -----------
    creds             List all credentials **in **the database
    db_connect        Connect to an existing database
    db_disconnect     Disconnect from the current database instance
    db_export         Export a file containing the contents of the database
    db_import         Import a scan result file **(**filetype will be auto-detected**)**
...snip...
```



## info



İstediğiniz herhangi bir modül hakkında detaylı bilgileri `info` komutuyla inceleyebilirsiniz. Herhangi bir modülü kullanmadan önce `info` komutuyla, modül detaylarını mutlaka okumanızı tavsiye ediyoruz. Sadece isminden hareketle başarılı olamayabilirsiniz.


```bash
msf  exploit**(**ms09_050_smb2_negotiate_func_index**)** **&gt;** info exploit/windows/smb/ms09_050_smb2_negotiate_func_index 

       Name: Microsoft SRV2.SYS SMB Negotiate ProcessID Function Table Dereference
     Module: exploit/windows/smb/ms09_050_smb2_negotiate_func_index
    Version: 14774
   Platform: Windows
 Privileged: Yes
    License: Metasploit Framework License **(**BSD**)**
       Rank: Good

Provided by:
  Laurent Gaffie &lt;laurent.gaffie@gmail.com&gt;
  hdm &lt;hdm@metasploit.com&gt;
  sf &lt;stephen_fewer@harmonysecurity.com&gt;

Available targets:
  Id  Name
  --  ----
  0   Windows Vista SP1/SP2 and Server 2008 **(**x86**)**

Basic options:
  Name   Current Setting  Required  Description
  ----   ---------------  --------  -----------
  RHOST                   yes       The target address
  RPORT  445              yes       The target port
  WAIT   180              yes       The number of seconds to wait **for **the attack to complete.

Payload information:
  Space: 1024

Description:
  This module exploits an out of bounds **function **table dereference **in 
  **the SMB request validation code of the SRV2.SYS driver included with 
  Windows Vista, Windows 7 release candidates **(**not RTM**)**, and Windows 
  2008 Server prior to R2. Windows Vista without SP1 does not seem 
  affected by this flaw.

References:
  <a href="http://www.microsoft.com/technet/security/bulletin/MS09-050.mspx">http://www.microsoft.com/technet/security/bulletin/MS09-050.mspx</a>
  <a href="http://cve.mitre.org/cgi-bin/cvename.cgi?name">http://cve.mitre.org/cgi-bin/cvename.cgi?name</a>**=**2009-3103
  <a href="http://www.securityfocus.com/bid/36299">http://www.securityfocus.com/bid/36299</a>
  <a href="http://www.osvdb.org/57799">http://www.osvdb.org/57799</a>
  <a href="http://seclists.org/fulldisclosure/2009/Sep/0039.html">http://seclists.org/fulldisclosure/2009/Sep/0039.html</a>
  <a href="http://www.microsoft.com/technet/security/Bulletin/MS09-050.mspx">http://www.microsoft.com/technet/security/Bulletin/MS09-050.mspx</a>

msf  exploit**(**ms09_050_smb2_negotiate_func_index**)** **&gt;**
```



## irb



Bu komutu verdiğinizde doğrudan Ruby komut girişimcisine gidersiniz. msfconsole içerisinden Ruby ile script yazmanızı sağlar.


```bash
msf **&gt;** irb
**[*********]** Starting IRB shell...

**&gt;&gt;** puts "Hello, metasploit!"
Hello, metasploit!
**=&gt;** nil
**&gt;&gt;** Framework::Version
**=&gt;** "4.8.2-2014022601"
```



## jobs



Arka planda çalışır durumdaki modülleri listeleme, kapatma vb. işlemleri listelemenizi sağlar.


```bash
msf **&gt;** jobs -h
Usage: jobs **[**options]

Active job manipulation and interaction.

OPTIONS:

    -K        Terminate all running jobs.
    -h        Help banner.
    -i &lt;opt&gt;  Lists detailed information about a running job.
    -k &lt;opt&gt;  Terminate the specified job name.
    -l        List all running jobs.
    -v        Print more detailed info.  Use with -i and -l

msf **&gt;**
```



## kill



Çalışan bir prosesin `job id` numarasını verdiğiniz takdirde işlemin kapanmasını sağlar.


```bash
msf exploit**(**ms10_002_aurora**)** **&gt;** kill 0
Stopping job: 0...

**[*********]** Server stopped.
```



## load



Metasploit klasörlerinden plugin (eklenti) yüklemenizi sağlar. Parametreler, key=val formatında belirtilmelidir.


```bash
msf **&gt;** load
Usage: load &lt;path&gt; **[**var**=**val var**=**val ...]
```



`load` komutuyla eklentinin tam yolunu vermezseniz, öncelikle kullanıcı klasörlerine `~/.msf4/plugins` bakılır. Orada bulunamaz ise eklenti için metasploit-framework ana klasörlerine `/usr/share/metasploit-framework/plugins` bakılır.


```bash
msf **&gt;** load pcap_log
**[*********]** PcapLog plugin loaded.
**[*********]** Successfully loaded plugin: pcap_log
```



## loadpath



msfconsole çalışır durumda iken, istediğiniz bir modülü yüklemenizi sağlar.


```bash
msf **&gt;** loadpath /home/secret/modules

Loaded 0 modules.
```



## unload



`load` komutuyla yüklediğiniz eklentinin sistemden ayrılmasını sağlar.


```bash
msf **&gt;** unload pcap_log
Unloading plugin pcap_log...unloaded.
```



## resource



Bazı modüller, script komutlarının içinden dış kaynaklara atıfta bulunurlar. Örneğin (password dictionary) vb. kaynakları msfconsole içerisinde kullanmak için `resource` komutunu kullanabilirsiniz.


```bash
msf **&gt;** resource
Usage: resource path1 **[**path2 ...]
```


```bash
msf **&gt;** resource karma.rc
**[*********]** Processing karma.rc **for **ERB directives.
resource **(**karma.rc_.txt**)&gt;** db_connect postgres:toor@127.0.0.1/msfbook
resource **(**karma.rc_.txt**)&gt;** use auxiliary/server/browser_autopwn
...snip...
```



Bu tür resource dosyaları, işlerinizi oldukça hızlandırabilir. msfconsole dışından, msfconsole resource dosyası göndermek için `-r` parametresini kullanabilirsiniz.


```bash
root@kali:~# echo version **&gt;** version.rc
root@kali:~# msfconsole -r version.rc

 _                                                    _
/     /         __                         _   __  /_/ __
| |  / | _____               ___   _____ | | /   _    
| | /| | | ___ |- -|   /    / __ | -__/ | **||** | **||** | |- -|
|_|   | | | _|__  | |_  / - __    | |    | | __/| |  | |_
      |/  |____/  ___/ / \___/   /     __|    |_  ___

Frustrated with proxy pivoting? Upgrade to layer-2 VPN pivoting with
Metasploit Pro -- type 'go_pro' to launch it now.

       **=[** metasploit v4.8.2-2014021901 **[**core:4.8 api:1.0] **]**
+ -- --**=[** 1265 exploits - 695 auxiliary - 202 post **]**
+ -- --**=[** 330 payloads - 32 encoders - 8 nops      **]**

**[*********]** Processing version.rc **for **ERB directives.
resource **(**version.rc**)&gt;** version
Framework: 4.8.2-2014022601
Console  : 4.8.2-2014022601.15168
msf **&gt;**
```



## route



`route` komutu, hedef bilgisayardaki iletişimin rotasını değiştirmeye yarar. `add`, `delete` ve `list` seçenekleri bulunur. Komuta **subnet**, **netmask**, **gateway** parametrelerini göndermeniz gerekir.


```bash
meterpreter **&gt;** route -h
Usage: route **[**-h**]** command **[**args]
```



Hedef bilgisayarda meterpreter session açtığınızda `route` komutunu parametresiz olarak verirseniz mevcut iletişim tablosunu görebilirsiniz.


```bash
Supported commands:

   add    **[**subnet] **[**netmask] **[**gateway]
   delete **[**subnet] **[**netmask] **[**gateway]
   list

meterpreter **&gt;**
meterpreter **&gt;** route

Network routes
**==============**

    Subnet           Netmask          Gateway
    ------           -------          -------
    0.0.0.0          0.0.0.0          172.16.1.254
    127.0.0.0        255.0.0.0        127.0.0.1
    172.16.1.0       255.255.255.0    172.16.1.100
    172.16.1.100     255.255.255.255  127.0.0.1
    172.16.255.255   255.255.255.255  172.16.1.100
    224.0.0.0        240.0.0.0        172.16.1.100
    255.255.255.255  255.255.255.255  172.16.1.100
```



## search



msfconsole içerisinde arama yapmanızı sağlar. Basitçe aradığınız herhangi bir ifadeyi yazabileceğiniz gibi parametreler sayesinde aramayı daraltmanız da mümkündür.


```bash
msf **&gt;** search usermap_script

Matching Modules
**================**

   Name                                Disclosure Date  Rank       Description
   ----                                ---------------  ----       -----------
   exploit/multi/samba/usermap_script  2007-05-14       excellent  Samba "username map script" Command Execution

msf **&gt;**
```



## help



Anahtar kelimeleri kullanarak aramalarınızı çeşitlendirebilirsiniz.


```bash
msf **&gt;** help search
Usage: search **[**keywords]

Keywords:
  name      :  Modules with a matching descriptive name
  path      :  Modules with a matching path or reference name
  platform  :  Modules affecting this platform
  type      :  Modules of a specific type **(**exploit, auxiliary, or post**)**
  app       :  Modules that are client or server attacks
  author    :  Modules written by this author
  cve       :  Modules with a matching CVE ID
  bid       :  Modules with a matching Bugtraq ID
  osvdb     :  Modules with a matching OSVDB ID

msf **&gt;**
```



## name



“name” anahtar kelimesi ile arama.


```bash
msf **&gt;** search name:mysql

Matching Modules
**================**

   Name                                               Disclosure Date  Rank       Description
   ----                                               ---------------  ----       -----------
   auxiliary/admin/mysql/mysql_enum                                    normal     MySQL Enumeration Module
   auxiliary/admin/mysql/mysql_sql                                     normal     MySQL SQL Generic Query
   auxiliary/analyze/jtr_mysql_fast                                    normal     John the Ripper MySQL Password Cracker **(**Fast Mode**)**
   auxiliary/scanner/mysql/mysql_authbypass_hashdump  2012-06-09       normal     MySQL Authentication Bypass Password Dump
   auxiliary/scanner/mysql/mysql_hashdump                              normal     MYSQL Password Hashdump
   auxiliary/scanner/mysql/mysql_login                                 normal     MySQL Login Utility
   auxiliary/scanner/mysql/mysql_schemadump                            normal     MYSQL Schema Dump
   auxiliary/scanner/mysql/mysql_version                               normal     MySQL Server Version Enumeration
   exploit/linux/mysql/mysql_yassl_getname            2010-01-25       good       MySQL yaSSL CertDecoder::GetName Buffer Overflow
   exploit/linux/mysql/mysql_yassl_hello              2008-01-04       good       MySQL yaSSL SSL Hello Message Buffer Overflow
   exploit/windows/mysql/mysql_payload                2009-01-16       excellent  Oracle MySQL **for **Microsoft Windows Payload Execution
   exploit/windows/mysql/mysql_yassl_hello            2008-01-04       average    MySQL yaSSL SSL Hello Message Buffer Overflow
msf **&gt;**
```



## path



“path” anahtar kelimesi ile modül klasörlerinde arama.


```bash
msf **&gt;** search path:scada

Matching Modules
**================**

   Name                                                 Disclosure Date  Rank     Description
   ----                                                 ---------------  ----     -----------
   auxiliary/admin/scada/igss_exec_17                   2011-03-21       normal   Interactive Graphical SCADA System Remote Command Injection
   exploit/windows/scada/citect_scada_odbc              2008-06-11       normal   CitectSCADA/CitectFacilities ODBC Buffer Overflow
...snip...
```



## platform



“platform” anahtar kelimesi ile arama


```bash
msf **&gt;** search platform:aix

Matching Modules
**================**

   Name                                  Disclosure Date  Rank    Description
   ----                                  ---------------  ----    -----------
   payload/aix/ppc/shell_bind_tcp                         normal  AIX Command Shell, Bind TCP Inline
   payload/aix/ppc/shell_find_port                        normal  AIX Command Shell, Find Port Inline
   payload/aix/ppc/shell_interact                         normal  AIX execve shell **for **inetd
...snip...
```



## type



“type” anahtar kelimesi ile arama


```bash
msf **&gt;** search type:exploit

Matching Modules
**================**

   Name                                                Disclosure Date  Rank    Description
   ----                                                ---------------  ----    -----------
   post/linux/gather/checkvm                                            normal  Linux Gather Virtual Environment Detection
   post/linux/gather/enum_cron                                          normal  Linux Cron Job Enumeration
   post/linux/gather/enum_linux                                         normal  Linux Gather System Information
...snip...
```



## author



“author” anahtar kelimesi ile yazara göre arama.


```bash
msf **&gt;** search author:dookie

Matching Modules
**================**

   Name                                                       Disclosure Date  Rank     Description
   ----                                                       ---------------  ----     -----------
   exploit/osx/http/evocam_webserver                          2010-06-01       average  MacOS X EvoCam HTTP GET Buffer Overflow
   exploit/osx/misc/ufo_ai                                    2009-10-28       average  UFO: Alien Invasion IRC Client Buffer Overflow Exploit
   exploit/windows/browser/amaya_bdo                          2009-01-28       normal   Amaya Browser v11.0 bdo tag overflow
...snip...
```



## multiple



Birden fazla anahtar kelime kriteri girerek arama yapabilirsiniz.


```bash
msf **&gt;** search cve:2011 author:jduck platform:linux

Matching Modules
**================**

   Name                                         Disclosure Date  Rank     Description
   ----                                         ---------------  ----     -----------
   exploit/linux/misc/netsupport_manager_agent  2011-01-08       average  NetSupport Manager Agent Remote Buffer Overflow
```



## sessions



`sessions` komutuyla oturumları yönetebilirsiniz. Oturumlar, kullandığınız her bir modülün o anda aktif olarak faaliyetlerinin organize edildiği işlemleri ifade eder.


```bash
msf &gt; sessions -h
Usage: sessions [options]

Active session manipulation and interaction.

OPTIONS:

    -K        Terminate all sessions
    -c &lt;opt&gt;  Run a command on the session given with -i, or all
    -d &lt;opt&gt;  Detach an interactive session
    -h        Help banner
    -i &lt;opt&gt;  Interact with the supplied session ID
    -k &lt;opt&gt;  Terminate session
    -l        List all active sessions
    -q        Quiet mode
    -r        Reset the ring buffer for the session given with -i, or all
    -s &lt;opt&gt;  Run a script on the session given with -i, or all
    -u &lt;opt&gt;  Upgrade a win32 shell to a meterpreter session
    -v        List verbose fields
```



O anda bulunan tüm session (oturum) listesini görmek için `-l` parametresini kullanabilirsiniz.


```bash
msf exploit**(**3proxy**)** **&gt;** sessions -l

Active sessions
**===============**

  Id  Description    Tunnel
  --  -----------    ------
  1   Command shell  192.168.1.101:33191 -&gt; 192.168.1.104:4444
To interact with a given session, you just need to use the ‘-i’ switch followed by the Id number of the session.

msf exploit**(**3proxy**)** **&gt;** sessions -i 1
**[*********]** Starting interaction with 1...

C:WINDOWSsystem32&gt;
```



## set



`set` komutu, seçtiğiniz ve `use` komutuyla aktif hale getirdiğiniz modülün ayarlanması gereken seçenek ve parametrelerini düzenlemek için kullanılır.


```bash
msf auxiliary**(**ms09_050_smb2_negotiate_func_index**)** **&gt;** set RHOST 172.16.194.134
RHOST **=&gt;** 172.16.194.134
msf auxiliary**(**ms09_050_smb2_negotiate_func_index**)** **&gt;** show options

Module options **(**exploit/windows/smb/ms09_050_smb2_negotiate_func_index**)**:

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   RHOST  172.16.194.134   yes       The target address
   RPORT  445              yes       The target port
   WAIT   180              yes       The number of seconds to wait **for **the attack to complete.

Exploit target:

   Id  Name
   --  ----
   0   Windows Vista SP1/SP2 and Server 2008 **(**x86**)**
```



`set` komutuyla gerekli ayarlamaları yapabileceğiniz gibi aktif olan modülün kullanabileceği `encoders` listesini de görmek isteyebilirsiniz.


```bash
msf  exploit**(**ms09_050_smb2_negotiate_func_index**)** **&gt;** show encoders

Compatible Encoders
**===================**

   Name                    Disclosure Date  Rank       Description
   ----                    ---------------  ----       -----------
   generic/none                             normal     The "none" Encoder
   x86/alpha_mixed                          low        Alpha2 Alphanumeric Mixedcase Encoder
   x86/alpha_upper                          low        Alpha2 Alphanumeric Uppercase Encoder
   x86/avoid_utf8_tolower                   manual     Avoid UTF8/tolower
   x86/call4_dword_xor                      normal     Call+4 Dword XOR Encoder
   x86/context_cpuid                        manual     CPUID-based Context Keyed Payload Encoder
   x86/context_stat                         manual     stat**(**2**)**-based Context Keyed Payload Encoder
   x86/context_time                         manual     time**(**2**)**-based Context Keyed Payload Encoder
   x86/countdown                            normal     Single-byte XOR Countdown Encoder
   x86/fnstenv_mov                          normal     Variable-length Fnstenv/mov Dword XOR Encoder
   x86/jmp_call_additive                    normal     Jump/Call XOR Additive Feedback Encoder
   x86/nonalpha                             low        Non-Alpha Encoder
   x86/nonupper                             low        Non-Upper Encoder
   x86/shikata_ga_nai                       excellent  Polymorphic XOR Additive Feedback Encoder
   x86/single_static_bit                    manual     Single Static Bit
   x86/unicode_mixed                        manual     Alpha2 Alphanumeric Unicode Mixedcase Encoder
   x86/unicode_upper                        manual     Alpha2 Alphanumeric Unicode Uppercase Encoder
```



## unset



`set` komutunun tersidir ve bir önceki adımda ayarladığınız parametreyi iptal eder. Ayarladığınız tüm değişkenleri `unset all` komutuyla iptal edebilirsiniz.


```bash
msf **&gt;** set RHOSTS 192.168.1.0/24
RHOSTS **=&gt;** 192.168.1.0/24
msf **&gt;** set THREADS 50
THREADS **=&gt;** 50
msf **&gt;** set

Global
**======**

  Name     Value
  ----     -----
  RHOSTS   192.168.1.0/24
  THREADS  50

msf **&gt;** unset THREADS
Unsetting THREADS...
msf **&gt;** unset all
Flushing datastore...
msf **&gt;** set

Global
**======**

No entries **in **data store.

msf **&gt;**
```



## setg



Bir modül seçtiniz ve aktif hale getirdiniz. Muhtemelen o modülün RHOST değişkenini ayarlayacaksınız. Bunu `set RHOST` komutuyla yapabilirsiniz ancak farklı bir modüle geçtiğinizde RHOST değeriniz (Hedef IP) değişmemiş olsa bile önceki modülde yaptığınız ayar, yeni modüle taşınmaz. İşte `setg` komutuyla bir değişken ayarının, tüm modüllerde aktif halde, tekrar tekrar ayarlamaya gerek kalmadan kullanmanızı sağlar. Bu ayarı kullansanız da son olarak `show options` komutu ile kontrol yapmanızı tavsiye ediyoruz.


```bash
msf **&gt;** setg LHOST 192.168.1.101
LHOST **=&gt;** 192.168.1.101
msf **&gt;** setg RHOSTS 192.168.1.0/24
RHOSTS **=&gt;** 192.168.1.0/24
msf **&gt;** setg RHOST 192.168.1.136
RHOST **=&gt;** 192.168.1.136
```



## save



Tüm ayarlamaları yaptınız ve msfconsole dan çıkmak istiyorsunuz. Tekrar girdiğinizde, önceki ayarlarınızı tekrar kullanmak istiyorsanız `save` komutunu vererek kayıt edin. Bu sayede zamandan tasarruf edebilirsiniz.


```bash
msf **&gt;** save
Saved configuration to: /root/.msf4/config
msf **&gt;**
```



## show



`show` komutunu hiçbir parametre vermeden kullanırsanız metasploit içerisindeki tüm modüllerin listesini görebilirsiniz.


```bash
msf **&gt;** show

Encoders
**========**

   Name                    Disclosure Date  Rank       Description
   ----                    ---------------  ----       -----------
   cmd/generic_sh                           good       Generic Shell Variable Substitution Command Encoder
   cmd/ifs                                  low        Generic **${**IFS**}** Substitution Command Encoder
   cmd/printf_php_mq                        manual     printf**(**1**)** via PHP magic_quotes Utility Command Encoder
...snip...
```



`show` komutunu aşağıdaki formatlarda da kullanabilirsiniz.



## show auxiliary


```bash
msf **&gt;** show auxiliary
Auxiliary
**=========**

   Name                                                  Disclosure Date  Rank    Description
   ----                                                  ---------------  ----    -----------
   admin/2wire/xslt_password_reset                       2007-08-15       normal  2Wire Cross-Site Request Forgery Password Reset Vulnerability
   admin/backupexec/dump                                                  normal  Veritas Backup Exec Windows Remote File Access
   admin/backupexec/registry                                              normal  Veritas Backup Exec Server Registry Access
...snip...
```



## show exploits


```bash
msf **&gt;** show exploits

Exploits
**========**

   Name                                                           Disclosure Date  Rank       Description
   ----                                                           ---------------  ----       -----------
   aix/rpc_cmsd_opcode21                                          2009-10-07       great      AIX Calendar Manager Service Daemon **(**rpc.cmsd**)** Opcode 21 Buffer Overflow
   aix/rpc_ttdbserverd_realpath                                   2009-06-17       great      ToolTalk rpc.ttdbserverd _tt_internal_realpath Buffer Overflow **(**AIX**)**
   bsdi/softcart/mercantec_softcart                               2004-08-19       great      Mercantec SoftCart CGI Overflow
...snip...
```



## show payloads


```bash
msf **&gt;** show payloads

Payloads
**========**

   Name                                             Disclosure Date  Rank    Description
   ----                                             ---------------  ----    -----------
   aix/ppc/shell_bind_tcp                                            normal  AIX Command Shell, Bind TCP Inline
   aix/ppc/shell_find_port                                           normal  AIX Command Shell, Find Port Inline
   aix/ppc/shell_interact                                            normal  AIX execve shell **for **inetd
...snip...
```


```bash
msf  exploit**(**ms08_067_netapi**)** **&gt;** show payloads

Compatible Payloads
**===================**

   Name                                             Disclosure Date  Rank    Description
   ----                                             ---------------  ----    -----------
   generic/custom                                                    normal  Custom Payload
   generic/debug_trap                                                normal  Generic x86 Debug Trap
   generic/shell_bind_tcp                                            normal  Generic Command Shell, Bind TCP Inline
...snip...
```



`show options` komutu, aktif olan modülün seçeneklerini ve ayarlanabilecek değişkenlerini gösterir.


```bash
msf exploit**(**ms08_067_netapi**)** **&gt;** show options

Module options:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOST                     yes       The target address
   RPORT    445              yes       Set the SMB service port
   SMBPIPE  BROWSER          yes       The pipe name to use **(**BROWSER, SRVSVC**)**

Exploit target:

   Id  Name
   --  ----
   0   Automatic Targeting
```



Seçtiğiniz modülün hangi işletim sistemlerinde kullanabileceğinden emin değilseniz `show targets` komutunu kullanabilirsiniz.


```bash
msf  exploit**(**ms08_067_netapi**)** **&gt;** show targets

Exploit targets:

   Id  Name
   --  ----
   0   Automatic Targeting
   1   Windows 2000 Universal
   10  Windows 2003 SP1 Japanese **(**NO NX**)**
   11  Windows 2003 SP2 English **(**NO NX**)**
   12  Windows 2003 SP2 English **(**NX**)**
...snip...
```



Modül hakkında en detaylı bilgiyi görmek için `show advanced` komutunu kullanabilirsiniz.


```bash
msf exploit**(**ms08_067_netapi**)** **&gt;** show advanced

Module advanced options:

   Name           : CHOST
   Current Setting:
   Description    : The local client address

   Name           : CPORT
   Current Setting:
   Description    : The local client port

...snip...
```



## show encoders



Metasploit içerisindeki kullanabileceğiniz tüm encoder listesini görmek için `show encoders` komutunu kullanabilirsiniz.


```bash
msf **&gt;** show encoders
Compatible Encoders
**===================**

   Name                    Disclosure Date  Rank       Description
   ----                    ---------------  ----       -----------
   cmd/generic_sh                           good       Generic Shell Variable Substitution Command Encoder
   cmd/ifs                                  low        Generic **${**IFS**}** Substitution Command Encoder
   cmd/printf_php_mq                        manual     printf**(**1**)** via PHP magic_quotes Utility Command Encoder
   generic/none                             normal     The "none" Encoder
   mipsbe/longxor                           normal     XOR Encoder
   mipsle/longxor                           normal     XOR Encoder
   php/base64                               great      PHP Base64 encoder
   ppc/longxor                              normal     PPC LongXOR Encoder
   ppc/longxor_tag                          normal     PPC LongXOR Encoder
   sparc/longxor_tag                        normal     SPARC DWORD XOR Encoder
   x64/xor                                  normal     XOR Encoder
   x86/alpha_mixed                          low        Alpha2 Alphanumeric Mixedcase Encoder
   x86/alpha_upper                          low        Alpha2 Alphanumeric Uppercase Encoder
   x86/avoid_utf8_tolower                   manual     Avoid UTF8/tolower
   x86/call4_dword_xor                      normal     Call+4 Dword XOR Encoder
   x86/context_cpuid                        manual     CPUID-based Context Keyed Payload Encoder
   x86/context_stat                         manual     stat**(**2**)**-based Context Keyed Payload Encoder
   x86/context_time                         manual     time**(**2**)**-based Context Keyed Payload Encoder
   x86/countdown                            normal     Single-byte XOR Countdown Encoder
   x86/fnstenv_mov                          normal     Variable-length Fnstenv/mov Dword XOR Encoder
   x86/jmp_call_additive                    normal     Jump/Call XOR Additive Feedback Encoder
   x86/nonalpha                             low        Non-Alpha Encoder
   x86/nonupper                             low        Non-Upper Encoder
   x86/shikata_ga_nai                       excellent  Polymorphic XOR Additive Feedback Encoder
   x86/single_static_bit                    manual     Single Static Bit
   x86/unicode_mixed                        manual     Alpha2 Alphanumeric Unicode Mixedcase Encoder
   x86/unicode_upper                        manual     Alpha2 Alphanumeric Unicode Uppercase Encoder
```



## show nops



NOP Generator denilen kod üreticilerinin listesini `show nops` komutu ile ile görebilirsiniz


```bash
msf **&gt;** show nops
NOP Generators
**==============**

   Name             Disclosure Date  Rank    Description
   ----             ---------------  ----    -----------
   armle/simple                      normal  Simple
   php/generic                       normal  PHP Nop Generator
   ppc/simple                        normal  Simple
   sparc/random                      normal  SPARC NOP generator
   tty/generic                       normal  TTY Nop Generator
   x64/simple                        normal  Simple
   x86/opty2                         normal  Opty2
   x86/single_byte                   normal  Single Byte
```



## use



Yaptığınız aramalar sonunda bir modülü kullanmaya karar verdiniz. İşte bu noktada `use` komutuyla modülü aktif hale getirebilirsiniz.


```bash
msf **&gt;** use dos/windows/smb/ms09_001_write
msf auxiliary**(**ms09_001_write**)** **&gt;** show options

Module options:

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   RHOST                   yes       The target address
   RPORT  445              yes       Set the SMB service port

msf auxiliary**(**ms09_001_write**)** **&gt;**
```



Herhangi bir çalışma esnasında bir komut ile yardım almak istediğinizde `help` komutunu kullanabilirsiniz.



Video Anlatım


<!-- wp:embed {"url":"https://youtu.be/UOtw6CfPGlo","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://youtu.be/UOtw6CfPGlo
</div></figure>
<!-- /wp:embed -->