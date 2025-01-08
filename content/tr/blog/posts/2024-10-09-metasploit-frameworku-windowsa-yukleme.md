---
draft: false
title: Metasploit Framework'ü Windows'a Yükleme
date: 2024-10-09T01:17:41+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /tr/metasploit-frameworku-windowsa-yukleme/
featured_image: /images/metasploitframework.webp
categories:
   - Siber Güvenlik
tags:
   - metasploit framework
---


Metasploit Framework'ü Windows'a yüklemek, penetrasyon testi ve güvenlik değerlendirmeleri yapmak isteyen  siber güvenlik profesyonelleri ve meraklıları için önemli bir adımdır. Bu kılavuz, ön koşullar, kurulum adımları ve ilk kurulum dahil olmak üzere kurulum sürecinde size yol gösterecektir.



## Metasploit Framework'e Genel Bakış



Metasploit Framework, güvenlik uzmanlarının sistemlerdeki güvenlik açıklarını bulmalarına, bunları istismar etmelerine ve güvenlik önlemlerini doğrulamalarına olanak tanıyan açık kaynaklı bir penetrasyon testi platformudur. Kali Linux gibi Linux ortamlarında yaygın olarak kullanılsa da Windows kullanıcıları için de mevcuttur. Framework, ağ güvenliğinin test edilmesini kolaylaştıran çeşitli araçlar ve yardımcı programlar içerir.



## Kurulum için Ön Koşullar



Metasploit Framework'ü Windows'a yüklemeden önce sisteminizin aşağıdaki gereksinimleri karşıladığından emin olun:


* **İşletim Sistemi** : Windows 10 veya üzeri (Windows 11 de desteklenmektedir).

* **Yönetici Ayrıcalıkları** : Yazılımı yüklemek için yönetici haklarına sahip olmanız gerekir.

* **Sistem Gereksinimleri** : En az 4 GB RAM ve yeterli disk alanı (en az 1 GB).

* **Güvenlik Duvarı ve Antivirüs Ayarları** : Kurulum sırasında etkin güvenlik duvarlarını veya antivirüs yazılımlarını geçici olarak devre dışı bırakın; çünkü bunlar kurulum sürecini etkileyebilir.




## Adım Adım Kurulum Kılavuzu



Adım 1: Yükleyiciyi indirin


* Web tarayıcınızı açın ve <a href="https://www.rapid7.com/products/metasploit/download.jsp">Rapid7 Metasploit indirme sayfasına</a> gidin .

* En son Windows yükleyicisi için bağlantıya tıklayın (genellikle adı `metasploit-latest.msi`).

* Yükleyici dosyasını, İndirilenler klasörünüz gibi kolayca erişebileceğiniz bir konuma kaydedin.




Adım 2: Kuruluma Hazırlık


* **Antivirüs  Yazılımını** Devre Dışı Bırakın : Yükleyiciyi çalıştırmadan önce, herhangi bir antivirüs programını geçici olarak devre dışı bırakın. Bu, Metasploit'i yanlışlıkla kötü amaçlı yazılım olarak işaretlemelerini önler.

* **Windows Güvenlik Duvarını devre dışı bırakın** : Denetim Masası > Sistem ve Güvenlik > Windows Defender Güvenlik Duvarı'na gidin ve güvenlik duvarını geçici olarak kapatın.




Adım 3: Yükleyiciyi çalıştırın


* Yükleyiciyi indirdiğiniz klasöre gidin.

* `metasploit-latest.msi` dosyasına sağ tıklayıp **Yönetici Olarak Çalıştır'ı** seçin .

* Kullanıcı Hesabı Denetimi (UAC) tarafından istendiğinde, değişikliklere izin vermek için **Evet'e tıklayın.**




Adım 4: Kurulum İstemlerini Takip Edin


* Kurulum ekranı görüntülendiğinde devam etmek için **İleri'ye** tıklayın .

* Lisans sözleşmesini okuyun ve **Lisans sözleşmesini kabul ediyorum'u seçip ****İleri'ye** tıklayın .

