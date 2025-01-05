---
draft: false

title:  'Gizli GPS Verilerinin Bulunması: Dosyalardan Meta Veri Çıkarımı'
date: '2024-10-15T17:11:29+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/gizli-gps-verilerinin-bulunmasi-dosyalardan-meta-veri-cikarimi/
featured_image: /images/osint3.webp
categories:
    - 'Açık Kaynak İstihbaratı (AKİ)'
tags:
    - aki
    - 'cyber security'
    - osint
    - 'siber güvenlik'
---


Dijital dünyada, her dosya (ister fotoğraf, ister belge, ister video olsun) çoğu kullanıcının varlığından bile haberdar olmadığı gizli bilgiler içerir. **Meta veri** olarak bilinen bu bilgiler , dosyanın oluşturulması, değişiklikleri ve bazı durumlarda konumu hakkında değerli içgörüler sağlar. **Açık Kaynak İstihbaratı (OSINT)** uygulayıcıları, araştırmalarının kritik bir bileşeni olarak sıklıkla meta veri çıkarımına güvenir. Özellikle yararlı bir meta veri türü , bir fotoğrafın veya dosyanın oluşturulduğu tam konumu sağlayabilen **GPS verisidir .**



Bu blog yazısında, OSINT analistlerinin çeşitli dosyalardan gizli GPS verilerini nasıl bulup çıkarabileceklerini, kullandıkları araçları ve bu süreçte karşılaşılan zorlukları ve etik hususları inceleyeceğiz.



## Meta Veri Nedir?



**Meta veri,** diğer verileri tanımlayan veridir. Genellikle sıradan kullanıcılardan gizlenir, ancak resimler, belgeler, ses ve video gibi dosyalara gömülür ve bu dosyaların nasıl, ne zaman ve nerede oluşturulduğuna dair ek bağlam sağlar. Meta veri, aşağıdaki gibi bilgileri içerebilir:


* **Oluşturulma tarihi ve saati**

* **Dosya türü ve boyutu**

* **Kullanılan cihaz (kamera, telefon, bilgisayar)**

* **Yazar veya yaratıcının ayrıntıları**

* **Kullanılan yazılım veya donanım**

* **GPS koordinatları (coğrafi etiketleme etkinleştirilmişse)**




OSINT amaçları için meta veriler, bir dosyanın kökenleri, gerçekliği ve gözetim zinciri hakkında ipuçları sunan bir bilgi altın madeni olabilir. En kritik meta veri türleri arasında, bir fotoğrafın veya videonun çekildiği kesin coğrafi koordinatları ortaya çıkarabilen ve çeşitli alanlarda değerli istihbarat sunan **GPS verileri yer alır.**



## GPS Verilerinin OSINT İçin Önemi



GPS meta verileri, analistlerin içerikteki harici ipuçlarına güvenmek zorunda kalmadan bir dosyayı coğrafi olarak konumlandırmasına olanak tanıdığı için OSINT soruşturmaları için özellikle değerlidir. Kesin enlem ve boylamı bilmek, ulusal güvenlik, kolluk kuvvetleri veya kurumsal soruşturmalar için önemli bir bağlam sağlayabilir. İşte neden önemli olduğu:


* **Olayların Doğrulanması** : GPS verileri analistlerin belirli olayların yerini teyit etmelerine olanak tanır. Örneğin, bir protesto veya çatışma bölgesinde çekilen bir fotoğraf, coğrafi etiketin herkese açık haritalar veya uydu görüntüleriyle karşılaştırılmasıyla doğrulanabilir.

* **Hareket Takibi** : Analistler, birden fazla fotoğraf veya videodan GPS meta verilerini çıkararak, bireylerin veya nesnelerin zaman içindeki hareketlerini izleyebilir, desenleri ve rotaları belirleyebilir.

* **Suç Mahalli İncelemesi** : Kolluk kuvvetleri, suç mahallerini coğrafi olarak belirlemek, olası şüphelileri tespit etmek ve hatta dijital fotoğraflarda veya videolarda bırakılan kanıtları keşfetmek için meta verileri kullanır.

* **Gazetecilik Araştırmaları** : Araştırmacı gazeteciler, görüntülerin gerçekliğini doğrulamak veya haberlerindeki kaynakların yerini teyit etmek için sıklıkla GPS meta verilerini kullanırlar.

