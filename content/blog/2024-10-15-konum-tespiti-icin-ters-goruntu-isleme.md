---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Açık Kaynak İstihbaratı (AKİ)
date: "2024-10-15T17:25:22Z"
guid: https://www.siberoloji.com/?p=3615
id: 3615
image: /assets/images/2024/10/osint3.webp
tags:
- aki
- cyber security
- osint
- siber güvenlik
title: Konum Tespiti için Ters Görüntü İşleme
url: /tr/konum-tespiti-icin-ters-goruntu-isleme/
---

  Sürekli gelişen Açık Kaynak İstihbaratı (OSINT) manzarasında, en güçlü ancak yeterince kullanılmayan tekniklerden biri, konum keşfi için <strong>ters görüntü  aramasıdır</strong> , diğer adıyla <strong>görüntülerden coğrafi konum izleme</strong> . Akıllı telefonların ve sosyal medyanın yükselişiyle, konumlar hakkında görsel ipuçları içeren görüntüler her gün çevrimiçi olarak yükleniyor. OSINT analistleri bu görüntüleri kullanarak coğrafi bilgi çıkarabilir, konumları izleyebilir ve eyleme dönüştürülebilir istihbarat toplayabilir.</p>
 

  Bu blog yazısı, OSINT'teki ters görüntü arama tekniğine detaylı bir bakış sağlayacak, bu tekniğin coğrafi konum takibi için nasıl kullanıldığını, kullanılan araçları ve stratejileri ve bu süreci çevreleyen zorlukları ve etik hususları açıklayacaktır.</p>
 

 
 ## Tersine Görsel Arama Nedir?</h2>
<!-- /wp:heading -->

  Ters resim araması, bir resim yükleyerek veya bir URL'yi bir arama motoruna yapıştırarak internette benzer veya aynı resimleri bulmak için kullanılan bir yöntemdir . Kullanıcılar anahtar kelimeler veya metin kullanmak yerine sorgu olarak bir resmin kendisini kullanabilirler. Bu işlem şunlara yardımcı olur:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Resmin orijinal kaynağını tanımlayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Resmin daha yüksek çözünürlüklü versiyonlarını bulun.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Görselin başka bir yerde kullanılıp kullanılmadığını veya değiştirilip değiştirilmediğini öğrenin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Konumlar veya simge yapılar gibi önemli görsel öğeleri belirlemek için bir görseli çapraz referanslayın.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  OSINT bağlamında, ters görüntü araması araştırmacıların bir görüntünün coğrafi konumunu belirlemesine yardımcı olabilir; buna genellikle&nbsp;<strong>coğrafi konum izleme</strong>&nbsp;denir .</p>
 

 
 ## OSINT'te Görüntülerden Coğrafi Konum Takibinin Önemi</h2>
<!-- /wp:heading -->

  Görüntülerden coğrafi konum takibi, özellikle bir konumun soruşturma için kritik olduğu durumlarda çeşitli OSINT uygulamalarında önemli bir rol oynar. Buna ulusal güvenlik, suç soruşturması, afet müdahalesi, gazetecilik veya kurumsal istihbarat dahil olabilir. İşte neden önemli olduğu:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Bilgi Doğrulaması</strong> : Yanlış bilgi çağında, görüntülerin gerçekliğini doğrulamak hayati önem taşır. Bir görüntünün coğrafi konumunu belirlemek, fotoğrafın iddia edilen konumda çekilip çekilmediğini veya manipüle edilip edilmediğini belirlemeye yardımcı olur.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Durumsal Farkındalık</strong> : Coğrafi konum, doğal afetler veya çatışma bölgeleri gibi krizler sırasında gerçek zamanlı durumsal farkındalık sağlayabilir. Sosyal medya görüntülerini analiz etmek, olayların yerini ve kapsamını belirlemeye, karar alma ve yanıt çabalarına yardımcı olmaya yardımcı olur.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Suç Faaliyetlerinin Takibi</strong> : Kolluk kuvvetleri, çevrimiçi görüntülerin konumunu izleyerek insan ticareti, terörizm ve organize suç gibi yasa dışı faaliyetleri izlemek için coğrafi konumu kullanır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Askeri Hareketlerin İzlenmesi</strong> : İstihbarat teşkilatları, asker hareketlerini, askeri teçhizatı ve çatışmayla ilgili faaliyetleri takip etmek amacıyla sosyal medya platformlarında paylaşılan görüntüleri izliyor.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kayıp Kişileri Bulma</strong> : Sosyal medyada paylaşılan görseller, kayıp kişilerin nerede olduğuna dair ipuçları sağlayabilir. Tersine görsel araması, herkese açık olarak paylaşılan fotoğraflara dayanarak desenleri veya konumları bulmada önemli bir araçtır.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

 
 ## Tersine Resim Araması Bir Resmin Coğrafi Konumunu Belirlemeye Nasıl Yardımcı Olabilir</h2>
