---
title: WordPress Blog'unu Güvence Altına Alma Hobi Blogcuları İçin En İyi Uygulamalar
linkTitle: Wordpress Güvenliği
description: Bu rehber Alice'e (ve size) WordPress blogunuzu güvenli hale getirmek için en iyi uygulamaları anlatacak.
date: 2024-11-13
weight: 80
draft: true
tags:
  - blog publishing
  - securing wordpress
categories:
  - TechLife
keywords:
  - Securing WordPress
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
featured_image: /images/alice-interview.webp
url: /tr/securing-wordpress-blog-practices-hobby-bloggers
translationKey: securing-wordpress-blog-practices-hobby-bloggers
---
Alice, birçok hobi blog yazarı gibi, tutkusunu paylaşmak için ilgi çekici bir WordPress blogu oluşturmaya tüm kalbini ve ruhunu verdi. Ancak web siteleriyle karşı karşıya kalan siber tehditlerin sayısı arttıkça, blogunu güvence altına almak kaliteli içerik oluşturmak kadar önemlidir. Bilgisayar korsanları, kötü amaçlı yazılımlar ve kaba kuvvet saldırıları, yıllarca süren sıkı çalışmayı bozabilir veya hatta yok edebilir. Neyse ki Alice'in blogunu korumak için bir teknoloji uzmanı olması gerekmiyor.

Bu kılavuz Alice'i (ve sizi) bir WordPress blogunu güvence altına almak için en iyi uygulamalarda yönlendirecektir. Bu adımları izleyerek saldırı riskini en aza indirebilir, içeriğini koruyabilir ve okuyucularının verilerini güvende tutabilir.

---

#### **1. WordPress'i Güncel Tutun**

Bir WordPress sitesini güvence altına almanın en temel adımı, yazılımı güncel tutmaktır.

- **Temel Güncellemeler:** WordPress, güvenlik açıklarını gidermek, işlevselliği iyileştirmek ve performansı artırmak için düzenli olarak güncellemeler yayınlar. Alice, WordPress temel dosyalarını doğrudan *Pano > Güncellemeler* bölümüne giderek panodan güncelleyebilir. - Temalar ve Eklenti Güncellemeleri:** Güncel olmayan temalar ve eklentiler, bilgisayar korsanları için yaygın giriş noktalarıdır. Alice bunları sık sık güncellemeli ve artık kullanılmayanları kaldırmalıdır.
- **Otomatik Güncellemeler:** İşleri kolaylaştırmak için Alice, `wp-config.php` dosyasına şu satırı ekleyerek küçük sürümler için otomatik güncellemeleri etkinleştirebilir:

```php
define('WP_AUTO_UPDATE_CORE', true);
```

Birçok barındırma sağlayıcısı otomatik güncellemeler de sunar.

---

#### **2. Güvenli ve Güvenilir Barındırma Seçin**

Barındırma ortamı, bir WordPress blogunun genel güvenliğinde önemli bir rol oynar.

- **Yönetilen WordPress Barındırma:** Kinsta veya WP Engine gibi bu sağlayıcılar, günlük yedeklemeler, otomatik güncellemeler ve yerleşik güvenlik özellikleri dahil olmak üzere optimize edilmiş güvenlik sunar. - **Paylaşımlı Barındırma Hususları:** Alice paylaşımlı barındırma kullanıyorsa, site izolasyonu, güvenlik duvarları ve proaktif tehdit izleme gibi güçlü güvenlik uygulamalarına sahip saygın bir sağlayıcı seçmelidir.
- **SSL Sertifikası:** Çoğu saygın barındırıcı, Let's Encrypt gibi hizmetler aracılığıyla ücretsiz SSL sertifikaları sunar. Bir SSL sertifikası, Alice'in sitesi ile ziyaretçileri arasındaki verileri şifreleyerek güvenliği artırır ve arama sıralamalarını yükseltir.

---

#### **3. Güçlü Parolalar ve İki Faktörlü Kimlik Doğrulama (2FA) Kullanın**

Zayıf parolalar büyük bir güvenlik riskidir. Alice güçlü parola uygulamalarını benimsemeli ve 2FA ile ekstra bir koruma katmanı eklemelidir.

