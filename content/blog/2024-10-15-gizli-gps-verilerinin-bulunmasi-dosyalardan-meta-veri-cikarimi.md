---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Açık Kaynak İstihbaratı (AKİ)
date: "2024-10-15T17:11:29Z"
guid: https://www.siberoloji.com/?p=3607
id: 3607
image: /assets/images/2024/10/osint3.webp
tags:
- aki
- cyber security
- osint
- siber güvenlik
title: 'Gizli GPS Verilerinin Bulunması: Dosyalardan Meta Veri Çıkarımı'
url: /tr/gizli-gps-verilerinin-bulunmasi-dosyalardan-meta-veri-cikarimi/
---

  Dijital dünyada, her dosya (ister fotoğraf, ister belge, ister video olsun) çoğu kullanıcının varlığından bile haberdar olmadığı gizli bilgiler içerir.&nbsp;<strong>Meta veri</strong>&nbsp;olarak bilinen bu bilgiler , dosyanın oluşturulması, değişiklikleri ve bazı durumlarda konumu hakkında değerli içgörüler sağlar.&nbsp;<strong>Açık Kaynak İstihbaratı (OSINT)</strong>&nbsp;uygulayıcıları, araştırmalarının kritik bir bileşeni olarak sıklıkla meta veri çıkarımına güvenir. Özellikle yararlı bir meta veri türü&nbsp;, bir fotoğrafın veya dosyanın oluşturulduğu tam konumu sağlayabilen&nbsp;<strong>GPS verisidir .</strong></p>
 

  Bu blog yazısında, OSINT analistlerinin çeşitli dosyalardan gizli GPS verilerini nasıl bulup çıkarabileceklerini, kullandıkları araçları ve bu süreçte karşılaşılan zorlukları ve etik hususları inceleyeceğiz.</p>
 

 
 ## Meta Veri Nedir?</h2>
<!-- /wp:heading -->

  <strong>Meta veri,</strong>&nbsp;diğer verileri tanımlayan veridir. Genellikle sıradan kullanıcılardan gizlenir, ancak resimler, belgeler, ses ve video gibi dosyalara gömülür ve bu dosyaların nasıl, ne zaman ve nerede oluşturulduğuna dair ek bağlam sağlar. Meta veri, aşağıdaki gibi bilgileri içerebilir:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Oluşturulma tarihi ve saati</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Dosya türü ve boyutu</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kullanılan cihaz (kamera, telefon, bilgisayar)</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Yazar veya yaratıcının ayrıntıları</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kullanılan yazılım veya donanım</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>GPS koordinatları (coğrafi etiketleme etkinleştirilmişse)</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  OSINT amaçları için meta veriler, bir dosyanın kökenleri, gerçekliği ve gözetim zinciri hakkında ipuçları sunan bir bilgi altın madeni olabilir. En kritik meta veri türleri arasında,&nbsp;bir fotoğrafın veya videonun çekildiği kesin coğrafi koordinatları ortaya çıkarabilen ve çeşitli alanlarda değerli istihbarat sunan&nbsp;<strong>GPS verileri yer alır.</strong></p>
 

 
 ## GPS Verilerinin OSINT İçin Önemi</h2>
