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
date: "2017-06-05T13:35:00Z"
excerpt: Port Yönlendirme olarak kullanılan portfwd komutu, Meterpreter’in sağladığı
  imkanlardan bir tanesidir. Normalde ağda bulunan fakat doğrudan iletişim kurulamayan
  cihazlarla iletişim kurmaya yarar. Bunun gerçekleşebilmesi için öncelikle bir pivot bilgisayara
  ihtiyacımız bulunmaktadır.
guid: https://www.siberoloji.com/?p=1193
id: 1193
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Pivoting İçin Portfwd
url: /tr/msf-pivoting-icin-portfwd/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="portfwd">Portfwd 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Port Yönlendirme olarak kullanılan&nbsp;<code>portfwd</code>&nbsp;komutu, Meterpreter’in sağladığı imkanlardan bir tanesidir. Normalde ağda bulunan fakat doğrudan iletişim kurulamayan cihazlarla iletişim kurmaya yarar. Bunun gerçekleşebilmesi için öncelikle bir&nbsp;<strong>pivot</strong>&nbsp;bilgisayara ihtiyacımız bulunmaktadır.</p>
  

<!-- wp:paragraph -->
<p>Pivot olarak adlandırdığımız bilgisayarın bağlanabildiği bir ağ cihazına, port yönlendirme yaparak kendi yerel makinemizden bağlanmamızı sağlar. Bunun nasıl gerçekleştiğini bir örnekle açıklamaya çalışalım. Bu anlatımda 3 adet bilgisayar olduğunu baştan belirtmekte fayda var.</p>
  

<!-- wp:list {"ordered":true} -->
<ol><!-- wp:list-item -->
<li>Kendi bilgisayarımız: 192.168.1.162 veya 0.0.0.0</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Pivot bilgisayar : 172.16.194.144</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Hedef Bilgisayar : 172.16.194.191</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Bizim burada yapmaya çalıştığımız işlem, bir şekilde meterpreter oturum açtığımız&nbsp;<strong>pivot</strong>&nbsp;bilgisayar üzerinden Port Yönlendirme yaparak&nbsp;<strong>hedef</strong>&nbsp;bilgisayarla haberleşmeyi sağlamaktır.</p>
  

 
<h2 class="wp-block-heading" id="yardımı-görüntüleme">Yardımı Görüntüleme</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Pivot makinede meterpreter oturum açık durumdayken&nbsp;<code>portfwd –h</code>&nbsp;komutu ile&nbsp;<code>portfwd</code>&nbsp;ile ilgili yardımı görüntüleyebilirsiniz.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> portfwd -h
Usage: portfwd <strong>[</strong>-h<strong>]</strong> <strong>[</strong>add | delete | list | flush] <strong>[</strong>args]
OPTIONS:
     -L <strong>&gt;</strong>opt&gt;  The local host to listen on <strong>(</strong>optional<strong>)</strong>.
     -h        Help banner.
     -l <strong>&gt;</strong>opt&gt;  The local port to listen on.
     -p <strong>&gt;</strong>opt&gt;  The remote port to connect on.
     -r <strong>&gt;</strong>opt&gt;  The remote host to connect on.
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="seçenekler">Seçenekler</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>-L: Dinleme yapacağımız kendi bilgisayarımızın IP adresini ifade eder. Bilgisayarınızda birden fazla ağ kartı yoksa bu seçeneği girmeyebilirsiniz. Varsayılan olarak&nbsp;<code>localhost</code>&nbsp;anlamında&nbsp;<code>0.0.0.0</code>&nbsp;kullanılacaktır.</p>
  

<!-- wp:paragraph -->
<p>-h: Yardım bilgisini görüntüler.</p>
  

<!-- wp:paragraph -->
<p>-l: Yerel kendi bilgisayarımızda dinleme yapacağımız Port numarasını ifade eder.</p>
  

<!-- wp:paragraph -->
<p>-p: Hedef bilgisayarın Port numarasını ifade eder.</p>
  

<!-- wp:paragraph -->
<p>-r: Hedef bilgisayarın IP adresini ifade eder.</p>
  

 
<h2 class="wp-block-heading" id="argümanlar">Argümanlar</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Add: Yeni bir yönlendirme eklemeye yarar.</p>
  

<!-- wp:paragraph -->
<p>Delete: Mevcut bir yönlendirmeyi silmeye yarar.</p>
  

<!-- wp:paragraph -->
<p>List: Mevcut durumda tüm yönlendirmelerin listesini görüntülemeye yarar.</p>
  

