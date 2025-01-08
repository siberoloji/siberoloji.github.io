---
draft: false

title:  'MSF İçinde Port Tarama'
date: '2017-05-16T12:51:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazımızda, Metasploit içerisinde sağlanan Port tarama modüllerine kısaca bakacağız. Nmap ve diğer port tarama seçeneklerinin yanında, Metasploit tarafından sağlanan Port tarama modüllerinin, kullanıcıya ne gibi esneklikler sağladığını göreceğiz.' 
 
url:  /tr/msf-icinde-port-tarama/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


Bu yazımızda, Metasploit içerisinde sağlanan Port tarama modüllerine kısaca bakacağız. Nmap ve diğer port tarama seçeneklerinin yanında, Metasploit tarafından sağlanan Port tarama modüllerinin, kullanıcıya ne gibi esneklikler sağladığını göreceğiz.



## Metasploit İçinde Port Tarama



Tarayıcılar ve hemen hemen tüm auxiliary modülleri RHOST yerine RHOSTS değişkenini kullanırlar. RHOSTS değişkeni farklı formatlarda girilebilen IP aralıkları alabilir.


* 
* IP Aralıkları (192.168.1.20-192.168.1.30)

* CIDR Gösterimi (192.168.1.0/24),

* Çoklu format (192.168.1.0/24, 192.168.3.0/24),

* Bis dosyadan IP adresleri (file:/tmp/hostlist.txt). Her satırda 1 IP olmalı




## THREADS



Metasploit içerisinde kullanılan tarama modüllerinin içinde `THREADS` isimli bir değişken bulunur. Bu değişken, tarama esnasında kaç kanaldan denemenin çalıştırılacağını belirlememizi sağlar. `THREADS` değişkeni varsayılan olarak 1 değerine ayarlıdır. Bu değeri arttırdığınızda tarama hızlanır. Taramanın hızlanması, işlerin çabuklaşması için faydalı olsa da bir takım kısıtlamaları bulunmaktadır. Aşağıdaki listede `THREADS` değişkeni ile ilgili tavsiyeleri dikkate almalısınız.


* 
* MSF programı Win32 sistemlerde çalışıyorsa `THREADS` değerini 16 ve altında ayarlayın.

* MSF programı Cygwin sistemde çalışıyorsa `THREADS` değerini 200 ve altında ayarlayın

* MSF programı Unix-like sistemde çalışıyorsa `THREADS` değerini 256 yapabilirsiniz.




## Nmap &amp; db_nmap



Metasploit içerisinde bildiğiniz klasik `nmap` komutunu kullanabileceğiniz gibi `db_nmap` komutunu da kullanabilirsiniz. `db_nmap` komutunu kullandığınızda bulunan sonuçlar otomatik olarak hosts tablolarına aktarılır. `nmap` ile tarama yaptığınızda, sonuçları `-oA` parametresiyle sonradan kullanmak için (xml, grepable ve normal) formatlarda bir dosyaya kaydederseniz, o dosyayı Metasplot içerisine `db_import` komutuyla alabilirsiniz.



Aşağıda, nmap komutunun kullanımına bir örnek görebilirsiniz. İşletim sisteminin komut satırından `nmap` komutunu kullanabileceğiniz gibi `msf >` komut satırından da `nmap` kullanılabilir. Örnekteki `nmap` komutu, sonuçları `subnet_1` isimli dosyalara kaydedecektir. Bu dosyaları isterseniz Metasploit’ed aktarabilirsiniz. Bunun yerine `db_nmap -v -sV 192.168.1.0/24` komutunu verirseniz, sonuçlar otomatik olarak `hosts` tablosuna kayıt edilir.


```bash
msf **>** nmap -v -sV 192.168.1.0/24 -oA subnet_1
**[*********]** exec: nmap -v -sV 192.168.1.0/24 -oA subnet_1

Starting Nmap 5.00 **(** <a href="http://nmap.org/">http://nmap.org</a> **)** at 2009-08-13 19:29 MDT
NSE: Loaded 3 scripts **for **scanning.
Initiating ARP Ping Scan at 19:29
Scanning 101 hosts **[**1 port/host]
...
Nmap **done**: 256 IP addresses **(**16 hosts up**)** scanned **in **499.41 seconds
Raw packets sent: 19973 **(**877.822KB**)** | Rcvd: 15125 **(**609.512KB**)**
```



## Port Tarama



