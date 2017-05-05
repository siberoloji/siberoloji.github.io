---
layout: post
title: systemd nedir? Genel Yapısı Nasıldır?
date: 2016-04-03 08:57:23.000000000 +03:00
type: post
img: linux1.png
published: true
status: publish
categories:
- Araştırma
- Linux
tags:
- analyze
- cgls
- cgtop
- journalctl
- loginctl
- notify
- nspawn
- systemctl

---
<p>Linux İşletim Sistemi kullanıyorsanız, "systemd" ifadesiyle mutlaka karşılaşmışsınızdır. En azından systemd haberlerine rastlamışsınızdır. Bu konuda yaptığımız aramada, detaylı bir Türkçe kaynak bulmakta zorlandık. Bu sebeple, systemd hakkında bir çalışma yaptık.</p>
<h2>Kısaca systemd Hikayesi</h2>
<p>2010 yılında, Lennart Poettering, bir <a href="http://0pointer.de/blog/projects/systemd.html" target="_blank">blog</a> yazısıyla konuyu açıklar.  Lennart Poettering, Kay Sievers, Harald Hoyer, Daniel Mack, Tom Gundersen, ve David Herrmann tarafından, C programlama diliyle geliştirilen yazılımın ilk sürümü 30 Mart  2010 tarihinde yayınlanmıştır. Programın resmi <a href="http://www.freedesktop.org/wiki/" target="_blank">web sitesine</a> buradan ulaşabilirsiniz.</p>
<p>systemd olarak adlandırılan program, Linux işletim sistemleri için geliştirilmiştir. Amacı; bilgisayardaki sistem ve servislerin çalışmasını organize etmektir. Bu yönetimi, systemctl, journalctl, notify, analyze, cgls, cgtop, loginctl ve nspawn olarak adlandırılan araçlar sayesinde gerçekleştirir. Bu araçların detaylarını başka bir yazıya bırakıyoruz.</p>
<h2>systemd kullandığı temel yaklaşım</h2>
<p>systemd kullanmayan Linux sistemlerinde, açılış yöneticisi, PID 1 numara olarak, öncelikle açılış işlemlerini yönetecek programı (init) çalıştırır. Devamında diğer servisler başlatılır. Örneğin, Avahi hizmeti, D-Bus hizmetine ihtiyaç duyar. O zaman, açılışta önce D-Bus başlatılacak, Avahi sırada bekleyecektir. livirtd ve X11 servisleri, HAL hizmetine ihtiyaç duyarlar. O zaman önce HAL servisi başlayacaktır. Tüm bu servisler, syslog servisine ihtiyaç duyduklarından, hepsinden önce syslog başlayacaktır. Klasik Linux açılışı bu mantıkla çalışır.</p>
<p>Bu programlar, birbirleriyle soketler üzerinden haberleşirler. D-Bus başlamadan, soketi açılmaz ve Avahi, D-Bus soketine bağlanamaz. Systemd, bu yaklaşımı değiştirmeyi amaçlamıştır. Systemd, tüm hizmet ve servislerin ihtiyaç duyduğu bağlanma noktalarını -soketleri-, ilgili hizmet başlamasa dahi önceden başlatma ve diğer bekleyen programların sırada beklemesini ortadan kaldırmayı amaçlar.  X11,  başlamak için HAL  soketinin açılmasını bekliyorsa, X11 servisine bağlanacağı bir soket verilir. Dikkat edilirse, HAL servisi gerçekte başlamamıştır.  Bilgisayarın, o anda boşta bekleyen işlemci gücü, mümkün olan kapasiteyle azami oranda kullanılır. Servislerin, birbirlerini beklemesinden meydana gelen zaman kaybı en aza indirilmeye çalışılır. Bu durumda, X11 servisinin gönderdiği mesajlar, geçici bir kuyrukta bekletilir ve hizmetler başladıkça yerine getirilir.</p>
<p>Bu işlemler, sadece başlangıç süreci ile ilgili değildir. İşletim sisteminizin çalışması esnasında, systemd servisinin, çalışan yazılım ve donanımlarla ilgili bir çok işlevi olduğunu da belirtmeliyiz. systemd yaklaşımının, kısaca hangi mantık üzerine kurulduğunu anlatmaya çalıştık. Çok detaya girip, yazıyı teknik dokümana çevirmenin, şu an için gereksiz olduğunu düşünüyoruz.</p>
<h2>İtirazlar, çekinceler</h2>
<p>systemd, anlatılan bu işlemleri, önceden derlenmiş binary programlarla yapar. Kullanıcının müdahalesine pek müsaade etmez. Bir takım parametreleri kontrol etmenize izin verilse de genelde işlemler önceden ayarlanmıştır. systemd öncesinde kullanılan hizmet programları (Upstart veya sysvinit), uyguladıkları prosedürleri kabuk -shell- aracılığıyla yaparlar. Bu sebeple, kullanıcıların, kabuk -shell- kullanarak kişisel ayarlamalar yapabilme imkanı vardır. systemd ise kabuk üzerinden işlem yapmaz. Bu nedenle, fayda ve mahzurları üzerinde çok tartışılmaktadır. Açık kaynak kodlu, özgür yazılım mantığına ters olduğu için kabul etmeyenler, systemd programının, windows svchost.exe olmaya aday olduğu belirtmektedir. Kullanılabilir bularak, tercihli veya varsayılan olarak dağıtımlara dahil edenler de bulunmaktadır. Yazının son kısmında, systemd kullanmaya başlayan bir kaç dağıtım listelenmiştir.</p>
<p>Paul Venezia, 2014 Ağustos ayında InfoWorld’te yayınlanan makalesinde, systemd yaklaşımının, tüm işlemleri kendisi yapmaya çalışan bir yapı olduğunu, bunun “hiç hata yapmayan bir program olduğunu iddia etmesi” demek olduğundan, Unix felsefesini ihlal ettiğini belirtmiştir.</p>
<p>Bu konuda, önde gelen isimlerin düşüncelerinin özetlendiği <a href="http://www.zdnet.com/article/linus-torvalds-and-others-on-linuxs-systemd/" target="_blank">ZDNet</a> makalesini incelemenizi öneriyoruz. Söz konusu makalede, Linus Torvalds'ın konu hakkında çok fazla net bir ifade kullanmadığı ve bunların detay olduğunu söylediği görülüyor.</p>
<p>Ubuntu Türkiye <a href="https://forum.ubuntu-tr.net/index.php?topic=45368.5" target="_blank">forumunda</a> Forum Sorumlusu ve Genel Yönetici olan heartsmagic; “Kendi adıma, ben de bir projenin (systemd) bu kadar fazla işi yapmaya çalışmasını anlayamıyorum. Büyük dağıtımların son kullanıcı kararları nedeniyle, Unix felsefesinden zaten gittikçe uzaklaşıyoruz. Hadi üst taraftaki kararlar neyse de, şimdi ise sistemin bel kemiklerinden biri bu hâle getiriliyor. Unix felsefesinde -eğer yanlış bilmiyorsam- bir araç yazarsın, görevi neyse onu yapar. Systemd, maşallah her işe el atmaya çalışıyor ve ikilik sistem üzerinde çalışıyor ki -kodlama tarafım olmasa da- geliştiriciler bundan nefret ediyor. “ şeklinde düşüncelerini ifade ediyor ve “Beğensek de, beğenmesek de, sevabıyla, günahıyla, Ubuntu ve diğer büyük dağıtımlar systemd'ye geçecek .” ifadesiyle büyük dağıtımların buna geçeceğini, son kullanıcıların da ayak uydurmak durumunda kalacaklarını belirtiyor.</p>
<p>Aşağıda, systemd programını <b>varsayılan</b> olarak kullanmaya başlayan Linux dağıtımlarından bir kaçını görebilirsiniz.</p>
<h2>Dağıtım ve başlangıç tarihleri</h2>
<p>Fedora, Mayıs 2011</p>
<p>openSUSE, Eylül 2012</p>
<p>ArchLinux, Ekim 2012</p>
<p>Red Hat Şirket Sürümü, Haziran 2014</p>
<p>Debian, Nisan 2015</p>
<p>Ubuntu, Nisan 2015</p>
<p>Debian içerisinde systemd kullanımını kabul etmeyenler, systemd yüklenmemiş halde, <a href="https://devuan.org/">Devuan</a> dağıtımı yayınlanmıştır. Tarihsel gelişimi içerisinde, bir çok konuda farklı dağıtımlar oluşturan Linux, yeni bir konuda da yol ayrımına gelmiş bulunuyor.</p>
<p>Kısa bir giriş olarak, systemd hakkında temel bir takım bilgiler vermeye çalıştığımız bu yazıda, olumlu ve olumsuz farklı görüşleri yansıtmaya çalıştık. Gelişmeleri yakından takip edeceğiz.</p>