<!-- /wp:heading -->

  GPS meta verileri, analistlerin içerikteki harici ipuçlarına güvenmek zorunda kalmadan bir dosyayı coğrafi olarak konumlandırmasına olanak tanıdığı için OSINT soruşturmaları için özellikle değerlidir. Kesin enlem ve boylamı bilmek, ulusal güvenlik, kolluk kuvvetleri veya kurumsal soruşturmalar için önemli bir bağlam sağlayabilir. İşte neden önemli olduğu:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Olayların Doğrulanması</strong> : GPS verileri analistlerin belirli olayların yerini teyit etmelerine olanak tanır. Örneğin, bir protesto veya çatışma bölgesinde çekilen bir fotoğraf, coğrafi etiketin herkese açık haritalar veya uydu görüntüleriyle karşılaştırılmasıyla doğrulanabilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Hareket Takibi</strong> : Analistler, birden fazla fotoğraf veya videodan GPS meta verilerini çıkararak, bireylerin veya nesnelerin zaman içindeki hareketlerini izleyebilir, desenleri ve rotaları belirleyebilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Suç Mahalli İncelemesi</strong> : Kolluk kuvvetleri, suç mahallerini coğrafi olarak belirlemek, olası şüphelileri tespit etmek ve hatta dijital fotoğraflarda veya videolarda bırakılan kanıtları keşfetmek için meta verileri kullanır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Gazetecilik Araştırmaları</strong> : Araştırmacı gazeteciler, görüntülerin gerçekliğini doğrulamak veya haberlerindeki kaynakların yerini teyit etmek için sıklıkla GPS meta verilerini kullanırlar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kurumsal Casusluk ve Dolandırıcılık</strong> : Şirketler, sızdırılan belge veya dosyaların kökenlerini izleyerek iç dolandırıcılığı, fikri mülkiyet hırsızlığını veya casusluğu araştırmak için GPS meta verilerini kullanabilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Bu güçlü bilgiyi açığa çıkarmanın anahtarı&nbsp;, OSINT analistlerinin dosyalardan gizli GPS verilerini çekmek için kullandığı bir işlem olan&nbsp;<strong>meta veri çıkarma işleminde yatmaktadır.</strong></p>
 

 
 ## GPS Meta Verilerini İçeren Dosya Türleri</h2>
<!-- /wp:heading -->

  Birçok dosya türü meta veri içerir, ancak coğrafi etiketleme etkinleştirilirse yalnızca belirli türler GPS koordinatlarını içerecektir. GPS verilerini depolayan en yaygın dosya türlerinden bazıları şunlardır:</p>
 

<!-- wp:heading {"level":3} -->
 ### 1.&nbsp;<strong>Görüntüler (JPEG, PNG)</strong></h3>
<!-- /wp:heading -->

  Akıllı telefonlar, dijital kameralar ve diğer cihazlar, coğrafi etiketleme etkinleştirildiğinde genellikle GPS koordinatlarını görüntü dosyalarına gömer. Örneğin, akıllı telefonunuzla bir fotoğraf çekerseniz, fotoğrafın çekildiği yerin tam enlemini, boylamını ve hatta irtifasını kaydedebilir.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>JPEG (Ortak Fotoğraf Uzmanları Grubu)</strong> : Bu, GPS koordinatları da dahil olmak üzere meta verileri depolayan en yaygın görüntü biçimidir. Çoğu dijital kamera ve akıllı telefon görüntüleri JPEG biçiminde yakalar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>PNG (Taşınabilir Ağ Grafikleri)</strong> : Coğrafi etiketleme için JPEG'den daha az yaygın olsa da PNG dosyaları konum verileri de dahil olmak üzere gömülü meta verileri içerebilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Video (MP4, MOV)</strong></h3>
<!-- /wp:heading -->

  Modern akıllı telefonlar ve kameralar da meta verilere GPS verilerini gömerek videolara coğrafi etiket ekler. Videolardan GPS verilerini çıkarmak, görüntülerin kaydedildiği yeri ortaya çıkarabilir.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>MP4 (MPEG-4)</strong> : Coğrafi etiketler de dahil olmak üzere meta verileri depolayan yaygın olarak kullanılan bir video formatıdır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>MOV (QuickTime Dosya Biçimi)</strong> : Bir video kaydedildiğinde GPS bilgisi gibi meta verileri depolayabilen Apple'ın video dosya biçimi.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 3.&nbsp;<strong>Belgeler (PDF, Word)</strong></h3>
<!-- /wp:heading -->

  Belgeler meta veriler de içerebilir, ancak GPS verileri bu tür dosyalara daha az sıklıkla gömülür. Ancak PDF'ler ve Word dosyaları zaman damgaları, yazar bilgileri ve belgeyi oluşturmak için kullanılan yazılım gibi diğer değerli meta veri türlerini içerebilir.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>PDF (Taşınabilir Belge Biçimi)</strong> : PDF dosyalarındaki meta veriler genellikle oluşturulma tarihlerini, yazarları ve değişiklik geçmişini içerir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>DOCX (Microsoft Word)</strong> : Word belgeleri yazar bilgilerini, düzenleme geçmişini ve zaman damgalarını içerebilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### 4.&nbsp;<strong>Ses Dosyaları (MP3)</strong></h3>
