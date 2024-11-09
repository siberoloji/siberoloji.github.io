---
authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png
categories:
- Bilgi Toplama
date: "2024-11-02T21:35:11Z"
excerpt: Bu makalede bilgi sızıntısının ne olduğu, keşif sırasında neden özellikle
  tehlikeli olduğu ve kuruluşların sağlam güvenlik uygulamaları ve farkındalık yoluyla
  kendilerini buna karşı nasıl koruyabilecekleri ele alınmaktadır.
image: /assets/images/2024/10/cybersecurity4.webp
tags:
- keşif
title: Keşif Aşamasında Bilgi Sızıntısına Karşı Koruma
url: /tr/kesif-asamasinda-bilgi-sizintisina-karsi-koruma/
---

Dijital çağda, herhangi bir siber saldırının ilk adımı genellikle keşiftir. Bu aşamada, saldırganlar potansiyel güvenlik açıklarını belirlemek için hedef kuruluşun sistemleri, ağları, çalışanları ve güvenlik önlemleri hakkında bilgi toplar. Bilgi sızıntısı (hassas verilerin istenmeyen şekilde ifşa edilmesi) bu aşamada kritik bir risk olabilir. Kuruluşların, siber suçluların güvenlik yapılarına ilişkin bilgi edinmesini önlemek için bilgi sızıntısına karşı nasıl korunacaklarını anlamaları gerekir.

Bu makalede bilgi sızıntısının ne olduğu, keşif sırasında neden özellikle tehlikeli olduğu ve kuruluşların sağlam güvenlik uygulamaları ve farkındalık yoluyla kendilerini buna karşı nasıl koruyabilecekleri ele alınmaktadır.

---

### ***Bilgi Sızıntısı Nedir?*** 

Bilgi sızıntısı, bir sistem, ağ veya organizasyon hakkındaki hassas verilerin yetkisiz kullanıcılar tarafından istemeden erişilebilir hale getirilmesiyle oluşur. Bu bilgiler meta veriler, korumasız dosyalar, yapılandırma ayrıntıları ve hatta sosyal medya aracılığıyla ifşa edilen çalışan ayrıntıları gibi çeşitli biçimlerde olabilir. Keşif aşamasında saldırganlar, bir araya getirildiğinde organizasyonun altyapısına dair kritik içgörüler ortaya çıkarabilecek herkese açık bilgileri veya hatta küçük ipuçlarını ararlar.

Siber güvenlikte bilgi sızıntısı, saldırganlara IP adresleri, açık portlar, yazılım sürümleri ve personel bilgileri gibi değerli veriler sağlayabilir ve hedefli saldırılar planlamalarına olanak tanır. Keşif sırasında bu sızıntıya karşı koruma sağlamak, güçlü bir güvenlik duruşunu sürdürmek için çok önemlidir.

---

### ***Keşif Aşamasında Bilgi Sızdırmak Neden Risklidir?*** 
Keşif aşaması, bilgisayar korsanlarının belirli, karmaşık saldırılar tasarlamak için istihbarat topladığı aşamadır. İşte bu aşamada bilgi sızıntısının özellikle tehlikeli olmasının nedeni:
 
- ***Saldırı Vektörlerinin Belirlenmesi*** 
Sızdırılan bilgiler, güncel olmayan yazılım sürümleri, yanlış yapılandırılmış güvenlik duvarları veya korumasız uç noktalar gibi saldırganlar için potansiyel giriş noktalarını ortaya çıkarabilir.
- ***Sosyal Mühendislik Saldırılarını Kolaylaştırma*** 
Saldırganlar, çalışanlar ve kurumsal roller hakkında veri toplayarak kişiselleştirilmiş kimlik avı e-postaları oluşturabilir veya güvenilir kişileri taklit ederek çalışanları daha da hassas verileri ifşa etmeye yönlendirebilir.</span> 
 	- ***<span>Ağ ve Sistem Altyapısının Haritalanması</span>*** 
<span>Açık IP adresleri, açık portlar veya servis afişleri, saldırganların bir ağın düzenini haritalandırmasına ve kritik sistemleri hedeflemesine yardımcı olur.</span> 
 	- ***<span>Güvenlik Açıklarının İstismarı</span>*** 
