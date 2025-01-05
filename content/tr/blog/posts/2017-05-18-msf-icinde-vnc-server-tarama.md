---
draft: false

title:  'MSF İçinde VNC Server Tarama'
date: '2017-05-18T13:04:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Bazen sistem yöneticileri, kurdukları servislerin güvenlik ayarlarını yapmayı eksik bırakırlar. Klasik yapılan hatalardan bir tanesi de ağda çalışan servislerin\_guest\_olarak tabir edilen kullanıcılara kapatılmamasıdır. VNC Server, bir bilgisayara uzaktan bağlanılmasını sağlayan servistir." 
 
url:  /tr/msf-icinde-vnc-server-tarama/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


Bazen sistem yöneticileri, kurdukları servislerin güvenlik ayarlarını yapmayı eksik bırakırlar. Klasik yapılan hatalardan bir tanesi de ağda çalışan servislerin `guest` olarak tabir edilen kullanıcılara kapatılmamasıdır. VNC Server, bir bilgisayara uzaktan bağlanılmasını sağlayan servistir.



Aşağıdaki örnekte, belli bir IP aralığında çalışan ve parolasız erişime izin verilen VNC Server olup olmadığını arayan modül kullanılmıştır. Bu modüle Metasploit Framework içinde **VNC Authentication None Scanner** adı verilmektedir.



Sistem yöneticisi iseniz, servislerinizi yapılandırırken, bu tür açıkları sürekli arayan birileri olduğunu aklınızdan çıkartmamalısınız.


```bash
msf auxiliary**(**vnc_none_auth**)** **&gt;** use auxiliary/scanner/vnc/vnc_none_auth
msf auxiliary**(**vnc_none_auth**)** **&gt;** show options

Module options:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOSTS                    yes       The target address range or CIDR identifier
   RPORT    5900             yes       The target port
   THREADS  1                yes       The number of concurrent threads

msf auxiliary**(**vnc_none_auth**)** **&gt;** set RHOSTS 192.168.1.0/24
RHOSTS **=&gt;** 192.168.1.0/24
msf auxiliary**(**vnc_none_auth**)** **&gt;** set THREADS 50
THREADS **=&gt;** 50
msf auxiliary**(**vnc_none_auth**)** **&gt;** run

**[*********]** 192.168.1.121:5900, VNC server protocol version : RFB 003.008
**[*********]** 192.168.1.121:5900, VNC server security types supported : None, free access!
**[*********]** Auxiliary module execution completed
```



Çıktıda görüldüğü gibi, `192.168.1.121:5900` adresinde VNC Server, parolasız olarak bağlanmaya izin vermektedir.
