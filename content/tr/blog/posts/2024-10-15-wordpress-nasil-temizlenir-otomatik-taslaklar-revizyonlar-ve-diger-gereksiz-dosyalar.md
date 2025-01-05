---
draft: false

title:  'WordPress Nasıl Temizlenir: Otomatik Taslaklar, Revizyonlar ve Diğer Gereksiz Dosyalar'
date: '2024-10-15T16:57:45+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/wordpress-nasil-temizlenir-otomatik-taslaklar-revizyonlar-ve-diger-gereksiz-dosyalar/
slim_seo:
    - 'a:1:{s:5:"title";s:18:"wordpress clean up";}'
featured_image: /images/wordpress.webp
categories:
    - Wordpress
tags:
    - wordpress
---


WordPress, web siteleri oluşturmak için en popüler içerik yönetim sistemlerinden (CMS) biridir. Kullanıcı dostudur, esnektir ve çok çeşitli web sitesi türlerini idare edebilir. Ancak zamanla WordPress veritabanınız, otomatik taslaklar, gönderi revizyonları, çöpe atılan öğeler ve diğer gereksiz dosyalar gibi karmaşa biriktirebilir. Bu şişkinlik web sitenizi yavaşlatabilir, daha az verimli ve yönetilmesi daha zor hale getirebilir.



Bu blog yazısında, otomatik taslakları, revizyonları ve diğer gereksiz dosyaları kaldırarak WordPress sitenizi nasıl temizleyeceğinizi göstereceğiz. Sitenizi temiz tutmak, performansı artırmaya, veritabanı boyutunu azaltmaya ve yönetmeyi kolaylaştırmaya yardımcı olacaktır. Ayrıntılara dalalım.



## WordPress İçin Temizlik Neden Önemlidir



Temizleme sürecine dalmadan önce, WordPress sitenizi temizlemenin sağlığı ve performansı açısından neden önemli olduğunu anlamak önemlidir. İşte nedeni:



1. **Geliştirilmiş Site Hızı**



Bir kullanıcı web sitenizi her ziyaret ettiğinde, sunucunun WordPress veritabanından bilgi çekmesi gerekir. Veritabanınız eski revizyonlar ve otomatik taslaklar gibi gereksiz verilerle doluysa, sunucunun gerekli bilgileri alması daha uzun sürer ve bu da web sitenizi yavaşlatabilir. Bu dosyaları temizlemek, veritabanı sorgularının ve dolayısıyla web sitenizin hızlanmasına yardımcı olur.



2. **Veritabanı Boyutunun Azaltılması**



Gönderi ve sayfalar yayınladığınızda, WordPress içeriğinizin birden fazla sürümünü ve taslağını kaydeder ve bu da veritabanınızda yer kaplayabilir. Zamanla bu, önemli bir şişkinliğe yol açabilir. Revizyonları ve taslakları temizleyerek, WordPress veritabanınızın boyutunu önemli ölçüde azaltabilir, yönetmeyi ve yedeklemeyi kolaylaştırabilirsiniz.



3. **Gelişmiş Web Sitesi Performansı**



 Web sitesi hızı, kullanıcı deneyimi ve SEO sıralamalarında önemli bir faktördür . Dağınık bir veritabanı, daha uzun yükleme sürelerine yol açabilir ve bu da Google gibi  arama motorlarındaki sıralamanızı olumsuz etkileyebilir . Veritabanınızı temiz tutmak, optimum performansı garanti eder.



4. **Daha Az Hata ve Veritabanı Bozulması Riskleri**



Şişkin bir veritabanı, veritabanı hataları veya bozulma olasılığını artırabilir ve bu da web sitenizde sorunlara yol açabilir. Düzenli temizlik, bu riskleri azaltmaya yardımcı olur ve web sitenizin sorunsuz çalışmasını sağlar.



## WordPress'teki Yaygın Karmaşa Türleri



Artık WordPress'i temizlemenin neden önemli olduğunu anladığınıza göre, zamanla biriken yaygın dağınıklık türlerine bakalım:


* **Otomatik Taslaklar:** Bunlar, bir gönderi veya sayfa üzerinde çalışırken veri kaybını önlemek için WordPress tarafından otomatik olarak oluşturulan geçici taslaklardır. Zamanla, kullanılmayan otomatik taslaklar birikebilir ve yer kaplayabilir.