<span>Saldırganlar, yazılım güvenlik açıklarını belirlemek ve yama uygulanmamış sistemleri istismar etmek için sızdırılan bilgileri kullanabilir. Saldırganlar güvenlik açığı veritabanlarına erişebiliyorsa, güncel olmayan bir yazılım sürümü gibi küçük ayrıntılar bile istismar edilebilir.</span> 
 	- ***<span>Saldırı İçin Gereken Zaman ve Kaynaklar Azalır</span>*** 
<span>Saldırganlar hedefin güvenlik ortamı hakkında ayrıntılı bilgileri erken bir aşamada elde ederse, uzun deneme-yanılma süreçlerinden kaçınabilir, saldırıları daha hızlı ve etkili hale getirebilirler.</span> 
 


---


### ***<span>Keşif Sırasında Bilgi Sızıntısının Yaygın Kaynakları</span>*** 
<span>Bilgi sızıntısı bir organizasyon içindeki birden fazla alandan kaynaklanabilir. İşte bazı yaygın kaynaklar:</span>
#### <span>1.</span>***<span>Açık Portlar ve Hizmetler</span>***  
<span>Korunmasız açık portlar, web sunucuları, veritabanı sunucuları veya dosya paylaşım sistemleri gibi çalışan hizmetler hakkında yanlışlıkla bilgi ifşa edebilir. Bu veriler genellikle Nmap gibi araçlar aracılığıyla keşfedilebilir.</span>
#### <span>2.</span>***<span>Sosyal Medya ve Çevrimiçi Profiller</span>***  
<span>Çalışanlar genellikle saldırganlara iş rolleri, e-posta biçimleri, proje ayrıntıları ve hatta şirketin yapısı hakkında ayrıntılar gibi değerli veriler sağlayabilecek bilgileri sosyal medyada veya profesyonel ağlarda (LinkedIn gibi) paylaşırlar.</span>
#### <span>3.</span>***<span>DNS Kayıtları ve WHOIS Verileri</span>***  
<span>Herkesin erişebildiği DNS kayıtları ve WHOIS verileri, bir kuruluşun ağ altyapısı hakkında alan adı sahipliği ayrıntılarını, alt alan adlarını, IP adreslerini ve diğer önemli bilgileri ortaya çıkarabilir.</span>
#### <span>4.</span>***<span>Hata Mesajları ve Hata Ayıklama Bilgileri</span>***  
<span>Web sitelerinden veya</span><span class="google-anno-t"><span>uygulamalardan gelen ayrıntılı hata mesajları, dizin yapıları, veritabanı bilgileri veya </span></span><span class="google-anno-t"><span>sunucu</span></span><span>ayrıntılarıgibi hassas verileri açığa çıkarabilir .</span>
#### <span>5.</span>***<span>Belgelerdeki Meta Veriler</span>***  
<span>PDF'ler, Word dosyaları veya resimler gibi belgelere gömülü meta veriler kullanıcı adları, yazılım sürüm bilgileri ve belge geçmişi içerebilir. Bu veriler analiz edildiğinde saldırganlara kuruluşun sistem kurulumu ve yazılım kullanımı hakkında ipuçları verebilir.</span>
#### <span>6.</span>***<span>GitHub Depoları ve Kod Depoları</span>***  
<span>Genel depolar, özellikle bir projenin parçası olarak yanlışlıkla yüklenirlerse API anahtarları, veritabanı kimlik bilgileri veya sistem mimarisi ayrıntıları gibi hassas bilgiler içerebilir.</span>


---


