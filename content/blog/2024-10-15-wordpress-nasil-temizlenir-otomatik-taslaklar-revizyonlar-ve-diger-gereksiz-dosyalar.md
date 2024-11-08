---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Wordpress
date: "2024-10-15T16:57:45Z"
guid: https://www.siberoloji.com/?p=3601
id: 3601
image: /assets/images/2024/10/wordpress.webp
slim_seo:
- a:1:{s:5:"title";s:18:"wordpress clean up";}
tags:
- wordpress
title: 'WordPress Nasıl Temizlenir: Otomatik Taslaklar, Revizyonlar ve Diğer Gereksiz
  Dosyalar'
url: /tr/wordpress-nasil-temizlenir-otomatik-taslaklar-revizyonlar-ve-diger-gereksiz-dosyalar/
---

 <p>WordPress, web siteleri oluşturmak için en popüler içerik yönetim sistemlerinden (CMS) biridir. Kullanıcı dostudur, esnektir ve çok çeşitli web sitesi türlerini idare edebilir. Ancak zamanla WordPress veritabanınız, otomatik taslaklar, gönderi revizyonları, çöpe atılan öğeler ve diğer gereksiz dosyalar gibi karmaşa biriktirebilir. Bu şişkinlik web sitenizi yavaşlatabilir, daha az verimli ve yönetilmesi daha zor hale getirebilir.</p>
 

 <p>Bu blog yazısında, otomatik taslakları, revizyonları ve diğer gereksiz dosyaları kaldırarak WordPress sitenizi nasıl temizleyeceğinizi göstereceğiz. Sitenizi temiz tutmak, performansı artırmaya, veritabanı boyutunu azaltmaya ve yönetmeyi kolaylaştırmaya yardımcı olacaktır. Ayrıntılara dalalım.</p>
 

 
 ## WordPress İçin Temizlik Neden Önemlidir</h2>
<!-- /wp:heading -->

 <p>Temizleme sürecine dalmadan önce, WordPress sitenizi temizlemenin sağlığı ve performansı açısından neden önemli olduğunu anlamak önemlidir. İşte nedeni:</p>
 

<!-- wp:heading {"level":3} -->
 ### 1.&nbsp;<strong>Geliştirilmiş Site Hızı</strong></h3>
<!-- /wp:heading -->

 <p>Bir kullanıcı web sitenizi her ziyaret ettiğinde, sunucunun WordPress veritabanından bilgi çekmesi gerekir. Veritabanınız eski revizyonlar ve otomatik taslaklar gibi gereksiz verilerle doluysa, sunucunun gerekli bilgileri alması daha uzun sürer ve bu da web sitenizi yavaşlatabilir. Bu dosyaları temizlemek, veritabanı sorgularının ve dolayısıyla web sitenizin hızlanmasına yardımcı olur.</p>
 

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Veritabanı Boyutunun Azaltılması</strong></h3>
<!-- /wp:heading -->

 <p>Gönderi ve sayfalar yayınladığınızda, WordPress içeriğinizin birden fazla sürümünü ve taslağını kaydeder ve bu da veritabanınızda yer kaplayabilir. Zamanla bu, önemli bir şişkinliğe yol açabilir. Revizyonları ve taslakları temizleyerek, WordPress veritabanınızın boyutunu önemli ölçüde azaltabilir, yönetmeyi ve yedeklemeyi kolaylaştırabilirsiniz.</p>
 

<!-- wp:heading {"level":3} -->
 ### 3.&nbsp;<strong>Gelişmiş Web Sitesi Performansı</strong></h3>
<!-- /wp:heading -->

 <p> Web sitesi hızı, kullanıcı deneyimi ve SEO sıralamalarında önemli bir faktördür . Dağınık bir veritabanı, daha uzun yükleme sürelerine yol açabilir ve bu da Google gibi  arama motorlarındaki sıralamanızı olumsuz etkileyebilir . Veritabanınızı temiz tutmak, optimum performansı garanti eder.</p>
 

<!-- wp:heading {"level":3} -->
 ### 4.&nbsp;<strong>Daha Az Hata ve Veritabanı Bozulması Riskleri</strong></h3>
<!-- /wp:heading -->

 <p>Şişkin bir veritabanı, veritabanı hataları veya bozulma olasılığını artırabilir ve bu da web sitenizde sorunlara yol açabilir. Düzenli temizlik, bu riskleri azaltmaya yardımcı olur ve web sitenizin sorunsuz çalışmasını sağlar.</p>
 

 
 ## WordPress'teki Yaygın Karmaşa Türleri</h2>