* **Gönderi Revizyonları:** WordPress, bir gönderiyi veya sayfayı her güncellediğinizde yeni bir revizyon kaydeder. Revizyonlar faydalı olabilirken, çok fazla revizyon veritabanınızı tıkayabilir.

* **Çöp Kutusuna Atılan Gönderiler ve Sayfalar:** Çöp kutusuna taşıdığınız ancak kalıcı olarak silmediğiniz gönderiler veya sayfalar, siz bunları manuel olarak kaldırana kadar veritabanınızda kalır.

* **Kullanılmayan Medya Dosyaları:** Zamanla, WordPress medya kitaplığınız artık kullanılmayan resimler, videolar ve diğer medya dosyalarıyla dolabilir.

* **Spam ve Onaylanmamış Yorumlar:** Bu yorumlar hızla birikebilir ve ilgilenilmezse veritabanınızdaki karmaşaya yol açabilir.




## WordPress'te Otomatik Taslaklar ve Revizyonlar Nasıl Temizlenir



İşte WordPress sitenizi temizlemeye yönelik adım adım bir kılavuz; otomatik taslaklar ve revizyonlarla başlayarak.



1. **WordPress Kontrol Paneli Üzerinden Manuel Temizleme**



WordPress, panonuzdan otomatik taslakları, revizyonları ve çöpe atılan öğeleri manuel olarak silmenize olanak tanır. Bu yöntem basittir ancak çok sayıda gönderiniz varsa zaman alıcı olabilir.


#### Otomatik Taslakları ve Revizyonları Manuel Olarak Silme Adımları:


* **Otomatik Taslakları Sil:**



* WordPress panonuzdaki “Yazılar” bölümüne gidin.

* “Taslaklar” sekmesini seçin.

* Taslakları inceleyin ve artık ihtiyaç duymadıklarınızı çöp kutusuna taşıyarak silin.



* **Revizyonları Sil:**



* Editörde bir gönderi veya sayfa açın.

* “Gönderi” panelinde “Revizyonlar” bölümünü bulun.

* Her revizyonu inceleyin ve eski bir sürümü seçip "Geri Yükle"ye tıklayarak ihtiyaç duyulmayanları manuel olarak silin.



* **Çöp Kutusunu Boşaltın:**



* Taslakları veya düzeltmeleri çöp kutusuna taşıdıktan sonra “Gönderiler” &gt; “Tüm Gönderiler” &gt; “Çöp Kutusu”na gidin.

* Tüm öğeleri kalıcı olarak silmek için “Çöp Kutusunu Boşalt”a tıklayın.




Bu yöntem işe yarar, ancak daha büyük siteler için verimli değildir. Yüzlerce veya binlerce gönderi içeren bir siteyi yönetiyorsanız, bir eklenti veya daha otomatik bir yöntem kullanmak size önemli ölçüde zaman ve emek kazandıracaktır.



2. **Verimli Temizlik İçin Eklentileri Kullanma**



WordPress veritabanınız çok sayıda otomatik taslak, revizyon ve diğer gereksiz şeylerle şişmişse, bir temizleme eklentisi kullanmak en etkili seçenektir. Kullanabileceğiniz bazı popüler eklentiler şunlardır:


#### a. **WP-Optimize**



WP-Optimize, en yaygın kullanılan WordPress temizleme eklentilerinden biridir. Veritabanınızı optimize etmenize, görselleri sıkıştırmanıza ve hatta daha hızlı performans için web sitenizi önbelleğe almanıza yardımcı olabilir.



**WP-Optimize ile Otomatik Taslakları ve Revizyonları Temizleme Adımları:**


* **WP-Optimize** eklentisini kurun ve etkinleştirin .

* WordPress kontrol panelinizde “WP-Optimize”a gidin.

* "Veritabanı" sekmesi altında revizyonları temizleme, otomatik taslaklar, çöp kutusuna atılan öğeler ve daha fazlası için seçenekler göreceksiniz.

* Temizlemek istediğiniz öğeleri seçin ve “Optimizasyonu Çalıştır”a tıklayın.




Eklenti, seçili tüm veritabanı tablolarını otomatik olarak temizleyecek ve bu sayede işlem hızlı ve zahmetsiz hale gelecektir.


#### b. **Advanced Database Cleaner**



Advanced Database Cleaner, WordPress veritabanınızı temizlemeye odaklanan bir diğer mükemmel eklentidir. Sadece otomatik taslakları ve revizyonları kaldırmakla kalmaz, aynı zamanda performansı iyileştirmek için veritabanı tablolarınızı da optimize eder.



