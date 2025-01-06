---
draft: false
title: "Tarayıcı Tabanlı Araçların Kullanımı: OSINT için Web Kazıma Teknikleri"
date: 2024-10-15T11:57:37+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /tr/tarayici-tabanli-araclarin-kullanimi-osint-icin-web-kazima-teknikleri/
featured_image: /images/osint2.webp
categories:
  - Açık Kaynak İstihbaratı (AKİ)
tags:
  - aki
  - cybersecurity
  - osint
  - siber güvenlik
---


Dijital çağda, Açık Kaynak İstihbaratı (OSINT), kamuya açık verilerden eyleme dönüştürülebilir içgörüler toplamak için bir temel taşı haline geldi. OSINT'te kullanılan çeşitli teknikler arasında, web kazıma, büyük miktarda bilgiyi verimli bir şekilde toplamak için güçlü bir yöntem olarak öne çıkıyor. Bu blog yazısı, web kazıma için tarayıcı tabanlı araçları kullanmanın inceliklerini, uygulamalarını, tekniklerini, en iyi uygulamalarını ve etik hususlarını inceleyecek.



Web Kazımayı Anlamak



Web kazıma, web sitelerinden veri çıkarma işleminin otomatikleştirilmesi anlamına gelir. Bu teknik, kullanıcıların metin, resim, bağlantı ve diğer ilgili veri noktaları gibi bilgileri manuel müdahale olmadan toplamasına olanak tanır. İki temel web kazıma türü vardır: **manuel** ve **otomatik** . Manuel kazıma, verileri elle kopyalayıp yapıştırmayı içerirken, otomatik kazıma, süreci kolaylaştırmak için yazılım araçlarını ve betikleri kullanır ve bu da onu önemli ölçüde daha hızlı ve daha verimli hale getirir[1][3].



OSINT'de Web Kazımanın Rolü



Web kazıma, analistlerin çeşitli çevrimiçi kaynaklardan büyük hacimli verileri hızla toplamasını sağlayarak OSINT için bir omurga görevi görür. Bu yetenek özellikle şunlar için yararlıdır:


* **Çevrimiçi Faaliyetlerin İzlenmesi** : Analistler, ilgili hashtag'leri veya tartışmaları toplayarak sosyal medya platformları veya forumlarındaki kamuoyunun görüşünü takip edebilir.

* **Siber Güvenlik İstihbaratı** : Web kazıma, sızdırılan kimlik bilgileri veya siber tehditler için karanlık web etkinliklerini izlemek amacıyla kullanılabilir ve bu sayede kuruluşların güvenlik açıklarını proaktif bir şekilde ele almasına olanak tanır[1][4].

* **Pazar Araştırması** : İşletmeler, e-ticaret sitelerinden ürün listelerini ve yorumlarını toplayarak rakip içgörüleri ve pazar eğilimleri hakkında bilgi toplayabilirler.




Web Kazımada Temel Teknikler



Etkili web kazıma, tespit risklerini en aza indirirken doğru veri çıkarmayı garanti eden birkaç iyi tanımlanmış tekniği içerir. İşte bazı temel yöntemler:


#### 1. Veri Alma ve Ayrıştırma



Web kazıma işleminin ilk adımı, HTML içeriğini almak için hedef web sitesine HTTP istekleri göndermektir. Bu genellikle Python'un gibi kütüphaneler kullanılarak yapılır `requests`. HTML elde edildikten sonra, belirli veri noktalarını çıkarmak için `BeautifulSoup` veya `lxml` gibi ayrıştırma kütüphaneleri kullanılabilir[1][3].


#### 2. Tarayıcı Otomasyonu



Birçok modern web sitesi JavaScript aracılığıyla oluşturulan dinamik içerik kullanır. Bu gibi durumlarda, tarayıcı otomasyon araçları `Selenium`web sitesiyle insan etkileşimlerini simüle edebilir ve kazıyıcıların ilk HTML yanıtında mevcut olmayabilecek verileri çıkarmasına olanak tanır[4][5].


#### 3. CAPTCHA'ları ve IP Engellemeyi Yönetme



Web siteleri genellikle otomatik kazımayı önlemek için CAPTCHA'lar gibi güvenlik önlemleri uygular. Optik Karakter Tanıma (OCR) yazılımı gibi araçlar bu zorlukların aşılmasına yardımcı olabilir. Ek olarak, proxy hizmetleri kullanmak veya IP adreslerini döndürmek, kapsamlı kazıma oturumları sırasında IP engellemesini önleyebilir[4][5].



Web Kazıma İçin Temel Araçlar



OSINT topluluğunun farklı ihtiyaçlarına cevap veren web kazıma için çeşitli araçlar mevcuttur:


* **BeautifulSoup** : HTML ayrıştırmayı kolaylaştıran bir Python kütüphanesi.

* **Selenium** : Dinamik web içeriğiyle etkileşime izin veren bir tarayıcı otomasyon aracıdır.

* **Scrapy** : Web kazıyıcılarını hızlı bir şekilde oluşturmak için açık kaynaklı bir çerçeve.

* **Octoparse** : Kodlama bilgisi gerektirmeyen, kullanıcı dostu görsel bir araçtır.