<!-- /wp:heading -->

 <p>Artık WordPress'i temizlemenin neden önemli olduğunu anladığınıza göre, zamanla biriken yaygın dağınıklık türlerine bakalım:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Otomatik Taslaklar:</strong> Bunlar, bir gönderi veya sayfa üzerinde çalışırken veri kaybını önlemek için WordPress tarafından otomatik olarak oluşturulan geçici taslaklardır. Zamanla, kullanılmayan otomatik taslaklar birikebilir ve yer kaplayabilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Gönderi Revizyonları:</strong> WordPress, bir gönderiyi veya sayfayı her güncellediğinizde yeni bir revizyon kaydeder. Revizyonlar faydalı olabilirken, çok fazla revizyon veritabanınızı tıkayabilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Çöp Kutusuna Atılan Gönderiler ve Sayfalar:</strong> Çöp kutusuna taşıdığınız ancak kalıcı olarak silmediğiniz gönderiler veya sayfalar, siz bunları manuel olarak kaldırana kadar veritabanınızda kalır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kullanılmayan Medya Dosyaları:</strong> Zamanla, WordPress medya kitaplığınız artık kullanılmayan resimler, videolar ve diğer medya dosyalarıyla dolabilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Spam ve Onaylanmamış Yorumlar:</strong> Bu yorumlar hızla birikebilir ve ilgilenilmezse veritabanınızdaki karmaşaya yol açabilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## WordPress'te Otomatik Taslaklar ve Revizyonlar Nasıl Temizlenir</h2>
<!-- /wp:heading -->

 <p>İşte WordPress sitenizi temizlemeye yönelik adım adım bir kılavuz; otomatik taslaklar ve revizyonlarla başlayarak.</p>
 

<!-- wp:heading {"level":3} -->
 ### 1.&nbsp;<strong>WordPress Kontrol Paneli Üzerinden Manuel Temizleme</strong></h3>
<!-- /wp:heading -->

 <p>WordPress, panonuzdan otomatik taslakları, revizyonları ve çöpe atılan öğeleri manuel olarak silmenize olanak tanır. Bu yöntem basittir ancak çok sayıda gönderiniz varsa zaman alıcı olabilir.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Otomatik Taslakları ve Revizyonları Manuel Olarak Silme Adımları:</h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Otomatik Taslakları Sil:</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>WordPress panonuzdaki “Yazılar” bölümüne gidin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>“Taslaklar” sekmesini seçin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Taslakları inceleyin ve artık ihtiyaç duymadıklarınızı çöp kutusuna taşıyarak silin.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Revizyonları Sil:</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Editörde bir gönderi veya sayfa açın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>“Gönderi” panelinde “Revizyonlar” bölümünü bulun.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Her revizyonu inceleyin ve eski bir sürümü seçip "Geri Yükle"ye tıklayarak ihtiyaç duyulmayanları manuel olarak silin.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Çöp Kutusunu Boşaltın:</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Taslakları veya düzeltmeleri çöp kutusuna taşıdıktan sonra “Gönderiler” &gt; “Tüm Gönderiler” &gt; “Çöp Kutusu”na gidin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Tüm öğeleri kalıcı olarak silmek için “Çöp Kutusunu Boşalt”a tıklayın.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 <p>Bu yöntem işe yarar, ancak daha büyük siteler için verimli değildir. Yüzlerce veya binlerce gönderi içeren bir siteyi yönetiyorsanız, bir eklenti veya daha otomatik bir yöntem kullanmak size önemli ölçüde zaman ve emek kazandıracaktır.</p>
 

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Verimli Temizlik İçin Eklentileri Kullanma</strong></h3>
<!-- /wp:heading -->

 <p>WordPress veritabanınız çok sayıda otomatik taslak, revizyon ve diğer gereksiz şeylerle şişmişse, bir temizleme eklentisi kullanmak en etkili seçenektir. Kullanabileceğiniz bazı popüler eklentiler şunlardır:</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">a.&nbsp;<strong>WP-Optimize</strong></h4>
<!-- /wp:heading -->

 <p>WP-Optimize, en yaygın kullanılan WordPress temizleme eklentilerinden biridir. Veritabanınızı optimize etmenize, görselleri sıkıştırmanıza ve hatta daha hızlı performans için web sitenizi önbelleğe almanıza yardımcı olabilir.</p>
 

 <p><strong>WP-Optimize ile Otomatik Taslakları ve Revizyonları Temizleme Adımları:</strong></p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>WP-Optimize</strong> eklentisini kurun ve etkinleştirin .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>WordPress kontrol panelinizde “WP-Optimize”a gidin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>"Veritabanı" sekmesi altında revizyonları temizleme, otomatik taslaklar, çöp kutusuna atılan öğeler ve daha fazlası için seçenekler göreceksiniz.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Temizlemek istediğiniz öğeleri seçin ve “Optimizasyonu Çalıştır”a tıklayın.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 <p>Eklenti, seçili tüm veritabanı tablolarını otomatik olarak temizleyecek ve bu sayede işlem hızlı ve zahmetsiz hale gelecektir.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">b. <strong>Advanced Database Cleaner</strong></h4>