Port tarama için sadece `nmap` veya `db_nmap` kullanmak zorunda değilsiniz. Metasploit içerisinde başka bir takım Port tarama modülleri de bulunmaktadır. Bunları `search portscan` komutuyla listeletebilirsiniz.


```bash
msf **>** search portscan

Matching Modules
**================**

   Name                                      Disclosure Date  Rank    Description
   ----                                      ---------------  ----    -----------
   auxiliary/scanner/natpmp/natpmp_portscan                   normal  NAT-PMP External Port Scanner
   auxiliary/scanner/portscan/ack                             normal  TCP ACK Firewall Scanner
   auxiliary/scanner/portscan/ftpbounce                       normal  FTP Bounce Port Scanner
   auxiliary/scanner/portscan/syn                             normal  TCP SYN Port Scanner
   auxiliary/scanner/portscan/tcp                             normal  TCP Port Scanner
   auxiliary/scanner/portscan/xmas                            normal  TCP "XMas" Port Scanner
```



Şimdi `nmap` ile yapılmış bir tarama ve Metasploit içinde `auxiliary/scanner/portscan/syn` tarama modülü ile yapılmış tarama sonuçlarını karşılaştıralım.



<h3 class="wp-block-heading" id="nmap-syn-tarama-sonuçları">nmap SYN Tarama sonuçları


```bash
msf **>** cat subnet_1.gnmap | grep 80/open | awk '{print $2}'
**[*********]** exec: cat subnet_1.gnmap | grep 80/open | awk '{print $2}'

192.168.1.1
192.168.1.2
192.168.1.10
192.168.1.109
192.168.1.116
192.168.1.150
```



<h3 class="wp-block-heading" id="metasploit-syn-modülü-tarama-ve-sonuçları">Metasploit SYN Modülü Tarama ve Sonuçları


```bash
msf **>** use auxiliary/scanner/portscan/syn
msf auxiliary**(**syn**)** **>** show options

Module options **(**auxiliary/scanner/portscan/syn**)**:

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   BATCHSIZE  256              yes       The number of hosts to scan per set
   DELAY      0                yes       The delay between connections, per thread, **in **milliseconds
   INTERFACE                   no        The name of the interface
   JITTER     0                yes       The delay jitter factor **(**maximum value by which to +/- DELAY**)** **in **milliseconds.
   PORTS      1-10000          yes       Ports to scan **(**e.g. 22-25,80,110-900**)**
   RHOSTS                      yes       The target address range or CIDR identifier
   SNAPLEN    65535            yes       The number of bytes to capture
   THREADS    1                yes       The number of concurrent THREADS
   TIMEOUT    500              yes       The reply read timeout **in **milliseconds

msf auxiliary**(**syn**)** **>** set INTERFACE eth0
INTERFACE **=>** eth0
msf auxiliary**(**syn**)** **>** set PORTS 80
PORTS **=>** 80
msf auxiliary**(**syn**)** **>** set RHOSTS 192.168.1.0/24
RHOSTS **=>** 192.168.1.0/24
msf auxiliary**(**syn**)** **>** set THREADS 50
THREADS **=>** 50
msf auxiliary**(**syn**)** **>** run

**[*********]** TCP OPEN 192.168.1.1:80
**[*********]** TCP OPEN 192.168.1.2:80
**[*********]** TCP OPEN 192.168.1.10:80
**[*********]** TCP OPEN 192.168.1.109:80
**[*********]** TCP OPEN 192.168.1.116:80
**[*********]** TCP OPEN 192.168.1.150:80
**[*********]** Scanned 256 of 256 hosts **(**100% complete**)**
**[*********]** Auxiliary module execution completed
```



Metasploit `auxiliary/scanner/portscan/syn` modülü ile yukarıda yaptığımız taramanın `hosts` tablosuna kaydedildiğini biliyoruz. Şimdi bu sonuçları kullanarak TCP taraması yapalım. Aktif olan bir modülün ihtiyacı olan IP bilgileri RHOSTS değişkenine, `hosts` tablosundan `hosts -R` komutuyla aktarıldığını hatırlayın.


