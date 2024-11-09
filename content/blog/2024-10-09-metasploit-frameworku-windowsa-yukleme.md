---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Siber Güvenlik
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-10-09T01:17:41Z"
guid: https://www.siberoloji.com/?p=2857
id: 2857
image: /assets/images/2024/10/metasploitframework.webp
tags:
- metasploit framework
title: Metasploit Framework&#8217;ü Windows&#8217;a Yükleme
url: /tr/metasploit-frameworku-windowsa-yukleme/
---

  Metasploit Framework'ü Windows'a yüklemek, penetrasyon testi ve güvenlik değerlendirmeleri yapmak isteyensiber güvenlikprofesyonelleri ve meraklıları için önemli bir adımdır. Bu kılavuz, ön koşullar, kurulum adımları ve ilk kurulum dahil olmak üzere kurulum sürecinde size yol gösterecektir. 
 

 
 ## Metasploit Framework'e Genel Bakış
<!-- /wp:heading -->

  Metasploit Framework, güvenlik uzmanlarının sistemlerdeki güvenlik açıklarını bulmalarına, bunları istismar etmelerine ve güvenlik önlemlerini doğrulamalarına olanak tanıyan açık kaynaklı bir penetrasyon testi platformudur. Kali Linux gibi Linux ortamlarında yaygın olarak kullanılsa da Windows kullanıcıları için de mevcuttur. Framework, ağ güvenliğinin test edilmesini kolaylaştıran çeşitli araçlar ve yardımcı programlar içerir. 
 

 
 ## Kurulum için Ön Koşullar
<!-- /wp:heading -->

  Metasploit Framework'ü Windows'a yüklemeden önce sisteminizin aşağıdaki gereksinimleri karşıladığından emin olun: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***İşletim Sistemi*** : Windows 10 veya üzeri (Windows 11 de desteklenmektedir). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Yönetici Ayrıcalıkları*** : Yazılımı yüklemek için yönetici haklarına sahip olmanız gerekir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Sistem Gereksinimleri*** : En az 4 GB RAM ve yeterli disk alanı (en az 1 GB). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Güvenlik Duvarı ve Antivirüs Ayarları*** : Kurulum sırasında etkin güvenlik duvarlarını veya antivirüs yazılımlarını geçici olarak devre dışı bırakın; çünkü bunlar kurulum sürecini etkileyebilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Adım Adım Kurulum Kılavuzu
<!-- /wp:heading -->


 ### Adım 1: Yükleyiciyi indirin
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Web tarayıcınızı açın ve<a href="https://www.rapid7.com/products/metasploit/download.jsp">Rapid7 Metasploit indirme sayfasına</a>gidin . 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- En son Windows yükleyicisi için bağlantıya tıklayın (genellikle adı<code>metasploit-latest.msi</code>). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Yükleyici dosyasını, İndirilenler klasörünüz gibi kolayca erişebileceğiniz bir konuma kaydedin. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Adım 2: Kuruluma Hazırlık
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***AntivirüsYazılımını*** Devre Dışı Bırakın : Yükleyiciyi çalıştırmadan önce, herhangi bir antivirüs programını geçici olarak devre dışı bırakın. Bu, Metasploit'i yanlışlıkla kötü amaçlı yazılım olarak işaretlemelerini önler. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Windows Güvenlik Duvarını devre dışı bırakın*** : Denetim Masası &gt; Sistem ve Güvenlik &gt; Windows Defender Güvenlik Duvarı'na gidin ve güvenlik duvarını geçici olarak kapatın. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Adım 3: Yükleyiciyi çalıştırın
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Yükleyiciyi indirdiğiniz klasöre gidin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>metasploit-latest.msi</code> dosyasına sağ tıklayıp***Yönetici Olarak Çalıştır'ı***  seçin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Kullanıcı Hesabı Denetimi (UAC) tarafından istendiğinde,değişikliklere izin vermek için***Evet'e tıklayın.***  
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Adım 4: Kurulum İstemlerini Takip Edin
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Kurulum ekranı görüntülendiğinde devam etmek için***İleri'ye*** tıklayın . 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Lisans sözleşmesini okuyun ve***Lisans sözleşmesini kabul ediyorum'u seçip*** ***İleri'ye*** tıklayın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Kurulum dizininizi seçin (varsayılan <code>C:\metasploit-framework</code>'dir ).***İleri'ye*** tıklayın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Kurulum sürecini başlatmak için Yükle'ye*** tıklayın. Bu, sisteminizin performansına bağlı olarak birkaç dakika sürebilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Kurulum tamamlandıktan sonra***Son'a*** tıklayın . 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Adım 5: Metasploit Framework'ün İlk Kurulumu
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Yönetici ayrıcalıklarıyla Komut İstemi'ni açın: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Başlat menüsünde “cmd”yi arayın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Komut İstemi'ne sağ tıklayın ve***Yönetici Olarak Çalıştır'ı*** seçin . 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Aşağıdaki komutu yazarak Metasploit dizinine gidin: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   cd C:\metasploit-framework\bin</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- Aşağıdaki komutu yazarak Metasploit'i başlatın: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   msfconsole.bat</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list"><!-- wp:list-item -->
- İlk başlatmada yeni bir veritabanı kurmanız istenecektir: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Veritabanı yapılandırmasını başlatmak için<code>y</code>veyayazın .<code>yes</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list"><!-- wp:list-item -->
- Msfconsole'un tamamen yüklenmesini bekleyin; bu birkaç dakika sürebilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Kurulum Sonrası Yapılandırma
<!-- /wp:heading -->

  Metasploit'i başarıyla kurduktan sonra, optimum performans için birkaç ayarı yapılandırmak önemlidir: 
 


 ### Veritabanı Bağlantısını Yapılandır
