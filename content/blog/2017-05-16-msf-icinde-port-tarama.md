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
 <!-- wp:list-item -->
- IP Aralıkları (192.168.1.20-192.168.1.30) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- CIDR Gösterimi (192.168.1.0/24), 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Çoklu format (192.168.1.0/24, 192.168.3.0/24), 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Bis dosyadan IP adresleri (file:/tmp/hostlist.txt). <em>Her satırda 1 IP olmalı</em> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
<h2 class="wp-block-heading" id="threads">THREADS
<!-- /wp:heading -->

  Metasploit içerisinde kullanılan tarama modüllerinin içinde&nbsp;<code>THREADS</code>&nbsp;isimli bir değişken bulunur. Bu değişken, tarama esnasında kaç kanaldan denemenin çalıştırılacağını belirlememizi sağlar.&nbsp;<code>THREADS</code>&nbsp;değişkeni varsayılan olarak 1 değerine ayarlıdır. Bu değeri arttırdığınızda tarama hızlanır. Taramanın hızlanması, işlerin çabuklaşması için faydalı olsa da bir takım kısıtlamaları bulunmaktadır. Aşağıdaki listede&nbsp;<code>THREADS</code>&nbsp;değişkeni ile ilgili tavsiyeleri dikkate almalısınız. 
 

<!-- wp:list -->
 <!-- wp:list-item -->
- MSF programı Win32 sistemlerde çalışıyorsa <code>THREADS</code> değerini 16 ve altında ayarlayın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- MSF programı Cygwin sistemde çalışıyorsa <code>THREADS</code> değerini 200 ve altında ayarlayın 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- MSF programı Unix-like sistemde çalışıyorsa <code>THREADS</code> değerini 256 yapabilirsiniz. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
<h2 class="wp-block-heading" id="nmap--db_nmap">Nmap &amp; db_nmap
<!-- /wp:heading -->

  Metasploit içerisinde bildiğiniz klasik&nbsp;<code>nmap</code>&nbsp;komutunu kullanabileceğiniz gibi&nbsp;<code>db_nmap</code>&nbsp;komutunu da kullanabilirsiniz.&nbsp;<code>db_nmap</code>&nbsp;komutunu kullandığınızda bulunan sonuçlar otomatik olarak hosts tablolarına aktarılır.&nbsp;<code>nmap</code>&nbsp;ile tarama yaptığınızda, sonuçları&nbsp;<code>-oA</code>&nbsp;parametresiyle sonradan kullanmak için (xml, grepable ve normal) formatlarda bir dosyaya kaydederseniz, o dosyayı Metasplot içerisine&nbsp;<code>db_import</code>&nbsp;komutuyla alabilirsiniz. 
 

  Aşağıda, nmap komutunun kullanımına bir örnek görebilirsiniz. İşletim sisteminin komut satırından&nbsp;<code>nmap</code>&nbsp;komutunu kullanabileceğiniz gibi&nbsp;<code>msf &gt;</code>&nbsp;komut satırından da&nbsp;<code>nmap</code>&nbsp;kullanılabilir. Örnekteki&nbsp;<code>nmap</code>&nbsp;komutu, sonuçları&nbsp;<code>subnet_1</code>&nbsp;isimli dosyalara kaydedecektir. Bu dosyaları isterseniz Metasploit’ed aktarabilirsiniz. Bunun yerine&nbsp;<code>db_nmap -v -sV 192.168.1.0/24</code>&nbsp;komutunu verirseniz, sonuçlar otomatik olarak&nbsp;<code>hosts</code>&nbsp;tablosuna kayıt edilir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  nmap -v -sV 192.168.1.0/24 -oA subnet_1
***[*** ******* ***]***  exec: nmap -v -sV 192.168.1.0/24 -oA subnet_1

