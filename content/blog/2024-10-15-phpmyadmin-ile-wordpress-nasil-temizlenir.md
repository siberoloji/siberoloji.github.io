---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Wordpress
date: "2024-10-15T16:53:44Z"
guid: https://www.siberoloji.com/?p=3599
id: 3599
image: /assets/images/2024/10/wordpress.webp
tags:
- wordpress
title: phpMyAdmin ile WordPress Nasıl Temizlenir
url: /tr/phpmyadmin-ile-wordpress-nasil-temizlenir/
---

  İçeriğiniz büyüdükçe sağlıklı ve optimize edilmiş bir WordPress web sitesi sürdürmek zor olabilir. Zamanla, WordPress veritabanınız otomatik taslaklar, revizyonlar, çöpe atılan gönderiler, spam yorumlar ve geçici seçenekler gibi web sitenizi yavaşlatabilecek gereksiz dosyalar biriktirir. Bu kılavuzda, phpMyAdmin kullanarak doğrudan veritabanınızdan gereksiz dosyaları silerek WordPress'i nasıl temizleyeceğinizi ele alacağız. 
 

  Teknik sürece dalmadan önce, bu dosyaları temizlemenin neden önemli olduğunu, bu dosyaların ne olduğunu anlayalım ve ardından phpMyAdmin'i kullanarak bunları adım adım kaldırma sürecini inceleyelim. 
 

<!-- wp:heading {"level":3} -->
 ### WordPress Veritabanınızı Neden Temizlemelisiniz?</h3>
<!-- /wp:heading -->

  WordPress veritabanınız, gönderiler, sayfalar, yorumlar, eklenti ayarları ve diğer meta veriler dahil olmak üzere web sitenizin tüm içeriklerini ve ayarlarını depolar. Bazı veriler önemli olsa da, gönderi revizyonları, otomatik taslaklar, spam yorumları ve eski geçiciler gibi gereksiz dosyalar veritabanının şişmesine neden olabilir. WordPress veritabanınızı temizlemeniz için bazı önemli nedenler şunlardır: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Gelişmiş Performans</strong> : Şişkin bir veritabanı web sitenizi yavaşlatabilir ve WordPress'in veriyi almasını ve işlemesini zorlaştırabilir. Gereksiz dosyaları temizlemek sorgu yürütme süresini iyileştirir ve web sitenizi hızlandırır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Verimli Yedekleme ve Geri Yükleme</strong> : Büyük veritabanlarının yedekleri daha uzun sürer ve daha fazla kaynak tüketir. Daha temiz bir veritabanı yedekleme boyutunu azaltır ve gerektiğinde geri yüklemeyi kolaylaştırır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Azaltılmış Disk Kullanımı</strong> : Veritabanı şişkinliği, özellikle depolama alanının genellikle sınırlı olduğu paylaşımlı barındırmada sunucu depolama alanını tüketir. Gereksiz dosyaları kaldırarak, daha kritik dosyalar ve veriler için alan açarsınız.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Güvenlik ve Bakım</strong> : Temiz bir veritabanının yönetimi, sorun gidermesi ve güvenliği daha kolaydır. İlgisiz dosyalar hatalara ve potansiyel güvenlik açıklarına fırsat yaratabilir.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Artık WordPress veritabanınızı temiz tutmanın neden önemli olduğunu öğrendiğinize göre, zamanla birikme eğiliminde olan gereksiz dosyaları tartışalım. 
 

<!-- wp:heading {"level":3} -->
 ### WordPress'teki Gereksiz Dosya Türleri</h3>
<!-- /wp:heading -->

  WordPress veritabanında kaldırmayı düşünmeniz gereken en yaygın gereksiz dosya türleri şunlardır: 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1.&nbsp;<strong>Otomatik Taslaklar</strong></h4>
<!-- /wp:heading -->

  WordPress, düzenlediğiniz gönderilerinizi ve sayfalarınızı otomatik taslaklar olarak kaydeder. Bu, yanlışlıkla tarayıcı çökmesi veya bağlantı sorunu durumunda içeriğinizi kaybetmemenizi sağlar. Ancak, bu otomatik taslaklar genellikle son gönderi veya sayfa yayınlandıktan sonra bile veritabanınızda kalır. Otomatik taslakları kaldırmak, veritabanı şişkinliğini azaltmaya yardımcı olur. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2.&nbsp;<strong>Revizyonlar</strong></h4>