<!-- /wp:heading -->

  Metasploit, güvenlik açıkları ve istismarlar hakkında bilgi depolamak için bir veritabanı kullanır: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- PostgreSQL'in çalıştığından emin olun: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Komut İstemi'ni Yönetici olarak açın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- PostgreSQL servisini başlatmak için şunu yazın:<br>(Gerekirse sürüm numarasını ayarlayın.) 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">net start postgresql-x64-12</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Msfconsole'da veritabanı bağlantısını ayarlayın: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   db_status</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- Eğer “bağlandı” yazıyorsa, veritabanı kurulumunuz başarılıdır. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Metasploit Çerçevesini Güncelle
<!-- /wp:heading -->

  En son exploitlere ve özelliklere sahip olduğunuzdan emin olmak için: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Msfconsole'a şunu yazın: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   msfupdate</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- Bu komut güncellemeleri kontrol edecek ve varsa yükleyecektir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Güvenlik Özelliklerini Yeniden Etkinleştir
<!-- /wp:heading -->

  Kurulum ve ilk ayarları tamamladıktan sonra: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Antivirüs yazılımınızı tekrar etkinleştirin ve gerekirse Metasploit'e izin verecek şekilde yapılandırın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Güvenlik için Windows Güvenlik Duvarınızı tekrar açın. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Kurulum Sırasında Karşılaşılan Genel Sorunlar
<!-- /wp:heading -->

  Metasploit'i Windows'a yüklerken kullanıcılar birkaç yaygın sorunla karşılaşabilir: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Kurulum Erken Başarısız Oluyor*** : Kuruluma başlamadan önce tüm antivirüs yazılımlarını ve güvenlik duvarlarını devre dışı bıraktığınızdan emin olun. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Veritabanı Bağlantı Sorunları*** : Eğer msfconsole veritabanına bağlanamadığını bildiriyorsa, PostgreSQL'in düzgün çalıştığını doğrulayın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Yavaş Performans*** : Kaynak yönetimi farklılıklarından dolayı Metasploit'i Windows'ta çalıştırmak Linux sistemlerine göre daha yavaş olabilir; sisteminizin minimum gereksinimleri karşıladığından emin olun. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Sonuç
<!-- /wp:heading -->

  Metasploit Framework'ü Windows'a kurmak, penetrasyon testi ve güvenlik değerlendirmeleri için geniş bir olasılık yelpazesi sunar. Bu ayrıntılı kılavuzu izleyerek, Metasploit Framework'ü Windows makinenize başarıyla kurabilir ve ayarlayabilir vesiber güvenlikuygulamalarındaki güçlü yeteneklerini keşfedebilirsiniz. 
 

  Herhangi bir sistemi veya ağı test etmeden önce izin aldığınızdan emin olarak, bu araçları her zaman yasal sınırlar içerisinde sorumlu ve etik bir şekilde kullanmayı unutmayın. 
 

  Metasploit'in işlevlerini öğrenerek ve güncel tutarak, ağ güvenliğindeki becerilerinizi önemli ölçüde artıracak ve aynı zamanda kuruluşunuzdaki veya kişisel projelerinizdeki siber güvenlik çalışmalarına olumlu katkıda bulunacaksınız. 
 

  Alıntılar:<br>[1] https://docs.rapid7.com/metasploit/installing-the-metasploit-framework/<br>[2] https://www.youtube.com/watch?v=y4-oIl6bkbE<br>[3] https://blog.didierstevens.com/2017/08/14/using-metasploit-on-windows/<br>[4] https://www.youtube.com/watch?v=fhR9jkgPiKg<br>[5] https://www.youtube.com/watch?v=IuXmboYm3Gk<br>[6<br>] https://help.rapid7.com/metasploit/Content/getting-started/gsg-pro.html [7] https://docs.metasploit.com/docs/using-metasploit/getting-started/nightly-installers.html<br>[8] https://www.metasploit.com/get-started 
 