* **Kurumsal Casusluk ve Dolandırıcılık** : Şirketler, sızdırılan belge veya dosyaların kökenlerini izleyerek iç dolandırıcılığı, fikri mülkiyet hırsızlığını veya casusluğu araştırmak için GPS meta verilerini kullanabilir.




Bu güçlü bilgiyi açığa çıkarmanın anahtarı , OSINT analistlerinin dosyalardan gizli GPS verilerini çekmek için kullandığı bir işlem olan **meta veri çıkarma işleminde yatmaktadır.**



## GPS Meta Verilerini İçeren Dosya Türleri



Birçok dosya türü meta veri içerir, ancak coğrafi etiketleme etkinleştirilirse yalnızca belirli türler GPS koordinatlarını içerecektir. GPS verilerini depolayan en yaygın dosya türlerinden bazıları şunlardır:



1. **Görüntüler (JPEG, PNG)**



Akıllı telefonlar, dijital kameralar ve diğer cihazlar, coğrafi etiketleme etkinleştirildiğinde genellikle GPS koordinatlarını görüntü dosyalarına gömer. Örneğin, akıllı telefonunuzla bir fotoğraf çekerseniz, fotoğrafın çekildiği yerin tam enlemini, boylamını ve hatta irtifasını kaydedebilir.


* **JPEG (Ortak Fotoğraf Uzmanları Grubu)** : Bu, GPS koordinatları da dahil olmak üzere meta verileri depolayan en yaygın görüntü biçimidir. Çoğu dijital kamera ve akıllı telefon görüntüleri JPEG biçiminde yakalar.

* **PNG (Taşınabilir Ağ Grafikleri)** : Coğrafi etiketleme için JPEG'den daha az yaygın olsa da PNG dosyaları konum verileri de dahil olmak üzere gömülü meta verileri içerebilir.




2. **Video (MP4, MOV)**



Modern akıllı telefonlar ve kameralar da meta verilere GPS verilerini gömerek videolara coğrafi etiket ekler. Videolardan GPS verilerini çıkarmak, görüntülerin kaydedildiği yeri ortaya çıkarabilir.


* **MP4 (MPEG-4)** : Coğrafi etiketler de dahil olmak üzere meta verileri depolayan yaygın olarak kullanılan bir video formatıdır.

* **MOV (QuickTime Dosya Biçimi)** : Bir video kaydedildiğinde GPS bilgisi gibi meta verileri depolayabilen Apple'ın video dosya biçimi.




3. **Belgeler (PDF, Word)**



Belgeler meta veriler de içerebilir, ancak GPS verileri bu tür dosyalara daha az sıklıkla gömülür. Ancak PDF'ler ve Word dosyaları zaman damgaları, yazar bilgileri ve belgeyi oluşturmak için kullanılan yazılım gibi diğer değerli meta veri türlerini içerebilir.


* **PDF (Taşınabilir Belge Biçimi)** : PDF dosyalarındaki meta veriler genellikle oluşturulma tarihlerini, yazarları ve değişiklik geçmişini içerir.

* **DOCX (Microsoft Word)** : Word belgeleri yazar bilgilerini, düzenleme geçmişini ve zaman damgalarını içerebilir.




4. **Ses Dosyaları (MP3)**



Bazı ses kayıt cihazları, özellikle akıllı telefonlarda veya coğrafi etiketleme özelliğine sahip saha kayıt cihazlarında kullanılanlar, GPS koordinatlarını ses dosyalarına gömebilir. Ancak bu, görüntü ve video dosyalarına göre daha az yaygındır.



5. **EXIF ​​Verileri (Değiştirilebilir Görüntü Dosya Biçimi)**



GPS verilerine gelince, çoğu görüntü ve video dosyası meta verilerini depolamak için **EXIF ​​(Değiştirilebilir Görüntü Dosya Biçimi)** kullanır . EXIF, akıllı telefonlar dahil olmak üzere dijital kameralar tarafından çekilen görüntüler, sesler ve diğer medyalar için biçimi belirten standarttır. GPS koordinatları genellikle diğer ilgili meta verilerle birlikte EXIF ​​verilerinde bulunur.



## Gizli GPS Verileri Nasıl Bulunur: Meta Veri Çıkarma Teknikleri



