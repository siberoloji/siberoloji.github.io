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
date: "2017-05-16T12:51:00Z"
excerpt: Bu yazımızda, Metasploit içerisinde sağlanan Port tarama modüllerine kısaca
  bakacağız. Nmap ve diğer port tarama seçeneklerinin yanında, Metasploit tarafından
  sağlanan Port tarama modüllerinin, kullanıcıya ne gibi esneklikler sağladığını göreceğiz.
guid: https://www.siberoloji.com/?p=1151
id: 1151
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde Port Tarama
url: /tr/msf-icinde-port-tarama/
---

  Bu yazımızda, Metasploit içerisinde sağlanan Port tarama modüllerine kısaca bakacağız. Nmap ve diğer port tarama seçeneklerinin yanında, Metasploit tarafından sağlanan Port tarama modüllerinin, kullanıcıya ne gibi esneklikler sağladığını göreceğiz. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="metasploit-i̇çinde-port-tarama">Metasploit İçinde Port Tarama 
<!-- /wp:heading -->

  Tarayıcılar ve hemen hemen tüm auxiliary modülleri RHOST yerine RHOSTS değişkenini kullanırlar. RHOSTS değişkeni farklı formatlarda girilebilen IP aralıkları alabilir. 
 

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>IP Aralıkları (192.168.1.20-192.168.1.30)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>CIDR Gösterimi (192.168.1.0/24),</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Çoklu format (192.168.1.0/24, 192.168.3.0/24),</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Bis dosyadan IP adresleri (file:/tmp/hostlist.txt). <em>Her satırda 1 IP olmalı</em></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
<h2 class="wp-block-heading" id="threads">THREADS</h2>
<!-- /wp:heading -->

  Metasploit içerisinde kullanılan tarama modüllerinin içinde&nbsp;<code>THREADS</code>&nbsp;isimli bir değişken bulunur. Bu değişken, tarama esnasında kaç kanaldan denemenin çalıştırılacağını belirlememizi sağlar.&nbsp;<code>THREADS</code>&nbsp;değişkeni varsayılan olarak 1 değerine ayarlıdır. Bu değeri arttırdığınızda tarama hızlanır. Taramanın hızlanması, işlerin çabuklaşması için faydalı olsa da bir takım kısıtlamaları bulunmaktadır. Aşağıdaki listede&nbsp;<code>THREADS</code>&nbsp;değişkeni ile ilgili tavsiyeleri dikkate almalısınız. 
 

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>MSF programı Win32 sistemlerde çalışıyorsa <code>THREADS</code> değerini 16 ve altında ayarlayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>MSF programı Cygwin sistemde çalışıyorsa <code>THREADS</code> değerini 200 ve altında ayarlayın</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>MSF programı Unix-like sistemde çalışıyorsa <code>THREADS</code> değerini 256 yapabilirsiniz.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
<h2 class="wp-block-heading" id="nmap--db_nmap">Nmap &amp; db_nmap</h2>
<!-- /wp:heading -->

  Metasploit içerisinde bildiğiniz klasik&nbsp;<code>nmap</code>&nbsp;komutunu kullanabileceğiniz gibi&nbsp;<code>db_nmap</code>&nbsp;komutunu da kullanabilirsiniz.&nbsp;<code>db_nmap</code>&nbsp;komutunu kullandığınızda bulunan sonuçlar otomatik olarak hosts tablolarına aktarılır.&nbsp;<code>nmap</code>&nbsp;ile tarama yaptığınızda, sonuçları&nbsp;<code>-oA</code>&nbsp;parametresiyle sonradan kullanmak için (xml, grepable ve normal) formatlarda bir dosyaya kaydederseniz, o dosyayı Metasplot içerisine&nbsp;<code>db_import</code>&nbsp;komutuyla alabilirsiniz. 
 

  Aşağıda, nmap komutunun kullanımına bir örnek görebilirsiniz. İşletim sisteminin komut satırından&nbsp;<code>nmap</code>&nbsp;komutunu kullanabileceğiniz gibi&nbsp;<code>msf &gt;</code>&nbsp;komut satırından da&nbsp;<code>nmap</code>&nbsp;kullanılabilir. Örnekteki&nbsp;<code>nmap</code>&nbsp;komutu, sonuçları&nbsp;<code>subnet_1</code>&nbsp;isimli dosyalara kaydedecektir. Bu dosyaları isterseniz Metasploit’ed aktarabilirsiniz. Bunun yerine&nbsp;<code>db_nmap -v -sV 192.168.1.0/24</code>&nbsp;komutunu verirseniz, sonuçlar otomatik olarak&nbsp;<code>hosts</code>&nbsp;tablosuna kayıt edilir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> nmap -v -sV 192.168.1.0/24 -oA subnet_1
