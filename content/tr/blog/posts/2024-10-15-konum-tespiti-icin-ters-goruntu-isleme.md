---
draft: false
title: Konum Tespiti için Ters Görüntü İşleme
date: 2024-10-15T17:25:22+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /tr/konum-tespiti-icin-ters-goruntu-isleme/
featured_image: /images/osint3.webp
categories:
  - Açık Kaynak İstihbaratı (AKİ)
tags:
  - aki
  - cybersecurity
  - osint
  - siber güvenlik
---


Sürekli gelişen Açık Kaynak İstihbaratı (OSINT) manzarasında, en güçlü ancak yeterince kullanılmayan tekniklerden biri, konum keşfi için **ters görüntü  aramasıdır** , diğer adıyla **görüntülerden coğrafi konum izleme** . Akıllı telefonların ve sosyal medyanın yükselişiyle, konumlar hakkında görsel ipuçları içeren görüntüler her gün çevrimiçi olarak yükleniyor. OSINT analistleri bu görüntüleri kullanarak coğrafi bilgi çıkarabilir, konumları izleyebilir ve eyleme dönüştürülebilir istihbarat toplayabilir.



Bu blog yazısı, OSINT'teki ters görüntü arama tekniğine detaylı bir bakış sağlayacak, bu tekniğin coğrafi konum takibi için nasıl kullanıldığını, kullanılan araçları ve stratejileri ve bu süreci çevreleyen zorlukları ve etik hususları açıklayacaktır.



## Tersine Görsel Arama Nedir?



Ters resim araması, bir resim yükleyerek veya bir URL'yi bir arama motoruna yapıştırarak internette benzer veya aynı resimleri bulmak için kullanılan bir yöntemdir . Kullanıcılar anahtar kelimeler veya metin kullanmak yerine sorgu olarak bir resmin kendisini kullanabilirler. Bu işlem şunlara yardımcı olur:


* Resmin orijinal kaynağını tanımlayın.

* Resmin daha yüksek çözünürlüklü versiyonlarını bulun.

* Görselin başka bir yerde kullanılıp kullanılmadığını veya değiştirilip değiştirilmediğini öğrenin.

* Konumlar veya simge yapılar gibi önemli görsel öğeleri belirlemek için bir görseli çapraz referanslayın.




OSINT bağlamında, ters görüntü araması araştırmacıların bir görüntünün coğrafi konumunu belirlemesine yardımcı olabilir; buna genellikle **coğrafi konum izleme** denir .



## OSINT'te Görüntülerden Coğrafi Konum Takibinin Önemi



Görüntülerden coğrafi konum takibi, özellikle bir konumun soruşturma için kritik olduğu durumlarda çeşitli OSINT uygulamalarında önemli bir rol oynar. Buna ulusal güvenlik, suç soruşturması, afet müdahalesi, gazetecilik veya kurumsal istihbarat dahil olabilir. İşte neden önemli olduğu:


* **Bilgi Doğrulaması** : Yanlış bilgi çağında, görüntülerin gerçekliğini doğrulamak hayati önem taşır. Bir görüntünün coğrafi konumunu belirlemek, fotoğrafın iddia edilen konumda çekilip çekilmediğini veya manipüle edilip edilmediğini belirlemeye yardımcı olur.

* **Durumsal Farkındalık** : Coğrafi konum, doğal afetler veya çatışma bölgeleri gibi krizler sırasında gerçek zamanlı durumsal farkındalık sağlayabilir. Sosyal medya görüntülerini analiz etmek, olayların yerini ve kapsamını belirlemeye, karar alma ve yanıt çabalarına yardımcı olmaya yardımcı olur.

* **Suç Faaliyetlerinin Takibi** : Kolluk kuvvetleri, çevrimiçi görüntülerin konumunu izleyerek insan ticareti, terörizm ve organize suç gibi yasa dışı faaliyetleri izlemek için coğrafi konumu kullanır.

* **Askeri Hareketlerin İzlenmesi** : İstihbarat teşkilatları, asker hareketlerini, askeri teçhizatı ve çatışmayla ilgili faaliyetleri takip etmek amacıyla sosyal medya platformlarında paylaşılan görüntüleri izliyor.