<!-- /wp:heading -->

  Bazı ses kayıt cihazları, özellikle akıllı telefonlarda veya coğrafi etiketleme özelliğine sahip saha kayıt cihazlarında kullanılanlar, GPS koordinatlarını ses dosyalarına gömebilir. Ancak bu, görüntü ve video dosyalarına göre daha az yaygındır.</p>
 

<!-- wp:heading {"level":3} -->
 ### 5.&nbsp;<strong>EXIF ​​Verileri (Değiştirilebilir Görüntü Dosya Biçimi)</strong></h3>
<!-- /wp:heading -->

  GPS verilerine gelince, çoğu görüntü ve video dosyası meta verilerini depolamak için&nbsp;<strong>EXIF ​​(Değiştirilebilir Görüntü Dosya Biçimi)</strong>&nbsp;kullanır . EXIF, akıllı telefonlar dahil olmak üzere dijital kameralar tarafından çekilen görüntüler, sesler ve diğer medyalar için biçimi belirten standarttır. GPS koordinatları genellikle diğer ilgili meta verilerle birlikte EXIF ​​verilerinde bulunur.</p>
 

 
 ## Gizli GPS Verileri Nasıl Bulunur: Meta Veri Çıkarma Teknikleri</h2>
<!-- /wp:heading -->

  GPS verileri de dahil olmak üzere dosyalardan meta verileri çıkarmak için çeşitli yöntemler ve araçlar mevcuttur. OSINT analistleri, dijital medyaya gömülü gizli bilgileri ortaya çıkarmak için bu tekniklere güvenirler.</p>
 

<!-- wp:heading {"level":3} -->
 ### 1.&nbsp;<strong>Araçları Kullanarak Manuel Meta Veri Çıkarımı</strong></h3>
<!-- /wp:heading -->

  GPS verileri de dahil olmak üzere meta verileri çıkarmanın en kolay yolu, dosyalara gömülü gizli bilgileri okumak üzere tasarlanmış özel yazılım araçlarıdır. Manuel meta veri çıkarma için en popüler araçlardan bazıları şunlardır:</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">a.&nbsp;<strong>Exif Aracı</strong></h4>
<!-- /wp:heading -->

  <strong>ExifTool,</strong>&nbsp;meta verileri okumak, yazmak ve düzenlemek için yaygın olarak kullanılan açık kaynaklı bir yazılımdır. Görüntüler, videolar ve ses dosyaları dahil olmak üzere çeşitli dosya türlerini destekler. ExifTool ile OSINT analistleri, yalnızca birkaç tıklamayla GPS koordinatlarını ve diğer meta veri ayrıntılarını çıkarabilir.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>ExifTool Nasıl Kullanılır</strong> :</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>ExifTool’u indirin ve kurun.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Komut satırı arayüzünü çalıştırın veya GUI sürümünü kullanın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Analiz etmek istediğiniz dosyayı açın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Araç, varsa GPS verileri de dahil olmak üzere tüm meta verileri görüntüler.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">b. <strong>Jeffrey'nin Exif Viewer</strong></h4>
<!-- /wp:heading -->

  Jeffrey's Exif Viewer, kullanıcıların fotoğraf yüklemelerine ve GPS koordinatları da dahil olmak üzere EXIF ​​meta verilerini çıkarmalarına olanak tanıyan çevrimiçi bir araçtır. Yazılım indirmeye gerek kalmadan meta verileri çıkarmanın hızlı ve basit bir yoludur.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Jeffrey'nin Exif Görüntüleyicisi Nasıl Kullanılır</strong> :</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Jeffrey'nin Exif Viewer web sitesine gidin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Resim dosyasını yükleyin veya URL'sini yapıştırın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Araç, coğrafi konum bilgileri de dahil olmak üzere ayrıntılı meta verileri görüntüleyecek.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">c.&nbsp;<strong>Metapicz</strong></h4>
