---
draft: false

title:  'Keşif Aşamasında Bilgi Sızıntısına Karşı Koruma'
date: '2024-11-02T21:35:11+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu makalede bilgi sızıntısının ne olduğu, keşif sırasında neden özellikle tehlikeli olduğu ve kuruluşların sağlam güvenlik uygulamaları ve farkındalık yoluyla kendilerini buna karşı nasıl koruyabilecekleri ele alınmaktadır.' 
 
url:  /tr/kesif-asamasinda-bilgi-sizintisina-karsi-koruma/
 
featured_image: /images/cybersecurity4.webp
categories:
    - 'Bilgi Toplama'
tags:
    - keşif
---

Dijital çağda, herhangi bir siber saldırının ilk adımı genellikle keşiftir. Bu aşamada, saldırganlar potansiyel güvenlik açıklarını belirlemek için hedef kuruluşun sistemleri, ağları, çalışanları ve güvenlik önlemleri hakkında bilgi toplar. Bilgi sızıntısı (hassas verilerin istenmeyen şekilde ifşa edilmesi) bu aşamada kritik bir risk olabilir. Kuruluşların, siber suçluların güvenlik yapılarına ilişkin bilgi edinmesini önlemek için bilgi sızıntısına karşı nasıl korunacaklarını anlamaları gerekir.

Bu makalede bilgi sızıntısının ne olduğu, keşif sırasında neden özellikle tehlikeli olduğu ve kuruluşların sağlam güvenlik uygulamaları ve farkındalık yoluyla kendilerini buna karşı nasıl koruyabilecekleri ele alınmaktadır.

---

**Bilgi Sızıntısı Nedir?**
Bilgi sızıntısı, bir sistem, ağ veya organizasyon hakkındaki hassas verilerin yetkisiz kullanıcılar tarafından istemeden erişilebilir hale getirilmesiyle oluşur. Bu bilgiler meta veriler, korumasız dosyalar, yapılandırma ayrıntıları ve hatta sosyal medya aracılığıyla ifşa edilen çalışan ayrıntıları gibi çeşitli biçimlerde olabilir. Keşif aşamasında saldırganlar, bir araya getirildiğinde organizasyonun altyapısına dair kritik içgörüler ortaya çıkarabilecek herkese açık bilgileri veya hatta küçük ipuçlarını ararlar.

Siber güvenlikte bilgi sızıntısı, saldırganlara IP adresleri, açık portlar, yazılım sürümleri ve personel bilgileri gibi değerli veriler sağlayabilir ve hedefli saldırılar planlamalarına olanak tanır. Keşif sırasında bu sızıntıya karşı koruma sağlamak, güçlü bir güvenlik duruşunu sürdürmek için çok önemlidir.

---

**Keşif Aşamasında Bilgi Sızdırmak Neden Risklidir?**
Keşif aşaması, bilgisayar korsanlarının belirli, karmaşık saldırılar tasarlamak için istihbarat topladığı aşamadır. İşte bu aşamada bilgi sızıntısının özellikle tehlikeli olmasının nedeni:

 	* **Saldırı Vektörlerinin Belirlenmesi**
Sızdırılan bilgiler, güncel olmayan yazılım sürümleri, yanlış yapılandırılmış güvenlik duvarları veya korumasız uç noktalar gibi saldırganlar için potansiyel giriş noktalarını ortaya çıkarabilir.
 	* **Sosyal Mühendislik Saldırılarını Kolaylaştırma**
Saldırganlar, çalışanlar ve kurumsal roller hakkında veri toplayarak kişiselleştirilmiş kimlik avı e-postaları oluşturabilir veya güvenilir kişileri taklit ederek çalışanları daha da hassas verileri ifşa etmeye yönlendirebilir.
 	* **Ağ ve Sistem Altyapısının Haritalanması**
Açık IP adresleri, açık portlar veya servis afişleri, saldırganların bir ağın düzenini haritalandırmasına ve kritik sistemleri hedeflemesine yardımcı olur.
 	* **Güvenlik Açıklarının İstismarı**
Saldırganlar, yazılım güvenlik açıklarını belirlemek ve yama uygulanmamış sistemleri istismar etmek için sızdırılan bilgileri kullanabilir. Saldırganlar güvenlik açığı veritabanlarına erişebiliyorsa, güncel olmayan bir yazılım sürümü gibi küçük ayrıntılar bile istismar edilebilir.
 	* **Saldırı İçin Gereken Zaman ve Kaynaklar Azalır**
Saldırganlar hedefin güvenlik ortamı hakkında ayrıntılı bilgileri erken bir aşamada elde ederse, uzun deneme-yanılma süreçlerinden kaçınabilir, saldırıları daha hızlı ve etkili hale getirebilirler.
---

