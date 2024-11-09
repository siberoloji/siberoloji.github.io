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
<p>Port Yönlendirme olarak kullanılan&nbsp;<code>portfwd</code>&nbsp;komutu, Meterpreter’in sağladığı imkanlardan bir tanesidir. Normalde ağda bulunan fakat doğrudan iletişim kurulamayan cihazlarla iletişim kurmaya yarar. Bunun gerçekleşebilmesi için öncelikle bir&nbsp;***pivot*** &nbsp;bilgisayara ihtiyacımız bulunmaktadır.
  

<!-- wp:paragraph -->
<p>Pivot olarak adlandırdığımız bilgisayarın bağlanabildiği bir ağ cihazına, port yönlendirme yaparak kendi yerel makinemizden bağlanmamızı sağlar. Bunun nasıl gerçekleştiğini bir örnekle açıklamaya çalışalım. Bu anlatımda 3 adet bilgisayar olduğunu baştan belirtmekte fayda var.
  

<!-- wp:list {"ordered":true} -->
 <!-- wp:list-item -->
- Kendi bilgisayarımız: 192.168.1.162 veya 0.0.0.0 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Pivot bilgisayar : 172.16.194.144 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Hedef Bilgisayar : 172.16.194.191 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Bizim burada yapmaya çalıştığımız işlem, bir şekilde meterpreter oturum açtığımız&nbsp;***pivot*** &nbsp;bilgisayar üzerinden Port Yönlendirme yaparak&nbsp;***hedef*** &nbsp;bilgisayarla haberleşmeyi sağlamaktır.
  

 
<h2 class="wp-block-heading" id="yardımı-görüntüleme">Yardımı Görüntüleme
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Pivot makinede meterpreter oturum açık durumdayken&nbsp;<code>portfwd –h</code>&nbsp;komutu ile&nbsp;<code>portfwd</code>&nbsp;ile ilgili yardımı görüntüleyebilirsiniz.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  portfwd -h
Usage: portfwd ***[*** -h***]***  ***[*** add | delete | list | flush] ***[*** args]
OPTIONS:
     -L ***&gt;*** opt&gt;  The local host to listen on ***(*** optional***)*** .
     -h        Help banner.
     -l ***&gt;*** opt&gt;  The local port to listen on.
     -p ***&gt;*** opt&gt;  The remote port to connect on.
     -r ***&gt;*** opt&gt;  The remote host to connect on.
meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="seçenekler">Seçenekler
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>-L: Dinleme yapacağımız kendi bilgisayarımızın IP adresini ifade eder. Bilgisayarınızda birden fazla ağ kartı yoksa bu seçeneği girmeyebilirsiniz. Varsayılan olarak&nbsp;<code>localhost</code>&nbsp;anlamında&nbsp;<code>0.0.0.0</code>&nbsp;kullanılacaktır.
  

<!-- wp:paragraph -->
<p>-h: Yardım bilgisini görüntüler.
  

<!-- wp:paragraph -->
<p>-l: Yerel kendi bilgisayarımızda dinleme yapacağımız Port numarasını ifade eder.
  

<!-- wp:paragraph -->
<p>-p: Hedef bilgisayarın Port numarasını ifade eder.
  

<!-- wp:paragraph -->
<p>-r: Hedef bilgisayarın IP adresini ifade eder.
  

 
<h2 class="wp-block-heading" id="argümanlar">Argümanlar
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Add: Yeni bir yönlendirme eklemeye yarar.
  

<!-- wp:paragraph -->
<p>Delete: Mevcut bir yönlendirmeyi silmeye yarar.
  

<!-- wp:paragraph -->
<p>List: Mevcut durumda tüm yönlendirmelerin listesini görüntülemeye yarar.
  