```bash
msf **>** use auxiliary/scanner/portscan/tcp
msf  auxiliary**(**tcp**)** **>** show options

Module options **(**auxiliary/scanner/portscan/tcp**)**:

   Name         Current Setting  Required  Description
   ----         ---------------  --------  -----------
   CONCURRENCY  10               yes       The number of concurrent ports to check per host
   DELAY        0                yes       The delay between connections, per thread, **in **milliseconds
   JITTER       0                yes       The delay jitter factor **(**maximum value by which to +/- DELAY**)** **in **milliseconds.
   PORTS        1-10000          yes       Ports to scan **(**e.g. 22-25,80,110-900**)**
   RHOSTS                        yes       The target address range or CIDR identifier
   THREADS      1                yes       The number of concurrent THREADS
   TIMEOUT      1000             yes       The socket connect timeout **in **milliseconds

msf  auxiliary**(**tcp**)** **>** hosts -R

Hosts
**=====**

address         mac                name  os_name  os_flavor  os_sp  purpose  info  comments
-------         ---                ----  -------  ---------  -----  -------  ----  --------
172.16.194.172  00:0C:29:D1:62:80        Linux    Ubuntu            server         

RHOSTS **=>** 172.16.194.172

msf  auxiliary**(**tcp**)** **>** show options

Module options **(**auxiliary/scanner/portscan/tcp**)**:

   Name         Current Setting  Required  Description
   ----         ---------------  --------  -----------
   CONCURRENCY  10               yes       The number of concurrent ports to check per host
   FILTER                        no        The filter string **for **capturing traffic
   INTERFACE                     no        The name of the interface
   PCAPFILE                      no        The name of the PCAP capture file to process
   PORTS        1-1024           yes       Ports to scan **(**e.g. 22-25,80,110-900**)**
   RHOSTS       172.16.194.172   yes       The target address range or CIDR identifier
   SNAPLEN      65535            yes       The number of bytes to capture
   THREADS      10                yes       The number of concurrent THREADS
   TIMEOUT      1000             yes       The socket connect timeout **in **milliseconds

msf  auxiliary**(**tcp**)** **>** run

**[*********]** 172.16.194.172:25 - TCP OPEN
**[*********]** 172.16.194.172:23 - TCP OPEN
**[*********]** 172.16.194.172:22 - TCP OPEN
**[*********]** 172.16.194.172:21 - TCP OPEN
**[*********]** 172.16.194.172:53 - TCP OPEN
**[*********]** 172.16.194.172:80 - TCP OPEN
**[*********]** 172.16.194.172:111 - TCP OPEN
**[*********]** 172.16.194.172:139 - TCP OPEN
**[*********]** 172.16.194.172:445 - TCP OPEN
**[*********]** 172.16.194.172:514 - TCP OPEN
**[*********]** 172.16.194.172:513 - TCP OPEN
**[*********]** 172.16.194.172:512 - TCP OPEN
**[*********]** Scanned 1 of 1 hosts **(**100% complete**)**
**[*********]** Auxiliary module execution completed
msf  auxiliary**(**tcp**)** **>** 
```



İşletim sisteminde `nmap` yüklü olmayan bilgisayarlar için, Metasploit tarama modülleri büyük kolaylık sağlar.



## SMB Versiyon Taraması



Yaptığımız SYN ve TCP taramalarında bir kısım IP adreslerinin açık olduğunu ve 445 numaralı Portların aktif olduğunu gördüğümüzü farz edelim. Bu durumda Windows için `smb` ve Linux için `samba` olarak ifade edilen taramayı kullanabiliriz.


```bash
msf **>** use auxiliary/scanner/smb/smb_version
msf auxiliary**(**smb_version**)** **>** set RHOSTS 192.168.1.200-210
RHOSTS **=>** 192.168.1.200-210
msf auxiliary**(**smb_version**)** **>** set THREADS 11
THREADS **=>** 11
msf auxiliary**(**smb_version**)** **>** run

**[*********]** 192.168.1.209:445 is running Windows 2003 R2 Service Pack 2 **(**language: Unknown**)** **(**name:XEN-2K3-FUZZ**)** **(**domain:WORKGROUP**)**
**[*********]** 192.168.1.201:445 is running Windows XP Service Pack 3 **(**language: English**)** **(**name:V-XP-EXPLOIT**)** **(**domain:WORKGROUP**)**
**[*********]** 192.168.1.202:445 is running Windows XP Service Pack 3 **(**language: English**)** **(**name:V-XP-DEBUG**)** **(**domain:WORKGROUP**)**
**[*********]** Scanned 04 of 11 hosts **(**036% complete**)**
**[*********]** Scanned 09 of 11 hosts **(**081% complete**)**
**[*********]** Scanned 11 of 11 hosts **(**100% complete**)**
**[*********]** Auxiliary module execution completed
```