**Keşif Sırasında Bilgi Sızıntısının Yaygın Kaynakları**
Bilgi sızıntısı bir organizasyon içindeki birden fazla alandan kaynaklanabilir. İşte bazı yaygın kaynaklar:
#### 1. **Açık Portlar ve Hizmetler**
Korunmasız açık portlar, web sunucuları, veritabanı sunucuları veya dosya paylaşım sistemleri gibi çalışan hizmetler hakkında yanlışlıkla bilgi ifşa edebilir. Bu veriler genellikle Nmap gibi araçlar aracılığıyla keşfedilebilir.
#### 2. **Sosyal Medya ve Çevrimiçi Profiller**
Çalışanlar genellikle saldırganlara iş rolleri, e-posta biçimleri, proje ayrıntıları ve hatta şirketin yapısı hakkında ayrıntılar gibi değerli veriler sağlayabilecek bilgileri sosyal medyada veya profesyonel ağlarda (LinkedIn gibi) paylaşırlar.
#### 3. **DNS Kayıtları ve WHOIS Verileri**
Herkesin erişebildiği DNS kayıtları ve WHOIS verileri, bir kuruluşun ağ altyapısı hakkında alan adı sahipliği ayrıntılarını, alt alan adlarını, IP adreslerini ve diğer önemli bilgileri ortaya çıkarabilir.
#### 4. **Hata Mesajları ve Hata Ayıklama Bilgileri**
Web sitelerinden veya  uygulamalardan gelen ayrıntılı hata mesajları, dizin yapıları, veritabanı bilgileri veya sunucu ayrıntıları gibi hassas verileri açığa çıkarabilir .
#### 5. **Belgelerdeki Meta Veriler**
PDF'ler, Word dosyaları veya resimler gibi belgelere gömülü meta veriler kullanıcı adları, yazılım sürüm bilgileri ve belge geçmişi içerebilir. Bu veriler analiz edildiğinde saldırganlara kuruluşun sistem kurulumu ve yazılım kullanımı hakkında ipuçları verebilir.
#### 6. **GitHub Depoları ve Kod Depoları**
Genel depolar, özellikle bir projenin parçası olarak yanlışlıkla yüklenirlerse API anahtarları, veritabanı kimlik bilgileri veya sistem mimarisi ayrıntıları gibi hassas bilgiler içerebilir.

---

**Saldırganların Bilgi Sızıntısını İstismar Etmek İçin Kullandıkları Teknikler**
Keşif sırasında saldırganlar sızdırılan bilgileri tespit etmek için çeşitli teknikler kullanırlar:
#### 1. **Açık Kaynaklı İstihbarat (OSINT) Toplama**
Saldırganlar, internette herkesin erişebildiği bilgileri taramak için Maltego ve Shodan gibi OSINT araçlarını kullanır. OSINT, sunucu konumları, alan adı mülkiyeti ve açık portlar gibi çok miktarda veriyi ortaya çıkarabilir.
#### 2. **Sosyal Medya Keşfi**
Social-Engineer Toolkit (SET) gibi sosyal medya tarama araçları , saldırganların çalışanların ve rollerinin bir listesini derlemesine ve kuruluşun iç yapısı hakkında bilgi edinmesine olanak tanır.
#### 3. **Web Kazıma ve Dizin Tarama**
Saldırganlar, yanlışlıkla erişilebilir bırakılan dosyalar veya yapılandırmalar için bir web sitesinin genel dizinlerini taramak için otomatik araçlar kullanır. Bunlara günlük dosyaları, yedekleme dosyaları ve yapılandırma dosyaları dahil olabilir.
#### 4. **Meta Veri Çıkarımı**
ExifTool ve Foca gibi araçlar, saldırganların kamuya açık belgelerden meta verileri çıkarmasına yardımcı olarak, iç sistemler hakkında ipuçları sağlayabilecek hassas bilgileri ortaya çıkarıyor.
#### 5. **DNS ve WHOIS Numaralandırması**
Saldırganlar, bir kuruluşun ağındaki alt alan adlarını veya gizli hizmetleri keşfetmek için DNS numaralandırması gerçekleştirir. WHOIS verileri, alan adı kayıt sahipleriyle ilgili bilgi sağlayarak saldırganların onlarla iletişim kurmasını veya onları taklit etmesini kolaylaştırır.

---