<!-- wp:paragraph -->
<p>Flush: Tüm aktif yönlendirmeleri iptal etmeye yarar.
  

 
<h2 class="wp-block-heading" id="yönlendirme-ekleme">Yönlendirme Ekleme
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Meterpreter shell oturumunu açtığımız&nbsp;***pivot*** &nbsp;bilgisayarda iken vereceğimiz komut aşağıdaki formattadır.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  portfwd add –l 3389 –p 3389 –r  ***[*** target host]
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>-l 3389</code>&nbsp;Yerel bilgisayarımızda dinleme yapacağımız Port numarası
  

<!-- wp:paragraph -->
<p><code>-p 3389</code>&nbsp;Hedef bilgisayar Port numarasıdır.
  

<!-- wp:paragraph -->
<p><code>-r [target host]</code>&nbsp;hedef bilgisayar IP adresidir.
  

<!-- wp:paragraph -->
<p>Şimdi port yönlendirmeyi yapalım.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  portfwd add –l 3389 –p 3389 –r 172.16.194.191
***[*** ******* ***]***  Local TCP relay created: 0.0.0.0:3389 ***&gt;*** -&gt; 172.16.194.191:3389
meterpreter ***&gt;***  
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="yönlendirme-silme">Yönlendirme Silme
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Silme işlemini de&nbsp;***pivot*** &nbsp;bilgisayar oturumunda iken aşağıdaki örnekte olduğu gibi yapabiliriz.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  portfwd delete –l 3389 –p 3389 –r 172.16.194.191
***[*** ******* ***]***  Successfully stopped TCP relay on 0.0.0.0:3389
meterpreter ***&gt;***  
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="yönlendirmeleri-listeleme">Yönlendirmeleri Listeleme
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Aktif olan yönlendirmeleri&nbsp;<code>portfwd list</code>&nbsp;komutuyla yapabiliriz.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  portfwd list
0: 0.0.0.0:3389 -&gt; 172.16.194.191:3389
1: 0.0.0.0:1337 -&gt; 172.16.194.191:1337
2: 0.0.0.0:2222 -&gt; 172.16.194.191:2222

3 total local port forwards.
meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="tüm-yönlendirmeleri-temizleme">Tüm Yönlendirmeleri Temizleme
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sistemde aktif olan tüm yönlendirmeleri&nbsp;<code>portfwd flush</code>&nbsp;komutuyla iptal edebiliriz.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  portfwd flush
***[*** ******* ***]***  Successfully stopped TCP relay on 0.0.0.0:3389
***[*** ******* ***]***  Successfully stopped TCP relay on 0.0.0.0:1337
***[*** ******* ***]***  Successfully stopped TCP relay on 0.0.0.0:2222
***[*** ******* ***]***  Successfully flushed 3 rules
meterpreter ***&gt;***  portfwd list

0 total local port forwards
meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="örnek">Örnek 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Aşağıda örnek olarak bir senaryoyu bulabilirsiniz.
  

 
<h2 class="wp-block-heading" id="hedef-bilgisayar">Hedef Bilgisayar
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Aşağıdaki komut çıktısında görüldüğü gibi, hedef bilgisayar&nbsp;<code>172.16.194.141</code>&nbsp;IP adresine sahiptir.
  

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

 
<h2 class="wp-block-heading" id="pivot-bilgisayar">Pivot Bilgisayar
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>***Pivot*** &nbsp;bilgisayar aşağıdaki çıktıda görüldüğü gibi, hem&nbsp;<code>172.16.194.0/24</code>&nbsp;ağına hem de&nbsp;<code>192.168.1.0/24</code>&nbsp;ağına bağlanabilmektedir. Bizim yerel bilgisayarımızda bu&nbsp;<code>192.168.1.0/24</code>&nbsp;ağında bulunuyor.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  ipconfig

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

 
<h2 class="wp-block-heading" id="yerel-bilgisayar">Yerel Bilgisayar
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Birazdan aşağıda göreceğiniz yönlendirme sonucunda yerel bilgisayarımızın (192.168.1.162 IP numaralı),&nbsp;***pivot*** &nbsp;makine üzerinden&nbsp;<code>172.16.194.141</code>&nbsp;IP adresine&nbsp;<code>ping</code>&nbsp;sinyali gönderebildiğini görebiliyoruz.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# ifconfig eth1
eth1     Link encap:Ethernet  HWaddr 0a:0b:0c:0d:0e:0f  
         inet addr:192.168.1.162  Bcast:192.168.1.255  Mask:255.255.255.0
         inet6 addr: fe80::20c:29ff:fed6:ab38/64 Scope:Link
         UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
         RX packets:1357685 errors:0 dropped:0 overruns:0 frame:0
         TX packets:823428 errors:0 dropped:0 overruns:0 carrier:0
         collisions:0 txqueuelen:1000 
         RX bytes:318385612 ***(*** 303.6 MiB***)***   TX bytes:133752114 ***(*** 127.5 MiB***)*** 
         Interrupt:19 Base address:0x2000


