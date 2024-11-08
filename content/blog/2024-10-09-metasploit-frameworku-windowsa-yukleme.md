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

  Metasploit Framework'ü Windows'a yüklemek, penetrasyon testi ve güvenlik değerlendirmeleri yapmak isteyen  siber güvenlik profesyonelleri ve meraklıları için önemli bir adımdır. Bu kılavuz, ön koşullar, kurulum adımları ve ilk kurulum dahil olmak üzere kurulum sürecinde size yol gösterecektir. 
 

 
 ## Metasploit Framework'e Genel Bakış</h2>
<!-- /wp:heading -->

  Metasploit Framework, güvenlik uzmanlarının sistemlerdeki güvenlik açıklarını bulmalarına, bunları istismar etmelerine ve güvenlik önlemlerini doğrulamalarına olanak tanıyan açık kaynaklı bir penetrasyon testi platformudur. Kali Linux gibi Linux ortamlarında yaygın olarak kullanılsa da Windows kullanıcıları için de mevcuttur. Framework, ağ güvenliğinin test edilmesini kolaylaştıran çeşitli araçlar ve yardımcı programlar içerir. 
 

 
 ## Kurulum için Ön Koşullar</h2>
<!-- /wp:heading -->

  Metasploit Framework'ü Windows'a yüklemeden önce sisteminizin aşağıdaki gereksinimleri karşıladığından emin olun: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>İşletim Sistemi</strong> : Windows 10 veya üzeri (Windows 11 de desteklenmektedir).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Yönetici Ayrıcalıkları</strong> : Yazılımı yüklemek için yönetici haklarına sahip olmanız gerekir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Sistem Gereksinimleri</strong> : En az 4 GB RAM ve yeterli disk alanı (en az 1 GB).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Güvenlik Duvarı ve Antivirüs Ayarları</strong> : Kurulum sırasında etkin güvenlik duvarlarını veya antivirüs yazılımlarını geçici olarak devre dışı bırakın; çünkü bunlar kurulum sürecini etkileyebilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Adım Adım Kurulum Kılavuzu</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Adım 1: Yükleyiciyi indirin</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Web tarayıcınızı açın ve <a href="https://www.rapid7.com/products/metasploit/download.jsp">Rapid7 Metasploit indirme sayfasına</a> gidin .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>En son Windows yükleyicisi için bağlantıya tıklayın (genellikle adı <code>metasploit-latest.msi</code>).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Yükleyici dosyasını, İndirilenler klasörünüz gibi kolayca erişebileceğiniz bir konuma kaydedin.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Adım 2: Kuruluma Hazırlık</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Antivirüs  Yazılımını</strong> Devre Dışı Bırakın : Yükleyiciyi çalıştırmadan önce, herhangi bir antivirüs programını geçici olarak devre dışı bırakın. Bu, Metasploit'i yanlışlıkla kötü amaçlı yazılım olarak işaretlemelerini önler.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Windows Güvenlik Duvarını devre dışı bırakın</strong> : Denetim Masası &gt; Sistem ve Güvenlik &gt; Windows Defender Güvenlik Duvarı'na gidin ve güvenlik duvarını geçici olarak kapatın.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Adım 3: Yükleyiciyi çalıştırın</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Yükleyiciyi indirdiğiniz klasöre gidin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><code>metasploit-latest.msi</code> dosyasına sağ tıklayıp <strong>Yönetici Olarak Çalıştır'ı</strong> seçin .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Kullanıcı Hesabı Denetimi (UAC) tarafından istendiğinde, değişikliklere izin vermek için <strong>Evet'e tıklayın.</strong></li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Adım 4: Kurulum İstemlerini Takip Edin</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Kurulum ekranı görüntülendiğinde devam etmek için <strong>İleri'ye</strong> tıklayın .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Lisans sözleşmesini okuyun ve <strong>Lisans sözleşmesini kabul ediyorum'u seçip </strong><strong>İleri'ye</strong> tıklayın .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Kurulum dizininizi seçin (varsayılan <code>C:\metasploit-framework</code>'dir ). <strong>İleri'ye</strong> tıklayın .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kurulum sürecini başlatmak için Yükle'ye</strong> tıklayın . Bu, sisteminizin performansına bağlı olarak birkaç dakika sürebilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Kurulum tamamlandıktan sonra <strong>Son'a</strong> tıklayın .</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Adım 5: Metasploit Framework'ün İlk Kurulumu</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Yönetici ayrıcalıklarıyla Komut İstemi'ni açın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Başlat menüsünde “cmd”yi arayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Komut İstemi'ne sağ tıklayın ve <strong>Yönetici Olarak Çalıştır'ı</strong> seçin .</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Aşağıdaki komutu yazarak Metasploit dizinine gidin:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   cd C:\metasploit-framework\bin</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Aşağıdaki komutu yazarak Metasploit'i başlatın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   msfconsole.bat</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list"><!-- wp:list-item -->