<!-- wp:paragraph -->
<p>Flush: Tüm aktif yönlendirmeleri iptal etmeye yarar.</p>
  

 
<h2 class="wp-block-heading" id="yönlendirme-ekleme">Yönlendirme Ekleme</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Meterpreter shell oturumunu açtığımız&nbsp;<strong>pivot</strong>&nbsp;bilgisayarda iken vereceğimiz komut aşağıdaki formattadır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> portfwd add –l 3389 –p 3389 –r  <strong>[</strong>target host]
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>-l 3389</code>&nbsp;Yerel bilgisayarımızda dinleme yapacağımız Port numarası</p>
  

<!-- wp:paragraph -->
<p><code>-p 3389</code>&nbsp;Hedef bilgisayar Port numarasıdır.</p>
  

<!-- wp:paragraph -->
<p><code>-r [target host]</code>&nbsp;hedef bilgisayar IP adresidir.</p>
  

<!-- wp:paragraph -->
<p>Şimdi port yönlendirmeyi yapalım.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> portfwd add –l 3389 –p 3389 –r 172.16.194.191
<strong>[</strong><strong>*</strong><strong>]</strong> Local TCP relay created: 0.0.0.0:3389 <strong>&gt;</strong>-&gt; 172.16.194.191:3389
meterpreter <strong>&gt;</strong> 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="yönlendirme-silme">Yönlendirme Silme</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Silme işlemini de&nbsp;<strong>pivot</strong>&nbsp;bilgisayar oturumunda iken aşağıdaki örnekte olduğu gibi yapabiliriz.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> portfwd delete –l 3389 –p 3389 –r 172.16.194.191
<strong>[</strong><strong>*</strong><strong>]</strong> Successfully stopped TCP relay on 0.0.0.0:3389
meterpreter <strong>&gt;</strong> 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="yönlendirmeleri-listeleme">Yönlendirmeleri Listeleme</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Aktif olan yönlendirmeleri&nbsp;<code>portfwd list</code>&nbsp;komutuyla yapabiliriz.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> portfwd list
0: 0.0.0.0:3389 -&gt; 172.16.194.191:3389
1: 0.0.0.0:1337 -&gt; 172.16.194.191:1337
2: 0.0.0.0:2222 -&gt; 172.16.194.191:2222

3 total local port forwards.
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="tüm-yönlendirmeleri-temizleme">Tüm Yönlendirmeleri Temizleme</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sistemde aktif olan tüm yönlendirmeleri&nbsp;<code>portfwd flush</code>&nbsp;komutuyla iptal edebiliriz.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> portfwd flush
<strong>[</strong><strong>*</strong><strong>]</strong> Successfully stopped TCP relay on 0.0.0.0:3389
<strong>[</strong><strong>*</strong><strong>]</strong> Successfully stopped TCP relay on 0.0.0.0:1337
<strong>[</strong><strong>*</strong><strong>]</strong> Successfully stopped TCP relay on 0.0.0.0:2222
<strong>[</strong><strong>*</strong><strong>]</strong> Successfully flushed 3 rules
meterpreter <strong>&gt;</strong> portfwd list

0 total local port forwards
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="örnek">Örnek 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Aşağıda örnek olarak bir senaryoyu bulabilirsiniz.</p>
  

 
<h2 class="wp-block-heading" id="hedef-bilgisayar">Hedef Bilgisayar</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Aşağıdaki komut çıktısında görüldüğü gibi, hedef bilgisayar&nbsp;<code>172.16.194.141</code>&nbsp;IP adresine sahiptir.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">C:\&gt; ipconfig

Windows IP Configuration

Ethernet adapter Local Area Connection 3:

   Connection-specific DNS Suffix . : localdomain
   IP Address.  .  .  .  .  .  .  .  . 172.16.194.141
   Subnet Mask.  .  . .  .  .  .  .  . 255.255.255.0
   Default Gateway. . .  .  .  .  .  . 172.16.194.2

C:\&gt;
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="pivot-bilgisayar">Pivot Bilgisayar</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Pivot</strong>&nbsp;bilgisayar aşağıdaki çıktıda görüldüğü gibi, hem&nbsp;<code>172.16.194.0/24</code>&nbsp;ağına hem de&nbsp;<code>192.168.1.0/24</code>&nbsp;ağına bağlanabilmektedir. Bizim yerel bilgisayarımızda bu&nbsp;<code>192.168.1.0/24</code>&nbsp;ağında bulunuyor.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> ipconfig

MS TCP Loopback interface
Hardware MAC: 00:00:00:00:00:00
IP Address  : 127.0.0.1
Netmask     : 255.0.0.0

VMware Accelerated AMD PCNet Adapter - Packet Scheduler Miniport
Hardware MAC: 00:aa:00:aa:00:aa
IP Address  : 172.16.194.144
Netmask     : 255.0.0.0

