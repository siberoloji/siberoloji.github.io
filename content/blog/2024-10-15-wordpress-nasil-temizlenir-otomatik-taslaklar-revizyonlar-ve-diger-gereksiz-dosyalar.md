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

 <p>WordPress, web siteleri oluşturmak için en popüler içerik yönetim sistemlerinden (CMS) biridir. Kullanıcı dostudur, esnektir ve çok çeşitli web sitesi türlerini idare edebilir. Ancak zamanla WordPress veritabanınız, otomatik taslaklar, gönderi revizyonları, çöpe atılan öğeler ve diğer gereksiz dosyalar gibi karmaşa biriktirebilir. Bu şişkinlik web sitenizi yavaşlatabilir, daha az verimli ve yönetilmesi daha zor hale getirebilir.
 

 <p>Bu blog yazısında, otomatik taslakları, revizyonları ve diğer gereksiz dosyaları kaldırarak WordPress sitenizi nasıl temizleyeceğinizi göstereceğiz. Sitenizi temiz tutmak, performansı artırmaya, veritabanı boyutunu azaltmaya ve yönetmeyi kolaylaştırmaya yardımcı olacaktır. Ayrıntılara dalalım.
 

 
 ## WordPress İçin Temizlik Neden Önemlidir
<!-- /wp:heading -->

 <p>Temizleme sürecine dalmadan önce, WordPress sitenizi temizlemenin sağlığı ve performansı açısından neden önemli olduğunu anlamak önemlidir. İşte nedeni:
 


 ### 1.&nbsp;***Geliştirilmiş Site Hızı*** 
<!-- /wp:heading -->

 <p>Bir kullanıcı web sitenizi her ziyaret ettiğinde, sunucunun WordPress veritabanından bilgi çekmesi gerekir. Veritabanınız eski revizyonlar ve otomatik taslaklar gibi gereksiz verilerle doluysa, sunucunun gerekli bilgileri alması daha uzun sürer ve bu da web sitenizi yavaşlatabilir. Bu dosyaları temizlemek, veritabanı sorgularının ve dolayısıyla web sitenizin hızlanmasına yardımcı olur.
 


 ### 2.&nbsp;***Veritabanı Boyutunun Azaltılması*** 
<!-- /wp:heading -->

 <p>Gönderi ve sayfalar yayınladığınızda, WordPress içeriğinizin birden fazla sürümünü ve taslağını kaydeder ve bu da veritabanınızda yer kaplayabilir. Zamanla bu, önemli bir şişkinliğe yol açabilir. Revizyonları ve taslakları temizleyerek, WordPress veritabanınızın boyutunu önemli ölçüde azaltabilir, yönetmeyi ve yedeklemeyi kolaylaştırabilirsiniz.
 


 ### 3.&nbsp;***Gelişmiş Web Sitesi Performansı*** 
<!-- /wp:heading -->

 <p> Web sitesi hızı, kullanıcı deneyimi ve SEO sıralamalarında önemli bir faktördür . Dağınık bir veritabanı, daha uzun yükleme sürelerine yol açabilir ve bu da Google gibi  arama motorlarındaki sıralamanızı olumsuz etkileyebilir . Veritabanınızı temiz tutmak, optimum performansı garanti eder.
 


 ### 4.&nbsp;***Daha Az Hata ve Veritabanı Bozulması Riskleri*** 
<!-- /wp:heading -->

 <p>Şişkin bir veritabanı, veritabanı hataları veya bozulma olasılığını artırabilir ve bu da web sitenizde sorunlara yol açabilir. Düzenli temizlik, bu riskleri azaltmaya yardımcı olur ve web sitenizin sorunsuz çalışmasını sağlar.
 

 
 ## WordPress'teki Yaygın Karmaşa Türleri
<!-- /wp:heading -->

 <p>Artık WordPress'i temizlemenin neden önemli olduğunu anladığınıza göre, zamanla biriken yaygın dağınıklık türlerine bakalım:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Otomatik Taslaklar:***  Bunlar, bir gönderi veya sayfa üzerinde çalışırken veri kaybını önlemek için WordPress tarafından otomatik olarak oluşturulan geçici taslaklardır. Zamanla, kullanılmayan otomatik taslaklar birikebilir ve yer kaplayabilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Gönderi Revizyonları:***  WordPress, bir gönderiyi veya sayfayı her güncellediğinizde yeni bir revizyon kaydeder. Revizyonlar faydalı olabilirken, çok fazla revizyon veritabanınızı tıkayabilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Çöp Kutusuna Atılan Gönderiler ve Sayfalar:***  Çöp kutusuna taşıdığınız ancak kalıcı olarak silmediğiniz gönderiler veya sayfalar, siz bunları manuel olarak kaldırana kadar veritabanınızda kalır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Kullanılmayan Medya Dosyaları:***  Zamanla, WordPress medya kitaplığınız artık kullanılmayan resimler, videolar ve diğer medya dosyalarıyla dolabilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Spam ve Onaylanmamış Yorumlar:***  Bu yorumlar hızla birikebilir ve ilgilenilmezse veritabanınızdaki karmaşaya yol açabilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## WordPress'te Otomatik Taslaklar ve Revizyonlar Nasıl Temizlenir
