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

  Dijital dünyada, her dosya (ister fotoğraf, ister belge, ister video olsun) çoğu kullanıcının varlığından bile haberdar olmadığı gizli bilgiler içerir.&nbsp;***Meta veri*** &nbsp;olarak bilinen bu bilgiler , dosyanın oluşturulması, değişiklikleri ve bazı durumlarda konumu hakkında değerli içgörüler sağlar.&nbsp;***Açık Kaynak İstihbaratı (OSINT)*** &nbsp;uygulayıcıları, araştırmalarının kritik bir bileşeni olarak sıklıkla meta veri çıkarımına güvenir. Özellikle yararlı bir meta veri türü&nbsp;, bir fotoğrafın veya dosyanın oluşturulduğu tam konumu sağlayabilen&nbsp;***GPS verisidir .*** 
 

  Bu blog yazısında, OSINT analistlerinin çeşitli dosyalardan gizli GPS verilerini nasıl bulup çıkarabileceklerini, kullandıkları araçları ve bu süreçte karşılaşılan zorlukları ve etik hususları inceleyeceğiz.
 

 
 ## Meta Veri Nedir?
<!-- /wp:heading -->

  ***Meta veri,*** &nbsp;diğer verileri tanımlayan veridir. Genellikle sıradan kullanıcılardan gizlenir, ancak resimler, belgeler, ses ve video gibi dosyalara gömülür ve bu dosyaların nasıl, ne zaman ve nerede oluşturulduğuna dair ek bağlam sağlar. Meta veri, aşağıdaki gibi bilgileri içerebilir:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Oluşturulma tarihi ve saati***  
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Dosya türü ve boyutu***  
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Kullanılan cihaz (kamera, telefon, bilgisayar)***  
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Yazar veya yaratıcının ayrıntıları***  
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Kullanılan yazılım veya donanım***  
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***GPS koordinatları (coğrafi etiketleme etkinleştirilmişse)***  
<!-- /wp:list-item --> 
<!-- /wp:list -->

  OSINT amaçları için meta veriler, bir dosyanın kökenleri, gerçekliği ve gözetim zinciri hakkında ipuçları sunan bir bilgi altın madeni olabilir. En kritik meta veri türleri arasında,&nbsp;bir fotoğrafın veya videonun çekildiği kesin coğrafi koordinatları ortaya çıkarabilen ve çeşitli alanlarda değerli istihbarat sunan&nbsp;***GPS verileri yer alır.*** 
 

 
 ## GPS Verilerinin OSINT İçin Önemi
<!-- /wp:heading -->

  GPS meta verileri, analistlerin içerikteki harici ipuçlarına güvenmek zorunda kalmadan bir dosyayı coğrafi olarak konumlandırmasına olanak tanıdığı için OSINT soruşturmaları için özellikle değerlidir. Kesin enlem ve boylamı bilmek, ulusal güvenlik, kolluk kuvvetleri veya kurumsal soruşturmalar için önemli bir bağlam sağlayabilir. İşte neden önemli olduğu:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Olayların Doğrulanması*** : GPS verileri analistlerin belirli olayların yerini teyit etmelerine olanak tanır. Örneğin, bir protesto veya çatışma bölgesinde çekilen bir fotoğraf, coğrafi etiketin herkese açık haritalar veya uydu görüntüleriyle karşılaştırılmasıyla doğrulanabilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Hareket Takibi*** : Analistler, birden fazla fotoğraf veya videodan GPS meta verilerini çıkararak, bireylerin veya nesnelerin zaman içindeki hareketlerini izleyebilir, desenleri ve rotaları belirleyebilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Suç Mahalli İncelemesi*** : Kolluk kuvvetleri, suç mahallerini coğrafi olarak belirlemek, olası şüphelileri tespit etmek ve hatta dijital fotoğraflarda veya videolarda bırakılan kanıtları keşfetmek için meta verileri kullanır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Gazetecilik Araştırmaları*** : Araştırmacı gazeteciler, görüntülerin gerçekliğini doğrulamak veya haberlerindeki kaynakların yerini teyit etmek için sıklıkla GPS meta verilerini kullanırlar. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Kurumsal Casusluk ve Dolandırıcılık*** : Şirketler, sızdırılan belge veya dosyaların kökenlerini izleyerek iç dolandırıcılığı, fikri mülkiyet hırsızlığını veya casusluğu araştırmak için GPS meta verilerini kullanabilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Bu güçlü bilgiyi açığa çıkarmanın anahtarı&nbsp;, OSINT analistlerinin dosyalardan gizli GPS verilerini çekmek için kullandığı bir işlem olan&nbsp;***meta veri çıkarma işleminde yatmaktadır.*** 
 

 
 ## GPS Meta Verilerini İçeren Dosya Türleri