**Advanced Database Cleaner'ı Kullanma Adımları:**


* Eklentiyi WordPress Eklenti Deposundan kurun ve etkinleştirin.

* Pano’da “WP DB Cleaner”a gidin.

* Otomatik temizlemeleri planlayabilir veya revizyonlar, taslaklar ve yorumlar gibi öğelerin silinmesini manuel olarak seçebilirsiniz.

* Seçili öğeleri kaldırmak için “Temizle”ye tıklayın.




Eklenti ayrıca düzenli temizlikler planlamanıza da olanak tanır, böylece veritabanınız zaman içinde optimize edilmiş kalır.


#### c. **WP-Sweep**



WP-Sweep, WordPress veritabanınızı temizlemek için bir diğer etkili eklentidir. Otomatik taslakları, gönderi revizyonlarını, kullanılmayan terimleri ve hatta yetim gönderi meta verilerini kaldırmaya yardımcı olur.



**WP-Sweep'i Kullanma Adımları:**


* Eklentiyi kurun ve etkinleştirin.

* “Araçlar” &gt; “Süpürme” bölümüne gidin.

* Düzeltmeler, taslaklar, çöpe atılan gönderiler ve daha fazlası gibi çeşitli öğeler göreceksiniz.

* Temizlemek istediğiniz her kategorinin yanındaki “Süpür” butonuna tıklayın.




Eklenti seçili öğeleri otomatik olarak kaldıracak ve veritabanınızı yalın ve optimize edilmiş halde tutacaktır.



## Otomatik Taslakları ve Revizyonları Yönetmek İçin En İyi Uygulamalar



Sitenizi temizlemek önemli olsa da, ilk etapta dağınıklığın oluşmasını önlemek için atabileceğiniz adımlar vardır.



1. **Gönderi Revizyonlarını Sınırla**



Varsayılan olarak, WordPress her gönderi veya sayfa için sınırsız sayıda revizyon depolar.  `wp-config.php` bir satır kod ekleyerek WordPress'in tuttuğu revizyon sayısını sınırlayabilirsiniz.



Gönderi revizyonlarını nasıl sınırlayacağınız aşağıda açıklanmıştır:


* `wp-config.php` Dosyanızı açın (WordPress kurulumunuzun kök dizininde bulunur).

* Aşağıdaki kod satırını ekleyin:



```bash
   define('WP_POST_REVISIONS', 3);
```



Bu, gönderi revizyonlarının sayısını 3 ile sınırlayacaktır. Bu sayıyı tercihlerinize göre ayarlayabilirsiniz.



2. **Otomatik Taslakları ve Revizyonları Devre Dışı Bırakın**



WordPress'in taslakları ve revizyonları otomatik olarak kaydetmesini istemiyorsanız, `wp-config.php` dosyanıza şu kodu ekleyerek bu özelliği devre dışı bırakabilirsiniz :


```bash
define('AUTOSAVE_INTERVAL', 86400); // Auto-save every 24 hours (basically disables it)
define('WP_POST_REVISIONS', false); // Disables revisions
```



Bu yöntem, revizyonlara ihtiyacınız olmayacağından emin olmadığınız sürece önerilmez; çünkü bir gönderinin önceki bir sürümüne geri dönmeniz gerektiğinde faydalı olabilirler.



3. **Düzenli Temizlikler Planlayın**



WP-Optimize veya Advanced Database Cleaner gibi bir eklenti kullanıyorsanız, veritabanınızı düzenli aralıklarla (örneğin, haftalık veya aylık) otomatik olarak temizlemek için zamanlama özelliklerinden yararlanın. Bu şekilde, siteniz manuel müdahale olmadan optimize edilmiş halde kalır.



## Sonuç



WordPress'teki otomatik taslakları, revizyonları ve diğer gereksiz karmaşayı temizlemek web sitesi bakımının önemli bir yönüdür. Temiz bir veritabanı performansı artırır, kullanıcı deneyimini iyileştirir ve  SEO sıralamanızı yükseltir. Taslakları ve revizyonları manuel olarak silmeyi veya işlemi otomatikleştirmek için bir eklenti kullanmayı seçseniz de, düzenli temizlikler WordPress sitenizin sorunsuz çalışmasını sağlayacaktır.



Yukarıda özetlenen adımları izleyerek ve revizyonları sınırlama ve temizlemeleri planlama gibi en iyi uygulamaları benimseyerek, hızlı ve verimli bir WordPress web sitesi sürdürebilirsiniz.