AMD PCNET Family PCI Ethernet Adapter - Packet Scheduler Miniport
Hardware MAC: 00:bb:00:bb:00:bb
IP Address  : 192.168.1.191
Netmask     : 255.0.0.0
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="yerel-bilgisayar">Yerel Bilgisayar</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Birazdan aşağıda göreceğiniz yönlendirme sonucunda yerel bilgisayarımızın (192.168.1.162 IP numaralı),&nbsp;<strong>pivot</strong>&nbsp;makine üzerinden&nbsp;<code>172.16.194.141</code>&nbsp;IP adresine&nbsp;<code>ping</code>&nbsp;sinyali gönderebildiğini görebiliyoruz.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# ifconfig eth1
eth1     Link encap:Ethernet  HWaddr 0a:0b:0c:0d:0e:0f  
         inet addr:192.168.1.162  Bcast:192.168.1.255  Mask:255.255.255.0
         inet6 addr: fe80::20c:29ff:fed6:ab38/64 Scope:Link
         UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
         RX packets:1357685 errors:0 dropped:0 overruns:0 frame:0
         TX packets:823428 errors:0 dropped:0 overruns:0 carrier:0
         collisions:0 txqueuelen:1000 
         RX bytes:318385612 <strong>(</strong>303.6 MiB<strong>)</strong>  TX bytes:133752114 <strong>(</strong>127.5 MiB<strong>)</strong>
         Interrupt:19 Base address:0x2000


root@kali:~# ping 172.16.194.141
PING 172.16.194.141 <strong>(</strong>172.16.194.141<strong>)</strong> 56<strong>(</strong>84<strong>)</strong> bytes of data.
64 bytes from 172.16.194.141: icmp_req<strong>=</strong>1 ttl<strong>=</strong>128 time<strong>=</strong>240 ms
64 bytes from 172.16.194.141: icmp_req<strong>=</strong>2 ttl<strong>=</strong>128 time<strong>=</strong>117 ms
64 bytes from 172.16.194.141: icmp_req<strong>=</strong>3 ttl<strong>=</strong>128 time<strong>=</strong>119 ms
^C
--- 172.16.194.141 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev <strong>=</strong> 117.759/159.378/240.587/57.430 ms

root@kali:~#
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Peki bu haberleşmeyi nasıl başardık?</p>
  

 
<h2 class="wp-block-heading" id="yönlendirme-yapalım">Yönlendirme Yapalım</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>pivot</strong>&nbsp;bilgisayarda açtığımız meterpreter shell içerisinde iken aşağıdaki yönlendirme işlemini gerçekleştirdik.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> portfwd add –l 3389 –p 3389 –r 172.16.194.141
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Yönlendirme komutunu&nbsp;<strong>pivot</strong>&nbsp;bilgisayarda verdikten sonra yerel bilgisayarımızda&nbsp;<code>netstat -antp</code>&nbsp;komutuyla bizim de dinlemeyi&nbsp;<code>3389</code>&nbsp;numaralı port üzerinden yaptığımızı kontrol edebilirsiniz.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# netstat -antp
Active Internet connections <strong>(</strong>servers and established<strong>)</strong>
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:22              0.0.0.0:<strong>*</strong>               LISTEN      8397/sshd  
.....
tcp        0      0 0.0.0.0:3389            0.0.0.0:<strong>*</strong>               LISTEN      2045/.ruby.bin      
.....
tcp6       0      0 :::22                   :::<strong>*</strong>                    LISTEN      8397/sshd
root@kali:~#
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Bu durumda yerel bilgisayarımızdan hedef bilgisayara&nbsp;<code>rdesktop</code>&nbsp;uzak masaüstü bağlantısı açabilir veya diğer işlemleri yapabiliriz.</p>
  

<!-- wp:paragraph -->
<p>Örneğin&nbsp;<code>exploit/windows/smb/ms08_067_netapi</code>&nbsp;modülünü kullanabiliriz. Bu modüldeki değişkenleri, yönlendirme sonucu ulaştığımız hedef bilgisayarın IP adresi ve Port numarasını girerek kullanabiliriz.</p>
  

<!-- wp:paragraph -->
<p>Konunun biraz kafa karıştırıcı olduğunu düşünebilirsiniz. Bir miktar deneme ve antrenman yapmanızı tavsiye ediyorum.</p>
  

<!-- wp:paragraph -->
<p>Şöyle düşünün, hedef bilgisayara ulaşmak için&nbsp;<strong>pivot</strong>&nbsp;makineye meterpreter shell açıyoruz.&nbsp;<strong>pivot</strong>&nbsp;bilgisayarın haberleşebildiği diğer IP adresinde aktif bulunan (örneğin SAMBA, 445 portu) servise önce yönlendirme yapıyoruz. Ardından yerel bilgisayarımızdan hedef bilgisayara bağlanabiliyoruz.</p>
  

<!-- wp:paragraph -->
<p>Doğru IP ve Port numaralarını yönlendirme yaptığınıza dikkat etmelisiniz.</p>
  