<!-- /wp:heading -->

  Bir gönderiyi veya sayfayı her güncellediğinizde, WordPress bir revizyon kaydeder. Zamanla, bu revizyonlar, özellikle sık güncellenen gönderiler için birikebilir. Revizyonlar eski sürümleri kurtarmada yardımcı olabilirken, çok fazla revizyon tutmak veritabanı boyutunu gereksiz yere artırabilir. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3.&nbsp;<strong>Çöpe Atılan Gönderiler ve Yorumlar</strong></h4>
<!-- /wp:heading -->

  Bir gönderiyi veya yorumu sildiğinizde, WordPress onu hemen kaldırmaz. Bunun yerine, öğeyi çöp kutusuna taşır ve kalıcı olarak silinene kadar orada kalır. Eski çöpe atılmış öğeler, özellikle düzgün yönetilmezse, veritabanı şişkinliğine katkıda bulunur. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">4.&nbsp;<strong>Spam ve Onaylanmamış Yorumlar</strong></h4>
<!-- /wp:heading -->

  Spam ve onaylanmamış yorumlar veritabanınızda yer kaplar. Bu yorumları kaldırmak yalnızca yorum bölümünü düzenlemeye yardımcı olmakla kalmaz, aynı zamanda veritabanı kaynaklarını da serbest bırakır. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">5.&nbsp;<strong>Geçiciler</strong></h4>
<!-- /wp:heading -->

  Geçiciler, WordPress ve eklentiler tarafından veritabanında depolanan geçici verilerdir. Geçiciler yararlı olabilirken, süresi dolan geçiciler genellikle veritabanında gereksiz yere kalır ve veritabanı şişkinliğine katkıda bulunur. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">6.&nbsp;<strong>Yetim Meta Veri</strong></h4>
<!-- /wp:heading -->

  Silinen gönderiler, yorumlar veya kullanıcılarla ilişkili meta veriler, üst öğe silindikten sonra bile veritabanında kalabilir. Yetim meta veriler zamanla birikerek veritabanını daha da şişirebilir. 
 

  Artık WordPress veritabanında yer kaplayan dosya türlerini anladığımıza göre, şimdi phpMyAdmin'i kullanarak bu dosyaları temizlemeye geçelim. 
 

<!-- wp:heading {"level":3} -->
 ### WordPress Veritabanınızı Temizlemek İçin phpMyAdmin Kullanma</h3>
<!-- /wp:heading -->

  phpMyAdmin, WordPress veritabanınızı doğrudan yönetmek için güçlü bir araçtır. Devam etmeden önce,&nbsp;<strong>WordPress veritabanınızı yedeklediğinizden emin olun</strong>&nbsp;. Bu, temizleme işlemi sırasında bir şeyler ters giderse verilerinizi kurtarabilmenizi sağlar. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Adım 1: phpMyAdmin'e erişin</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Hosting Kontrol Panelinize (cPanel) Giriş Yapın</strong> : Çoğu web barındırma sağlayıcısı cPanel aracılığıyla phpMyAdmin'e erişim sunar. Giriş yaptıktan sonra, "Veritabanları" bölümünün altında phpMyAdmin seçeneğini arayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>WordPress Veritabanınızı Seçin</strong> : phpMyAdmin'de, bir veritabanları listesi göreceksiniz. Web sitenizle ilişkili tabloları görüntülemek için WordPress veritabanınıza tıklayın.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Adım 2: Otomatik Taslakları Silme</h4>
<!-- /wp:heading -->

  Otomatik taslaklar WordPress veritabanınızın <code>wp_posts</code> tablosuna kaydedilir. Otomatik taslakları silmek için: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>phpMyAdmin arayüzünde <strong>SQL</strong> sekmesine tıklayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Otomatik taslakları silmek için aşağıdaki sorguyu çalıştırın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_posts WHERE post_status = 'auto-draft';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Sorguyu yürütmek için <strong>Git'e</strong> tıklayın .</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Bu, veritabanınızdan tüm otomatik taslak gönderilerini kaldıracaktır. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Adım 3: Gönderi Revizyonlarını Silme</h4>
<!-- /wp:heading -->

  Revizyonlar da <code>wp_posts</code> tablosunda saklanır. Gönderi revizyonlarını kaldırmak için: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>SQL</strong> sekmesine gidin .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Gönderi revizyonlarını silmek için aşağıdaki sorguyu çalıştırın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_posts WHERE post_type = 'revision';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Git'e</strong> tıklayın .</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Bu, veritabanınızdaki tüm gönderi revizyonlarını silecektir. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Adım 4: Gönderiler ve Yorumlar İçin Çöp Kutusunu Boşaltma</h4>