* **Kayıp Kişileri Bulma** : Sosyal medyada paylaşılan görseller, kayıp kişilerin nerede olduğuna dair ipuçları sağlayabilir. Tersine görsel araması, herkese açık olarak paylaşılan fotoğraflara dayanarak desenleri veya konumları bulmada önemli bir araçtır.




## Tersine Resim Araması Bir Resmin Coğrafi Konumunu Belirlemeye Nasıl Yardımcı Olabilir



Ters görüntü araması genellikle belirli bir görüntünün nerede çekildiğini bulmanın başlangıç ​​noktasıdır. İşlem, görüntüyü web'de eşleşmeler veya görsel olarak benzer görüntüler arayan bir ters görüntü arama motoruna yüklemeyi içerir. Bir eşleşme bulunursa, görüntünün konumu hakkında değerli ipuçları sağlayabilir ve analistlerin coğrafi bağlamı bir araya getirmesine yardımcı olabilir.



Tersine Görsel Arama ile Bir Görselin Coğrafi Konumunu Belirleme Adımları:


* **Resmi Yükleyin veya Girin** : Araştırmak istediğiniz resmi yükleyerek veya URL'sini ters resim arama motoruna girerek başlayın.

* **Görsel İpuçlarını Analiz Edin** : Resimde belirgin görsel ipuçlarını (örneğin, simge yapılar, sokak tabelaları, bina mimarisi veya benzersiz coğrafi özellikler) arayın.

* **<a href="https://www.siberoloji.com/reverse-image-search-for-location-discovery-osint-geolocation-tracking-from-images/#"> </a>Eşleşmeleri Ara** : Arama motoru benzer veya aynı görsellerin çevrimiçi olarak nerede göründüğünü gösteren sonuçları döndürecektir. Potansiyel konumları bulmak için bu sonuçları inceleyin.

* **Haritalarla çapraz referanslama** : Bir görsel benzersiz görsel öğeler içeriyorsa, konumu doğrulamak için bunları Google Haritalar veya uydu görüntüleri gibi çevrimiçi harita servisleriyle çapraz referanslayın.

* **Bilgileri Doğrulayın** : Doğruluğu sağlamak için sonuçları her zaman birden fazla kaynak veya araç kullanarak doğrulayın; çünkü görüntü değişiklikleri veya manipülasyonları bazen arama motorunu yanıltabilir.




Coğrafi Konum Belirleme İçin Görsellerdeki Temel Unsurlar:


* **Anıtlar ve Simge Yapılar** : Ünlü binalar, heykeller veya benzersiz doğal özellikler gibi kolayca tanınabilen yapılar.

* **Sokak İşaretleri ve Reklam Panoları** : Yerel dillerdeki işaretler, yol işaretleri veya reklamlar bölge veya ülke hakkında ipuçları verebilir.

* **Araç Plakaları** : Kısmi veya tam plakalar, ülkeyi veya ülke içindeki belirli bir bölgeyi tanımlamaya yardımcı olabilir.

* **Mimari** : Yapı stilleri veya mimari detaylar, kendine özgü yapıları ile bilinen belirli bölgelere veya ülkelere işaret edebilir.

* **Flora ve Fauna** : Görseldeki bitki, ağaç veya hayvan türleri iklim veya coğrafi bölge hakkında ipuçları verebilir.

* **Giyim ve Kültürel İşaretler** : Görseldeki kişilerin giydiği giyim türü belirli bir kültürü veya bölgeyi işaret edebilir.




## Ters Görüntü Arama ve Coğrafi Konum Takibi için Araçlar



OSINT uygulayıcılarının erişebildiği ters görüntü  arama ve coğrafi konum izleme için çeşitli araçlar mevcuttur . Bu araçların her biri, görüntülerden coğrafi bilgi çıkarmak için benzersiz özellikler ve yöntemler sunar.



1. **Google Reverse Image Search**



Google'ın ters görsel arama aracı, web genelinde görsel olarak benzer görselleri belirlemek için en yaygın kullanılanlardan biridir. Analistler bir görseli yükleyebilir veya URL'sini Google Görseller'e yapıştırabilir ve benzer görsellerin çevrimiçi olarak nerede göründüğünü görebilir. Google'ın ters görsel araması genel araştırmalar için etkili olsa da, benzersiz veya daha az popüler görsellerle zorluk çekebilir.