* **ParseHub** : Karmaşık web sitelerini işleyebilen bir diğer görsel kazıyıcı.




Bu araçlar analistlerin veri toplama sürecini etkili bir şekilde otomatikleştirmesini sağlar.



Sorumlu Web Kazıma İçin En İyi Uygulamalar



Web kazıma güçlü bir teknik olsa da, yasal ve etik sorunlardan kaçınmak için sorumlu bir şekilde gerçekleştirilmelidir. İşte bazı en iyi uygulamalar:


#### 1. Web Sitesi Hizmet Şartlarına Saygı Gösterin



Herhangi bir web sitesini taramadan önce, hizmet şartlarını okumak ve anlamak çok önemlidir. Bazı siteler taramayı açıkça yasaklar veya veri toplama konusunda sınırlamalar getirir[3][4].


#### 2. Gaz Kelebeği Tekniklerini Kullanın



Sunucuların aşırı yüklenmesini önlemek için, belirli bir zaman diliminde gönderilen istek sayısını sınırlayan kısıtlama tekniklerini uygulayın. Bu uygulama yalnızca sunucu bütünlüğünün korunmasına yardımcı olmakla kalmaz, aynı zamanda bir bot olarak algılanma riskini de azaltır[3][5].


#### 3. Veri Çıkarımında Seçici Olun



Analiziniz için yalnızca gerekli verileri çıkarmaya odaklanın. Hem kaynaklarınızı hem de hedef sunucuyu zorlayabilecek aşırı miktarda bilgi toplamaktan kaçının[3].



OSINT'te Web Kazımanın Gelişmiş Uygulamaları



Temel uygulamaların ötesinde, web kazıma daha gelişmiş kullanım durumlarına genişletilebilir:


* **Duygu Analizi** : Analistler, belirli konulardaki sosyal medya gönderilerini veya yorumlarını toplayarak kamuoyunun fikrini ölçebilir ve eğilimleri belirleyebilir.

* **Coğrafi Konum Takibi** : Sosyal medyadan konuma dayalı verilerin toplanması, belirli olaylara veya kişilere ilişkin hareketlerin veya faaliyetlerin anlaşılmasına yardımcı olabilir.

* **Meta Veri Çıkarımı** : Belgelerden veya görüntülerden meta verilerin analiz edilmesi, araştırmalar için kritik olabilecek gizli bilgileri ortaya çıkarabilir[1][2].




Web Kazımada Etik Hususlar



Herhangi bir teknolojide olduğu gibi, web kazıma tekniklerini kullanırken etik hususlar son derece önemlidir:


* **Gizlilik Endişeleri** : Analistler, onay olmaksızın kişisel bilgi toplama konusunda dikkatli olmalıdır.

* **Veri Koruma Yasaları** : Belirli yargı bölgelerindeki bireylere ait verileri işlerken GDPR gibi düzenlemelere uymak önemlidir.

* **Yapay Zekanın Sorumlu Kullanımı** : Yapay zeka araçlarının tarama sürecine entegre edilmesi durumunda, bütünlüğün korunması ve kötüye kullanımın önlenmesi için sorumlu kullanımın sağlanması hayati önem taşımaktadır[2][5].




Sonuç



Web kazıma, analistlerin kamuya açık kaynaklardan büyük miktarda veriyi verimli bir şekilde toplamasına olanak tanıyan OSINT alanında paha biçilmez bir tekniktir. Etkili teknikler kullanarak ve en iyi uygulamalara bağlı kalarak, profesyoneller etik kaygıları sorumlu bir şekilde yönetirken bu güçlü aracı kullanabilirler.



Teknoloji gelişmeye devam ettikçe, web kazıma için mevcut yöntemler ve araçlar da gelişecektir. Gelişmeler hakkında güncel kalmak, OSINT uygulayıcılarının giderek karmaşıklaşan dijital ortamda istihbarat toplamanın ön saflarında kalmasını sağlayacaktır.



Özetle, tarayıcı tabanlı web kazıma tekniklerinde uzmanlaşmak, yalnızca bir OSINT analisti olarak yeteneklerinizi geliştirmekle kalmaz, aynı zamanda siber güvenlik, pazar analizi veya araştırma araştırması gibi çeşitli sektörlerde bilinçli karar almaya da önemli ölçüde katkıda bulunur.



Alıntılar: [1] https://stabler.tech/blog/web-scraping-and-osint [2] https://www.forensic-pathways.com/uncategorized/mastering-osint-technical-skills-and-the-essential-tools-and-strategies-for-intelligence-gathering/ [3] https://be4sec.com/2023/03/14/web-scraping-for-osint-techniques-and-best-practices/ [4 ] https://www.linkedin.com/pulse/web-social-media-scraping-osint-professionals-niels-groeneveld [5] https://www.recordedfuture.com/threat-intelligence-101/tools-and-technologies/osint-tools [6] https://www.reddit.com/r/OSINT/comments/10xcqqt/developing_my_own_data_scraping_and_aggregation/ [7] https://osintteam.blog/point-and-click-osint-dark-web-scraping-with-gui-tools-c434164120d5?gi=1af25c1c7e64 [8] https://www.neo tas.com/osint-tools-and-techniques/