Şimdi tekrar `hosts` komutunu verirseniz, en son yapılan `smb` tarama sonuçlarının da tabloya ilave edildiğini görebilirsiniz.


```bash
msf auxiliary**(**smb_version**)** **>** hosts

Hosts
**=====**

address        mac  name  os_name            os_flavor  os_sp  purpose  info  comments
-------        ---  ----  -------            ---------  -----  -------  ----  --------
192.168.1.201             Microsoft Windows  XP         SP3    client         
192.168.1.202             Microsoft Windows  XP         SP3    client         
192.168.1.209             Microsoft Windows  2003 R2    SP2    server
```



## Idle Tarama



Nmap tarafından kullanıcıya sağlanan tarama türlerinden bir tanesi de Idle taramadır. Bir ağda, boşta bulunan bir bilgisayar bulunur ve onun IP numarası üzerinden ağda bulunan diğer IP adresleri taranır. Öncelikle Idle tarama için kullanılacak bir IP adresi bulmalıyız. Bunu bulmak için `auxiliary/scanner/ip/ipidseq` modülünü kullanalım.


```bash
msf **>** use auxiliary/scanner/ip/ipidseq
msf auxiliary**(**ipidseq**)** **>** show options

Module options **(**auxiliary/scanner/ip/ipidseq**)**:

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   INTERFACE                   no        The name of the interface
   RHOSTS                      yes       The target address range or CIDR identifier
   RPORT      80               yes       The target port
   SNAPLEN    65535            yes       The number of bytes to capture
   THREADS    1                yes       The number of concurrent THREADS
   TIMEOUT    500              yes       The reply read timeout **in **milliseconds

msf auxiliary**(**ipidseq**)** **>** set RHOSTS 192.168.1.0/24
RHOSTS **=>** 192.168.1.0/24
msf auxiliary**(**ipidseq**)** **>** set THREADS 50
THREADS **=>** 50
msf auxiliary**(**ipidseq**)** **>** run

**[*********]** 192.168.1.1's IPID sequence class: All zeros
[*] 192.168.1.2's IPID sequence class: Incremental!
**[*********]** 192.168.1.10's IPID sequence class: Incremental!
[*] 192.168.1.104's IPID sequence class: Randomized
**[*********]** 192.168.1.109's IPID sequence class: Incremental!
[*] 192.168.1.111's IPID sequence class: Incremental!
**[*********]** 192.168.1.114's IPID sequence class: Incremental!
[*] 192.168.1.116's IPID sequence class: All zeros
**[*********]** 192.168.1.124's IPID sequence class: Incremental!
[*] 192.168.1.123's IPID sequence class: Incremental!
**[*********]** 192.168.1.137's IPID sequence class: All zeros
[*] 192.168.1.150's IPID sequence class: All zeros
**[*********]** 192.168.1.151's IPID sequence class: Incremental!
[*] Auxiliary module execution completed
```



Çıktıda görülen IP adresleri Idle Tarama için kullanılabilir. aşağıdaki örnekte, `192.168.1.109` IP adresi zombie olarak kullanılmıştır ve onun üzerinden sistemdeki başka bir IP (`192.168.1.114`) adresine Port taraması gerçekleştirilmiştir.


```bash
msf auxiliary**(**ipidseq**)** **>** nmap -PN -sI 192.168.1.109 192.168.1.114
**[*********]** exec: nmap -PN -sI 192.168.1.109 192.168.1.114

Starting Nmap 5.00 **(** <a href="http://nmap.org/">http://nmap.org</a> **)** at 2009-08-14 05:51 MDT
Idle scan using zombie 192.168.1.109 **(**192.168.1.109:80**)**; Class: Incremental
Interesting ports on 192.168.1.114:
Not shown: 996 closed|filtered ports
PORT STATE SERVICE
135/tcp open msrpc
139/tcp open netbios-ssn
445/tcp open microsoft-ds
3389/tcp open ms-term-serv
MAC Address: 00:0C:29:41:F2:E8 **(**VMware**)**

Nmap **done**: 1 IP address **(**1 host up**)** scanned **in **5.56 seconds
```



Bu tarama sonucunda bulunan açık portlar ve servisler çıktıda görülebilir. Aynı işlemi, `db_nmap` komutuyla da yapabilirsiniz.