<!-- /wp:heading -->

  Ters görüntü araması genellikle belirli bir görüntünün nerede çekildiğini bulmanın başlangıç ​​noktasıdır. İşlem, görüntüyü web'de eşleşmeler veya görsel olarak benzer görüntüler arayan bir ters görüntü arama motoruna yüklemeyi içerir. Bir eşleşme bulunursa, görüntünün konumu hakkında değerli ipuçları sağlayabilir ve analistlerin coğrafi bağlamı bir araya getirmesine yardımcı olabilir.</p>
 

<!-- wp:heading {"level":3} -->
 ### Tersine Görsel Arama ile Bir Görselin Coğrafi Konumunu Belirleme Adımları:</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Resmi Yükleyin veya Girin</strong> : Araştırmak istediğiniz resmi yükleyerek veya URL'sini ters resim arama motoruna girerek başlayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Görsel İpuçlarını Analiz Edin</strong> : Resimde belirgin görsel ipuçlarını (örneğin, simge yapılar, sokak tabelaları, bina mimarisi veya benzersiz coğrafi özellikler) arayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong><a href="https://www.siberoloji.com/reverse-image-search-for-location-discovery-osint-geolocation-tracking-from-images/#"> </a>Eşleşmeleri Ara</strong> : Arama motoru benzer veya aynı görsellerin çevrimiçi olarak nerede göründüğünü gösteren sonuçları döndürecektir. Potansiyel konumları bulmak için bu sonuçları inceleyin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Haritalarla çapraz referanslama</strong> : Bir görsel benzersiz görsel öğeler içeriyorsa, konumu doğrulamak için bunları Google Haritalar veya uydu görüntüleri gibi çevrimiçi harita servisleriyle çapraz referanslayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Bilgileri Doğrulayın</strong> : Doğruluğu sağlamak için sonuçları her zaman birden fazla kaynak veya araç kullanarak doğrulayın; çünkü görüntü değişiklikleri veya manipülasyonları bazen arama motorunu yanıltabilir.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Coğrafi Konum Belirleme İçin Görsellerdeki Temel Unsurlar:</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Anıtlar ve Simge Yapılar</strong> : Ünlü binalar, heykeller veya benzersiz doğal özellikler gibi kolayca tanınabilen yapılar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Sokak İşaretleri ve Reklam Panoları</strong> : Yerel dillerdeki işaretler, yol işaretleri veya reklamlar bölge veya ülke hakkında ipuçları verebilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Araç Plakaları</strong> : Kısmi veya tam plakalar, ülkeyi veya ülke içindeki belirli bir bölgeyi tanımlamaya yardımcı olabilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Mimari</strong> : Yapı stilleri veya mimari detaylar, kendine özgü yapıları ile bilinen belirli bölgelere veya ülkelere işaret edebilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Flora ve Fauna</strong> : Görseldeki bitki, ağaç veya hayvan türleri iklim veya coğrafi bölge hakkında ipuçları verebilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Giyim ve Kültürel İşaretler</strong> : Görseldeki kişilerin giydiği giyim türü belirli bir kültürü veya bölgeyi işaret edebilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Ters Görüntü Arama ve Coğrafi Konum Takibi için Araçlar</h2>
<!-- /wp:heading -->

  OSINT uygulayıcılarının erişebildiği ters görüntü  arama ve coğrafi konum izleme için çeşitli araçlar mevcuttur . Bu araçların her biri, görüntülerden coğrafi bilgi çıkarmak için benzersiz özellikler ve yöntemler sunar.</p>
 

<!-- wp:heading {"level":3} -->
 ### 1. <strong>Google Reverse Image Search</strong></h3>
<!-- /wp:heading -->

  Google'ın ters görsel arama aracı, web genelinde görsel olarak benzer görselleri belirlemek için en yaygın kullanılanlardan biridir. Analistler bir görseli yükleyebilir veya URL'sini Google Görseller'e yapıştırabilir ve benzer görsellerin çevrimiçi olarak nerede göründüğünü görebilir. Google'ın ters görsel araması genel araştırmalar için etkili olsa da, benzersiz veya daha az popüler görsellerle zorluk çekebilir.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">OSINT için Google Görseller nasıl kullanılır:</h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><a href="https://images.google.com" target="_blank" rel="noreferrer noopener">images.google.com</a> adresine gidin .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Bir resim yüklemek veya bir URL yapıştırmak için arama çubuğundaki kamera simgesine tıklayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Sonuçları inceleyin ve konumu bulmak için ilgili eşleşmeleri çapraz referanslayın.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>TinEye</strong></h3>
