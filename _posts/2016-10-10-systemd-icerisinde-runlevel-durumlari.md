---
layout: post
title: Systemd İçerisinde Runlevel Durumları
date: 2016-10-10 22:02:47.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
- Nasıl
tags:
- systemd
- systemd target
- systemd target vs runlevel
author: siberoloji
---
<p>Linux işletim sistemlerinin bir çoğu systemd kullanımına başladılar. Systemd kullanımına başlanmasıyla birlikte, internette yapacağınız aramalarda bulacağınız "Nasıl yapılır?" dokümanlarının bir kısmı da doğal olarak güncelliği kaybetti. Bulacağınız çözümlerin bir kısmı doğru çalışabilir. Fakat diğer kısmında da hatalar almanız ve istediğiniz sonuca ulaşamama ihtimaliniz bulunuyor. Bu konuda yabancı dillerde çözümler üretiliyor. Biz de portlinux.com olarak Türkçe kaynak oluşturmak adına bir takım dokümanlar hazırlamak istedik.</p>
<p>Bu yazımızda, önceden sysV init olarak bilinen yapıda bulunan çalışma seviyelerinin systemd ile birlikte nasıl değiştiğini açıklayacağız. Aşağıdaki tabloda, çalışma seviyelerinin init ve systemd içerisinde nasıl isimlendirildiğini görebilirsiniz.</p>
<p>[table]</p>
<table>
<thead>
<tr>
<th>Runlevel</th>
<th>Target</th>
</tr>
</thead>
<tbody>
<tr>
<td>0</td>
<td>poweroff.target</td>
</tr>
<tr>
<td>1</td>
<td>rescue.target</td>
</tr>
<tr>
<td>2,3,4</td>
<td>multi-user.target</td>
</tr>
<tr>
<td>5</td>
<td>graphical.target</td>
</tr>
<tr>
<td>6</td>
<td>reboot.target</td>
</tr>
</tbody>
</table>
<p>[/table]</p>
<p>Tablodan da göreceğiniz gibi, init içerisinde çalışma seviyesi (runlevel) olarak adlandırılan kademeler systemd ile birlikte hedef (target) olarak ifade edilmeye başlamıştır. Komutlarda İngilizce yazımı kullanmanız gereken hedefleri şimdi tek tek açıklayalım.</p>
<p><strong>poweroff.target</strong>: Sistemi, tüm servisleri durdurarak kapanma durumuna getirir.</p>
<p><strong>rescue.target</strong>: Sistemi, yönetimsel işlemler için tek kullanıcı moduna getirir. Dosya ve disklere erişim ile bazı temel servisler çalışmaya devam eder.</p>
<p><strong>multi-user.target</strong>: Text modunu ifade eder. Grafik arayüz olmadan çok kullanıcının oturum açabileceği durumdur.</p>
<p><strong>graphical.target</strong>: Sistemi, görüntü yöneticisinin de çalıştığı konuma getirmeyi ifade eder.</p>
<p><strong>reboot.target</strong>: Sistemi, tüm servisleri durdurarak kapatmayı ve tekrar başlatmayı ifade eder.</p>
<p>Yukarıda bahsedilen çalışma seviyeleri için ortak bir kriter bulunmaktadır. “Sistem aynı anda sadece bir durumda bulunabilir.” Sisteminiz multiuser.target durumunda iken aynı anda graphical.target durumunda bulunamaz.</p>
<p>Sisteminizde şu an aktif olan .<strong>target</strong> durumlarını aşağıdaki komut ile listelediğinizde <strong>active</strong> durumunda olan .target uzantılı üniteleri görebilirsiniz.</p>
<pre class="lang:sh decode:true ">systemctl list-units --type target

UNIT                   LOAD   ACTIVE SUB    DESCRIPTION
basic.target           loaded active active Basic System
cryptsetup.target      loaded active active Encrypted Volumes
getty.target           loaded active active Login Prompts
graphical.target       loaded active active Graphical Interface
local-fs-pre.target    loaded active active Local File Systems (Pre)
local-fs.target        loaded active active Local File Systems
multi-user.target      loaded active active Multi-User System
network-online.target  loaded active active Network is Online
network.target         loaded active active Network
nss-user-lookup.target loaded active active User and Group Name Lookups
paths.target           loaded active active Paths
remote-fs-pre.target   loaded active active Remote File Systems (Pre)
remote-fs.target       loaded active active Remote File Systems
slices.target          loaded active active Slices
sockets.target         loaded active active Sockets
sound.target           loaded active active Sound Card
swap.target            loaded active active Swap
sysinit.target         loaded active active System Initialization
time-sync.target       loaded active active System Time Synchronized
timers.target          loaded active active Timers
</pre>
<p>7.sırada görülebileceği gibi <strong>graphical.target</strong> durumu aktif ve çalışıyor.</p>
<p>Şimdi birlikte sistemi <span class="lang:sh highlight:0 decode:true crayon-inline ">isolate</span>  fonksiyonunu kullanarak multiuser.target durumuna geçirelim. Bu durumda, tüm grafik uygulamalar kapanacak ve ekranınız komut satırına dönüşecek (Alt+Ctrl+F1,F2,....F6 kullanın). Oturum açma ekranı text modunda karşınıza gelecek. Kayıt etmediğiniz çalışmalarınızı kaydetmenizi öneriyoruz çünkü hepsi kapanacak. Ayrıca tekrar grafik arayüzüne geri dönmek için gerekli komutu da bir yere not etmek isteyebilirsiniz.</p>
<pre class="lang:sh decode:true" title="Multiuser.target durumuna geçmek için">sudo systemctl isolate multi-user.target</pre>
<p>Multiuser durumuna geçince, Alt+Ctrl+F1 ile komut satırına girebilirsiniz. Text modunda oturum açarak ulaşacağınız komut satırında, aşağıdaki komutu yazarak tekrar grafik arayüzüne dönebilirsiniz.</p>
<pre class="lang:sh decode:true" title="Multiuser.target durumundan graphical.target durumuna geçmek için">sudo systemctl isolate graphical.target</pre>
<p>Geçmişe dönük olarak işlerliği sürdürmek açısından systemd .<strong>target</strong> durumlarına runlevel1,2,3 vb. şekilde isimlendirme de yapılmıştır. Aşağıdaki iki örnek örnek komut aslında aynı işlem yapılmaktadır.</p>
<pre class="lang:sh decode:true">sudo systemctl isolate graphical.target
sudo systemctl isolate runlevel5.target</pre>
<p>Bir sonraki yazımızda sistemi varsayılan olarak grafik arayüzde (graphical.target) değil de doğrudan text modunda (multi-user.target) açmayı açıklayacağız.</p>