**Bilgi Sızıntısına Karşı Nasıl Korunulur**
Bilgi sızıntısını önlemek, çalışanları, sistemleri ve süreçleri içeren proaktif bir yaklaşım gerektirir. Keşif aşamasında verileri güvence altına almak için bazı en iyi uygulamalar şunlardır:
#### 1. **Düzenli Güvenlik Denetimleri Gerçekleştirin**
Rutin denetimler hassas bilgilerin sızdırıldığı alanları belirleyebilir. Denetimler açık portları, DNS yapılandırmalarını, sosyal medya politikalarını ve diğer potansiyel bilgi ifşa noktalarını kapsamalıdır.
#### 2. **Erişim Kontrolünü ve En Az Ayrıcalığı Uygulayın**
Hassas bilgilere erişimi sınırlayın ve çalışanların yalnızca rolleri için gerekli verilere sahip olduğundan emin olun. En az ayrıcalık ilkesi, hassas bilgilerin yetkisiz taraflarca erişilebilir veya sızdırılabilir olma olasılığını azaltmaya yardımcı olabilir.
#### 3. **Güvenlik Duvarlarını Yapılandırın ve Kullanılmayan Bağlantı Noktalarını Kapatın**
Güvenlik duvarları gereksiz portları engelleyecek şekilde yapılandırılmalı ve açık portlar yakından izlenmelidir. Kuruluşun ağı içinden port taramaları çalıştırmak istenmeyen herhangi bir ifşanın tespit edilmesine yardımcı olabilir.
#### 4. **Web Uygulama Güvenlik Duvarlarını (WAF) ve İçerik Güvenlik Politikalarını kullanın**
Web uygulama güvenlik duvarları yetkisiz kullanıcıların hassas uç noktalara erişmesini engelleyebilir. İçerik Güvenlik Politikaları (CSP), verilerin yanlışlıkla güvenilmeyen kaynaklarla paylaşılmasını önler.
#### 5. **Belgelerdeki Meta Verileri En Aza İndirin**
Belgeleri herkese açık hale getirmeden önce, dahili bilgileri ifşa edebilecek meta verileri kaldırın. PDF'ler için Adobe Acrobat ve görüntü dosyaları için ExifTool dahil olmak üzere birçok araç meta veri soyma olanağı sağlar.
#### 6. **DNS ve WHOIS Verilerini Güvence Altına Alın**
Özel WHOIS kaydı kullanmak, idari kişilerin ifşasını sınırlayabilir. Ek olarak, DNS yapılandırmaları, bilgi sızıntısına yol açabilecek yetkisiz değişiklikleri önlemek için düzenli olarak kontrol edilmelidir.
#### 7. **Sosyal Medyada Görünürlüğünüzü İzleyin ve Kontrol Edin**
Çalışanlara hangi bilgilerin paylaşılmasının güvenli olduğu konusunda eğitim veren net bir sosyal medya politikası oluşturun. Kuruluş hakkında kamuya açık sosyal medya gönderilerini izlemek, maruziyeti azaltmaya yardımcı olabilir.
#### 8. **Git Depolarını ve Diğer Kod Depolarını Güvenli Hale Getirin**
Kamusal kod depoları, kimlik bilgileri gibi hassas bilgilerin ifşa edilmediğinden emin olmak için iyice kontrol edilmelidir. Git-secrets gibi araçların kullanılması , hassas verilerin yüklenmesini tespit etmeye ve engellemeye yardımcı olabilir.

---

**Bilgi Sızıntısını Belirlemek İçin Araçların Kullanılması**
Çeşitli araçlar kuruluşların bilgi sızıntısını proaktif bir şekilde tespit etmesine yardımcı olabilir:

* **Shodan** : İnterneti açık portlara sahip cihazlar ve servisler için tarar ve bir kuruluşun istemeden kamuoyuna ifşa edebileceği bilgileri ortaya çıkarır.
* **FOCA** : Belgelerdeki meta verileri analiz ederek, kamuya açık dosyalar aracılığıyla sızabilecek hassas bilgiler hakkında fikir verir.
* **Nmap** : BT ekiplerinin ağlarını bir saldırganın bakış açısından görmelerine, açık portları ve servisleri belirlemelerine yardımcı olabilen bir ağ tarama aracıdır.
* **SpiderFoot** : Birden fazla kaynaktan veri toplayarak, alan adları, IP'ler ve daha fazlasıyla ilgili açığa çıkmış bilgileri ortaya çıkaran bir OSINT aracıdır.
* **Maltego** : Bir kuruluşun dijital ayak izini haritalandırır ve veri noktaları arasındaki ilişkileri görselleştirerek hassas verilerin nereye sızabileceğini belirlemeye yardımcı olur.
---

**Çalışan Eğitimi: Bilgi Sızıntısını Önlemede Önemli Bir Faktör**
Çalışanlar bilgi sızıntısına karşı korumada önemli bir rol oynar. Çalışanların güvenlik risklerini tanımaları ve sorumluluklarını anlamaları için eğitilmeleri, kasıtsız bilgi ifşası olasılığını azaltabilir. İşte bazı eğitim odak alanları:

* **Kimlik Avı ve Sosyal Mühendislik Farkındalığı** : Çalışanlarınızı, keşif verilerini toplamak için kullanılabilecek kimlik avı girişimlerini tanımaları için eğitin.
* **Veri İşleme Politikaları** : Personeli, hassas bilgilerin herkese açık veya güvenli olmayan kanallarda paylaşılmasından kaçınmak da dahil olmak üzere, verileri düzgün bir şekilde yönetme ve sınıflandırma konusunda eğitin.
* **Belge ve Meta Veri Farkındalığı** : Çalışanlar, dosyaları harici olarak paylaşmadan önce meta verilerin nasıl kaldırılacağını bilmelidir.
* **Sosyal Medya Güvenliği** : Çalışanlarınızı, özellikle dikkat çekebilecek belirli rolleri veya projeleri ortaya koyan iş bilgilerini sosyal medyada paylaşma konusunda dikkatli olmaları konusunda teşvik edin.
---

**Keşif Sırasında Bilgi Sızıntısını Önlemedeki Zorluklar**
En iyi çabalara rağmen, bilgi sızıntısını tamamen önlemek zor olabilir. Bazı zorluklar şunlardır:

 * **İnsan Hatası** : Çalışanlar eğitim almış olsalar bile, gözetimsizlik nedeniyle hassas bilgileri istemeden paylaşabilirler.
 * **Hızla Gelişen Saldırı Teknikleri** : Saldırganlar yeni yöntemler geliştirdikçe, geleneksel güvenlik önlemleri bu teknikleri tespit etmede ve engellemede geride kalabilir.
 * **Sürekli İzleme Gereksinimleri** : Bilgi sızıntısına karşı güvenlik sağlamak, birçok kuruluş için kaynak yoğun olabilen sürekli izleme ve denetim gerektirir.
---

**Sonuç**
Keşif aşamasında bilgi sızdırılması, kuruluşları ciddi güvenlik risklerine maruz bırakabilir ve bu da proaktif güvenlik önlemlerini benimsemek esastır. Sistemleri düzenli olarak denetleyerek, hassas verilere erişimi güvence altına alarak, çalışanları eğiterek ve gelişmiş güvenlik araçlarını kullanarak kuruluşlar maruziyetlerini önemli ölçüde azaltabilir. Etkili bilgi sızıntısı önleme, kuruluşların saldırganlardan bir adım önde kalmasını sağlayan teknoloji, politika ve insan uyanıklığının bir karışımını gerektirir.

Bilgi sızıntısına karşı koruma, bir kuruluşun genel siber güvenlik duruşunu güçlendirir ve kritik varlıkların bir saldırının erken aşamalarında istismar edilmesini önlemeye yardımcı olur. Doğru uygulamalar, araçlar ve farkındalıkla kuruluşlar, keşif aşamasıyla ilişkili risklere karşı kendilerini daha iyi savunabilirler.

---

**Bilgi Sızıntısına Karşı Korunma Hakkında SSS**
**1. Siber güvenlikte bilgi sızıntısı nedir?**
Bilgi sızıntısı, saldırganların genellikle bir saldırının keşif aşamasında istismar edebileceği hassas verilerin kasıtsız olarak açığa çıkmasıdır.

**2. Keşif sırasında bilgi sızıntısı neden bir risktir?**
Bilgi sızıntısı, bir sistemin yapılandırması, güvenlik açıkları ve çalışan verileri hakkında ayrıntıları ortaya çıkarabilir ve saldırganlara daha hedefli saldırılar planlamak için değerli içgörüler sağlayabilir.
**3. Kuruluşlar bilgi sızıntısını nasıl önleyebilir?**
Kuruluşlar düzenli denetimler yaparak, çalışanları eğiterek, açık portları güvence altına alarak ve kamu belgelerindeki meta verileri en aza indirerek bilgi sızıntısını önleyebilir.

**4. Bilgi sızıntısını tespit etmek için bazı araçlar nelerdir?**
Shodan, FOCA, Nmap, SpiderFoot ve Maltego gibi araçlar, istemeden ifşa edilebilecek kamuya açık bilgileri tespit etmeye yardımcı olur.

**5. Bilgi sızıntısını önlemede çalışan eğitimi neden önemlidir?**
Çalışanlar genellikle hassas bilgileri ele alır ve onlara güvenli veri işleme ve sosyal medya uygulamaları konusunda eğitim vermek, yanlışlıkla ifşa olma olasılığını azaltır.

**6. Bilgi sızıntısı tamamen önlenebilir mi?**
Bilgi sızıntısını ortadan kaldırmak zor olsa da, proaktif güvenlik önlemleri, düzenli izleme ve eğitim riski önemli ölçüde azaltabilir.