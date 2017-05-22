---
layout: post
title: systemd Araçları - Genel Kullanım Alanları
date: 2016-04-03 08:56:33.000000000 +03:00
type: post
author: siberoloji
img: linux-howto.jpg
published: true
status: publish
categories:
- Araştırma
- Linux
tags:
- journalctl
- systemctl
- systemd utilities
- systemd-analyze
- systemd-cgls
- systemd-cgtop
- systemd-notify
- systemd-nspawn

---
<p>Günümüzde, Debian, Fedora, Red Hat, Ubuntu ve ArchLinux vb. ana dağıtım olarak kabul edilen linux işletim sistemleri, systemd kullanmaya başlamıştır.  Gelişmeler, kullanımın yaygınlaşacağını göstermektedir. Linux kullanıcılarının, bu alanda kendini geliştirmeleri gerekecektir.</p>
<p>Bu konuda internette kaynak arandığında, genelde geliştiricilerin hazırladığı İngilizce manpages (<a href="http://www.freedesktop.org/software/systemd/man/" target="_blank">wiki</a>) veya kısa blog yazıları ile karşılaşıyoruz. Türkçe, detaylı bir kaynak bulmak oldukça zor. İşletim sistemini, görsel olarak kullananlar ve gerisine karışmam diyenler için sorun yok. Ancak, arka planda olanları merak edenler veya sorun çözme işlemlerinde bilgi sahibi olmak isteyenlerin, systemd araçlarını öğrenmesi kaçınılmaz olacak. Bu düşünceden hareketle, yazıları bir sıra dahilinde devam ettirmeyi düşünüyoruz.</p>
<p>systemd hakkında <a href="https://siberoloji.github.io/systemd-nedir-genel-yapisi-nasil-calisir/" target="_blank">giriş</a> yazısında, kısaca açıklayıcı bilgi vermeye çalışmıştık. Bu yazıda ise systemd, kullanıcılara hangi  araçları sunuyor? Bu araçların neler olduğunu açıklayacağız.</p>
<p>systemd, sistem ve servis yöneticisi olarak tanımlanan bir program. Windows İşletim Sistemi kullanıcılarının, Çalıştır kutusuna services.msc komutunu yazdığında çalışan servisler programının bir benzeri. Komut satırından kontrol edilebildiği gibi görsel bir kullanıcı arayüzü de bulunuyor (systemd-ui).</p>
<h2>Bilgisayarda mevcut servislerle ilgili neler yapılabilir?</h2>
<p>Yapılabilecek işlemlere Başlatmak (start), Durdurmak (stop), Tekrar Başlatmak (restart), İptal Etmek (disable), Kullanıma Sokmak (enable) örnek olarak verilebilir.  İşte systemd ile bunları yapmak mümkün. Zaten sysvinit ile yapılıyordu ancak şimdi daha hızlı yapılabiliyor. En azından systemd öyle olmalı ki ana dağıtımlar geçmeyi tercih ettiler.</p>
<p>systemd konusunda adım adım gitmek ve temel bilgileri anlamak önemli. Şu ana kadar servisler olarak bahsettiğimiz bilgisayar hizmetlerinin tamamına, systemd literatüründe ünite (unit) adı verilmektedir. Yazılarımızda kavram bütünlüğü olması açısından “ünite” ifadesi kullanılacaktır. Servis (service) ifadesi, systemd içerisinde ünite ifadesinden biraz ayrı kullanılıyor.</p>
<h2>Systemd Araçları</h2>
<p>Sisteminizde, systemd çalışıyorsa, istediğiniz soruyu sorup cevabını alabilirsiniz. O zaman, kullanıcılar olarak bizim “soru sormayı” öğrenmemiz ve hangi aracı kullanarak bunu yapacağımızı bilmemiz gerekiyor. systemd içerisinde, en dış katmanda, kullanıcı ile etkileşimli, 8 adet araç bulunmaktadır. Bunlar, systemctl, journalctl, notify, analyze, cgls, cgtop, loginctl ve nspawn olarak isimlendirilirler. Bu araçların  seçeneklerini, parametrelerini ve ünite isimlerini kullanarak systemd ile etkileşim kurabilirsiniz. Durum sorgulayıp cevap beklersiniz, aldığınız cevaba göre bir hizmeti başlatıp, durdurabilir veya devre dışı bırakabilirsiniz.</p>
<p><b>İPUCU:</b> Hatta isterseniz, snapshot hizmetini kullanarak, sisteminizin çalışan servislerinin durumunu fotoğraflayıp, bir arıza olduğunda bu duruma sisteminizi geri yükleme imkanınız da var. (Bilgisayarınızı kapatmadığınız sürece. Kapatınca, snapshot silinir.)</p>
<h2>Systemd Araçları</h2>
<h3>systemctl</h3>
<p>systemd sistemini ve servislerini kontrol eden aracı ifade eder.</p>
<h3>journalctl</h3>
<p>olayları kontrol edip raporlayabilmek için systemd log dosyalarını kontrol eden aracı ifade eder.</p>
<h3>systemd-notify</h3>
<p>Ünitelerin durumlarında bir değişiklik olduğunda, diğer hizmetleri ve kullanıcıları bilgilendirmek için kullanılan bir araçtır. Genelde, açılış esnasında meydana gelen hatalarla ilgilidir.</p>
<h3>systemd-analyze</h3>
<p>Sisteminizin açılış esnasında geçen zamanın istatistik ve incelemesini analiz eder. Çekirdek (kernel) başlangıç zamanı ve kullanıcı işlemleri başlangıç zamanı ayrı ayrı ölçülür ve gösterilir. Bu süreleri analiz etmeye yarayan araçtır.</p>
<h3>systemd-cgls</h3>
<p>systemd çalışma mantığında yer alan kontrol gruplarının durumunu ve hangi kontrol grubunda ve alt basamaklarında hangi servislerin çalıştığını kontrol etmeye yarayan araçtır.</p>
<h3>systemd-cgtop</h3>
<p>systemd-cgls aracında, tüm ana grup ve üyeleri hiyerarşik olarak gösterilirken, systemd-cgtop aracında ise en üstte bulunan ana grup ve sistem kullanımı görüntülenir. sysvinit içerisinde  “service --status-all” komutuna benzer.</p>
<h3>systemd-loginctl</h3>
<p>İşletim Sisteminin oturum açma işlemlerini kontrol eden araçtır. Oturum açma yöneticisi diye tanımlanabilir.</p>
<h3>systemd-nspawn</h3>
<p>Hata ayıklama ve simülasyon yapmak için kullanılan bir araçtır. chroot aracına benzer ancak daha fazlasıdır. Bir programın, hatta başka bir işletim sisteminin, izole edilmiş halde, sistemin gerçek kaynaklarına zarar vermeden çalıştırılmasını sağlar. Yazılım geliştiriciler için oldukça kullanışlıdır.<br />
Bu yazımızda, mümkün olduğunca anlaşılır şekilde systemd araçların en önemlilerinden bahsettik. İlerleyen yazılarda, detaylı anlatım ve örnekler vermeye çalışacağız.</p>