<!-- /wp:heading -->

  TinEye, görüntü kullanımını izleme ve kopyaları bulma konusunda uzmanlaşmış başka bir ters görüntü arama motorudur. Bir fotoğrafın orijinal kaynağını belirlemeyi amaçlayan OSINT analistleri için değerli olan, çevrimiçi bir görüntünün en erken görünümünü bulma yeteneğiyle bilinir.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">TinEye'ın Özellikleri:</h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Çift veya değiştirilmiş görselleri tespit etmede hızlı ve güvenilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Görüntü eşleşme geçmişlerini sağlar, bir görüntünün ilk olarak nerede ve ne zaman göründüğünü gösterir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Daha hızlı aramalar için tarayıcı eklentileri sunar.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 3.&nbsp;<strong>Yandex Görselleri</strong></h3>
<!-- /wp:heading -->

  Rus arama motoru Yandex, özellikle Rusya ve yakın bölgelerdeki görselleri coğrafi olarak konumlandırırken güçlü ters görsel arama yetenekleriyle bilinir. Birçok OSINT uygulayıcısı, belirsiz ve daha az indekslenmiş görselleri bulma yeteneği nedeniyle Yandex'i tercih eder.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">OSINT için Yandex'in Avantajları:</h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Özellikle dış mekan sahneleri ve binalar için güçlü görüntü eşleştirme algoritması.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Doğu Avrupa, Rusya ve çevre bölgeler için Google veya diğer arama motorlarından daha kapsamlı görsel sonuçları.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 4.&nbsp;<strong>Bing Görsel Arama</strong></h3>
<!-- /wp:heading -->

  Bing'in görsel araması, ters resim aramalarında yardımcı olabilecek başka bir araçtır, ancak OSINT'te Google veya TinEye'dan daha az kullanılır. Bing, resimler için URL'leri yüklemek veya girmek ve eşleşmeleri almak için benzer bir işlem sunar.</p>
 

<!-- wp:heading {"level":3} -->
 ### 5.&nbsp;<strong>Mapillary</strong></h3>
<!-- /wp:heading -->

  Mapillary, Google Street View'a benzer, kalabalık kaynaklı bir sokak seviyesi görüntü platformudur. Kullanıcılar, daha sonra belirli konumları tanımlamak için kullanılabilen coğrafi etiketli fotoğraflar katkıda bulunur. Coğrafi konum takibi için Mapillary, dünyanın dört bir yanından sokak seviyesi görünümleriyle görüntüleri eşleştirmek için harika bir kaynaktır.</p>
 

<!-- wp:heading {"level":3} -->
 ### 6.&nbsp;<strong>Google Earth ve Sokak Görünümü</strong></h3>
<!-- /wp:heading -->

  Potansiyel coğrafi ipuçları ters görüntü aramasıyla belirlendikten sonra, Google Earth ve Street View gibi araçlar devreye girer. Google Earth kullanıcıların dünyanın uydu görüntülerini görüntülemesine olanak tanırken, Street View ayrıntılı sokak seviyesi görüntüleri sunar. Bu araçlar birlikte, OSINT analistlerinin görüntüde bulunan binaların, yer işaretlerinin veya coğrafi özelliklerin konumunu çapraz referanslamasını ve doğrulamasını sağlar.</p>
 

<!-- wp:heading {"level":3} -->
 ### 7.&nbsp;<strong>Exif Veri Çıkarma Araçları</strong></h3>
<!-- /wp:heading -->

  <strong>Bazen bir görüntü, Değiştirilebilir Görüntü Dosya Biçimi (Exif)</strong>&nbsp;verisi olarak bilinen gömülü meta veri içerebilir&nbsp;. Exif verileri, görüntüyü yakalamak için kullanılan cihaz, tarih ve saat ve en önemlisi cihazda coğrafi etiketleme etkinleştirilmişse coğrafi koordinatlar gibi bir görüntü hakkında önemli bilgileri ortaya çıkarabilir.&nbsp;<strong>ExifTool</strong>&nbsp;veya&nbsp;<strong>Jeffrey's Exif Viewer</strong>&nbsp;gibi araçlar bu meta veriyi çıkarabilir ve bu, OSINT araştırmalarında kritik bir adım haline gelir.</p>
 

 
 ## Görüntülerden Coğrafi Konum Takibindeki Zorluklar</h2>
<!-- /wp:heading -->

  Coğrafi konum takibi için ters görüntü  araması güçlü bir teknik olsa da, OSINT analistlerinin farkında olması gereken sınırlamaları ve zorlukları vardır:</p>
 

<!-- wp:heading {"level":3} -->
 ### 1.&nbsp;<strong>Ayırt Edici Görsel İpuçlarının Eksikliği</strong></h3>