### ***<span>Saldırganların Bilgi Sızıntısını İstismar Etmek İçin Kullandıkları Teknikler</span>*** 
<span>Keşif sırasında saldırganlar sızdırılan bilgileri tespit etmek için çeşitli teknikler kullanırlar:</span>
#### <span>1.</span>***<span>Açık Kaynaklı İstihbarat (OSINT) Toplama</span>***  
<span>Saldırganlar, internette herkesin erişebildiği bilgileri taramak için </span><em><span>Maltego</span></em><span>ve</span><em><span>Shodan</span></em><span> gibi OSINT araçlarını kullanır. OSINT, sunucu konumları, alan adı mülkiyeti ve açık portlar gibi çok miktarda veriyi ortaya çıkarabilir.</span>
#### <span>2.</span>***<span>Sosyal Medya Keşfi</span>***  
<em><span>Social-Engineer Toolkit (SET)</span></em><span>gibi sosyal medya tarama araçları, saldırganların çalışanların ve rollerinin bir listesini derlemesine ve kuruluşun iç yapısı hakkında bilgi edinmesine olanak tanır.</span>
#### <span>3.</span>***<span>Web Kazıma ve Dizin Tarama</span>***  
<span>Saldırganlar, yanlışlıkla erişilebilir bırakılan dosyalar veya yapılandırmalar için bir web sitesinin genel dizinlerini taramak için otomatik araçlar kullanır. Bunlara günlük dosyaları, yedekleme dosyaları ve yapılandırma dosyaları dahil olabilir.</span>
#### <span>4.</span>***<span>Meta Veri Çıkarımı</span>***  
<em><span>ExifTool</span></em><span>ve</span><em><span>Foca</span></em><span>gibi araçlar,saldırganların kamuya açık belgelerden meta verileri çıkarmasına yardımcı olarak, iç sistemler hakkında ipuçları sağlayabilecek hassas bilgileri ortaya çıkarıyor.</span>
#### <span>5.</span>***<span>DNS ve WHOIS Numaralandırması</span>***  
<span>Saldırganlar, bir kuruluşun ağındaki alt alan adlarını veya gizli hizmetleri keşfetmek için DNS numaralandırması gerçekleştirir. WHOIS verileri, alan adı kayıt sahipleriyle ilgili bilgi sağlayarak saldırganların onlarla iletişim kurmasını veya onları taklit etmesini kolaylaştırır.</span>


---


### ***<span>Bilgi Sızıntısına Karşı Nasıl Korunulur</span>*** 
<span>Bilgi sızıntısını önlemek, çalışanları, sistemleri ve süreçleri içeren proaktif bir yaklaşım gerektirir. Keşif aşamasında verileri güvence altına almak için bazı en iyi uygulamalar şunlardır:</span>
#### <span>1.</span>***<span>Düzenli Güvenlik Denetimleri Gerçekleştirin</span>***  
<span>Rutin denetimler hassas bilgilerin sızdırıldığı alanları belirleyebilir. Denetimler açık portları, DNS yapılandırmalarını, sosyal medya politikalarını ve diğer potansiyel bilgi ifşa noktalarını kapsamalıdır.</span>
#### <span>2.</span>***<span>Erişim Kontrolünü ve En Az Ayrıcalığı Uygulayın</span>***  
<span>Hassas bilgilere erişimi sınırlayın ve çalışanların yalnızca rolleri için gerekli verilere sahip olduğundan emin olun. En az ayrıcalık ilkesi, hassas bilgilerin yetkisiz taraflarca erişilebilir veya sızdırılabilir olma olasılığını azaltmaya yardımcı olabilir.</span>
#### <span>3.</span>***<span>Güvenlik Duvarlarını Yapılandırın ve Kullanılmayan Bağlantı Noktalarını Kapatın</span>***  
<span>Güvenlik duvarları gereksiz portları engelleyecek şekilde yapılandırılmalı ve açık portlar yakından izlenmelidir. Kuruluşun ağı içinden port taramaları çalıştırmak istenmeyen herhangi bir ifşanın tespit edilmesine yardımcı olabilir.</span>
#### <span>4.</span>***<span>Web Uygulama Güvenlik Duvarlarını (WAF) ve İçerik Güvenlik Politikalarını kullanın</span>***  
<span>Web uygulama güvenlik duvarları yetkisiz kullanıcıların hassas uç noktalara erişmesini engelleyebilir. İçerik Güvenlik Politikaları (CSP), verilerin yanlışlıkla güvenilmeyen kaynaklarla paylaşılmasını önler.</span>
#### <span>5.</span>***<span>Belgelerdeki Meta Verileri En Aza İndirin</span>***  
<span>Belgeleri herkese açık hale getirmeden önce, dahili bilgileri ifşa edebilecek meta verileri kaldırın. PDF'ler için Adobe Acrobat ve görüntü dosyaları için ExifTool dahil olmak üzere birçok araç meta veri soyma olanağı sağlar.</span>
#### <span>6.</span>***<span>DNS ve WHOIS Verilerini Güvence Altına Alın</span>***  
<span>Özel WHOIS kaydı kullanmak, idari kişilerin ifşasını sınırlayabilir. Ek olarak, DNS yapılandırmaları, bilgi sızıntısına yol açabilecek yetkisiz değişiklikleri önlemek için düzenli olarak kontrol edilmelidir.</span>
#### <span>7.</span>***<span>Sosyal Medyada Görünürlüğünüzü İzleyin ve Kontrol Edin</span>***  
<span>Çalışanlara hangi bilgilerin paylaşılmasının güvenli olduğu konusunda eğitim veren net bir sosyal medya politikası oluşturun. Kuruluş hakkında kamuya açık sosyal medya gönderilerini izlemek, maruziyeti azaltmaya yardımcı olabilir.</span>
#### <span>8.</span>***<span>Git Depolarını ve Diğer Kod Depolarını Güvenli Hale Getirin</span>***  
<span>Kamusal kod depoları, kimlik bilgileri gibi hassas bilgilerin ifşa edilmediğinden emin olmak için iyice kontrol edilmelidir.</span><em><span>Git-secrets</span></em><span>gibi araçların kullanılması , hassas verilerin yüklenmesini tespit etmeye ve engellemeye yardımcı olabilir.</span>


