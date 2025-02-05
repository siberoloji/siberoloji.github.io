---
draft: false
title: MSF İçinde VNC Server Tarama
weight: 180
linkTitle: MSF İçinde VNC Server Tarama
tranlsationKey: vnc-server-scanning-in-msf
date: 2017-05-18T13:04:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Bu yazıda, VNC Authentication None Scanner modülü kullanılarak VNC Server tarama işlemi anlatılmıştır.
url: /tr/msf-icinde-vnc-server-tarama/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
---
Bazen sistem yöneticileri, kurdukları servislerin güvenlik ayarlarını yapmayı eksik bırakırlar. Klasik yapılan hatalardan bir tanesi de ağda çalışan servislerin `guest` olarak tabir edilen kullanıcılara kapatılmamasıdır. VNC Server, bir bilgisayara uzaktan bağlanılmasını sağlayan servistir.

Aşağıdaki örnekte, belli bir IP aralığında çalışan ve parolasız erişime izin verilen VNC Server olup olmadığını arayan modül kullanılmıştır. Bu modüle Metasploit Framework içinde **VNC Authentication None Scanner** adı verilmektedir.

Sistem yöneticisi iseniz, servislerinizi yapılandırırken, bu tür açıkları sürekli arayan birileri olduğunu aklınızdan çıkartmamalısınız.

```bash
msf auxiliary(vnc_none_auth) > use auxiliary/scanner/vnc/vnc_none_auth
msf auxiliary(vnc_none_auth) > show options

Module options:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOSTS                    yes       The target address range or CIDR identifier
   RPORT    5900             yes       The target port
   THREADS  1                yes       The number of concurrent threads

msf auxiliary(vnc_none_auth) > set RHOSTS 192.168.1.0/24
RHOSTS => 192.168.1.0/24
msf auxiliary(vnc_none_auth) > set THREADS 50
THREADS => 50
msf auxiliary(vnc_none_auth) > run

> 192.168.1.121:5900, VNC server protocol version : RFB 003.008
> 192.168.1.121:5900, VNC server security types supported : None, free access!
> Auxiliary module execution completed
```

Çıktıda görüldüğü gibi, `192.168.1.121:5900` adresinde VNC Server, parolasız olarak bağlanmaya izin vermektedir.
