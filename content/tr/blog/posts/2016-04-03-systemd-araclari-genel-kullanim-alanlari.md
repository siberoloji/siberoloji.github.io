---
draft: false

title:  'systemd Araçları &#8211; Genel Kullanım Alanları'
date: '2016-04-03T14:22:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Günümüzde, Debian, Fedora, Red Hat, Ubuntu ve ArchLinux vb. ana dağıtım olarak kabul edilen linux işletim sistemleri, systemd kullanmaya başlamıştır. \_Gelişmeler, kullanımın yaygınlaşacağını göstermektedir. Linux kullanıcılarının, bu alanda kendini geliştirmeleri gerekecektir." 
 
url:  /tr/systemd-araclari-genel-kullanim-alanlari/
 
featured_image: /images/linux-howto.jpg
categories:
    - 'Temel Linux'
tags:
    - systemd
---
Günümüzde, Debian, Fedora, Red Hat, Ubuntu ve ArchLinux vb. ana dağıtım olarak kabul edilen linux işletim sistemleri, systemd kullanmaya başlamıştır.  Gelişmeler, kullanımın yaygınlaşacağını göstermektedir. Linux kullanıcılarının, bu alanda kendini geliştirmeleri gerekecektir.

Bu konuda internette kaynak arandığında, genelde geliştiricilerin hazırladığı İngilizce manpages (<a href="http://www.freedesktop.org/software/systemd/man/" target="_blank" rel="noreferrer noopener">wiki</a>) veya kısa blog yazıları ile karşılaşıyoruz. Türkçe, detaylı bir kaynak bulmak oldukça zor. İşletim sistemini, görsel olarak kullananlar ve gerisine karışmam diyenler için sorun yok. Ancak, arka planda olanları merak edenler veya sorun çözme işlemlerinde bilgi sahibi olmak isteyenlerin, systemd araçlarını öğrenmesi kaçınılmaz olacak. Bu düşünceden hareketle, yazıları bir sıra dahilinde devam ettirmeyi düşünüyoruz.

systemd hakkında <a href="https://www.siberoloji.com/systemd-nedir-genel-yapisi-nasildir/" data-type="post" data-id="1036" target="_blank" rel="noreferrer noopener">giriş</a> yazısında, kısaca açıklayıcı bilgi vermeye çalışmıştık. Bu yazıda ise systemd, kullanıcılara hangi  araçları sunuyor? Bu araçların neler olduğunu açıklayacağız.

systemd, sistem ve servis yöneticisi olarak tanımlanan bir program. Windows İşletim Sistemi kullanıcılarının, Çalıştır kutusuna services.msc komutunu yazdığında çalışan servisler programının bir benzeri. Komut satırından kontrol edilebildiği gibi görsel bir kullanıcı arayüzü de bulunuyor (systemd-ui).

## Bilgisayarda mevcut servislerle ilgili neler yapılabilir?

Yapılabilecek işlemlere Başlatmak (start), Durdurmak (stop), Tekrar Başlatmak (restart), İptal Etmek (disable), Kullanıma Sokmak (enable) örnek olarak verilebilir.  İşte systemd ile bunları yapmak mümkün. Zaten sysvinit ile yapılıyordu ancak şimdi daha hızlı yapılabiliyor. En azından systemd öyle olmalı ki ana dağıtımlar geçmeyi tercih ettiler.

systemd konusunda adım adım gitmek ve temel bilgileri anlamak önemli. Şu ana kadar servisler olarak bahsettiğimiz bilgisayar hizmetlerinin tamamına, systemd literatüründe ünite (unit) adı verilmektedir. Yazılarımızda kavram bütünlüğü olması açısından “ünite” ifadesi kullanılacaktır. Servis (service) ifadesi, systemd içerisinde ünite ifadesinden biraz ayrı kullanılıyor.

## Systemd Araçları

Sisteminizde, systemd çalışıyorsa, istediğiniz soruyu sorup cevabını alabilirsiniz. O zaman, kullanıcılar olarak bizim “soru sormayı” öğrenmemiz ve hangi aracı kullanarak bunu yapacağımızı bilmemiz gerekiyor. systemd içerisinde, en dış katmanda, kullanıcı ile etkileşimli, 8 adet araç bulunmaktadır. Bunlar, systemctl, journalctl, notify, analyze, cgls, cgtop, loginctl ve nspawn olarak isimlendirilirler. Bu araçların  seçeneklerini, parametrelerini ve ünite isimlerini kullanarak systemd ile etkileşim kurabilirsiniz. Durum sorgulayıp cevap beklersiniz, aldığınız cevaba göre bir hizmeti başlatıp, durdurabilir veya devre dışı bırakabilirsiniz.

**İPUCU:** Hatta isterseniz, snapshot hizmetini kullanarak, sisteminizin çalışan servislerinin durumunu fotoğraflayıp, bir arıza olduğunda bu duruma sisteminizi geri yükleme imkanınız da var. (Bilgisayarınızı kapatmadığınız sürece. Kapatınca, snapshot silinir.)

## Systemd Araçları

systemctl

systemd sistemini ve servislerini kontrol eden aracı ifade eder.

journalctl

olayları kontrol edip raporlayabilmek için systemd log dosyalarını kontrol eden aracı ifade eder.

systemd-notify

Ünitelerin durumlarında bir değişiklik olduğunda, diğer hizmetleri ve kullanıcıları bilgilendirmek için kullanılan bir araçtır. Genelde, açılış esnasında meydana gelen hatalarla ilgilidir.

systemd-analyze

Sisteminizin açılış esnasında geçen zamanın istatistik ve incelemesini analiz eder. Çekirdek (kernel) başlangıç zamanı ve kullanıcı işlemleri başlangıç zamanı ayrı ayrı ölçülür ve gösterilir. Bu süreleri analiz etmeye yarayan araçtır.

systemd-cgls

systemd çalışma mantığında yer alan kontrol gruplarının durumunu ve hangi kontrol grubunda ve alt basamaklarında hangi servislerin çalıştığını kontrol etmeye yarayan araçtır.

systemd-cgtop

systemd-cgls aracında, tüm ana grup ve üyeleri hiyerarşik olarak gösterilirken, systemd-cgtop aracında ise en üstte bulunan ana grup ve sistem kullanımı görüntülenir. sysvinit içerisinde  “service --status-all” komutuna benzer.

systemd-loginctl

İşletim Sisteminin oturum açma işlemlerini kontrol eden araçtır. Oturum açma yöneticisi diye tanımlanabilir.

systemd-nspawn

Hata ayıklama ve simülasyon yapmak için kullanılan bir araçtır. chroot aracına benzer ancak daha fazlasıdır. Bir programın, hatta başka bir işletim sisteminin, izole edilmiş halde, sistemin gerçek kaynaklarına zarar vermeden çalıştırılmasını sağlar. Yazılım geliştiriciler için oldukça kullanışlıdır. Bu yazımızda, mümkün olduğunca anlaşılır şekilde systemd araçların en önemlilerinden bahsettik. İlerleyen yazılarda, detaylı anlatım ve örnekler vermeye çalışacağız.
