---
draft: false

title:  'phpMyAdmin ile WordPress Nasıl Temizlenir'
date: '2024-10-15T16:53:44+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/phpmyadmin-ile-wordpress-nasil-temizlenir/
featured_image: /images/wordpress.webp
categories:
    - Wordpress
tags:
    - wordpress
---


İçeriğiniz büyüdükçe sağlıklı ve optimize edilmiş bir WordPress web sitesi sürdürmek zor olabilir. Zamanla, WordPress veritabanınız otomatik taslaklar, revizyonlar, çöpe atılan gönderiler, spam yorumlar ve geçici seçenekler gibi web sitenizi yavaşlatabilecek gereksiz dosyalar biriktirir. Bu kılavuzda, phpMyAdmin kullanarak doğrudan veritabanınızdan gereksiz dosyaları silerek WordPress'i nasıl temizleyeceğinizi ele alacağız.



Teknik sürece dalmadan önce, bu dosyaları temizlemenin neden önemli olduğunu, bu dosyaların ne olduğunu anlayalım ve ardından phpMyAdmin'i kullanarak bunları adım adım kaldırma sürecini inceleyelim.



WordPress Veritabanınızı Neden Temizlemelisiniz?



WordPress veritabanınız, gönderiler, sayfalar, yorumlar, eklenti ayarları ve diğer meta veriler dahil olmak üzere web sitenizin tüm içeriklerini ve ayarlarını depolar. Bazı veriler önemli olsa da, gönderi revizyonları, otomatik taslaklar, spam yorumları ve eski geçiciler gibi gereksiz dosyalar veritabanının şişmesine neden olabilir. WordPress veritabanınızı temizlemeniz için bazı önemli nedenler şunlardır:


* **Gelişmiş Performans** : Şişkin bir veritabanı web sitenizi yavaşlatabilir ve WordPress'in veriyi almasını ve işlemesini zorlaştırabilir. Gereksiz dosyaları temizlemek sorgu yürütme süresini iyileştirir ve web sitenizi hızlandırır.

* **Verimli Yedekleme ve Geri Yükleme** : Büyük veritabanlarının yedekleri daha uzun sürer ve daha fazla kaynak tüketir. Daha temiz bir veritabanı yedekleme boyutunu azaltır ve gerektiğinde geri yüklemeyi kolaylaştırır.

* **Azaltılmış Disk Kullanımı** : Veritabanı şişkinliği, özellikle depolama alanının genellikle sınırlı olduğu paylaşımlı barındırmada sunucu depolama alanını tüketir. Gereksiz dosyaları kaldırarak, daha kritik dosyalar ve veriler için alan açarsınız.

* **Güvenlik ve Bakım** : Temiz bir veritabanının yönetimi, sorun gidermesi ve güvenliği daha kolaydır. İlgisiz dosyalar hatalara ve potansiyel güvenlik açıklarına fırsat yaratabilir.




Artık WordPress veritabanınızı temiz tutmanın neden önemli olduğunu öğrendiğinize göre, zamanla birikme eğiliminde olan gereksiz dosyaları tartışalım.



WordPress'teki Gereksiz Dosya Türleri



WordPress veritabanında kaldırmayı düşünmeniz gereken en yaygın gereksiz dosya türleri şunlardır:


#### 1. **Otomatik Taslaklar**



WordPress, düzenlediğiniz gönderilerinizi ve sayfalarınızı otomatik taslaklar olarak kaydeder. Bu, yanlışlıkla tarayıcı çökmesi veya bağlantı sorunu durumunda içeriğinizi kaybetmemenizi sağlar. Ancak, bu otomatik taslaklar genellikle son gönderi veya sayfa yayınlandıktan sonra bile veritabanınızda kalır. Otomatik taslakları kaldırmak, veritabanı şişkinliğini azaltmaya yardımcı olur.


#### 2. **Revizyonlar**



Bir gönderiyi veya sayfayı her güncellediğinizde, WordPress bir revizyon kaydeder. Zamanla, bu revizyonlar, özellikle sık güncellenen gönderiler için birikebilir. Revizyonlar eski sürümleri kurtarmada yardımcı olabilirken, çok fazla revizyon tutmak veritabanı boyutunu gereksiz yere artırabilir.