<!-- /wp:heading -->

  Çöp kutusuna atılan gönderileri kaldırmak için: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>SQL</strong> sekmesinde aşağıdaki sorguyu çalıştırın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_posts WHERE post_status = 'trash';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Git'e</strong> tıklayın .</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Çöp kutusuna atılan yorumları kaldırmak için: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Aşağıdaki sorguyu çalıştırın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_comments WHERE comment_approved = 'trash';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Git'e</strong> tıklayın .</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Adım 5: Spam ve Onaylanmamış Yorumları Silme</h4>
<!-- /wp:heading -->

  Spam ve onaylanmamış yorumları veritabanınızdan kaldırmak için: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>SQL</strong> sekmesinde aşağıdaki sorguyu çalıştırın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_comments WHERE comment_approved = 'spam';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Onaylanmamış yorumları silmek için şu sorguyu kullanın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_comments WHERE comment_approved = '0';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Her sorgu için <strong>Git'e</strong> tıklayın .</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Adım 6: Süresi Dolan Geçicileri Kaldırma</h4>
<!-- /wp:heading -->

  Geçici olaylar <code>wp_options</code> tablosunda saklanır . Süresi dolan geçici olayları kaldırmak için: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>SQL</strong> sekmesinde aşağıdaki sorguyu çalıştırın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_options WHERE option_name LIKE '_transient_%' AND option_value &lt; NOW();</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Git'e</strong> tıklayın .</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Bu, süresi dolmuş geçici verileri veritabanınızdan kaldıracaktır. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Adım 7: Yetim Meta Verilerin Silinmesi</h4>
<!-- /wp:heading -->

  Yetim meta veriler zamanla birikebilir. Yetim meta verileri temizlemek için: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Yetim gönderi meta verileri için şu sorguyu çalıştırın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE pm FROM wp_postmeta pm LEFT JOIN wp_posts wp ON wp.ID = pm.post_id WHERE wp.ID IS NULL;</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Yetim yorum meta verileri için şu sorguyu çalıştırın:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_commentmeta WHERE comment_id NOT IN (SELECT comment_ID FROM wp_comments);</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Her sorgu için <strong>Git'e</strong> tıklayın .</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Veritabanı Bakımı İçin En İyi Uygulamalar</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Düzenli Yedeklemeler</strong> : Herhangi bir değişiklik yapmadan önce veritabanınızı her zaman yedekleyin. Düzenli yedeklemeler planlamak da iyi bir alışkanlıktır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Veritabanı Optimizasyon Eklentileri</strong> : Temizleme sürecini otomatikleştirmek için WP-Optimize veya Advanced Database Cleaner gibi eklentileri kullanmayı düşünün. Bu eklentiler, revizyonları, spam'i, geçicileri ve diğer gereksiz verileri silmek için kullanıcı dostu yollar sunar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Gönderi Revizyonlarını Sınırla</strong> : <code>wp-config.php</code> Dosyanıza aşağıdaki satırı ekleyerek WordPress'in kaydedeceği gönderi revizyonlarının sayısını sınırlayabilirsiniz:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   define( 'WP_POST_REVISIONS', 3 );</code></pre>
<!-- /wp:code -->

  Bu, gönderi başına kaydedilen revizyon sayısını üçle sınırlar. 
 

<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Düzenli Temizlik</strong> : WordPress veritabanınızı düzenli olarak temizleyin ve dağınık hale gelmesini önleyin. Düzenli temizlikler çalıştırmak daha iyi performans ve daha verimli veritabanı yönetimi sağlar.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Sonuç</h3>
<!-- /wp:heading -->

  WordPress veritabanınızı temizlemek web sitenizin performansını önemli ölçüde iyileştirebilir, depolama kullanımını azaltabilir ve yedeklemeleri daha yönetilebilir hale getirebilir. Veritabanı bakımına yardımcı olmak için eklentiler mevcut olsa da, phpMyAdmin kullanmak daha fazla kontrol sunar ve belirli dosyaları hedeflemek için özel SQL sorguları yürütmenize olanak tanır. Otomatik taslakları, revizyonları veya geçicileri kaldırıyor olun, phpMyAdmin veritabanınızı yalın ve optimize edilmiş tutmak için güçlü bir yol sağlar. 
 

  Herhangi bir temizleme işlemi yapmadan önce veritabanınızı yedeklemeyi unutmayın ve WordPress sitenizin zaman içinde sorunsuz çalışmasını sağlamak için düzenli bakım rutinlerini göz önünde bulundurun. 
 