<li>İlk başlatmada yeni bir veritabanı kurmanız istenecektir:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Veritabanı yapılandırmasını başlatmak için <code>y</code>veya yazın .<code>yes</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list"><!-- wp:list-item -->
<li>Msfconsole'un tamamen yüklenmesini bekleyin; bu birkaç dakika sürebilir.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Kurulum Sonrası Yapılandırma</h2>
<!-- /wp:heading -->

  Metasploit'i başarıyla kurduktan sonra, optimum performans için birkaç ayarı yapılandırmak önemlidir: 
 

<!-- wp:heading {"level":3} -->
 ### Veritabanı Bağlantısını Yapılandır</h3>
<!-- /wp:heading -->

  Metasploit, güvenlik açıkları ve istismarlar hakkında bilgi depolamak için bir veritabanı kullanır: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>PostgreSQL'in çalıştığından emin olun:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Komut İstemi'ni Yönetici olarak açın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>PostgreSQL servisini başlatmak için şunu yazın:<br>(Gerekirse sürüm numarasını ayarlayın.)</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">net start postgresql-x64-12</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Msfconsole'da veritabanı bağlantısını ayarlayın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   db_status</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Eğer “bağlandı” yazıyorsa, veritabanı kurulumunuz başarılıdır.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Metasploit Çerçevesini Güncelle</h3>
<!-- /wp:heading -->

  En son exploitlere ve özelliklere sahip olduğunuzdan emin olmak için: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Msfconsole'a şunu yazın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   msfupdate</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Bu komut güncellemeleri kontrol edecek ve varsa yükleyecektir.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Güvenlik Özelliklerini Yeniden Etkinleştir</h3>
<!-- /wp:heading -->

  Kurulum ve ilk ayarları tamamladıktan sonra: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Antivirüs yazılımınızı tekrar etkinleştirin ve gerekirse Metasploit'e izin verecek şekilde yapılandırın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Güvenlik için Windows Güvenlik Duvarınızı tekrar açın.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Kurulum Sırasında Karşılaşılan Genel Sorunlar</h2>
<!-- /wp:heading -->

  Metasploit'i Windows'a yüklerken kullanıcılar birkaç yaygın sorunla karşılaşabilir: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Kurulum Erken Başarısız Oluyor</strong> : Kuruluma başlamadan önce tüm antivirüs yazılımlarını ve güvenlik duvarlarını devre dışı bıraktığınızdan emin olun.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Veritabanı Bağlantı Sorunları</strong> : Eğer msfconsole veritabanına bağlanamadığını bildiriyorsa, PostgreSQL'in düzgün çalıştığını doğrulayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Yavaş Performans</strong> : Kaynak yönetimi farklılıklarından dolayı Metasploit'i Windows'ta çalıştırmak Linux sistemlerine göre daha yavaş olabilir; sisteminizin minimum gereksinimleri karşıladığından emin olun.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Sonuç</h2>
<!-- /wp:heading -->

  Metasploit Framework'ü Windows'a kurmak, penetrasyon testi ve güvenlik değerlendirmeleri için geniş bir olasılık yelpazesi sunar. Bu ayrıntılı kılavuzu izleyerek, Metasploit Framework'ü Windows makinenize başarıyla kurabilir ve ayarlayabilir ve  siber güvenlik uygulamalarındaki güçlü yeteneklerini keşfedebilirsiniz. 
 

  Herhangi bir sistemi veya ağı test etmeden önce izin aldığınızdan emin olarak, bu araçları her zaman yasal sınırlar içerisinde sorumlu ve etik bir şekilde kullanmayı unutmayın. 
 

  Metasploit'in işlevlerini öğrenerek ve güncel tutarak, ağ güvenliğindeki becerilerinizi önemli ölçüde artıracak ve aynı zamanda kuruluşunuzdaki veya kişisel projelerinizdeki siber güvenlik çalışmalarına olumlu katkıda bulunacaksınız. 
 

  Alıntılar:<br>[1] https://docs.rapid7.com/metasploit/installing-the-metasploit-framework/<br>[2] https://www.youtube.com/watch?v=y4-oIl6bkbE<br>[3] https://blog.didierstevens.com/2017/08/14/using-metasploit-on-windows/<br>[4] https://www.youtube.com/watch?v=fhR9jkgPiKg<br>[5] https://www.youtube.com/watch?v=IuXmboYm3Gk<br>[6<br>] https://help.rapid7.com/metasploit/Content/getting-started/gsg-pro.html [7] https://docs.metasploit.com/docs/using-metasploit/getting-started/nightly-installers.html<br>[8] https://www.metasploit.com/get-started 
 