---


### ***<span>Bilgi Sızıntısını Belirlemek İçin Araçların Kullanılması</span>*** 
<span>Çeşitli araçlar kuruluşların bilgi sızıntısını proaktif bir şekilde tespit etmesine yardımcı olabilir:</span>
 
 	- ***<span>Shodan</span>*** <span>: İnterneti açık portlara sahip cihazlar ve servisler için tarar ve bir kuruluşun istemeden kamuoyuna ifşa edebileceği bilgileri ortaya çıkarır.</span> 
 	- ***<span>FOCA</span>*** <span>: Belgelerdeki meta verileri analiz ederek, kamuya açık dosyalar aracılığıyla sızabilecek hassas bilgiler hakkında fikir verir.</span> 
 	- ***<span>Nmap</span>*** <span>: BT ekiplerinin ağlarını bir saldırganın bakış açısından görmelerine, açık portları ve servisleri belirlemelerine yardımcı olabilen bir ağ tarama aracıdır.</span> 
 	- ***<span>SpiderFoot</span>*** <span>: Birden fazla kaynaktan veri toplayarak, alan adları, IP'ler ve daha fazlasıyla ilgili açığa çıkmış bilgileri ortaya çıkaran bir OSINT aracıdır.</span> 
 	- ***<span>Maltego</span>*** <span>: Bir kuruluşun dijital ayak izini haritalandırır ve veri noktaları arasındaki ilişkileri görselleştirerek hassas verilerin nereye sızabileceğini belirlemeye yardımcı olur.</span> 
 


---


### ***<span>Çalışan Eğitimi: Bilgi Sızıntısını Önlemede Önemli Bir Faktör</span>*** 
<span>Çalışanlar bilgi sızıntısına karşı korumada önemli bir rol oynar. Çalışanların güvenlik risklerini tanımaları ve sorumluluklarını anlamaları için eğitilmeleri, kasıtsız bilgi ifşası olasılığını azaltabilir. İşte bazı eğitim odak alanları:</span>
 
 	- ***<span>Kimlik Avı ve Sosyal Mühendislik Farkındalığı</span>*** <span>: Çalışanlarınızı, keşif verilerini toplamak için kullanılabilecek kimlik avı girişimlerini tanımaları için eğitin.</span> 
 	- ***<span>Veri İşleme Politikaları</span>*** <span>: Personeli, hassas bilgilerin herkese açık veya güvenli olmayan kanallarda paylaşılmasından kaçınmak da dahil olmak üzere, verileri düzgün bir şekilde yönetme ve sınıflandırma konusunda eğitin.</span> 
 	- ***<span>Belge ve Meta Veri Farkındalığı</span>*** <span>: Çalışanlar, dosyaları harici olarak paylaşmadan önce meta verilerin nasıl kaldırılacağını bilmelidir.</span> 
 	- ***<span>Sosyal Medya Güvenliği</span>*** <span>: Çalışanlarınızı, özellikle dikkat çekebilecek belirli rolleri veya projeleri ortaya koyan iş bilgilerini sosyal medyada paylaşma konusunda dikkatli olmaları konusunda teşvik edin.</span> 
 


---