<!-- /wp:heading -->

  Birçok dosya türü meta veri içerir, ancak coğrafi etiketleme etkinleştirilirse yalnızca belirli türler GPS koordinatlarını içerecektir. GPS verilerini depolayan en yaygın dosya türlerinden bazıları şunlardır:
 


 ### 1.&nbsp;***Görüntüler (JPEG, PNG)*** 
<!-- /wp:heading -->

  Akıllı telefonlar, dijital kameralar ve diğer cihazlar, coğrafi etiketleme etkinleştirildiğinde genellikle GPS koordinatlarını görüntü dosyalarına gömer. Örneğin, akıllı telefonunuzla bir fotoğraf çekerseniz, fotoğrafın çekildiği yerin tam enlemini, boylamını ve hatta irtifasını kaydedebilir.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***JPEG (Ortak Fotoğraf Uzmanları Grubu)*** : Bu, GPS koordinatları da dahil olmak üzere meta verileri depolayan en yaygın görüntü biçimidir. Çoğu dijital kamera ve akıllı telefon görüntüleri JPEG biçiminde yakalar. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***PNG (Taşınabilir Ağ Grafikleri)*** : Coğrafi etiketleme için JPEG'den daha az yaygın olsa da PNG dosyaları konum verileri de dahil olmak üzere gömülü meta verileri içerebilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### 2.&nbsp;***Video (MP4, MOV)*** 
<!-- /wp:heading -->

  Modern akıllı telefonlar ve kameralar da meta verilere GPS verilerini gömerek videolara coğrafi etiket ekler. Videolardan GPS verilerini çıkarmak, görüntülerin kaydedildiği yeri ortaya çıkarabilir.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***MP4 (MPEG-4)*** : Coğrafi etiketler de dahil olmak üzere meta verileri depolayan yaygın olarak kullanılan bir video formatıdır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***MOV (QuickTime Dosya Biçimi)*** : Bir video kaydedildiğinde GPS bilgisi gibi meta verileri depolayabilen Apple'ın video dosya biçimi. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### 3.&nbsp;***Belgeler (PDF, Word)*** 
<!-- /wp:heading -->

  Belgeler meta veriler de içerebilir, ancak GPS verileri bu tür dosyalara daha az sıklıkla gömülür. Ancak PDF'ler ve Word dosyaları zaman damgaları, yazar bilgileri ve belgeyi oluşturmak için kullanılan yazılım gibi diğer değerli meta veri türlerini içerebilir.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***PDF (Taşınabilir Belge Biçimi)*** : PDF dosyalarındaki meta veriler genellikle oluşturulma tarihlerini, yazarları ve değişiklik geçmişini içerir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***DOCX (Microsoft Word)*** : Word belgeleri yazar bilgilerini, düzenleme geçmişini ve zaman damgalarını içerebilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### 4.&nbsp;***Ses Dosyaları (MP3)*** 
<!-- /wp:heading -->

  Bazı ses kayıt cihazları, özellikle akıllı telefonlarda veya coğrafi etiketleme özelliğine sahip saha kayıt cihazlarında kullanılanlar, GPS koordinatlarını ses dosyalarına gömebilir. Ancak bu, görüntü ve video dosyalarına göre daha az yaygındır.
 


 ### 5.&nbsp;***EXIF ​​Verileri (Değiştirilebilir Görüntü Dosya Biçimi)*** 
<!-- /wp:heading -->

  GPS verilerine gelince, çoğu görüntü ve video dosyası meta verilerini depolamak için&nbsp;***EXIF ​​(Değiştirilebilir Görüntü Dosya Biçimi)*** &nbsp;kullanır . EXIF, akıllı telefonlar dahil olmak üzere dijital kameralar tarafından çekilen görüntüler, sesler ve diğer medyalar için biçimi belirten standarttır. GPS koordinatları genellikle diğer ilgili meta verilerle birlikte EXIF ​​verilerinde bulunur.
 

 
 ## Gizli GPS Verileri Nasıl Bulunur: Meta Veri Çıkarma Teknikleri