<!-- /wp:heading -->

  Tüm görseller coğrafi konum belirleme için kullanılabilecek tanınabilir dönüm noktaları, işaretler veya diğer ayırt edici özellikler içermez. Örneğin kırsal veya iç mekan görselleri bir konumu tam olarak belirlemek için yeterli bilgi sunmayabilir.</p>
 

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Manipülasyon ve Düzenleme</strong></h3>
<!-- /wp:heading -->

  Çevrimiçi paylaşılan görseller sıklıkla değiştirilir, filtrelenir veya manipüle edilir, bu da coğrafi konumu daha zor hale getirebilir. Ters görsel arama motorları, özellikle arka plan veya önemli görsel öğeler değiştirilmişse, değiştirilmiş görselleri tanımlamakta zorluk çekebilir.</p>
 

<!-- wp:heading {"level":3} -->
 ### 3.&nbsp;<strong>Güncel Olmayan veya Kaldırılan Veriler</strong></h3>
<!-- /wp:heading -->

  Bazen, bir görüntünün orijinal sürümüne silme veya dizin kaldırma nedeniyle artık çevrimiçi olarak erişilemeyebilir. Ayrıca, Google Earth gibi araçlardaki uydu ve sokak seviyesi görüntüleri güncelliğini yitirmiş olabilir ve bu da bir konumun güncel durumunu doğrulamayı zorlaştırır.</p>
 

<!-- wp:heading {"level":3} -->
 ### 4.&nbsp;<strong>Gizlilik ve Etik Endişeler</strong></h3>
<!-- /wp:heading -->

  Görüntülerden coğrafi konum takibi, özellikle gizlilik konusunda etik endişelere yol açabilir. OSINT analistleri, bireylerin haklarını ihlal etmekten kaçınmak için kamuya açık olarak paylaşılan görüntüleri araştırırken dikkatli olmalıdır. Ayrıca, kişisel fotoğrafları izinsiz çıkarmak ve analiz etmek belirli yargı bölgelerinde yasal sınırları aşabilir.</p>
 

 
 ## Coğrafi Konum Takibinde Etik Hususlar</h2>
<!-- /wp:heading -->

  Tüm OSINT uygulamalarında olduğu gibi, etik hususlar ters görüntü araması ve coğrafi konum izlemede merkezi bir rol oynar. Herkese açık görüntülerden değerli içgörüler elde etmek mümkün olsa da, analistler olası gizlilik ihlallerinin ve araştırmalarının daha geniş kapsamlı etkilerinin farkında olmalıdır.</p>
 

  Temel etik hususlar şunlardır:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Gizliliğe Saygı</strong> : Görüntüler herkese açık olsa da, bunları araştırma amaçlı kullanırken dikkatli olunmalıdır. Analistler kamu güvenliğine ve yasal standartlara öncelik vermelidir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Zarardan Kaçınma</strong> : Yanlış yorumlama</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Coğrafi konum verilerinin yanlış kullanımı veya yanlış pozitif sonuçlar, yanlış suçlamalar veya yanlış yönlendirilmiş eylemler gibi zararlı sonuçlara yol açabilir.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Yasalara Uygunluk</strong> : Analistler, uyumlu kalmalarını sağlamak için GDPR gibi veri koruma düzenlemeleri de dahil olmak üzere yerel ve uluslararası gizlilik yasaları konusunda bilgili olmalıdır.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Sonuç</h2>
<!-- /wp:heading -->

  Coğrafi konum izleme için ters görüntü araması, analistlerin herkese açık görüntülerden değerli coğrafi bilgiler çıkarmasına olanak tanıyan OSINT araç setinde önemli bir tekniktir. Google Görseller, TinEye ve Yandex gibi araçları Google Earth'ten uydu görüntüleri ve Mapillary'den sokak seviyesi verileriyle birleştirerek OSINT uygulayıcıları bir görüntünün nerede çekildiğini belirleyebilir ve bu verileri araştırmalarını bilgilendirmek için kullanabilir.</p>
 

  Ancak, ters görüntü aramasının gücü, eksik görsel ipuçları, görüntü manipülasyonu ve etik kaygılar gibi zorluklarla birlikte gelir. Bu araçların başarılı ve sorumlu bir şekilde kullanılmasını sağlamak için OSINT analistleri dikkatli, metodik ve gizlilik ve yasal standartlara saygılı kalmalıdır.</p>
 

  Tersine görüntü aramasının coğrafi konum belirleme yeteneklerini ve sınırlamalarını anlayarak, ulusal güvenlik, kolluk kuvvetleri, gazetecilik ve kurumsal istihbarat alanlarındaki profesyoneller, konumları etkili bir şekilde izleyebilir, bilgileri doğrulayabilir ve çevrimiçi olarak paylaşılan çok sayıda görüntüden eyleme dönüştürülebilir istihbarat elde edebilir.</p>
 