### ***<span>Keşif Sırasında Bilgi Sızıntısını Önlemedeki Zorluklar</span>*** 
<span>En iyi çabalara rağmen, bilgi sızıntısını tamamen önlemek zor olabilir. Bazı zorluklar şunlardır:</span>
 
 	- ***<span>İnsan Hatası</span>*** <span>: Çalışanlar eğitim almış olsalar bile, gözetimsizlik nedeniyle hassas bilgileri istemeden paylaşabilirler.</span> 
 	- ***<span>Hızla Gelişen Saldırı Teknikleri</span>*** <span>: Saldırganlar yeni yöntemler geliştirdikçe, geleneksel güvenlik önlemleri bu teknikleri tespit etmede ve engellemede geride kalabilir.</span> 
 	- ***<span>Sürekli İzleme Gereksinimleri</span>*** <span>: Bilgi sızıntısına karşı güvenlik sağlamak, birçok kuruluş için kaynak yoğun olabilen sürekli izleme ve denetim gerektirir.</span> 
 


---


### ***<span>Sonuç</span>*** 
<span>Keşif aşamasında bilgi sızdırılması, kuruluşları ciddi güvenlik risklerine maruz bırakabilir ve bu da </span><span>proaktif güvenlik önlemlerini benimsemek esastır. Sistemleri düzenli olarak denetleyerek, hassas verilere erişimi güvence altına alarak, çalışanları eğiterek ve gelişmiş güvenlik araçlarını kullanarak kuruluşlar maruziyetlerini önemli ölçüde azaltabilir. Etkili bilgi sızıntısı önleme, kuruluşların saldırganlardan bir adım önde kalmasını sağlayan teknoloji, politika ve insan uyanıklığının bir karışımını gerektirir.</span>

<span>Bilgi sızıntısına karşı koruma, bir kuruluşun genel siber güvenlik duruşunu güçlendirir ve kritik varlıkların bir saldırının erken aşamalarında istismar edilmesini önlemeye yardımcı olur. Doğru uygulamalar, araçlar ve farkındalıkla kuruluşlar, keşif aşamasıyla ilişkili risklere karşı kendilerini daha iyi savunabilirler.</span>


---


### ***<span>Bilgi Sızıntısına Karşı Korunma Hakkında SSS</span>*** 
***<span>1. Siber güvenlikte bilgi sızıntısı nedir?</span>*** 
<span>Bilgi sızıntısı, saldırganların genellikle bir saldırının keşif aşamasında istismar edebileceği hassas verilerin kasıtsız olarak açığa çıkmasıdır.</span>

***<span>2. Keşif sırasında bilgi sızıntısı neden bir risktir?</span>*** 
<span>Bilgi sızıntısı, bir sistemin yapılandırması, güvenlik açıkları ve çalışan verileri hakkında ayrıntıları ortaya çıkarabilir ve saldırganlara daha hedefli saldırılar planlamak için değerli içgörüler sağlayabilir.</span>
<div class="autors-widget">
<div>
<div>
<div id="autors-container-0">***3. Kuruluşlar bilgi sızıntısını nasıl önleyebilir?*** </div>
</div>
</div>
</div>
<span>Kuruluşlar düzenli denetimler yaparak, çalışanları eğiterek, açık portları güvence altına alarak ve kamu belgelerindeki meta verileri en aza indirerek bilgi sızıntısını önleyebilir.</span>

***<span>4. Bilgi sızıntısını tespit etmek için bazı araçlar nelerdir?</span>*** 
<span>Shodan, FOCA, Nmap, SpiderFoot ve Maltego gibi araçlar, istemeden ifşa edilebilecek kamuya açık bilgileri tespit etmeye yardımcı olur.</span>

***<span>5. Bilgi sızıntısını önlemede çalışan eğitimi neden önemlidir?</span>*** 
<span>Çalışanlar genellikle hassas bilgileri ele alır ve onlara güvenli veri işleme ve sosyal medya uygulamaları konusunda eğitim vermek, yanlışlıkla ifşa olma olasılığını azaltır.</span>

***<span>6. Bilgi sızıntısı tamamen önlenebilir mi?</span>*** 
<span>Bilgi sızıntısını ortadan kaldırmak zor olsa da, proaktif güvenlik önlemleri, düzenli izleme ve eğitim riski önemli ölçüde azaltabilir.</span>