<!-- /wp:heading -->

  GPS verileri de dahil olmak üzere dosyalardan meta verileri çıkarmak için çeşitli yöntemler ve araçlar mevcuttur. OSINT analistleri, dijital medyaya gömülü gizli bilgileri ortaya çıkarmak için bu tekniklere güvenirler.
 


 ### 1.&nbsp;***Araçları Kullanarak Manuel Meta Veri Çıkarımı*** 
<!-- /wp:heading -->

  GPS verileri de dahil olmak üzere meta verileri çıkarmanın en kolay yolu, dosyalara gömülü gizli bilgileri okumak üzere tasarlanmış özel yazılım araçlarıdır. Manuel meta veri çıkarma için en popüler araçlardan bazıları şunlardır:
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">a.&nbsp;***Exif Aracı***  
<!-- /wp:heading -->

  ***ExifTool,*** &nbsp;meta verileri okumak, yazmak ve düzenlemek için yaygın olarak kullanılan açık kaynaklı bir yazılımdır. Görüntüler, videolar ve ses dosyaları dahil olmak üzere çeşitli dosya türlerini destekler. ExifTool ile OSINT analistleri, yalnızca birkaç tıklamayla GPS koordinatlarını ve diğer meta veri ayrıntılarını çıkarabilir.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***ExifTool Nasıl Kullanılır*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ExifTool’u indirin ve kurun. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Komut satırı arayüzünü çalıştırın veya GUI sürümünü kullanın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Analiz etmek istediğiniz dosyayı açın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Araç, varsa GPS verileri de dahil olmak üzere tüm meta verileri görüntüler. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">b.***Jeffrey'nin Exif Viewer***  
<!-- /wp:heading -->

  Jeffrey's Exif Viewer, kullanıcıların fotoğraf yüklemelerine ve GPS koordinatları da dahil olmak üzere EXIF ​​meta verilerini çıkarmalarına olanak tanıyan çevrimiçi bir araçtır. Yazılım indirmeye gerek kalmadan meta verileri çıkarmanın hızlı ve basit bir yoludur.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Jeffrey'nin Exif Görüntüleyicisi Nasıl Kullanılır*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Jeffrey'nin Exif Viewer web sitesine gidin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Resim dosyasını yükleyin veya URL'sini yapıştırın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Araç, coğrafi konum bilgileri de dahil olmak üzere ayrıntılı meta verileri görüntüleyecek. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">c.&nbsp;***Metapicz***  
<!-- /wp:heading -->

  Metapicz, resimlerden meta veri çıkarmada yardımcı olan başka bir çevrimiçi araçtır. JPEG ve PNG gibi popüler formatları destekler ve coğrafi etiketleme etkinleştirilmişse GPS verilerini ortaya çıkarabilir.
 


 ### 2.&nbsp;***Komut Dosyalarıyla Otomatik Meta Veri Çıkarımı*** 
<!-- /wp:heading -->

  ***Büyük ölçekli OSINT araştırmaları için analistler genellikle betikler kullanarak meta veri çıkarmayı otomatikleştirir. Analistler Python*** &nbsp;gibi programlama dillerini kullanarak&nbsp;yüzlerce veya binlerce görüntüyü işleyen ve meta veriyi verimli bir şekilde çıkaran betikler yazabilirler. Bu özellikle büyük veri kümeleriyle çalışırken faydalıdır.
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Meta Veri Çıkarımı için Python Kütüphaneleri*** : 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Pillow*** : Görüntü meta verilerini çıkarabilen ve düzenleyebilen bir Python Görüntüleme Kütüphanesi. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***pyExifTool*** : Python betiklerinde otomatik meta veri çıkarımına izin veren ExifTool için bir Python sarmalayıcısı. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">GPS Çıkarımı için Bir Python Komut Dosyası Örneği: 
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

  Bu betik, OSINT araştırmacılarının bir görüntü dosyasından birkaç satır kodla enlem, boylam ve yüksekliği çıkarmasına olanak tanır.
 


 ### 3.&nbsp;***Adli Analiz Araçları*** 
<!-- /wp:heading -->

  Daha gelişmiş soruşturmalar için OSINT uygulayıcıları gizli meta verileri ortaya çıkarmak, silinen dosyaları kurtarmak ve ayrıntılı analizler gerçekleştirmek için tasarlanmış&nbsp;***dijital adli bilişim araçlarını*** &nbsp;kullanabilir . Bazı popüler adli bilişim araçları şunlardır:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Otopsi*** : Araştırmacıların silinen dosyaları kurtarmasına, meta verileri analiz etmesine ve coğrafi konum bilgilerini izlemesine olanak tanıyan açık kaynaklı bir dijital adli bilişim platformu. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***FTK Imager*** : Dosya analizi, meta veri çıkarma ve silinen dosyaların kurtarılması için kullanılan bir adli araçtır. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## GPS Verilerinin Çıkarılması ve Kullanılmasındaki Zorluklar