<strong>[</strong><strong>*</strong><strong>]</strong> exec: nmap -v -sV 192.168.1.0/24 -oA subnet_1

Starting Nmap 5.00 <strong>(</strong> <a href="http://nmap.org/">http://nmap.org</a> <strong>)</strong> at 2009-08-13 19:29 MDT
NSE: Loaded 3 scripts <strong>for </strong>scanning.
Initiating ARP Ping Scan at 19:29
Scanning 101 hosts <strong>[</strong>1 port/host]
...
Nmap <strong>done</strong>: 256 IP addresses <strong>(</strong>16 hosts up<strong>)</strong> scanned <strong>in </strong>499.41 seconds
Raw packets sent: 19973 <strong>(</strong>877.822KB<strong>)</strong> | Rcvd: 15125 <strong>(</strong>609.512KB<strong>)</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="port-tarama">Port Tarama</h2>
<!-- /wp:heading -->

  Port tarama için sadece&nbsp;<code>nmap</code>&nbsp;veya&nbsp;<code>db_nmap</code>&nbsp;kullanmak zorunda değilsiniz. Metasploit içerisinde başka bir takım Port tarama modülleri de bulunmaktadır. Bunları&nbsp;<code>search portscan</code>&nbsp;komutuyla listeletebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> search portscan

Matching Modules
<strong>================</strong>

   Name                                      Disclosure Date  Rank    Description
   ----                                      ---------------  ----    -----------
   auxiliary/scanner/natpmp/natpmp_portscan                   normal  NAT-PMP External Port Scanner
   auxiliary/scanner/portscan/ack                             normal  TCP ACK Firewall Scanner
   auxiliary/scanner/portscan/ftpbounce                       normal  FTP Bounce Port Scanner
   auxiliary/scanner/portscan/syn                             normal  TCP SYN Port Scanner
   auxiliary/scanner/portscan/tcp                             normal  TCP Port Scanner
   auxiliary/scanner/portscan/xmas                            normal  TCP "XMas" Port Scanner
</code></pre>
<!-- /wp:code -->

  Şimdi&nbsp;<code>nmap</code>&nbsp;ile yapılmış bir tarama ve Metasploit içinde&nbsp;<code>auxiliary/scanner/portscan/syn</code>&nbsp;tarama modülü ile yapılmış tarama sonuçlarını karşılaştıralım. 
 

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading" id="nmap-syn-tarama-sonuçları">nmap SYN Tarama sonuçları</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> cat subnet_1.gnmap | grep 80/open | awk '{print $2}'
<strong>[</strong><strong>*</strong><strong>]</strong> exec: cat subnet_1.gnmap | grep 80/open | awk '{print $2}'

192.168.1.1
192.168.1.2
192.168.1.10
192.168.1.109
192.168.1.116
192.168.1.150
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading" id="metasploit-syn-modülü-tarama-ve-sonuçları">Metasploit SYN Modülü Tarama ve Sonuçları</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> use auxiliary/scanner/portscan/syn
msf auxiliary<strong>(</strong>syn<strong>)</strong> <strong>&gt;</strong> show options

Module options <strong>(</strong>auxiliary/scanner/portscan/syn<strong>)</strong>:

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   BATCHSIZE  256              yes       The number of hosts to scan per set
   DELAY      0                yes       The delay between connections, per thread, <strong>in </strong>milliseconds
   INTERFACE                   no        The name of the interface
   JITTER     0                yes       The delay jitter factor <strong>(</strong>maximum value by which to +/- DELAY<strong>)</strong> <strong>in </strong>milliseconds.
   PORTS      1-10000          yes       Ports to scan <strong>(</strong>e.g. 22-25,80,110-900<strong>)</strong>
   RHOSTS                      yes       The target address range or CIDR identifier
   SNAPLEN    65535            yes       The number of bytes to capture
   THREADS    1                yes       The number of concurrent THREADS
   TIMEOUT    500              yes       The reply read timeout <strong>in </strong>milliseconds

msf auxiliary<strong>(</strong>syn<strong>)</strong> <strong>&gt;</strong> set INTERFACE eth0
INTERFACE <strong>=&gt;</strong> eth0
msf auxiliary<strong>(</strong>syn<strong>)</strong> <strong>&gt;</strong> set PORTS 80
PORTS <strong>=&gt;</strong> 80
msf auxiliary<strong>(</strong>syn<strong>)</strong> <strong>&gt;</strong> set RHOSTS 192.168.1.0/24
RHOSTS <strong>=&gt;</strong> 192.168.1.0/24
msf auxiliary<strong>(</strong>syn<strong>)</strong> <strong>&gt;</strong> set THREADS 50
THREADS <strong>=&gt;</strong> 50
msf auxiliary<strong>(</strong>syn<strong>)</strong> <strong>&gt;</strong> run

<strong>[</strong><strong>*</strong><strong>]</strong> TCP OPEN 192.168.1.1:80
<strong>[</strong><strong>*</strong><strong>]</strong> TCP OPEN 192.168.1.2:80
<strong>[</strong><strong>*</strong><strong>]</strong> TCP OPEN 192.168.1.10:80
<strong>[</strong><strong>*</strong><strong>]</strong> TCP OPEN 192.168.1.109:80
<strong>[</strong><strong>*</strong><strong>]</strong> TCP OPEN 192.168.1.116:80
<strong>[</strong><strong>*</strong><strong>]</strong> TCP OPEN 192.168.1.150:80
<strong>[</strong><strong>*</strong><strong>]</strong> Scanned 256 of 256 hosts <strong>(</strong>100% complete<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Metasploit&nbsp;<code>auxiliary/scanner/portscan/syn</code>&nbsp;modülü ile yukarıda yaptığımız taramanın&nbsp;<code>hosts</code>&nbsp;tablosuna kaydedildiğini biliyoruz. Şimdi bu sonuçları kullanarak TCP taraması yapalım. Aktif olan bir modülün ihtiyacı olan IP bilgileri RHOSTS değişkenine,&nbsp;<code>hosts</code>&nbsp;tablosundan&nbsp;<code>hosts -R</code>&nbsp;komutuyla aktarıldığını hatırlayın. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> use auxiliary/scanner/portscan/tcp
msf  auxiliary<strong>(</strong>tcp<strong>)</strong> <strong>&gt;</strong> show options

Module options <strong>(</strong>auxiliary/scanner/portscan/tcp<strong>)</strong>:

   Name         Current Setting  Required  Description
   ----         ---------------  --------  -----------
   CONCURRENCY  10               yes       The number of concurrent ports to check per host
   DELAY        0                yes       The delay between connections, per thread, <strong>in </strong>milliseconds
   JITTER       0                yes       The delay jitter factor <strong>(</strong>maximum value by which to +/- DELAY<strong>)</strong> <strong>in </strong>milliseconds.
   PORTS        1-10000          yes       Ports to scan <strong>(</strong>e.g. 22-25,80,110-900<strong>)</strong>
   RHOSTS                        yes       The target address range or CIDR identifier
   THREADS      1                yes       The number of concurrent THREADS
   TIMEOUT      1000             yes       The socket connect timeout <strong>in </strong>milliseconds

msf  auxiliary<strong>(</strong>tcp<strong>)</strong> <strong>&gt;</strong> hosts -R

Hosts
<strong>=====</strong>

address         mac                name  os_name  os_flavor  os_sp  purpose  info  comments
-------         ---                ----  -------  ---------  -----  -------  ----  --------
172.16.194.172  00:0C:29:D1:62:80        Linux    Ubuntu            server         

RHOSTS <strong>=&gt;</strong> 172.16.194.172

msf  auxiliary<strong>(</strong>tcp<strong>)</strong> <strong>&gt;</strong> show options

Module options <strong>(</strong>auxiliary/scanner/portscan/tcp<strong>)</strong>:

   Name         Current Setting  Required  Description
   ----         ---------------  --------  -----------
   CONCURRENCY  10               yes       The number of concurrent ports to check per host
   FILTER                        no        The filter string <strong>for </strong>capturing traffic
   INTERFACE                     no        The name of the interface
   PCAPFILE                      no        The name of the PCAP capture file to process
   PORTS        1-1024           yes       Ports to scan <strong>(</strong>e.g. 22-25,80,110-900<strong>)</strong>
   RHOSTS       172.16.194.172   yes       The target address range or CIDR identifier
   SNAPLEN      65535            yes       The number of bytes to capture
   THREADS      10                yes       The number of concurrent THREADS
   TIMEOUT      1000             yes       The socket connect timeout <strong>in </strong>milliseconds

msf  auxiliary<strong>(</strong>tcp<strong>)</strong> <strong>&gt;</strong> run

<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:25 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:23 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:22 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:21 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:53 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:80 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:111 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:139 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:445 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:514 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:513 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:512 - TCP OPEN
<strong>[</strong><strong>*</strong><strong>]</strong> Scanned 1 of 1 hosts <strong>(</strong>100% complete<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed
msf  auxiliary<strong>(</strong>tcp<strong>)</strong> <strong>&gt;</strong> 
</code></pre>
<!-- /wp:code -->

  İşletim sisteminde&nbsp;<code>nmap</code>&nbsp;yüklü olmayan bilgisayarlar için, Metasploit tarama modülleri büyük kolaylık sağlar. 
 

 
<h2 class="wp-block-heading" id="smb-versiyon-taraması">SMB Versiyon Taraması</h2>
<!-- /wp:heading -->

  Yaptığımız SYN ve TCP taramalarında bir kısım IP adreslerinin açık olduğunu ve 445 numaralı Portların aktif olduğunu gördüğümüzü farz edelim. Bu durumda Windows için&nbsp;<code>smb</code>&nbsp;ve Linux için&nbsp;<code>samba</code>&nbsp;olarak ifade edilen taramayı kullanabiliriz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> use auxiliary/scanner/smb/smb_version
msf auxiliary<strong>(</strong>smb_version<strong>)</strong> <strong>&gt;</strong> set RHOSTS 192.168.1.200-210
RHOSTS <strong>=&gt;</strong> 192.168.1.200-210
msf auxiliary<strong>(</strong>smb_version<strong>)</strong> <strong>&gt;</strong> set THREADS 11
THREADS <strong>=&gt;</strong> 11
msf auxiliary<strong>(</strong>smb_version<strong>)</strong> <strong>&gt;</strong> run

<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.209:445 is running Windows 2003 R2 Service Pack 2 <strong>(</strong>language: Unknown<strong>)</strong> <strong>(</strong>name:XEN-2K3-FUZZ<strong>)</strong> <strong>(</strong>domain:WORKGROUP<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.201:445 is running Windows XP Service Pack 3 <strong>(</strong>language: English<strong>)</strong> <strong>(</strong>name:V-XP-EXPLOIT<strong>)</strong> <strong>(</strong>domain:WORKGROUP<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.202:445 is running Windows XP Service Pack 3 <strong>(</strong>language: English<strong>)</strong> <strong>(</strong>name:V-XP-DEBUG<strong>)</strong> <strong>(</strong>domain:WORKGROUP<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Scanned 04 of 11 hosts <strong>(</strong>036% complete<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Scanned 09 of 11 hosts <strong>(</strong>081% complete<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Scanned 11 of 11 hosts <strong>(</strong>100% complete<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Şimdi tekrar&nbsp;<code>hosts</code>&nbsp;komutunu verirseniz, en son yapılan&nbsp;<code>smb</code>&nbsp;tarama sonuçlarının da tabloya ilave edildiğini görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary<strong>(</strong>smb_version<strong>)</strong> <strong>&gt;</strong> hosts

Hosts
<strong>=====</strong>

address        mac  name  os_name            os_flavor  os_sp  purpose  info  comments
-------        ---  ----  -------            ---------  -----  -------  ----  --------
192.168.1.201             Microsoft Windows  XP         SP3    client         
192.168.1.202             Microsoft Windows  XP         SP3    client         
192.168.1.209             Microsoft Windows  2003 R2    SP2    server
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="idle-tarama">Idle Tarama</h2>
<!-- /wp:heading -->

  Nmap tarafından kullanıcıya sağlanan tarama türlerinden bir tanesi de Idle taramadır. Bir ağda, boşta bulunan bir bilgisayar bulunur ve onun IP numarası üzerinden ağda bulunan diğer IP adresleri taranır. Öncelikle Idle tarama için kullanılacak bir IP adresi bulmalıyız. Bunu bulmak için&nbsp;<code>auxiliary/scanner/ip/ipidseq</code>&nbsp;modülünü kullanalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> use auxiliary/scanner/ip/ipidseq
msf auxiliary<strong>(</strong>ipidseq<strong>)</strong> <strong>&gt;</strong> show options

Module options <strong>(</strong>auxiliary/scanner/ip/ipidseq<strong>)</strong>:

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   INTERFACE                   no        The name of the interface
   RHOSTS                      yes       The target address range or CIDR identifier
   RPORT      80               yes       The target port
   SNAPLEN    65535            yes       The number of bytes to capture
   THREADS    1                yes       The number of concurrent THREADS
   TIMEOUT    500              yes       The reply read timeout <strong>in </strong>milliseconds

msf auxiliary<strong>(</strong>ipidseq<strong>)</strong> <strong>&gt;</strong> set RHOSTS 192.168.1.0/24
RHOSTS <strong>=&gt;</strong> 192.168.1.0/24
msf auxiliary<strong>(</strong>ipidseq<strong>)</strong> <strong>&gt;</strong> set THREADS 50
THREADS <strong>=&gt;</strong> 50
msf auxiliary<strong>(</strong>ipidseq<strong>)</strong> <strong>&gt;</strong> run

<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.1's IPID sequence class: All zeros
[*] 192.168.1.2's IPID sequence class: Incremental!
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.10's IPID sequence class: Incremental!
[*] 192.168.1.104's IPID sequence class: Randomized
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.109's IPID sequence class: Incremental!
[*] 192.168.1.111's IPID sequence class: Incremental!
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.114's IPID sequence class: Incremental!
[*] 192.168.1.116's IPID sequence class: All zeros
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.124's IPID sequence class: Incremental!
[*] 192.168.1.123's IPID sequence class: Incremental!
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.137's IPID sequence class: All zeros
[*] 192.168.1.150's IPID sequence class: All zeros
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.151's IPID sequence class: Incremental!
[*] Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Çıktıda görülen IP adresleri Idle Tarama için kullanılabilir. aşağıdaki örnekte,&nbsp;<code>192.168.1.109</code>&nbsp;IP adresi zombie olarak kullanılmıştır ve onun üzerinden sistemdeki başka bir IP (<code>192.168.1.114</code>) adresine Port taraması gerçekleştirilmiştir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary<strong>(</strong>ipidseq<strong>)</strong> <strong>&gt;</strong> nmap -PN -sI 192.168.1.109 192.168.1.114
<strong>[</strong><strong>*</strong><strong>]</strong> exec: nmap -PN -sI 192.168.1.109 192.168.1.114

Starting Nmap 5.00 <strong>(</strong> <a href="http://nmap.org/">http://nmap.org</a> <strong>)</strong> at 2009-08-14 05:51 MDT
Idle scan using zombie 192.168.1.109 <strong>(</strong>192.168.1.109:80<strong>)</strong>; Class: Incremental
Interesting ports on 192.168.1.114:
Not shown: 996 closed|filtered ports
PORT STATE SERVICE
135/tcp open msrpc
139/tcp open netbios-ssn
445/tcp open microsoft-ds
3389/tcp open ms-term-serv
MAC Address: 00:0C:29:41:F2:E8 <strong>(</strong>VMware<strong>)</strong>

Nmap <strong>done</strong>: 1 IP address <strong>(</strong>1 host up<strong>)</strong> scanned <strong>in </strong>5.56 seconds
</code></pre>
<!-- /wp:code -->

  Bu tarama sonucunda bulunan açık portlar ve servisler çıktıda görülebilir. Aynı işlemi,&nbsp;<code>db_nmap</code>&nbsp;komutuyla da yapabilirsiniz. 
 