- **Güçlü Parolalar Oluşturma:** Alice büyük ve küçük harflerin, sayıların ve özel karakterlerin bir karışımını kullanmalıdır. Parolalar benzersiz olmalı ve farklı hesaplarda tekrar kullanılmamalıdır.
- **Parola Yönetim Araçları:** Alice, güçlü parolaları depolamak ve oluşturmak için LastPass veya 1Password gibi bir araç kullanabilir.
- **İki Faktörlü Kimlik Doğrulama Eklentileri:** **WP 2FA** veya **İki Faktörlü Kimlik Doğrulama** gibi eklentiler, Alice'in (ve yetkili kullanıcıların) e-postalarına veya mobil cihazlarına gönderilen tek seferlik bir kod sağlamasını gerektirerek oturum açma sırasında ek bir güvenlik adımı ekler.

---

#### **4. Oturum Açma Denemelerini Sınırlayın ve Oturum Açma URL'lerini Değiştirin**

Varsayılan olarak, WordPress oturum açma URL'leri tahmin edilebilirdir (`/wp-admin` veya `/wp-login.php`), bu da onları kaba kuvvet saldırıları için hedef haline getirir.

- **Oturum Açma Denemelerini Sınırlayın:** **Login Attempts Reloaded** gibi eklentiler, oturum açma denemelerinin sayısını kısıtlayarak kaba kuvvet saldırıları riskini azaltır.
- **Oturum Açma URL'sini Değiştirin:** **WPS Hide Login** gibi eklentiler, Alice'in varsayılan oturum açma URL'sini değiştirmesine olanak tanır ve bu da bilgisayar korsanlarının oturum açma sayfasını bulmasını zorlaştırır.

---

#### **5. Bir WordPress Güvenlik Eklentisi Yükleyin**

Bir güvenlik eklentisi, olası tehditleri ve güvenlik açıklarını izleyen bir kalkan görevi görür.

- **Wordfence Security:** Alice'in blogunu korumak için bir güvenlik duvarı, kötü amaçlı yazılım tarayıcısı ve gerçek zamanlı izleme sunar.
- **Sucuri Security:** Bu eklenti güvenlik denetimleri, kötü amaçlı yazılım taraması ve bir güvenlik duvarı sunar. Özellikle kötü amaçlı trafiği tespit etmek ve engellemek için faydalıdır.
- **iThemes Security:** Kaba kuvvet koruması, iki faktörlü kimlik doğrulama ve güvenlik güçlendirme ipuçları gibi çeşitli özellikler sağlayan popüler bir eklentidir.

---

#### **6. Sitenizi Düzenli Olarak Yedekleyin**

Düzenli yedeklemeler, Alice'in veri kaybı, saldırı veya diğer sorunlar durumunda blogunu hızla geri yüklemesini sağlar.

- **Yedekleme Eklentileri:** **UpdraftPlus** ve **BackupBuddy**, Alice'in otomatik yedeklemeleri planlamasını ve bunları Google Drive, Dropbox veya Amazon S3 gibi hizmetlerde depolamasını sağlayan harika araçlardır.
- **Manuel Yedeklemeler:** Alice ayrıca sitesinin dosyalarını ve veritabanını barındırma kontrol paneli veya WordPress araçları aracılığıyla manuel olarak yedekleyebilir.

---

#### **7. Güvenli Kullanıcı Rolleri ve İzinleri Kullanın**

Alice blogunda başkalarıyla işbirliği yapıyorsa, güvenli kullanıcı rolleri ve izinleri kullanmak önemlidir.

- **Rolleri Dikkatlice Atayın:** WordPress, Yönetici, Editör, Yazar, Katkıda Bulunan ve Abone gibi roller sunar. Alice, yalnızca güvenilir kullanıcılara Yönetici erişimi vermeli ve mümkün olduğunda daha düşük roller atamalıdır.
- **Kullanıcı İzinlerini Düzenli Olarak İnceleyin:** Periyodik olarak

---

#### **8. WordPress Kontrol Panelinden Dosya Düzenlemeyi Devre Dışı Bırakın**

Varsayılan olarak, WordPress yöneticilerin tema ve eklenti dosyalarını doğrudan kontrol panelinden düzenlemesine izin verir. Bu özellik bilgisayar korsanları tarafından istismar edilebilir.

- **Dosya Düzenlemeyi Devre Dışı Bırakın:** Alice, dosya düzenlemeyi devre dışı bırakmak için `wp-config.php` dosyasına şu satırı ekleyebilir:

```php
define('DISALLOW_FILE_EDIT', true);
```

---

#### **9. wp-config.php Dosyasını Koruyun**