<!-- /wp:heading -->

  GPS verilerini meta verilerden çıkarmak OSINT için güçlü bir teknik olsa da aynı zamanda bazı zorlukları da beraberinde getirir:
 


 ### 1.***Coğrafi Etiketleme***  ***Devre Dışı*** 
<!-- /wp:heading -->

  Tüm cihazlarda coğrafi etiketleme varsayılan olarak etkin değildir. Bazı kullanıcılar gizlilik nedenleriyle coğrafi etiketlemeyi etkin bir şekilde devre dışı bırakır, bu da birçok dosyanın GPS meta verisi içermeyebileceği anlamına gelir.
 


 ### 2.&nbsp;***Dosya Yönetimi*** 
<!-- /wp:heading -->

  Dosyalar, meta verileri kaldırmak veya tahrif etmek için düzenlenebilir veya değiştirilebilir. Photoshop gibi araçlar, EXIF ​​verilerini kaldırabilir veya değiştirebilir ve bu da
 

  GPS bilgilerinin doğruluğunu teyit etmek.
 


 ### 3.&nbsp;***Eksik Meta Veri*** 
<!-- /wp:heading -->

  Bazen, yalnızca kısmi meta veriler kullanılabilir. Örneğin, bir fotoğraf çekildiği tarihi ve saati içerebilir ancak GPS koordinatları eksik olabilir ve bu da coğrafi konum için kullanışlılığını sınırlar.
 


 ### 4.&nbsp;***Gizlilik ve Etik Endişeler*** 
<!-- /wp:heading -->

  Meta verileri, özellikle GPS verilerini çıkarmak ve kullanmak etik kaygılar doğurur. Meta veriler değerli istihbarat sağlayabilirken, aynı zamanda bireylerin gizliliğini ihlal edebilir. OSINT analistleri,&nbsp;***Genel Veri Koruma Yönetmeliği (GDPR)*** &nbsp;gibi yasal çerçevelere uymaya dikkat etmeli ve bu verileri kullanmanın etik etkilerini göz önünde bulundurmalıdır.
 

 
 ## Meta Veri Çıkarımında Etik Hususlar
<!-- /wp:heading -->

  Dosyalardan GPS verilerini çıkarırken ve kullanırken, OSINT analistleri etik standartlara uymalıdır. Temel hususlar şunlardır:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Gizliliğe Saygı*** : Meta veri çıkarma, bir bireyin tam konumu gibi hassas kişisel bilgileri ortaya çıkarabilir. Analistler, soruşturmalar yürütürken gizlilik haklarını ihlal etmediklerinden emin olmalıdır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Yasal Uyumluluk*** : GDPR gibi düzenlemeler, analistlerin veri gizliliğine ve bilgi toplama ve depolama için yasal gerekliliklere dikkat etmesini gerektirir. Her zaman yerel ve uluslararası yasalara uyumu sağlayın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Sorumlu Kullanım*** : Veriler yasal olarak erişilebilir olsa bile, bu verileri kullanmanın olası sonuçlarını göz önünde bulundurmak önemlidir. Analistler, bireylere zarar verebilecek veya sıkıntıya sokabilecek eylemlerden kaçınmalıdır. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Sonuç
<!-- /wp:heading -->

  Meta veri çıkarma yoluyla gizli GPS verilerini bulmak, OSINT analistleri için dijital medyanın nerede ve ne zaman oluşturulduğuna dair paha biçilmez içgörüler sağlayan hayati bir araçtır. İster ExifTool ve Jeffrey's Exif Viewer gibi manuel araçlarla ister Python kullanan otomatik komut dosyalarıyla olsun, analistler görüntülere, videolara ve belgelere gömülü GPS koordinatlarını ortaya çıkarabilir ve bu dosyaları güçlü istihbarat kaynaklarına dönüştürebilir.
 

  Ancak meta veri, özellikle GPS verisi çıkarmak, kendi zorlukları ve etik sorumluluklarıyla birlikte gelir. Teknoloji ilerledikçe, OSINT uygulayıcıları bilgiye olan ihtiyacı gizlilik ve yasal uyumlulukla dengelemeli ve meta veri çıkarma işleminin açık kaynaklı istihbarat dünyasında sorumlu ve etkili bir araç olmaya devam etmesini sağlamalıdır.
 