GPS verileri de dahil olmak üzere dosyalardan meta verileri çıkarmak için çeşitli yöntemler ve araçlar mevcuttur. OSINT analistleri, dijital medyaya gömülü gizli bilgileri ortaya çıkarmak için bu tekniklere güvenirler.



1. **Araçları Kullanarak Manuel Meta Veri Çıkarımı**



GPS verileri de dahil olmak üzere meta verileri çıkarmanın en kolay yolu, dosyalara gömülü gizli bilgileri okumak üzere tasarlanmış özel yazılım araçlarıdır. Manuel meta veri çıkarma için en popüler araçlardan bazıları şunlardır:


#### a. **Exif Aracı**



**ExifTool,** meta verileri okumak, yazmak ve düzenlemek için yaygın olarak kullanılan açık kaynaklı bir yazılımdır. Görüntüler, videolar ve ses dosyaları dahil olmak üzere çeşitli dosya türlerini destekler. ExifTool ile OSINT analistleri, yalnızca birkaç tıklamayla GPS koordinatlarını ve diğer meta veri ayrıntılarını çıkarabilir.


* **ExifTool Nasıl Kullanılır** :



* ExifTool’u indirin ve kurun.

* Komut satırı arayüzünü çalıştırın veya GUI sürümünü kullanın.

* Analiz etmek istediğiniz dosyayı açın.

* Araç, varsa GPS verileri de dahil olmak üzere tüm meta verileri görüntüler.



#### b. **Jeffrey'nin Exif Viewer**



Jeffrey's Exif Viewer, kullanıcıların fotoğraf yüklemelerine ve GPS koordinatları da dahil olmak üzere EXIF ​​meta verilerini çıkarmalarına olanak tanıyan çevrimiçi bir araçtır. Yazılım indirmeye gerek kalmadan meta verileri çıkarmanın hızlı ve basit bir yoludur.


* **Jeffrey'nin Exif Görüntüleyicisi Nasıl Kullanılır** :



* Jeffrey'nin Exif Viewer web sitesine gidin.

* Resim dosyasını yükleyin veya URL'sini yapıştırın.

* Araç, coğrafi konum bilgileri de dahil olmak üzere ayrıntılı meta verileri görüntüleyecek.



#### c. **Metapicz**



Metapicz, resimlerden meta veri çıkarmada yardımcı olan başka bir çevrimiçi araçtır. JPEG ve PNG gibi popüler formatları destekler ve coğrafi etiketleme etkinleştirilmişse GPS verilerini ortaya çıkarabilir.



2. **Komut Dosyalarıyla Otomatik Meta Veri Çıkarımı**



**Büyük ölçekli OSINT araştırmaları için analistler genellikle betikler kullanarak meta veri çıkarmayı otomatikleştirir. Analistler Python** gibi programlama dillerini kullanarak yüzlerce veya binlerce görüntüyü işleyen ve meta veriyi verimli bir şekilde çıkaran betikler yazabilirler. Bu özellikle büyük veri kümeleriyle çalışırken faydalıdır.


* **Meta Veri Çıkarımı için Python Kütüphaneleri** :

* **Pillow** : Görüntü meta verilerini çıkarabilen ve düzenleyebilen bir Python Görüntüleme Kütüphanesi.

* **pyExifTool** : Python betiklerinde otomatik meta veri çıkarımına izin veren ExifTool için bir Python sarmalayıcısı.