root@kali:~# ping 172.16.194.141
PING 172.16.194.141 ***(*** 172.16.194.141***)***  56***(*** 84***)***  bytes of data.
64 bytes from 172.16.194.141: icmp_req***=*** 1 ttl***=*** 128 time***=*** 240 ms
64 bytes from 172.16.194.141: icmp_req***=*** 2 ttl***=*** 128 time***=*** 117 ms
64 bytes from 172.16.194.141: icmp_req***=*** 3 ttl***=*** 128 time***=*** 119 ms
^C
--- 172.16.194.141 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev ***=***  117.759/159.378/240.587/57.430 ms

root@kali:~#
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Peki bu haberleşmeyi nasıl başardık?
  

 
<h2 class="wp-block-heading" id="yönlendirme-yapalım">Yönlendirme Yapalım
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>***pivot*** &nbsp;bilgisayarda açtığımız meterpreter shell içerisinde iken aşağıdaki yönlendirme işlemini gerçekleştirdik.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  portfwd add –l 3389 –p 3389 –r 172.16.194.141
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Yönlendirme komutunu&nbsp;***pivot*** &nbsp;bilgisayarda verdikten sonra yerel bilgisayarımızda&nbsp;<code>netstat -antp</code>&nbsp;komutuyla bizim de dinlemeyi&nbsp;<code>3389</code>&nbsp;numaralı port üzerinden yaptığımızı kontrol edebilirsiniz.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# netstat -antp
Active Internet connections ***(*** servers and established***)*** 
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:22              0.0.0.0:*******                LISTEN      8397/sshd  
.....
tcp        0      0 0.0.0.0:3389            0.0.0.0:*******                LISTEN      2045/.ruby.bin      
.....
tcp6       0      0 :::22                   :::*******                     LISTEN      8397/sshd
root@kali:~#
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Bu durumda yerel bilgisayarımızdan hedef bilgisayara&nbsp;<code>rdesktop</code>&nbsp;uzak masaüstü bağlantısı açabilir veya diğer işlemleri yapabiliriz.
  

<!-- wp:paragraph -->
<p>Örneğin&nbsp;<code>exploit/windows/smb/ms08_067_netapi</code>&nbsp;modülünü kullanabiliriz. Bu modüldeki değişkenleri, yönlendirme sonucu ulaştığımız hedef bilgisayarın IP adresi ve Port numarasını girerek kullanabiliriz.
  

<!-- wp:paragraph -->
<p>Konunun biraz kafa karıştırıcı olduğunu düşünebilirsiniz. Bir miktar deneme ve antrenman yapmanızı tavsiye ediyorum.
  

<!-- wp:paragraph -->
<p>Şöyle düşünün, hedef bilgisayara ulaşmak için&nbsp;***pivot*** &nbsp;makineye meterpreter shell açıyoruz.&nbsp;***pivot*** &nbsp;bilgisayarın haberleşebildiği diğer IP adresinde aktif bulunan (örneğin SAMBA, 445 portu) servise önce yönlendirme yapıyoruz. Ardından yerel bilgisayarımızdan hedef bilgisayara bağlanabiliyoruz.
  

<!-- wp:paragraph -->
<p>Doğru IP ve Port numaralarını yönlendirme yaptığınıza dikkat etmelisiniz.
  