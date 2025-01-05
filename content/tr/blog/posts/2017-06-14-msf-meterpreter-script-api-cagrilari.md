---
draft: false

title:  'MSF Meterpreter Script API Çağrıları'
date: '2017-06-14T13:50:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Önceki script düzenleme yazımızda, meterpreter oturumunda kullanılan script dosyasının genel mimari yapısını açıklamaya çalışmıştık. Bu yazımızda, sürekli kullanılan ve işimize yarayacak API çağrı kodlarını tek tek görelim ve ne işe yaradığını açıklayalım.' 
 
url:  /tr/msf-meterpreter-script-api-cagrilari/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


## Kullanışlı API Çağrıları



Önceki script düzenleme yazımızda, meterpreter oturumunda kullanılan script dosyasının genel mimari yapısını açıklamaya çalışmıştık. Bu yazımızda, sürekli kullanılan ve işimize yarayacak API çağrı kodlarını tek tek görelim ve ne işe yaradığını açıklayalım.



Bu çağrıları kendi dosyanızı oluşturarak deneyebileceğiniz gibi Meterpreter oturumu içerisinden `irb` komutuyla Ruby girişimcisini kullanarak direk hedef sistemde de çalıştırabilirsiniz. `irb` girişimcisini, meterpreter oturumu açık durumdayken, aşağıdaki örnekte olduğu gibi başlatabilirsiniz.


```bash
meterpreter **&gt;** irb
**[*********]** Starting IRB shell
**[*********]** The 'client' variable holds the meterpreter client

**&gt;&gt;**
```



## client.sys.config.sysinfo



Bu komut, sistem hakkında bir takım bilgileri öğrenmemizi sağlar. Aşağıda, `client.sys.config.sysinfo` API çağrısının bir kaç örneğini görebilirsiniz.


```bash
**&gt;&gt;** client.sys.config.sysinfo
**=&gt;** **{**"OS"**=&gt;**"Windows XP (Build 2600, Service Pack 3).", "Computer"**=&gt;**"WINXPVM01"**}**
**&gt;&gt;**
```



Komut çıktısında görüldüğü gibi, ekrana getirilen bilginin aslında farklı alt sınıfları bulunmaktadır. Örneğin, “OS” ve “Computer” bu çağrının alt sınıfıdır. İstersek, sadece bu sınıf bilgilerini de öğrenebiliriz. Bunun için çağrı komutu aşağıdaki gibi kullanılabilir.


```bash
**&gt;&gt;** client.sys.config.sysinfo.class
**=&gt;** Hash
**&gt;&gt;**
```


```bash
**&gt;&gt;** client.sys.config.sysinfo['OS'**]**
**=&gt;** "Windows XP (Build 2600, Service Pack 3)."
**&gt;&gt;**
```



## client.sys.config.getuid



Bu çağrı kullanıcı bilgilerini elde etmek için kullanılır.


```bash
**&gt;&gt;** client.sys.config.getuid
**=&gt;** "WINXPVM01\labuser"
**&gt;&gt;**
```



## client.sys.process.getpid



Bu çağrı sayesinde, Meterpreter oturumunun hangi program içine gömülü olarak çalıştığını öğrenebiliriz.


```bash
**&gt;&gt;** client.sys.process.getpid
**=&gt;** 684

## client.net.config.interfaces

Bu çağrı ile hedef sistemin ağ kartları ve arayüzleri hakkında bilgi elde edebilirsiniz.

```sh
**&gt;&gt;** client.net.config.interfaces
**=&gt;** **[**#, #]
**&gt;&gt;** client.net.config.interfaces.class
**=&gt;** Array
```



Gördüğünüz gibi, API çağrısı array tipi bir değişken kullanmaktadır. Bu değişken tipini aşağıdaki gibi döngüde kullanarak sonuçları görebiliriz.


```bash
 **&gt;&gt;** interfaces **=** client.net.config.interfaces
 **=&gt;** **[**#, #]
 **&gt;&gt;** interfaces.each **do** |i|
 ?&gt; puts i.pretty
 **&gt;&gt;** end
 MS TCP Loopback interface
 Hardware MAC: 00:00:00:00:00:00
 IP Address  : 127.0.0.1
 Netmask     : 255.0.0.0 AMD PCNET Family PCI Ethernet Adapter - Packet Scheduler Miniport
 Hardware MAC: 00:0c:29:dc:aa:e4
 IP Address  : 192.168.1.104
 Netmask     : 255.255.255.0```