#### GPS Çıkarımı için Bir Python Komut Dosyası Örneği:


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
print(f"Latitude: {gps_data[0]}, Longitude: {gps_data[1]}, Altitude: {gps_data[2]}")```



Bu betik, OSINT araştırmacılarının bir görüntü dosyasından birkaç satır kodla enlem, boylam ve yüksekliği çıkarmasına olanak tanır.



3. **Adli Analiz Araçları**



Daha gelişmiş soruşturmalar için OSINT uygulayıcıları gizli meta verileri ortaya çıkarmak, silinen dosyaları kurtarmak ve ayrıntılı analizler gerçekleştirmek için tasarlanmış **dijital adli bilişim araçlarını** kullanabilir . Bazı popüler adli bilişim araçları şunlardır:


* **Otopsi** : Araştırmacıların silinen dosyaları kurtarmasına, meta verileri analiz etmesine ve coğrafi konum bilgilerini izlemesine olanak tanıyan açık kaynaklı bir dijital adli bilişim platformu.

* **FTK Imager** : Dosya analizi, meta veri çıkarma ve silinen dosyaların kurtarılması için kullanılan bir adli araçtır.




## GPS Verilerinin Çıkarılması ve Kullanılmasındaki Zorluklar



GPS verilerini meta verilerden çıkarmak OSINT için güçlü bir teknik olsa da aynı zamanda bazı zorlukları da beraberinde getirir:



1. **Coğrafi Etiketleme** **Devre Dışı**



Tüm cihazlarda coğrafi etiketleme varsayılan olarak etkin değildir. Bazı kullanıcılar gizlilik nedenleriyle coğrafi etiketlemeyi etkin bir şekilde devre dışı bırakır, bu da birçok dosyanın GPS meta verisi içermeyebileceği anlamına gelir.



2. **Dosya Yönetimi**



Dosyalar, meta verileri kaldırmak veya tahrif etmek için düzenlenebilir veya değiştirilebilir. Photoshop gibi araçlar, EXIF ​​verilerini kaldırabilir veya değiştirebilir ve bu da



GPS bilgilerinin doğruluğunu teyit etmek.



3. **Eksik Meta Veri**



Bazen, yalnızca kısmi meta veriler kullanılabilir. Örneğin, bir fotoğraf çekildiği tarihi ve saati içerebilir ancak GPS koordinatları eksik olabilir ve bu da coğrafi konum için kullanışlılığını sınırlar.



4. **Gizlilik ve Etik Endişeler**



Meta verileri, özellikle GPS verilerini çıkarmak ve kullanmak etik kaygılar doğurur. Meta veriler değerli istihbarat sağlayabilirken, aynı zamanda bireylerin gizliliğini ihlal edebilir. OSINT analistleri, **Genel Veri Koruma Yönetmeliği (GDPR)** gibi yasal çerçevelere uymaya dikkat etmeli ve bu verileri kullanmanın etik etkilerini göz önünde bulundurmalıdır.



## Meta Veri Çıkarımında Etik Hususlar



Dosyalardan GPS verilerini çıkarırken ve kullanırken, OSINT analistleri etik standartlara uymalıdır. Temel hususlar şunlardır:


* **Gizliliğe Saygı** : Meta veri çıkarma, bir bireyin tam konumu gibi hassas kişisel bilgileri ortaya çıkarabilir. Analistler, soruşturmalar yürütürken gizlilik haklarını ihlal etmediklerinden emin olmalıdır.

* **Yasal Uyumluluk** : GDPR gibi düzenlemeler, analistlerin veri gizliliğine ve bilgi toplama ve depolama için yasal gerekliliklere dikkat etmesini gerektirir. Her zaman yerel ve uluslararası yasalara uyumu sağlayın.

* **Sorumlu Kullanım** : Veriler yasal olarak erişilebilir olsa bile, bu verileri kullanmanın olası sonuçlarını göz önünde bulundurmak önemlidir. Analistler, bireylere zarar verebilecek veya sıkıntıya sokabilecek eylemlerden kaçınmalıdır.




## Sonuç



Meta veri çıkarma yoluyla gizli GPS verilerini bulmak, OSINT analistleri için dijital medyanın nerede ve ne zaman oluşturulduğuna dair paha biçilmez içgörüler sağlayan hayati bir araçtır. İster ExifTool ve Jeffrey's Exif Viewer gibi manuel araçlarla ister Python kullanan otomatik komut dosyalarıyla olsun, analistler görüntülere, videolara ve belgelere gömülü GPS koordinatlarını ortaya çıkarabilir ve bu dosyaları güçlü istihbarat kaynaklarına dönüştürebilir.



Ancak meta veri, özellikle GPS verisi çıkarmak, kendi zorlukları ve etik sorumluluklarıyla birlikte gelir. Teknoloji ilerledikçe, OSINT uygulayıcıları bilgiye olan ihtiyacı gizlilik ve yasal uyumlulukla dengelemeli ve meta veri çıkarma işleminin açık kaynaklı istihbarat dünyasında sorumlu ve etkili bir araç olmaya devam etmesini sağlamalıdır.
