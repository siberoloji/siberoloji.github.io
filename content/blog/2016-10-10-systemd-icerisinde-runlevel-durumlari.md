---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Temel Linux
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-10-10T01:45:00Z"
excerpt: Linux işletim sistemlerinin bir çoğu systemd kullanımına başladılar. Systemd
  kullanımına başlanmasıyla birlikte, internette yapacağınız aramalarda bulacağınız
  "Nasıl yapılır?" dokümanlarının bir kısmı da doğal olarak güncelliği kaybetti. Bulacağınız
  çözümlerin bir kısmı doğru çalışabilir. Fakat diğer kısmında da hatalar almanız
  ve istediğiniz sonuca ulaşamama ihtimaliniz bulunuyor. Bu konuda yabancı dillerde
  çözümler üretiliyor.
guid: https://www.siberoloji.com/?p=1106
id: 1106
image: /assets/images/2024/06/cyber8.jpg
tags:
- linux
- systemd
title: Systemd İçerisinde Runlevel Durumları
url: /tr/systemd-icerisinde-runlevel-durumlari/
---

 <p>Linux işletim sistemlerinin bir çoğu systemd kullanımına başladılar. Systemd kullanımına başlanmasıyla birlikte, internette yapacağınız aramalarda bulacağınız "Nasıl yapılır?" dokümanlarının bir kısmı da doğal olarak güncelliği kaybetti. Bulacağınız çözümlerin bir kısmı doğru çalışabilir. Fakat diğer kısmında da hatalar almanız ve istediğiniz sonuca ulaşamama ihtimaliniz bulunuyor. Bu konuda yabancı dillerde çözümler üretiliyor. Biz de <a href="https://siberoloji.com" target="_blank" rel="noreferrer noopener">siberoloji.com</a> olarak Türkçe kaynak oluşturmak adına bir takım dokümanlar hazırlamak istedik.</p>
 

 <p>Bu yazımızda, önceden sysV init olarak bilinen yapıda bulunan çalışma seviyelerinin systemd ile birlikte nasıl değiştiğini açıklayacağız. Aşağıdaki tabloda, çalışma seviyelerinin init ve systemd içerisinde nasıl isimlendirildiğini görebilirsiniz.</p>
 

 <p>Runlevel Target<br>0 poweroff.target<br>1 rescue.target<br>2,3,4 multi-user.target<br>5 graphical.target<br>6 reboot.target</p>
 

 <p>Tablodan da göreceğiniz gibi, init içerisinde çalışma seviyesi (runlevel) olarak adlandırılan kademeler systemd ile birlikte hedef (target) olarak ifade edilmeye başlamıştır. Komutlarda İngilizce yazımı kullanmanız gereken hedefleri şimdi tek tek açıklayalım.</p>
 

 <p><strong>poweroff.target</strong>: Sistemi, tüm servisleri durdurarak kapanma durumuna getirir.</p>
 

 <p><strong>rescue.target</strong>: Sistemi, yönetimsel işlemler için tek kullanıcı moduna getirir. Dosya ve disklere erişim ile bazı temel servisler çalışmaya devam eder.</p>
 

 <p><strong>multi-user.target</strong>: Text modunu ifade eder. Grafik arayüz olmadan çok kullanıcının oturum açabileceği durumdur.</p>
 

 <p><strong>graphical.target</strong>: Sistemi, görüntü yöneticisinin de çalıştığı konuma getirmeyi ifade eder.</p>
 

 <p><strong>reboot.target</strong>: Sistemi, tüm servisleri durdurarak kapatmayı ve tekrar başlatmayı ifade eder.</p>
 

 <p>Yukarıda bahsedilen çalışma seviyeleri için ortak bir kriter bulunmaktadır. “Sistem aynı anda sadece bir durumda bulunabilir.” Sisteminiz multiuser.target durumunda iken aynı anda graphical.target durumunda bulunamaz.</p>
 

 <p>Sisteminizde şu an aktif olan .<strong>target</strong>&nbsp;durumlarını aşağıdaki komut ile listelediğinizde&nbsp;<strong>active</strong>&nbsp;durumunda olan .target uzantılı üniteleri görebilirsiniz.</p>
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">systemctl list-units --type target

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
<!-- /wp:preformatted -->

 <p>7.sırada görülebileceği gibi&nbsp;<strong>graphical.target</strong>&nbsp;durumu aktif ve çalışıyor.</p>
 

 <p>Şimdi birlikte sistemi&nbsp;isolate&nbsp; fonksiyonunu kullanarak multiuser.target durumuna geçirelim. Bu durumda, tüm grafik uygulamalar kapanacak ve ekranınız komut satırına dönüşecek (Alt+Ctrl+F1,F2,....F6 kullanın). Oturum açma ekranı text modunda karşınıza gelecek. Kayıt etmediğiniz çalışmalarınızı kaydetmenizi öneriyoruz çünkü hepsi kapanacak. Ayrıca tekrar grafik arayüzüne geri dönmek için gerekli komutu da bir yere not etmek isteyebilirsiniz.</p>
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo systemctl isolate multi-user.target</pre>
<!-- /wp:preformatted -->

 <p>Multiuser durumuna geçince, Alt+Ctrl+F1 ile komut satırına girebilirsiniz. Text modunda oturum açarak ulaşacağınız komut satırında, aşağıdaki komutu yazarak tekrar grafik arayüzüne dönebilirsiniz.</p>
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo systemctl isolate graphical.target</pre>
<!-- /wp:preformatted -->

 <p>Geçmişe dönük olarak işlerliği sürdürmek açısından systemd .<strong>target</strong>&nbsp;durumlarına runlevel1,2,3 vb. şekilde isimlendirme de yapılmıştır. Aşağıdaki iki örnek örnek komut aslında aynı işlem yapılmaktadır.</p>
 

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo systemctl isolate graphical.target
sudo systemctl isolate runlevel5.target</pre>
<!-- /wp:preformatted -->

 <p>Bir sonraki yazımızda sistemi varsayılan olarak grafik arayüzde (graphical.target) değil de doğrudan text modunda (multi-user.target) açmayı açıklayacağız.</p>
 