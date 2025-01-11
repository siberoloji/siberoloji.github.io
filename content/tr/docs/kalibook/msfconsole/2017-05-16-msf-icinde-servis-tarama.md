---
draft: false
title:  'MSF İçinde Servis Tarama'
date: '2017-05-16T12:54:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description:  "Metasploit Framework içerisinde, belirli Portlarda çalışan servisleri bulmak ve bunların versiyon numaralarını tespit etmek için bir takım modüller bulunur. nmap ile yapılan servis taraması gibi bir takım bilgi toplama faaliyetlerinde bunları kullanabilirsiniz." 
url:  /tr/msf-icinde-servis-tarama/
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


Metasploit Framework içerisinde, belirli Portlarda çalışan servisleri bulmak ve bunların versiyon numaralarını tespit etmek için bir takım modüller bulunur. `nmap` ile yapılan servis taraması gibi bir takım bilgi toplama faaliyetlerinde bunları kullanabilirsiniz.



## SSH Servisi



Aşağıdaki örnekte, önceden bir tarama yaptığımız ve iki farklı IP adresinde `ssh` servisinin çalıştığı bulunmuştur.


```bash
msf > services -p 22 -c name,port,proto

Services
**========**

host            name  port  proto
----            ----  ----  -----
172.16.194.163  ssh   22    tcp
172.16.194.172  ssh   22    tcp
```



Şimdi bu servislerin hangi sürüm SSH çalıştırdıklarını keşfedelim. Bunun için `auxiliary/scanner/ssh/ssh_version` isimli modülü kullanacağız.


```bash
msf > use auxiliary/scanner/ssh/ssh_version

msf  auxiliary(ssh_version) > set RHOSTS 172.16.194.163 172.16.194.172
RHOSTS => 172.16.194.163 172.16.194.172

msf  auxiliary(ssh_version) > show options

Module options (auxiliary/scanner/ssh/ssh_version):

   Name     Current Setting                Required  Description
   ----     ---------------                --------  -----------
   RHOSTS   172.16.194.163 172.16.194.172  yes       The target address range or CIDR identifier
   RPORT    22                             yes       The target port
   THREADS  1                              yes       The number of concurrent threads
   TIMEOUT  30                             yes       Timeout for the SSH probe


msf  auxiliary(ssh_version) > run

> 172.16.194.163:22, SSH server version: SSH-2.0-OpenSSH_5.3p1 Debian-3ubuntu7
> Scanned 1 of 2 hosts (050% complete)
> 172.16.194.172:22, SSH server version: SSH-2.0-OpenSSH_4.7p1 Debian-8ubuntu1
> Scanned 2 of 2 hosts (100% complete)
> Auxiliary module execution completed
```



Sonuç çıktısında görebileceğiniz gibi SSH sürüm numaraları tespit edilmiştir.



## FTP Servisi



Yanlış yapılandırılmış FTP servislerinin zayıf yanları kullanılarak sisteme erişim sağlanabilir. Herhangi bir IP adresinde 21 numaralı Portun açık olduğunu görürseniz, orada çalışan FTP servisinin **Anonymous** girişe izin verip vermediğini kontrol etmeniz faydalı olacaktır. Aşağıdaki örnekte, `ftp_version` modülü kullanılmaktadır. Tek bir IP adresi taranacağından, `THREADS` değişkeni 1 olarak ayarlanmıştır.



Öncelikle, `services` tablomuzdaki ilgilerden 21 Numaralı portun açık olduğu IP adreslerini listeleyelim.


```bash
msf > services -p 21 -c name,proto

Services
**========**

host            name  proto
----            ----  -----
172.16.194.172  ftp   tcp
```



Ardından, `auxiliary/scanner/ftp/ftp_version` modülünü kullanalım.


```bash
msf > use auxiliary/scanner/ftp/ftp_version 

msf  auxiliary(ftp_version) > set RHOSTS 172.16.194.172
RHOSTS => 172.16.194.172

msf  auxiliary(anonymous) > show options
Module options (auxiliary/scanner/ftp/anonymous):

   Name     Current Setting      Required  Description
   ----     ---------------      --------  -----------
   FTPPASS  mozilla@example.com  no        The password for the specified username
   FTPUSER  anonymous            no        The username to authenticate as
   RHOSTS   172.16.194.172       yes       The target address range or CIDR identifier
   RPORT    21                   yes       The target port
   THREADS  1                    yes       The number of concurrent threads

msf  auxiliary(anonymous) > run

> 172.16.194.172:21 Anonymous READ (220 (vsFTPd 2.3.4**))**
> Scanned 1 of 1 hosts (100% complete)
> Auxiliary module execution completed
```



Görüldüğü gibi, çok kısa zamanda SSH ve FTP servisleri hakkında bilgiler topladık. Metasploit Framework içerisinde bunlara benzer oldukça fazla keşif modülü bulunmaktadır. Vakit ayırıp listeyi incelemenizde fayda var. Yaklaşık sayıyı aşağıdaki çıktıda görebilirsiniz.


```bash
msf > use auxiliary/scanner/
Display all 485 possibilities? (y or n)```