#### OSINT için Google Görseller nasıl kullanılır:


* <a href="https://images.google.com" target="_blank" rel="noreferrer noopener">images.google.com</a> adresine gidin .

* Bir resim yüklemek veya bir URL yapıştırmak için arama çubuğundaki kamera simgesine tıklayın.

* Sonuçları inceleyin ve konumu bulmak için ilgili eşleşmeleri çapraz referanslayın.




2. **TinEye**



TinEye, görüntü kullanımını izleme ve kopyaları bulma konusunda uzmanlaşmış başka bir ters görüntü arama motorudur. Bir fotoğrafın orijinal kaynağını belirlemeyi amaçlayan OSINT analistleri için değerli olan, çevrimiçi bir görüntünün en erken görünümünü bulma yeteneğiyle bilinir.


#### TinEye'ın Özellikleri:


* Çift veya değiştirilmiş görselleri tespit etmede hızlı ve güvenilir.

* Görüntü eşleşme geçmişlerini sağlar, bir görüntünün ilk olarak nerede ve ne zaman göründüğünü gösterir.

* Daha hızlı aramalar için tarayıcı eklentileri sunar.




3. **Yandex Görselleri**



Rus arama motoru Yandex, özellikle Rusya ve yakın bölgelerdeki görselleri coğrafi olarak konumlandırırken güçlü ters görsel arama yetenekleriyle bilinir. Birçok OSINT uygulayıcısı, belirsiz ve daha az indekslenmiş görselleri bulma yeteneği nedeniyle Yandex'i tercih eder.


#### OSINT için Yandex'in Avantajları:


* Özellikle dış mekan sahneleri ve binalar için güçlü görüntü eşleştirme algoritması.

* Doğu Avrupa, Rusya ve çevre bölgeler için Google veya diğer arama motorlarından daha kapsamlı görsel sonuçları.




4. **Bing Görsel Arama**



Bing'in görsel araması, ters resim aramalarında yardımcı olabilecek başka bir araçtır, ancak OSINT'te Google veya TinEye'dan daha az kullanılır. Bing, resimler için URL'leri yüklemek veya girmek ve eşleşmeleri almak için benzer bir işlem sunar.



5. **Mapillary**



Mapillary, Google Street View'a benzer, kalabalık kaynaklı bir sokak seviyesi görüntü platformudur. Kullanıcılar, daha sonra belirli konumları tanımlamak için kullanılabilen coğrafi etiketli fotoğraflar katkıda bulunur. Coğrafi konum takibi için Mapillary, dünyanın dört bir yanından sokak seviyesi görünümleriyle görüntüleri eşleştirmek için harika bir kaynaktır.



6. **Google Earth ve Sokak Görünümü**



Potansiyel coğrafi ipuçları ters görüntü aramasıyla belirlendikten sonra, Google Earth ve Street View gibi araçlar devreye girer. Google Earth kullanıcıların dünyanın uydu görüntülerini görüntülemesine olanak tanırken, Street View ayrıntılı sokak seviyesi görüntüleri sunar. Bu araçlar birlikte, OSINT analistlerinin görüntüde bulunan binaların, yer işaretlerinin veya coğrafi özelliklerin konumunu çapraz referanslamasını ve doğrulamasını sağlar.



7. **Exif Veri Çıkarma Araçları**



**Bazen bir görüntü, Değiştirilebilir Görüntü Dosya Biçimi (Exif)** verisi olarak bilinen gömülü meta veri içerebilir . Exif verileri, görüntüyü yakalamak için kullanılan cihaz, tarih ve saat ve en önemlisi cihazda coğrafi etiketleme etkinleştirilmişse coğrafi koordinatlar gibi bir görüntü hakkında önemli bilgileri ortaya çıkarabilir. **ExifTool** veya **Jeffrey's Exif Viewer** gibi araçlar bu meta veriyi çıkarabilir ve bu, OSINT araştırmalarında kritik bir adım haline gelir.



## Görüntülerden Coğrafi Konum Takibindeki Zorluklar



Coğrafi konum takibi için ters görüntü  araması güçlü bir teknik olsa da, OSINT analistlerinin farkında olması gereken sınırlamaları ve zorlukları vardır:



1. **Ayırt Edici Görsel İpuçlarının Eksikliği**