<!-- /wp:heading -->

 <p>İşte WordPress sitenizi temizlemeye yönelik adım adım bir kılavuz; otomatik taslaklar ve revizyonlarla başlayarak.
 


 ### 1.&nbsp;***WordPress Kontrol Paneli Üzerinden Manuel Temizleme*** 
<!-- /wp:heading -->

 <p>WordPress, panonuzdan otomatik taslakları, revizyonları ve çöpe atılan öğeleri manuel olarak silmenize olanak tanır. Bu yöntem basittir ancak çok sayıda gönderiniz varsa zaman alıcı olabilir.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Otomatik Taslakları ve Revizyonları Manuel Olarak Silme Adımları: 
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Otomatik Taslakları Sil:***  
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- WordPress panonuzdaki “Yazılar” bölümüne gidin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- “Taslaklar” sekmesini seçin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Taslakları inceleyin ve artık ihtiyaç duymadıklarınızı çöp kutusuna taşıyarak silin. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Revizyonları Sil:***  
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Editörde bir gönderi veya sayfa açın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- “Gönderi” panelinde “Revizyonlar” bölümünü bulun. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Her revizyonu inceleyin ve eski bir sürümü seçip "Geri Yükle"ye tıklayarak ihtiyaç duyulmayanları manuel olarak silin. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Çöp Kutusunu Boşaltın:***  
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Taslakları veya düzeltmeleri çöp kutusuna taşıdıktan sonra “Gönderiler” &gt; “Tüm Gönderiler” &gt; “Çöp Kutusu”na gidin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Tüm öğeleri kalıcı olarak silmek için “Çöp Kutusunu Boşalt”a tıklayın. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 <p>Bu yöntem işe yarar, ancak daha büyük siteler için verimli değildir. Yüzlerce veya binlerce gönderi içeren bir siteyi yönetiyorsanız, bir eklenti veya daha otomatik bir yöntem kullanmak size önemli ölçüde zaman ve emek kazandıracaktır.
 


 ### 2.&nbsp;***Verimli Temizlik İçin Eklentileri Kullanma*** 
<!-- /wp:heading -->

 <p>WordPress veritabanınız çok sayıda otomatik taslak, revizyon ve diğer gereksiz şeylerle şişmişse, bir temizleme eklentisi kullanmak en etkili seçenektir. Kullanabileceğiniz bazı popüler eklentiler şunlardır:
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">a.&nbsp;***WP-Optimize***  
<!-- /wp:heading -->

 <p>WP-Optimize, en yaygın kullanılan WordPress temizleme eklentilerinden biridir. Veritabanınızı optimize etmenize, görselleri sıkıştırmanıza ve hatta daha hızlı performans için web sitenizi önbelleğe almanıza yardımcı olabilir.
 

 <p>***WP-Optimize ile Otomatik Taslakları ve Revizyonları Temizleme Adımları:*** 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***WP-Optimize***  eklentisini kurun ve etkinleştirin . 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- WordPress kontrol panelinizde “WP-Optimize”a gidin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- "Veritabanı" sekmesi altında revizyonları temizleme, otomatik taslaklar, çöp kutusuna atılan öğeler ve daha fazlası için seçenekler göreceksiniz. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Temizlemek istediğiniz öğeleri seçin ve “Optimizasyonu Çalıştır”a tıklayın. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 <p>Eklenti, seçili tüm veritabanı tablolarını otomatik olarak temizleyecek ve bu sayede işlem hızlı ve zahmetsiz hale gelecektir.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">b. ***Advanced Database Cleaner***  
<!-- /wp:heading -->

 <p>Advanced Database Cleaner, WordPress veritabanınızı temizlemeye odaklanan bir diğer mükemmel eklentidir. Sadece otomatik taslakları ve revizyonları kaldırmakla kalmaz, aynı zamanda performansı iyileştirmek için veritabanı tablolarınızı da optimize eder.
 

 <p>***Advanced Database Cleaner'ı Kullanma Adımları:*** 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Eklentiyi WordPress Eklenti Deposundan kurun ve etkinleştirin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Pano’da “WP DB Cleaner”a gidin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Otomatik temizlemeleri planlayabilir veya revizyonlar, taslaklar ve yorumlar gibi öğelerin silinmesini manuel olarak seçebilirsiniz. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Seçili öğeleri kaldırmak için “Temizle”ye tıklayın. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 <p>Eklenti ayrıca düzenli temizlikler planlamanıza da olanak tanır, böylece veritabanınız zaman içinde optimize edilmiş kalır.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">c. ***WP-Sweep***  