<!-- /wp:heading -->

  Metapicz, resimlerden meta veri çıkarmada yardımcı olan başka bir çevrimiçi araçtır. JPEG ve PNG gibi popüler formatları destekler ve coğrafi etiketleme etkinleştirilmişse GPS verilerini ortaya çıkarabilir.</p>
 

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Komut Dosyalarıyla Otomatik Meta Veri Çıkarımı</strong></h3>
<!-- /wp:heading -->

  <strong>Büyük ölçekli OSINT araştırmaları için analistler genellikle betikler kullanarak meta veri çıkarmayı otomatikleştirir. Analistler Python</strong>&nbsp;gibi programlama dillerini kullanarak&nbsp;yüzlerce veya binlerce görüntüyü işleyen ve meta veriyi verimli bir şekilde çıkaran betikler yazabilirler. Bu özellikle büyük veri kümeleriyle çalışırken faydalıdır.</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Meta Veri Çıkarımı için Python Kütüphaneleri</strong> :</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Pillow</strong> : Görüntü meta verilerini çıkarabilen ve düzenleyebilen bir Python Görüntüleme Kütüphanesi.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>pyExifTool</strong> : Python betiklerinde otomatik meta veri çıkarımına izin veren ExifTool için bir Python sarmalayıcısı.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">GPS Çıkarımı için Bir Python Komut Dosyası Örneği:</h4>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="python" class="language-python">import exifread

# Function to extract GPS data from image metadata
def extract_gps_data(image_path):
    with open(image_path, 'rb') as image_file:
        tags = exifread.process_file(image_file)
        gps_latitude = tags.get('GPS GPSLatitude')
        gps_longitude = tags.get('GPS GPSLongitude')
        gps_altitude = tags.get('GPS GPSAltitude')
        return gps_latitude, gps_longitude, gps_altitude

# Example usage
image_path = 'example.jpg'
gps_data = extract_gps_data(image_path)
print(f"Latitude: {gps_data[0]}, Longitude: {gps_data[1]}, Altitude: {gps_data[2]}")</code></pre>
<!-- /wp:code -->

  Bu betik, OSINT araştırmacılarının bir görüntü dosyasından birkaç satır kodla enlem, boylam ve yüksekliği çıkarmasına olanak tanır.</p>
 

<!-- wp:heading {"level":3} -->
 ### 3.&nbsp;<strong>Adli Analiz Araçları</strong></h3>
<!-- /wp:heading -->

  Daha gelişmiş soruşturmalar için OSINT uygulayıcıları gizli meta verileri ortaya çıkarmak, silinen dosyaları kurtarmak ve ayrıntılı analizler gerçekleştirmek için tasarlanmış&nbsp;<strong>dijital adli bilişim araçlarını</strong>&nbsp;kullanabilir . Bazı popüler adli bilişim araçları şunlardır:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Otopsi</strong> : Araştırmacıların silinen dosyaları kurtarmasına, meta verileri analiz etmesine ve coğrafi konum bilgilerini izlemesine olanak tanıyan açık kaynaklı bir dijital adli bilişim platformu.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>FTK Imager</strong> : Dosya analizi, meta veri çıkarma ve silinen dosyaların kurtarılması için kullanılan bir adli araçtır.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## GPS Verilerinin Çıkarılması ve Kullanılmasındaki Zorluklar</h2>
<!-- /wp:heading -->

  GPS verilerini meta verilerden çıkarmak OSINT için güçlü bir teknik olsa da aynı zamanda bazı zorlukları da beraberinde getirir:</p>
 

<!-- wp:heading {"level":3} -->
 ### 1. <strong>Coğrafi Etiketleme</strong> <strong>Devre Dışı</strong></h3>
<!-- /wp:heading -->

  Tüm cihazlarda coğrafi etiketleme varsayılan olarak etkin değildir. Bazı kullanıcılar gizlilik nedenleriyle coğrafi etiketlemeyi etkin bir şekilde devre dışı bırakır, bu da birçok dosyanın GPS meta verisi içermeyebileceği anlamına gelir.</p>
 