Tüm görseller coğrafi konum belirleme için kullanılabilecek tanınabilir dönüm noktaları, işaretler veya diğer ayırt edici özellikler içermez. Örneğin kırsal veya iç mekan görselleri bir konumu tam olarak belirlemek için yeterli bilgi sunmayabilir.



2. **Manipülasyon ve Düzenleme**



Çevrimiçi paylaşılan görseller sıklıkla değiştirilir, filtrelenir veya manipüle edilir, bu da coğrafi konumu daha zor hale getirebilir. Ters görsel arama motorları, özellikle arka plan veya önemli görsel öğeler değiştirilmişse, değiştirilmiş görselleri tanımlamakta zorluk çekebilir.



3. **Güncel Olmayan veya Kaldırılan Veriler**



Bazen, bir görüntünün orijinal sürümüne silme veya dizin kaldırma nedeniyle artık çevrimiçi olarak erişilemeyebilir. Ayrıca, Google Earth gibi araçlardaki uydu ve sokak seviyesi görüntüleri güncelliğini yitirmiş olabilir ve bu da bir konumun güncel durumunu doğrulamayı zorlaştırır.



4. **Gizlilik ve Etik Endişeler**



Görüntülerden coğrafi konum takibi, özellikle gizlilik konusunda etik endişelere yol açabilir. OSINT analistleri, bireylerin haklarını ihlal etmekten kaçınmak için kamuya açık olarak paylaşılan görüntüleri araştırırken dikkatli olmalıdır. Ayrıca, kişisel fotoğrafları izinsiz çıkarmak ve analiz etmek belirli yargı bölgelerinde yasal sınırları aşabilir.



## Coğrafi Konum Takibinde Etik Hususlar



Tüm OSINT uygulamalarında olduğu gibi, etik hususlar ters görüntü araması ve coğrafi konum izlemede merkezi bir rol oynar. Herkese açık görüntülerden değerli içgörüler elde etmek mümkün olsa da, analistler olası gizlilik ihlallerinin ve araştırmalarının daha geniş kapsamlı etkilerinin farkında olmalıdır.



Temel etik hususlar şunlardır:


* **Gizliliğe Saygı** : Görüntüler herkese açık olsa da, bunları araştırma amaçlı kullanırken dikkatli olunmalıdır. Analistler kamu güvenliğine ve yasal standartlara öncelik vermelidir.

* **Zarardan Kaçınma** : Yanlış yorumlama




Coğrafi konum verilerinin yanlış kullanımı veya yanlış pozitif sonuçlar, yanlış suçlamalar veya yanlış yönlendirilmiş eylemler gibi zararlı sonuçlara yol açabilir.


* **Yasalara Uygunluk** : Analistler, uyumlu kalmalarını sağlamak için GDPR gibi veri koruma düzenlemeleri de dahil olmak üzere yerel ve uluslararası gizlilik yasaları konusunda bilgili olmalıdır.




## Sonuç



Coğrafi konum izleme için ters görüntü araması, analistlerin herkese açık görüntülerden değerli coğrafi bilgiler çıkarmasına olanak tanıyan OSINT araç setinde önemli bir tekniktir. Google Görseller, TinEye ve Yandex gibi araçları Google Earth'ten uydu görüntüleri ve Mapillary'den sokak seviyesi verileriyle birleştirerek OSINT uygulayıcıları bir görüntünün nerede çekildiğini belirleyebilir ve bu verileri araştırmalarını bilgilendirmek için kullanabilir.



Ancak, ters görüntü aramasının gücü, eksik görsel ipuçları, görüntü manipülasyonu ve etik kaygılar gibi zorluklarla birlikte gelir. Bu araçların başarılı ve sorumlu bir şekilde kullanılmasını sağlamak için OSINT analistleri dikkatli, metodik ve gizlilik ve yasal standartlara saygılı kalmalıdır.



Tersine görüntü aramasının coğrafi konum belirleme yeteneklerini ve sınırlamalarını anlayarak, ulusal güvenlik, kolluk kuvvetleri, gazetecilik ve kurumsal istihbarat alanlarındaki profesyoneller, konumları etkili bir şekilde izleyebilir, bilgileri doğrulayabilir ve çevrimiçi olarak paylaşılan çok sayıda görüntüden eyleme dönüştürülebilir istihbarat elde edebilir.