`wp-config.php` dosyası Alice'in WordPress kurulumu için önemli yapılandırma bilgilerini içerir.

- **Dosyayı Taşıyın:** Alice, ek güvenlik için `wp-config.php` dosyasını WordPress kök dizininin bir üst dizinine taşıyabilir. - **Erişim Kısıtlamaları Ekleme:** Erişimi engellemek için `.htaccess` dosyasına şu satırları ekleyebilir:

```apache
<Files wp-config.php>
order allow,deny
deny from all
</Files>
```

---

#### **10. Bir Web Uygulama Güvenlik Duvarı (WAF) Kullanın**

Bir WAF, kötü amaçlı trafiği Alice'in sitesine ulaşmadan önce filtreler ve engeller.

- **Bulut Tabanlı WAF'ler:** **Cloudflare** ve **Sucuri** gibi hizmetler, ek bir koruma katmanı sağlayan bulut tabanlı WAF'ler sunar.
- **Eklenti Tabanlı WAF'ler:** Birçok güvenlik eklentisi yerleşik bir WAF içerir.

---

#### **11. Kötü Amaçlı Yazılımlara Karşı İzleme ve Koruma**

Kötü amaçlı yazılımlar verileri tehlikeye atabilir ve ziyaretçileri kötü amaçlı sitelere yönlendirebilir.

- **Kötü Amaçlı Yazılım Tarama Eklentileri:** **MalCare** ve **Wordfence** kötü amaçlı yazılım enfeksiyonlarını taramak ve temizlemek için araçlar sunar.
- **Düzenli Taramalar:** Alice, olası sorunları erken yakalamak için düzenli olarak taramalar yapmalıdır.

---

#### **12. Tüm Sitede HTTPS'yi Zorunlu Kılın**

Tüm siteyi HTTPS ile güvence altına almak, Alice'in ziyaretçileri ile sitesi arasında şifrelenmiş veri iletimi sağlar.

- **HTTP'yi HTTPS'ye Yönlendir:** Alice'in sitesi zaten bir SSL sertifikası kullanıyorsa, `.htaccess` dosyasına bir yönlendirme kuralı ekleyerek HTTPS'yi zorunlu kılabilir:

```apache
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
```

---

#### **13. Eklentileri ve Temaları Düzenli Olarak Denetleyin**

Kötü amaçlı veya güncel olmayan eklentiler ve temalar güvenlik riskleri oluşturabilir.

- **Güvenilir Kaynakları Kullanın:** Alice eklentileri ve temaları yalnızca WordPress deposu veya ThemeForest gibi doğrulanmış pazar yerleri gibi saygın kaynaklardan indirmelidir.
- **Etkin Olmayan Eklentileri ve Temaları Silin:** Kullanılmayan temalar ve eklentiler etkin olmasalar bile risk oluşturabilir. - **Güncellemeleri Sık Sık Kontrol Edin:** Her şeyi güncel tutmak güvenlik açıklarını azaltır.

---

#### **14. DDoS Saldırılarına Karşı Korunun**

Dağıtılmış Hizmet Reddi (DDoS) saldırıları bir siteyi trafikle boğarak çökmesine neden olur.

- **Cloudflare Koruması:** Cloudflare gibi hizmetler bu tür saldırıları azaltan DDoS koruması sunar.
- **Eklentiler ve Barındırma Özellikleri:** Birçok yönetilen barındırma sağlayıcısı yerleşik DDoS koruma özellikleri de sağlar.

---

#### **15. Kullanıcı Etkinliğini ve Günlüklerini İzleyin**

Kullanıcı etkinliğini izlemek şüpheli davranışları erken tespit etmeye yardımcı olabilir.

- **Etkinlik Günlüğü Eklentileri:** **WP Güvenlik Denetim Günlüğü** oturum açmalar, değişiklikler ve başarısız oturum açma girişimleri dahil olmak üzere kullanıcı etkinliğini izler.

---

### **Sonuç**

Bu güvenlik en iyi uygulamalarını izleyerek Alice, WordPress blogunu tehditlerden koruyabilir ve tutkusunu okuyucularla paylaşmaya odaklanabilir. Bir siteyi güvence altına almak, düzenli güncellemeler, izleme ve optimizasyon içeren devam eden bir süreçtir. Bu önlemler alındığında Alice, sıkı çalışmasının siber tehditlerden güvende olduğunu bilerek rahatlayabilir.