* Kurulum dizininizi seçin (varsayılan `C:\metasploit-framework`'dir ). **İleri'ye** tıklayın .

* **Kurulum sürecini başlatmak için Yükle'ye** tıklayın . Bu, sisteminizin performansına bağlı olarak birkaç dakika sürebilir.

* Kurulum tamamlandıktan sonra **Son'a** tıklayın .




Adım 5: Metasploit Framework'ün İlk Kurulumu


* Yönetici ayrıcalıklarıyla Komut İstemi'ni açın:



* Başlat menüsünde “cmd”yi arayın.

* Komut İstemi'ne sağ tıklayın ve **Yönetici Olarak Çalıştır'ı** seçin .



* Aşağıdaki komutu yazarak Metasploit dizinine gidin:



```bash
   cd C:\metasploit-framework\bin
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Aşağıdaki komutu yazarak Metasploit'i başlatın:



```bash
   msfconsole.bat```


<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list">* İlk başlatmada yeni bir veritabanı kurmanız istenecektir:



* Veritabanı yapılandırmasını başlatmak için `y`veya yazın .`yes`



<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list">* Msfconsole'un tamamen yüklenmesini bekleyin; bu birkaç dakika sürebilir.




## Kurulum Sonrası Yapılandırma



Metasploit'i başarıyla kurduktan sonra, optimum performans için birkaç ayarı yapılandırmak önemlidir:



Veritabanı Bağlantısını Yapılandır



Metasploit, güvenlik açıkları ve istismarlar hakkında bilgi depolamak için bir veritabanı kullanır:


* PostgreSQL'in çalıştığından emin olun:



* Komut İstemi'ni Yönetici olarak açın.

* PostgreSQL servisini başlatmak için şunu yazın: (Gerekirse sürüm numarasını ayarlayın.)



```bash
net start postgresql-x64-12```


* Msfconsole'da veritabanı bağlantısını ayarlayın:



```bash
   db_status
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Eğer “bağlandı” yazıyorsa, veritabanı kurulumunuz başarılıdır.




Metasploit Çerçevesini Güncelle



En son exploitlere ve özelliklere sahip olduğunuzdan emin olmak için:


* Msfconsole'a şunu yazın:



```bash
   msfupdate```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* Bu komut güncellemeleri kontrol edecek ve varsa yükleyecektir.




Güvenlik Özelliklerini Yeniden Etkinleştir



Kurulum ve ilk ayarları tamamladıktan sonra:


* Antivirüs yazılımınızı tekrar etkinleştirin ve gerekirse Metasploit'e izin verecek şekilde yapılandırın.

* Güvenlik için Windows Güvenlik Duvarınızı tekrar açın.




## Kurulum Sırasında Karşılaşılan Genel Sorunlar



Metasploit'i Windows'a yüklerken kullanıcılar birkaç yaygın sorunla karşılaşabilir:


* **Kurulum Erken Başarısız Oluyor** : Kuruluma başlamadan önce tüm antivirüs yazılımlarını ve güvenlik duvarlarını devre dışı bıraktığınızdan emin olun.

* **Veritabanı Bağlantı Sorunları** : Eğer msfconsole veritabanına bağlanamadığını bildiriyorsa, PostgreSQL'in düzgün çalıştığını doğrulayın.

* **Yavaş Performans** : Kaynak yönetimi farklılıklarından dolayı Metasploit'i Windows'ta çalıştırmak Linux sistemlerine göre daha yavaş olabilir; sisteminizin minimum gereksinimleri karşıladığından emin olun.




## Sonuç



Metasploit Framework'ü Windows'a kurmak, penetrasyon testi ve güvenlik değerlendirmeleri için geniş bir olasılık yelpazesi sunar. Bu ayrıntılı kılavuzu izleyerek, Metasploit Framework'ü Windows makinenize başarıyla kurabilir ve ayarlayabilir ve  siber güvenlik uygulamalarındaki güçlü yeteneklerini keşfedebilirsiniz.



Herhangi bir sistemi veya ağı test etmeden önce izin aldığınızdan emin olarak, bu araçları her zaman yasal sınırlar içerisinde sorumlu ve etik bir şekilde kullanmayı unutmayın.



Metasploit'in işlevlerini öğrenerek ve güncel tutarak, ağ güvenliğindeki becerilerinizi önemli ölçüde artıracak ve aynı zamanda kuruluşunuzdaki veya kişisel projelerinizdeki siber güvenlik çalışmalarına olumlu katkıda bulunacaksınız.



Alıntılar: [1] https://docs.rapid7.com/metasploit/installing-the-metasploit-framework/ [2] https://www.youtube.com/watch?v=y4-oIl6bkbE [3] https://blog.didierstevens.com/2017/08/14/using-metasploit-on-windows/ [4] https://www.youtube.com/watch?v=fhR9jkgPiKg [5] https://www.youtube.com/watch?v=IuXmboYm3Gk [6 ] https://help.rapid7.com/metasploit/Content/getting-started/gsg-pro.html [7] https://docs.metasploit.com/docs/using-metasploit/getting-started/nightly-installers.html [8] https://www.metasploit.com/get-started