<!-- /wp:heading -->

 <p>Advanced Database Cleaner, WordPress veritabanınızı temizlemeye odaklanan bir diğer mükemmel eklentidir. Sadece otomatik taslakları ve revizyonları kaldırmakla kalmaz, aynı zamanda performansı iyileştirmek için veritabanı tablolarınızı da optimize eder.</p>
 

 <p><strong>Advanced Database Cleaner'ı Kullanma Adımları:</strong></p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Eklentiyi WordPress Eklenti Deposundan kurun ve etkinleştirin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Pano’da “WP DB Cleaner”a gidin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Otomatik temizlemeleri planlayabilir veya revizyonlar, taslaklar ve yorumlar gibi öğelerin silinmesini manuel olarak seçebilirsiniz.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Seçili öğeleri kaldırmak için “Temizle”ye tıklayın.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 <p>Eklenti ayrıca düzenli temizlikler planlamanıza da olanak tanır, böylece veritabanınız zaman içinde optimize edilmiş kalır.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">c. <strong>WP-Sweep</strong></h4>
<!-- /wp:heading -->

 <p>WP-Sweep, WordPress veritabanınızı temizlemek için bir diğer etkili eklentidir. Otomatik taslakları, gönderi revizyonlarını, kullanılmayan terimleri ve hatta yetim gönderi meta verilerini kaldırmaya yardımcı olur.</p>
 

 <p><strong>WP-Sweep'i Kullanma Adımları:</strong></p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Eklentiyi kurun ve etkinleştirin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>“Araçlar” &gt; “Süpürme” bölümüne gidin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Düzeltmeler, taslaklar, çöpe atılan gönderiler ve daha fazlası gibi çeşitli öğeler göreceksiniz.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Temizlemek istediğiniz her kategorinin yanındaki “Süpür” butonuna tıklayın.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 <p>Eklenti seçili öğeleri otomatik olarak kaldıracak ve veritabanınızı yalın ve optimize edilmiş halde tutacaktır.</p>
 

 
 ## Otomatik Taslakları ve Revizyonları Yönetmek İçin En İyi Uygulamalar</h2>
<!-- /wp:heading -->

 <p>Sitenizi temizlemek önemli olsa da, ilk etapta dağınıklığın oluşmasını önlemek için atabileceğiniz adımlar vardır.</p>
 

<!-- wp:heading {"level":3} -->
 ### 1.&nbsp;<strong>Gönderi Revizyonlarını Sınırla</strong></h3>
<!-- /wp:heading -->

 <p>Varsayılan olarak, WordPress her gönderi veya sayfa için sınırsız sayıda revizyon depolar.  <code>wp-config.php</code> bir satır kod ekleyerek WordPress'in tuttuğu revizyon sayısını sınırlayabilirsiniz.</p>
 

 <p>Gönderi revizyonlarını nasıl sınırlayacağınız aşağıda açıklanmıştır:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><code>wp-config.php</code> Dosyanızı açın (WordPress kurulumunuzun kök dizininde bulunur).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Aşağıdaki kod satırını ekleyin:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   define('WP_POST_REVISIONS', 3);</code></pre>
<!-- /wp:code -->

 <p>Bu, gönderi revizyonlarının sayısını 3 ile sınırlayacaktır. Bu sayıyı tercihlerinize göre ayarlayabilirsiniz.</p>
 

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Otomatik Taslakları ve Revizyonları Devre Dışı Bırakın</strong></h3>
<!-- /wp:heading -->

 <p>WordPress'in taslakları ve revizyonları otomatik olarak kaydetmesini istemiyorsanız, <code>wp-config.php</code> dosyanıza şu kodu ekleyerek bu özelliği devre dışı bırakabilirsiniz :</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">define('AUTOSAVE_INTERVAL', 86400); // Auto-save every 24 hours (basically disables it)
define('WP_POST_REVISIONS', false); // Disables revisions</code></pre>
<!-- /wp:code -->

 <p>Bu yöntem, revizyonlara ihtiyacınız olmayacağından emin olmadığınız sürece önerilmez; çünkü bir gönderinin önceki bir sürümüne geri dönmeniz gerektiğinde faydalı olabilirler.</p>
 

<!-- wp:heading {"level":3} -->
 ### 3.&nbsp;<strong>Düzenli Temizlikler Planlayın</strong></h3>
<!-- /wp:heading -->

 <p>WP-Optimize veya Advanced Database Cleaner gibi bir eklenti kullanıyorsanız, veritabanınızı düzenli aralıklarla (örneğin, haftalık veya aylık) otomatik olarak temizlemek için zamanlama özelliklerinden yararlanın. Bu şekilde, siteniz manuel müdahale olmadan optimize edilmiş halde kalır.</p>
 

 
 ## Sonuç</h2>
<!-- /wp:heading -->

 <p>WordPress'teki otomatik taslakları, revizyonları ve diğer gereksiz karmaşayı temizlemek web sitesi bakımının önemli bir yönüdür. Temiz bir veritabanı performansı artırır, kullanıcı deneyimini iyileştirir ve  SEO sıralamanızı yükseltir. Taslakları ve revizyonları manuel olarak silmeyi veya işlemi otomatikleştirmek için bir eklenti kullanmayı seçseniz de, düzenli temizlikler WordPress sitenizin sorunsuz çalışmasını sağlayacaktır.</p>
 

 <p>Yukarıda özetlenen adımları izleyerek ve revizyonları sınırlama ve temizlemeleri planlama gibi en iyi uygulamaları benimseyerek, hızlı ve verimli bir WordPress web sitesi sürdürebilirsiniz.</p>
 