Starting Nmap 5.00 ***(***  <a href="http://nmap.org/">http://nmap.org</a> ***)***  at 2009-08-13 19:29 MDT
NSE: Loaded 3 scripts ***for *** scanning.
Initiating ARP Ping Scan at 19:29
Scanning 101 hosts ***[*** 1 port/host]
...
Nmap ***done*** : 256 IP addresses ***(*** 16 hosts up***)***  scanned ***in *** 499.41 seconds
Raw packets sent: 19973 ***(*** 877.822KB***)***  | Rcvd: 15125 ***(*** 609.512KB***)*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="port-tarama">Port Tarama
<!-- /wp:heading -->

  Port tarama için sadece&nbsp;<code>nmap</code>&nbsp;veya&nbsp;<code>db_nmap</code>&nbsp;kullanmak zorunda değilsiniz. Metasploit içerisinde başka bir takım Port tarama modülleri de bulunmaktadır. Bunları&nbsp;<code>search portscan</code>&nbsp;komutuyla listeletebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  search portscan

Matching Modules
***================*** 

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
 


<h3 class="wp-block-heading" id="nmap-syn-tarama-sonuçları">nmap SYN Tarama sonuçları
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  cat subnet_1.gnmap | grep 80/open | awk '{print $2}'
***[*** ******* ***]***  exec: cat subnet_1.gnmap | grep 80/open | awk '{print $2}'

192.168.1.1
192.168.1.2
192.168.1.10
192.168.1.109
192.168.1.116
192.168.1.150
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="metasploit-syn-modülü-tarama-ve-sonuçları">Metasploit SYN Modülü Tarama ve Sonuçları
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use auxiliary/scanner/portscan/syn
msf auxiliary***(*** syn***)***  ***&gt;***  show options

Module options ***(*** auxiliary/scanner/portscan/syn***)*** :

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   BATCHSIZE  256              yes       The number of hosts to scan per set
   DELAY      0                yes       The delay between connections, per thread, ***in *** milliseconds
   INTERFACE                   no        The name of the interface
   JITTER     0                yes       The delay jitter factor ***(*** maximum value by which to +/- DELAY***)***  ***in *** milliseconds.
   PORTS      1-10000          yes       Ports to scan ***(*** e.g. 22-25,80,110-900***)*** 
   RHOSTS                      yes       The target address range or CIDR identifier
   SNAPLEN    65535            yes       The number of bytes to capture
   THREADS    1                yes       The number of concurrent THREADS
   TIMEOUT    500              yes       The reply read timeout ***in *** milliseconds

msf auxiliary***(*** syn***)***  ***&gt;***  set INTERFACE eth0
INTERFACE ***=&gt;***  eth0
msf auxiliary***(*** syn***)***  ***&gt;***  set PORTS 80
PORTS ***=&gt;***  80
msf auxiliary***(*** syn***)***  ***&gt;***  set RHOSTS 192.168.1.0/24
RHOSTS ***=&gt;***  192.168.1.0/24
msf auxiliary***(*** syn***)***  ***&gt;***  set THREADS 50
THREADS ***=&gt;***  50
msf auxiliary***(*** syn***)***  ***&gt;***  run

***[*** ******* ***]***  TCP OPEN 192.168.1.1:80
***[*** ******* ***]***  TCP OPEN 192.168.1.2:80
***[*** ******* ***]***  TCP OPEN 192.168.1.10:80
***[*** ******* ***]***  TCP OPEN 192.168.1.109:80
***[*** ******* ***]***  TCP OPEN 192.168.1.116:80
***[*** ******* ***]***  TCP OPEN 192.168.1.150:80
***[*** ******* ***]***  Scanned 256 of 256 hosts ***(*** 100% complete***)*** 
***[*** ******* ***]***  Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Metasploit&nbsp;<code>auxiliary/scanner/portscan/syn</code>&nbsp;modülü ile yukarıda yaptığımız taramanın&nbsp;<code>hosts</code>&nbsp;tablosuna kaydedildiğini biliyoruz. Şimdi bu sonuçları kullanarak TCP taraması yapalım. Aktif olan bir modülün ihtiyacı olan IP bilgileri RHOSTS değişkenine,&nbsp;<code>hosts</code>&nbsp;tablosundan&nbsp;<code>hosts -R</code>&nbsp;komutuyla aktarıldığını hatırlayın. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use auxiliary/scanner/portscan/tcp
msf  auxiliary***(*** tcp***)***  ***&gt;***  show options

Module options ***(*** auxiliary/scanner/portscan/tcp***)*** :

   Name         Current Setting  Required  Description
   ----         ---------------  --------  -----------
   CONCURRENCY  10               yes       The number of concurrent ports to check per host
   DELAY        0                yes       The delay between connections, per thread, ***in *** milliseconds
   JITTER       0                yes       The delay jitter factor ***(*** maximum value by which to +/- DELAY***)***  ***in *** milliseconds.
   PORTS        1-10000          yes       Ports to scan ***(*** e.g. 22-25,80,110-900***)*** 
   RHOSTS                        yes       The target address range or CIDR identifier
   THREADS      1                yes       The number of concurrent THREADS
   TIMEOUT      1000             yes       The socket connect timeout ***in *** milliseconds

msf  auxiliary***(*** tcp***)***  ***&gt;***  hosts -R

Hosts
***=====*** 

address         mac                name  os_name  os_flavor  os_sp  purpose  info  comments
-------         ---                ----  -------  ---------  -----  -------  ----  --------
172.16.194.172  00:0C:29:D1:62:80        Linux    Ubuntu            server         

RHOSTS ***=&gt;***  172.16.194.172

msf  auxiliary***(*** tcp***)***  ***&gt;***  show options

Module options ***(*** auxiliary/scanner/portscan/tcp***)*** :

   Name         Current Setting  Required  Description
   ----         ---------------  --------  -----------
   CONCURRENCY  10               yes       The number of concurrent ports to check per host
   FILTER                        no        The filter string ***for *** capturing traffic
   INTERFACE                     no        The name of the interface
   PCAPFILE                      no        The name of the PCAP capture file to process
   PORTS        1-1024           yes       Ports to scan ***(*** e.g. 22-25,80,110-900***)*** 
   RHOSTS       172.16.194.172   yes       The target address range or CIDR identifier
   SNAPLEN      65535            yes       The number of bytes to capture
   THREADS      10                yes       The number of concurrent THREADS
   TIMEOUT      1000             yes       The socket connect timeout ***in *** milliseconds

msf  auxiliary***(*** tcp***)***  ***&gt;***  run

***[*** ******* ***]***  172.16.194.172:25 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:23 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:22 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:21 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:53 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:80 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:111 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:139 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:445 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:514 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:513 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:512 - TCP OPEN
***[*** ******* ***]***  Scanned 1 of 1 hosts ***(*** 100% complete***)*** 
***[*** ******* ***]***  Auxiliary module execution completed
msf  auxiliary***(*** tcp***)***  ***&gt;***  
</code></pre>
<!-- /wp:code -->

  İşletim sisteminde&nbsp;<code>nmap</code>&nbsp;yüklü olmayan bilgisayarlar için, Metasploit tarama modülleri büyük kolaylık sağlar. 
 

 
<h2 class="wp-block-heading" id="smb-versiyon-taraması">SMB Versiyon Taraması
<!-- /wp:heading -->

  Yaptığımız SYN ve TCP taramalarında bir kısım IP adreslerinin açık olduğunu ve 445 numaralı Portların aktif olduğunu gördüğümüzü farz edelim. Bu durumda Windows için&nbsp;<code>smb</code>&nbsp;ve Linux için&nbsp;<code>samba</code>&nbsp;olarak ifade edilen taramayı kullanabiliriz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use auxiliary/scanner/smb/smb_version
msf auxiliary***(*** smb_version***)***  ***&gt;***  set RHOSTS 192.168.1.200-210
RHOSTS ***=&gt;***  192.168.1.200-210
msf auxiliary***(*** smb_version***)***  ***&gt;***  set THREADS 11
THREADS ***=&gt;***  11
msf auxiliary***(*** smb_version***)***  ***&gt;***  run

***[*** ******* ***]***  192.168.1.209:445 is running Windows 2003 R2 Service Pack 2 ***(*** language: Unknown***)***  ***(*** name:XEN-2K3-FUZZ***)***  ***(*** domain:WORKGROUP***)*** 
***[*** ******* ***]***  192.168.1.201:445 is running Windows XP Service Pack 3 ***(*** language: English***)***  ***(*** name:V-XP-EXPLOIT***)***  ***(*** domain:WORKGROUP***)*** 
***[*** ******* ***]***  192.168.1.202:445 is running Windows XP Service Pack 3 ***(*** language: English***)***  ***(*** name:V-XP-DEBUG***)***  ***(*** domain:WORKGROUP***)*** 
***[*** ******* ***]***  Scanned 04 of 11 hosts ***(*** 036% complete***)*** 
***[*** ******* ***]***  Scanned 09 of 11 hosts ***(*** 081% complete***)*** 
***[*** ******* ***]***  Scanned 11 of 11 hosts ***(*** 100% complete***)*** 
***[*** ******* ***]***  Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Şimdi tekrar&nbsp;<code>hosts</code>&nbsp;komutunu verirseniz, en son yapılan&nbsp;<code>smb</code>&nbsp;tarama sonuçlarının da tabloya ilave edildiğini görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary***(*** smb_version***)***  ***&gt;***  hosts

Hosts
***=====*** 

address        mac  name  os_name            os_flavor  os_sp  purpose  info  comments
-------        ---  ----  -------            ---------  -----  -------  ----  --------
192.168.1.201             Microsoft Windows  XP         SP3    client         
192.168.1.202             Microsoft Windows  XP         SP3    client         
192.168.1.209             Microsoft Windows  2003 R2    SP2    server
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="idle-tarama">Idle Tarama
<!-- /wp:heading -->

  Nmap tarafından kullanıcıya sağlanan tarama türlerinden bir tanesi de Idle taramadır. Bir ağda, boşta bulunan bir bilgisayar bulunur ve onun IP numarası üzerinden ağda bulunan diğer IP adresleri taranır. Öncelikle Idle tarama için kullanılacak bir IP adresi bulmalıyız. Bunu bulmak için&nbsp;<code>auxiliary/scanner/ip/ipidseq</code>&nbsp;modülünü kullanalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use auxiliary/scanner/ip/ipidseq
msf auxiliary***(*** ipidseq***)***  ***&gt;***  show options

Module options ***(*** auxiliary/scanner/ip/ipidseq***)*** :

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   INTERFACE                   no        The name of the interface
   RHOSTS                      yes       The target address range or CIDR identifier
   RPORT      80               yes       The target port
   SNAPLEN    65535            yes       The number of bytes to capture
   THREADS    1                yes       The number of concurrent THREADS
   TIMEOUT    500              yes       The reply read timeout ***in *** milliseconds

msf auxiliary***(*** ipidseq***)***  ***&gt;***  set RHOSTS 192.168.1.0/24
RHOSTS ***=&gt;***  192.168.1.0/24
msf auxiliary***(*** ipidseq***)***  ***&gt;***  set THREADS 50
THREADS ***=&gt;***  50
msf auxiliary***(*** ipidseq***)***  ***&gt;***  run

***[*** ******* ***]***  192.168.1.1's IPID sequence class: All zeros
[*] 192.168.1.2's IPID sequence class: Incremental!
***[*** ******* ***]***  192.168.1.10's IPID sequence class: Incremental!
[*] 192.168.1.104's IPID sequence class: Randomized
***[*** ******* ***]***  192.168.1.109's IPID sequence class: Incremental!
[*] 192.168.1.111's IPID sequence class: Incremental!
***[*** ******* ***]***  192.168.1.114's IPID sequence class: Incremental!
[*] 192.168.1.116's IPID sequence class: All zeros
***[*** ******* ***]***  192.168.1.124's IPID sequence class: Incremental!
[*] 192.168.1.123's IPID sequence class: Incremental!
***[*** ******* ***]***  192.168.1.137's IPID sequence class: All zeros
[*] 192.168.1.150's IPID sequence class: All zeros
***[*** ******* ***]***  192.168.1.151's IPID sequence class: Incremental!
[*] Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Çıktıda görülen IP adresleri Idle Tarama için kullanılabilir. aşağıdaki örnekte,&nbsp;<code>192.168.1.109</code>&nbsp;IP adresi zombie olarak kullanılmıştır ve onun üzerinden sistemdeki başka bir IP (<code>192.168.1.114</code>) adresine Port taraması gerçekleştirilmiştir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary***(*** ipidseq***)***  ***&gt;***  nmap -PN -sI 192.168.1.109 192.168.1.114
***[*** ******* ***]***  exec: nmap -PN -sI 192.168.1.109 192.168.1.114

Starting Nmap 5.00 ***(***  <a href="http://nmap.org/">http://nmap.org</a> ***)***  at 2009-08-14 05:51 MDT
Idle scan using zombie 192.168.1.109 ***(*** 192.168.1.109:80***)*** ; Class: Incremental
Interesting ports on 192.168.1.114:
Not shown: 996 closed|filtered ports
PORT STATE SERVICE
135/tcp open msrpc
139/tcp open netbios-ssn
445/tcp open microsoft-ds
3389/tcp open ms-term-serv
MAC Address: 00:0C:29:41:F2:E8 ***(*** VMware***)*** 

Nmap ***done*** : 1 IP address ***(*** 1 host up***)***  scanned ***in *** 5.56 seconds
</code></pre>
<!-- /wp:code -->

  Bu tarama sonucunda bulunan açık portlar ve servisler çıktıda görülebilir. Aynı işlemi,&nbsp;<code>db_nmap</code>&nbsp;komutuyla da yapabilirsiniz. 
 