#### 3. **Çöpe Atılan Gönderiler ve Yorumlar**



Bir gönderiyi veya yorumu sildiğinizde, WordPress onu hemen kaldırmaz. Bunun yerine, öğeyi çöp kutusuna taşır ve kalıcı olarak silinene kadar orada kalır. Eski çöpe atılmış öğeler, özellikle düzgün yönetilmezse, veritabanı şişkinliğine katkıda bulunur.


#### 4. **Spam ve Onaylanmamış Yorumlar**



Spam ve onaylanmamış yorumlar veritabanınızda yer kaplar. Bu yorumları kaldırmak yalnızca yorum bölümünü düzenlemeye yardımcı olmakla kalmaz, aynı zamanda veritabanı kaynaklarını da serbest bırakır.


#### 5. **Geçiciler**



Geçiciler, WordPress ve eklentiler tarafından veritabanında depolanan geçici verilerdir. Geçiciler yararlı olabilirken, süresi dolan geçiciler genellikle veritabanında gereksiz yere kalır ve veritabanı şişkinliğine katkıda bulunur.


#### 6. **Yetim Meta Veri**



Silinen gönderiler, yorumlar veya kullanıcılarla ilişkili meta veriler, üst öğe silindikten sonra bile veritabanında kalabilir. Yetim meta veriler zamanla birikerek veritabanını daha da şişirebilir.



Artık WordPress veritabanında yer kaplayan dosya türlerini anladığımıza göre, şimdi phpMyAdmin'i kullanarak bu dosyaları temizlemeye geçelim.



WordPress Veritabanınızı Temizlemek İçin phpMyAdmin Kullanma



phpMyAdmin, WordPress veritabanınızı doğrudan yönetmek için güçlü bir araçtır. Devam etmeden önce, **WordPress veritabanınızı yedeklediğinizden emin olun** . Bu, temizleme işlemi sırasında bir şeyler ters giderse verilerinizi kurtarabilmenizi sağlar.


#### Adım 1: phpMyAdmin'e erişin


* **Hosting Kontrol Panelinize (cPanel) Giriş Yapın** : Çoğu web barındırma sağlayıcısı cPanel aracılığıyla phpMyAdmin'e erişim sunar. Giriş yaptıktan sonra, "Veritabanları" bölümünün altında phpMyAdmin seçeneğini arayın.

* **WordPress Veritabanınızı Seçin** : phpMyAdmin'de, bir veritabanları listesi göreceksiniz. Web sitenizle ilişkili tabloları görüntülemek için WordPress veritabanınıza tıklayın.



#### Adım 2: Otomatik Taslakları Silme



Otomatik taslaklar WordPress veritabanınızın `wp_posts` tablosuna kaydedilir. Otomatik taslakları silmek için:


* phpMyAdmin arayüzünde **SQL** sekmesine tıklayın.

* Otomatik taslakları silmek için aşağıdaki sorguyu çalıştırın:



```bash
   DELETE FROM wp_posts WHERE post_status = 'auto-draft';
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Sorguyu yürütmek için **Git'e** tıklayın .




Bu, veritabanınızdan tüm otomatik taslak gönderilerini kaldıracaktır.


#### Adım 3: Gönderi Revizyonlarını Silme



Revizyonlar da `wp_posts` tablosunda saklanır. Gönderi revizyonlarını kaldırmak için:


* **SQL** sekmesine gidin .

* Gönderi revizyonlarını silmek için aşağıdaki sorguyu çalıştırın:



```bash
   DELETE FROM wp_posts WHERE post_type = 'revision';
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* **Git'e** tıklayın .




Bu, veritabanınızdaki tüm gönderi revizyonlarını silecektir.


#### Adım 4: Gönderiler ve Yorumlar İçin Çöp Kutusunu Boşaltma



Çöp kutusuna atılan gönderileri kaldırmak için:


* **SQL** sekmesinde aşağıdaki sorguyu çalıştırın:



```bash
   DELETE FROM wp_posts WHERE post_status = 'trash';
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* **Git'e** tıklayın .




Çöp kutusuna atılan yorumları kaldırmak için:


* Aşağıdaki sorguyu çalıştırın:



```bash
   DELETE FROM wp_comments WHERE comment_approved = 'trash';
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* **Git'e** tıklayın .



#### Adım 5: Spam ve Onaylanmamış Yorumları Silme



Spam ve onaylanmamış yorumları veritabanınızdan kaldırmak için:


* **SQL** sekmesinde aşağıdaki sorguyu çalıştırın:



```bash
   DELETE FROM wp_comments WHERE comment_approved = 'spam';
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* Onaylanmamış yorumları silmek için şu sorguyu kullanın:



```bash
   DELETE FROM wp_comments WHERE comment_approved = '0';
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Her sorgu için **Git'e** tıklayın .



#### Adım 6: Süresi Dolan Geçicileri Kaldırma



Geçici olaylar `wp_options` tablosunda saklanır . Süresi dolan geçici olayları kaldırmak için:


* **SQL** sekmesinde aşağıdaki sorguyu çalıştırın:



```bash
   DELETE FROM wp_options WHERE option_name LIKE '_transient_%' AND option_value < NOW();
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* **Git'e** tıklayın .




Bu, süresi dolmuş geçici verileri veritabanınızdan kaldıracaktır.


#### Adım 7: Yetim Meta Verilerin Silinmesi



Yetim meta veriler zamanla birikebilir. Yetim meta verileri temizlemek için:


* Yetim gönderi meta verileri için şu sorguyu çalıştırın:



```bash
   DELETE pm FROM wp_postmeta pm LEFT JOIN wp_posts wp ON wp.ID = pm.post_id WHERE wp.ID IS NULL;
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* Yetim yorum meta verileri için şu sorguyu çalıştırın:



```bash
   DELETE FROM wp_commentmeta WHERE comment_id NOT IN (SELECT comment_ID FROM wp_comments);
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Her sorgu için **Git'e** tıklayın .




Veritabanı Bakımı İçin En İyi Uygulamalar


* **Düzenli Yedeklemeler** : Herhangi bir değişiklik yapmadan önce veritabanınızı her zaman yedekleyin. Düzenli yedeklemeler planlamak da iyi bir alışkanlıktır.

* **Veritabanı Optimizasyon Eklentileri** : Temizleme sürecini otomatikleştirmek için WP-Optimize veya Advanced Database Cleaner gibi eklentileri kullanmayı düşünün. Bu eklentiler, revizyonları, spam'i, geçicileri ve diğer gereksiz verileri silmek için kullanıcı dostu yollar sunar.

* **Gönderi Revizyonlarını Sınırla** : `wp-config.php` Dosyanıza aşağıdaki satırı ekleyerek WordPress'in kaydedeceği gönderi revizyonlarının sayısını sınırlayabilirsiniz:



```bash
   define( 'WP_POST_REVISIONS', 3 );
```



Bu, gönderi başına kaydedilen revizyon sayısını üçle sınırlar.


<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list">* **Düzenli Temizlik** : WordPress veritabanınızı düzenli olarak temizleyin ve dağınık hale gelmesini önleyin. Düzenli temizlikler çalıştırmak daha iyi performans ve daha verimli veritabanı yönetimi sağlar.




Sonuç



WordPress veritabanınızı temizlemek web sitenizin performansını önemli ölçüde iyileştirebilir, depolama kullanımını azaltabilir ve yedeklemeleri daha yönetilebilir hale getirebilir. Veritabanı bakımına yardımcı olmak için eklentiler mevcut olsa da, phpMyAdmin kullanmak daha fazla kontrol sunar ve belirli dosyaları hedeflemek için özel SQL sorguları yürütmenize olanak tanır. Otomatik taslakları, revizyonları veya geçicileri kaldırıyor olun, phpMyAdmin veritabanınızı yalın ve optimize edilmiş tutmak için güçlü bir yol sağlar.



Herhangi bir temizleme işlemi yapmadan önce veritabanınızı yedeklemeyi unutmayın ve WordPress sitenizin zaman içinde sorunsuz çalışmasını sağlamak için düzenli bakım rutinlerini göz önünde bulundurun.