<!-- wp:heading {"level":3} -->
 ### 2.&nbsp;<strong>Dosya Yönetimi</strong></h3>
<!-- /wp:heading -->

  Dosyalar, meta verileri kaldırmak veya tahrif etmek için düzenlenebilir veya değiştirilebilir. Photoshop gibi araçlar, EXIF ​​verilerini kaldırabilir veya değiştirebilir ve bu da</p>
 

  GPS bilgilerinin doğruluğunu teyit etmek.</p>
 

<!-- wp:heading {"level":3} -->
 ### 3.&nbsp;<strong>Eksik Meta Veri</strong></h3>
<!-- /wp:heading -->

  Bazen, yalnızca kısmi meta veriler kullanılabilir. Örneğin, bir fotoğraf çekildiği tarihi ve saati içerebilir ancak GPS koordinatları eksik olabilir ve bu da coğrafi konum için kullanışlılığını sınırlar.</p>
 

<!-- wp:heading {"level":3} -->
 ### 4.&nbsp;<strong>Gizlilik ve Etik Endişeler</strong></h3>
<!-- /wp:heading -->

  Meta verileri, özellikle GPS verilerini çıkarmak ve kullanmak etik kaygılar doğurur. Meta veriler değerli istihbarat sağlayabilirken, aynı zamanda bireylerin gizliliğini ihlal edebilir. OSINT analistleri,&nbsp;<strong>Genel Veri Koruma Yönetmeliği (GDPR)</strong>&nbsp;gibi yasal çerçevelere uymaya dikkat etmeli ve bu verileri kullanmanın etik etkilerini göz önünde bulundurmalıdır.</p>
 

 
 ## Meta Veri Çıkarımında Etik Hususlar</h2>
<!-- /wp:heading -->

  Dosyalardan GPS verilerini çıkarırken ve kullanırken, OSINT analistleri etik standartlara uymalıdır. Temel hususlar şunlardır:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Gizliliğe Saygı</strong> : Meta veri çıkarma, bir bireyin tam konumu gibi hassas kişisel bilgileri ortaya çıkarabilir. Analistler, soruşturmalar yürütürken gizlilik haklarını ihlal etmediklerinden emin olmalıdır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Yasal Uyumluluk</strong> : GDPR gibi düzenlemeler, analistlerin veri gizliliğine ve bilgi toplama ve depolama için yasal gerekliliklere dikkat etmesini gerektirir. Her zaman yerel ve uluslararası yasalara uyumu sağlayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Sorumlu Kullanım</strong> : Veriler yasal olarak erişilebilir olsa bile, bu verileri kullanmanın olası sonuçlarını göz önünde bulundurmak önemlidir. Analistler, bireylere zarar verebilecek veya sıkıntıya sokabilecek eylemlerden kaçınmalıdır.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Sonuç</h2>
<!-- /wp:heading -->

  Meta veri çıkarma yoluyla gizli GPS verilerini bulmak, OSINT analistleri için dijital medyanın nerede ve ne zaman oluşturulduğuna dair paha biçilmez içgörüler sağlayan hayati bir araçtır. İster ExifTool ve Jeffrey's Exif Viewer gibi manuel araçlarla ister Python kullanan otomatik komut dosyalarıyla olsun, analistler görüntülere, videolara ve belgelere gömülü GPS koordinatlarını ortaya çıkarabilir ve bu dosyaları güçlü istihbarat kaynaklarına dönüştürebilir.</p>
 

  Ancak meta veri, özellikle GPS verisi çıkarmak, kendi zorlukları ve etik sorumluluklarıyla birlikte gelir. Teknoloji ilerledikçe, OSINT uygulayıcıları bilgiye olan ihtiyacı gizlilik ve yasal uyumlulukla dengelemeli ve meta veri çıkarma işleminin açık kaynaklı istihbarat dünyasında sorumlu ve etkili bir araç olmaya devam etmesini sağlamalıdır.</p>
 