<!-- /wp:heading -->

 <p>WP-Sweep, WordPress veritabanınızı temizlemek için bir diğer etkili eklentidir. Otomatik taslakları, gönderi revizyonlarını, kullanılmayan terimleri ve hatta yetim gönderi meta verilerini kaldırmaya yardımcı olur.
 

 <p>***WP-Sweep'i Kullanma Adımları:*** 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Eklentiyi kurun ve etkinleştirin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- “Araçlar” &gt; “Süpürme” bölümüne gidin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Düzeltmeler, taslaklar, çöpe atılan gönderiler ve daha fazlası gibi çeşitli öğeler göreceksiniz. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Temizlemek istediğiniz her kategorinin yanındaki “Süpür” butonuna tıklayın. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 <p>Eklenti seçili öğeleri otomatik olarak kaldıracak ve veritabanınızı yalın ve optimize edilmiş halde tutacaktır.
 

 
 ## Otomatik Taslakları ve Revizyonları Yönetmek İçin En İyi Uygulamalar
<!-- /wp:heading -->

 <p>Sitenizi temizlemek önemli olsa da, ilk etapta dağınıklığın oluşmasını önlemek için atabileceğiniz adımlar vardır.
 


 ### 1.&nbsp;***Gönderi Revizyonlarını Sınırla*** 
<!-- /wp:heading -->

 <p>Varsayılan olarak, WordPress her gönderi veya sayfa için sınırsız sayıda revizyon depolar.  <code>wp-config.php</code> bir satır kod ekleyerek WordPress'in tuttuğu revizyon sayısını sınırlayabilirsiniz.
 

 <p>Gönderi revizyonlarını nasıl sınırlayacağınız aşağıda açıklanmıştır:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- <code>wp-config.php</code> Dosyanızı açın (WordPress kurulumunuzun kök dizininde bulunur). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Aşağıdaki kod satırını ekleyin: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   define('WP_POST_REVISIONS', 3);</code></pre>
<!-- /wp:code -->

 <p>Bu, gönderi revizyonlarının sayısını 3 ile sınırlayacaktır. Bu sayıyı tercihlerinize göre ayarlayabilirsiniz.
 


 ### 2.&nbsp;***Otomatik Taslakları ve Revizyonları Devre Dışı Bırakın*** 
<!-- /wp:heading -->

 <p>WordPress'in taslakları ve revizyonları otomatik olarak kaydetmesini istemiyorsanız, <code>wp-config.php</code> dosyanıza şu kodu ekleyerek bu özelliği devre dışı bırakabilirsiniz :
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">define('AUTOSAVE_INTERVAL', 86400); // Auto-save every 24 hours (basically disables it)
define('WP_POST_REVISIONS', false); // Disables revisions</code></pre>
<!-- /wp:code -->

 <p>Bu yöntem, revizyonlara ihtiyacınız olmayacağından emin olmadığınız sürece önerilmez; çünkü bir gönderinin önceki bir sürümüne geri dönmeniz gerektiğinde faydalı olabilirler.
 


 ### 3.&nbsp;***Düzenli Temizlikler Planlayın*** 
<!-- /wp:heading -->

 <p>WP-Optimize veya Advanced Database Cleaner gibi bir eklenti kullanıyorsanız, veritabanınızı düzenli aralıklarla (örneğin, haftalık veya aylık) otomatik olarak temizlemek için zamanlama özelliklerinden yararlanın. Bu şekilde, siteniz manuel müdahale olmadan optimize edilmiş halde kalır.
 

 
 ## Sonuç
<!-- /wp:heading -->

 <p>WordPress'teki otomatik taslakları, revizyonları ve diğer gereksiz karmaşayı temizlemek web sitesi bakımının önemli bir yönüdür. Temiz bir veritabanı performansı artırır, kullanıcı deneyimini iyileştirir ve  SEO sıralamanızı yükseltir. Taslakları ve revizyonları manuel olarak silmeyi veya işlemi otomatikleştirmek için bir eklenti kullanmayı seçseniz de, düzenli temizlikler WordPress sitenizin sorunsuz çalışmasını sağlayacaktır.
 

 <p>Yukarıda özetlenen adımları izleyerek ve revizyonları sınırlama ve temizlemeleri planlama gibi en iyi uygulamaları benimseyerek, hızlı ve verimli bir WordPress web sitesi sürdürebilirsiniz.
 