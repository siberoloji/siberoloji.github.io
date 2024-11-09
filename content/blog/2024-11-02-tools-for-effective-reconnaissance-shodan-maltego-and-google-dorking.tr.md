---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Bilgi Toplama
classic-editor-remember:
- classic-editor
date: "2024-11-02T21:25:24Z"
excerpt: Bu yazımızda Shodan, Maltego ve Google Dorking'in keşif araçları olarak nasıl
  çalıştıklarını, özel özelliklerini ve bunları etkili bir şekilde kullanmak için
  en iyi uygulamaları inceleyeceğiz.
guid: https://www.siberoloji.com/?p=5886
id: 5886
image: /assets/images/2024/09/cybersecurity2.webp
tags:
- google dorking
- maltego
- shodan
title: 'Etkili Keşif İçin Araçlar: Shodan, Maltego ve Google Dorking'
url: /tr/etkili-kesif-icin-araclar-shodan-maltego-ve-google-dorking/
---

Siber güvenlik dünyasında keşif, bir hedefin sistemlerini, ağlarını ve olası güvenlik açıklarını anlamanın ilk adımıdır. Bilgi toplama olarak da bilinen keşif, etik hackerların bir hedefin ortamını haritalandırmasını, yapısını anlamasını ve zayıflıkları belirlemesini sağlar. Üç son derece etkili araç—Shodan, Maltego ve Google Dorking—keşif aşamasında istihbarat toplamada önemli bir rol oynar. Bu araçların her biri benzersiz içgörüler sunarak siber güvenlik uzmanlarına bilinçli kararlar almak için ihtiyaç duydukları verileri sağlar.

Bu yazımızda Shodan, Maltego ve Google Dorking'in keşif araçları olarak nasıl çalıştıklarını, özel özelliklerini ve bunları etkili bir şekilde kullanmak için en iyi uygulamaları inceleyeceğiz.


---


### ***1. Shodan: İnternete Bağlı Cihazlar İçin Arama Motoru*** 
Shodan sıklıkla "Nesnelerin İnterneti için arama motoru" (IoT) olarak anılır. Web sitelerini dizinleyen geleneksel arama motorlarının aksine, Shodan interneti kendisine bağlı cihazlar için tarar; örneğin sunucular, yönlendiriciler, web kameraları, akıllı televizyonlar ve endüstriyel kontrol sistemleri. Shodan, IP adresleri, bağlantı noktası yapılandırmaları, çalışan hizmetler ve güvenlik açıkları dahil olmak üzere bu cihazlar hakkında değerli veriler sağlar.
#### ***Shodan Nasıl Çalışır?***  
Shodan, IP adresleri ve bağlantı noktalarına göre internete bağlı cihazları aramak için web tarayıcılarını kullanır. Bu cihazları analiz ederek işletim sistemleri, açık bağlantı noktaları ve protokoller hakkında ayrıntılar toplar. Shodan daha sonra bu verileri kolayca aranabilir bir biçimde düzenleyerek siber güvenlik uzmanlarının ağ güvenliğini değerlendirmesi için erişilebilir hale getirir.
#### ***Keşifte Shodan'ın Kullanımları***  
 
1. ***Açık Portları ve Hizmetleri Belirleme*** 
Shodan, hedef sistemde hangi portların açık olduğunu ve bu portlarda çalışan hizmetleri belirleyebilir. Bu bilgi, bilgisayar korsanları için giriş noktalarını ortaya çıkarabilir ve etik bilgisayar korsanlarının olası güvenlik açıklarını anlamalarına yardımcı olabilir. 
2. ***Güvenlik Açığı Olan Cihazları Bulma*** 
Shodan'ın arama filtreleri kullanıcıların bilinen güvenlik açıklarına sahip cihazları bulmasını sağlar. Örneğin, etik bir bilgisayar korsanı popüler yazılımların eski sürümlerini çalıştıran sistemleri arayabilir ve güvenlik açığı değerlendirmesi için bir başlangıç ​​noktası sağlayabilir. 
3. ***IoT Güvenlik Risklerini Anlama*** 
Birçok IoT cihazı varsayılan veya zayıf güvenlik yapılandırmaları nedeniyle savunmasızdır. Shodan, siber güvenlik uzmanlarının potansiyel güvenlik risklerini değerlendirmesine ve ele almasına olanak tanıyarak, savunmasız IoT cihazlarını belirlemeye yardımcı olur. 
4. ***Ağ Altyapısının Haritalanması*** 
Etik hackerlar, ilgili cihazları arayarak bir organizasyonun ağ altyapısının üst düzey bir haritasını oluşturabilir. Bu veriler, bağlı cihazlar hakkında ayrıntılar içerir ve olası saldırı yüzeylerinin belirlenmesine yardımcı olabilir. 
 
#### ***Shodan Arama Filtreleri ve Teknikleri***  
Shodan'ın gücü, kullanıcıların arama sonuçlarını konuma, porta, ürüne ve diğer parametrelere göre daraltmasına olanak tanıyan gelişmiş arama filtrelerinde yatmaktadır:
 
- ***ana bilgisayar adı:*** <code>hostname:example.com</code>– Belirli bir ana bilgisayar adıyla ilişkili cihazları arar. 
- ***port:*** <code>port:80</code>– Belirli açık porta göre cihazları filtreler. 
- ***os:*** <code>os:"Windows 10"</code>– Belirli bir işletim sistemini çalıştıran cihazları bulur. 
- ***ülke:*** <code>country:"US"</code>– Arama sonuçlarını belirli bir ülkede bulunan cihazlarla sınırlar. 
 
#### ***Shodan'ı Kullanmak İçin En İyi Uygulamalar***  
 
- ***Geniş Aramalarla Başlayın*** : Hedef kitlenin ağına genel bir bakış elde etmek için daha geniş aramalarla başlayın. 
- ***Açık Portlara ve Güvenlik Açığı Olan Servislere Odaklanın*** : Saldırılar için giriş noktası olabileceklerinden, açık portlara ve bu portlarda çalışan servislere özellikle dikkat edin. 
- ***Aramaları Yetkili IP Aralıklarıyla Sınırlandırın*** : Yetkili keşif yaparken, aramaları kuruluş tarafından sağlanan belirli IP aralıklarıyla sınırladığınızdan emin olun. 
 


---


### ***2. Maltego: Veri Görselleştirme ve Bağlantıları Eşleme Aracı*** 
Maltego, siber güvenlikte veri görselleştirme ve ilişki haritalama için kullanılan güçlü bir araçtır. Kullanıcıların birden fazla kaynaktan bilgi toplamasını, bağlantıları görselleştirmesini ve veri noktaları arasındaki ilişkileri belirlemesini sağlar. Maltego ile siber güvenlik uzmanları, alan adları, sosyal medya profilleri ve e-posta adresleri gibi verileri inceleyip analiz edebilir ve gizli bağlantıları ortaya çıkarmalarına yardımcı olabilir.
#### ***Maltego Nasıl Çalışır?***  
Maltego, çeşitli kaynaklardan veri toplamak ve bağlamak için "dönüşümler" kullanır. Her dönüşüm, bir etki alanında alt etki alanları aramak veya ilişkili IP adreslerini haritalamak gibi belirli bir görevi gerçekleştirir. Bu veriler daha sonra çeşitli varlıklar arasındaki bağlantıları gösteren bir grafikte görüntülenir ve bu da kalıpları ve ilişkileri tespit etmeyi kolaylaştırır.
#### ***Keşifte Maltego'nun Kullanımları***  
 
- ***Sosyal Ağları Haritalama*** 
Maltego, sosyal medyada bireyler, şirketler ve kuruluşlar arasındaki bağlantıları görselleştirebilir ve bu da onu sosyal mühendislik keşfi için değerli bir araç haline getirir. 
- ***Alan Adı İlişkilerini Keşfetme*** 
Maltego, bir alan adının ilişkili IP adreslerini, alt alan adlarını ve e-posta adreslerini analiz ederek kullanıcıların hedefin çevrimiçi varlığı ve altyapısı hakkında kapsamlı bir profil oluşturmasına olanak tanır. 
- ***Veri Noktaları Arasındaki İlişkileri Belirleme*** 
Maltego'nun dönüşümleri, etik hacker'ların paylaşılan IP adresleri veya e-posta hesapları gibi görünüşte ilgisiz veri noktaları arasındaki ilişkileri haritalandırmasını sağlıyor. 
- ***Kamuya Açık Bilgilerin Ortaya Çıkarılması*** 
Maltego, DNS kayıtları, WHOIS bilgileri ve sosyal medya gibi çeşitli kamuya açık kaynaklardan veri çekerek kullanıcıların hedef hakkında geniş yelpazede kamuya açık bilgileri toplamasına yardımcı olur. 
 
#### ***Popüler Maltego Dönüşümleri***  
Maltego, farklı veri türlerini toplamak için çeşitli dönüşümler sağlar:
 
- ***Alan Adından IP'ye Dönüşüm*** : Bir alan adıyla ilişkili IP adreslerini alır. 
- ***WHOIS Veri Dönüşümü*** : Bir alan adına ait WHOIS bilgilerini çıkararak kayıt sahibi bilgileri gibi ayrıntıları ortaya çıkarır. 
- ***Sosyal Ağ Dönüşümleri*** : Twitter ve LinkedIn gibi sosyal medya platformlarındaki bağlantıları haritalandırır. 
- ***Kişiden E-postaya Dönüşüm*** : Bir kişiyle ilişkili olası e-posta adreslerini bulur. 
 
#### ***Maltego'yu Kullanmak İçin En İyi Uygulamalar***  
 
- ***Öncelikle Önemli Varlıklara Odaklanın*** : Alan adları veya IP adresleri gibi önemli veri noktalarıyla başlayın ve oradan ilgili varlıkları ortaya çıkarmak için genişletin. 
- ***Derin Analiz İçin Çoklu Dönüşümler Kullanın*** : Kapsamlı bilgi toplamak için tek bir veri noktasında birden fazla dönüşüm çalıştırın. 
- ***Verileri Görsel Olarak Organize Edin*** : Maltego'nun gücü veri görselleştirmesinde yatmaktadır, bu nedenle veri ilişkilerini etkili bir şekilde bağlamak ve analiz etmek için grafik özelliğini kullanın. 
 


---


### ***3. Google Dorking: Hedeflenen Bilgiler İçin Gelişmiş Arama Operatörlerinden Yararlanma*** 
Google Dorking, internetteki tipik arama sonuçlarından sıklıkla gizlenen bilgileri ortaya çıkarmak için gelişmiş arama operatörleri kullanan bir tekniktir. Arama operatörlerini birleştirerek, etik hacker'lar hassas bilgiler içerebilecek dosyalar, dizinler ve diğer açık kaynaklar gibi web sitelerinden belirli bilgileri çıkarabilir.
#### ***Google Dorking Nasıl Çalışır?***  
Google Dorking, belirli veriler için hedefli aramalar gerçekleştirmek üzere Google'ın gelişmiş arama yeteneklerine güvenir. <code>intitle:</code>, <code>inurl:</code>,<code>filetype:</code>ve <code>site:</code>gibi arama operatörlerini kullanarak kullanıcılar, arama sonuçlarını yalnızca belirli dosya türlerini, dizinleri veya web sitesi bölümlerini içerecek şekilde daraltabilir.
#### ***Keşifte Google Dorking'in Kullanımları***  
 
- ***Hassas Dosya ve Dizinleri Bulma*** 
Google Dorking, etik hackerların Excel sayfaları, PDF'ler veya yapılandırma dosyaları gibi hassas bilgiler içerebilecek ifşa edilmiş dosyaları aramasına olanak tanır. 
- ***Güvenli Olmayan Giriş Sayfalarını Bulma*** 
Google Dorking ile kullanıcılar, HTTPS'si olmayan veya iki faktörlü kimlik doğrulaması gerektiren güvenli olmayan giriş sayfalarını bulabilirler. 
- ***Açığa Çıkmış Yönetim Panellerini Belirleme*** 
Birçok web sitesinde düzgün bir şekilde güvence altına alınmamış veya gizlenmemiş yönetim oturum açma sayfaları bulunur. Google Dorking bu sayfaları bulmanıza yardımcı olarak olası güvenlik açıklarına ilişkin içgörüler sağlayabilir. 
- ***E-posta Adreslerini ve İletişim Bilgilerini Ortaya Çıkarma*** 
Google Dorking, herkese açık iletişim sayfalarını veya dizinlerini arayarak e-posta adreslerini ortaya çıkarabilir; bu da sosyal mühendislik amaçları için yararlı olabilir. 
 
#### ***Yaygın Google Dorking Operatörleri***  
Google Dorking için bazı yararlı operatörler şunlardır:
 
- ***site:*** <code>site:example.com</code>– Arama sonuçlarını belirli bir etki alanıyla sınırlar. 
- ***filetype:*** <code>filetype:pdf</code>– PDF'ler gibi belirli dosya türlerini arar. 
- ***intitle:*** <code>intitle:"index of"</code>– Başlığında belirli anahtar kelimeler bulunan sayfaları bulur; genellikle dizinleri bulmak için kullanılır. 
- ***inurl:*** <code>inurl:login</code>– URL'de belirli anahtar sözcükleri olan sayfaları arar, genellikle giriş sayfalarını bulmak için kullanılır. 
 
#### ***Google Dorking için En İyi Uygulamalar***  
 
- ***Operatörleri Birleştirme*** : Birden fazla operatör kullanmak sonuçları daraltabilir ve daha kesin bilgiler elde etmenizi sağlayabilir. 
- ***Hassas Verilere Erişimden Kaçının*** : Google Dorking çok sayıda bilgiyi ortaya çıkarsa da, etik hackerlar potansiyel olarak hassas verilere erişmekten veya bunları indirmekten kaçınmalıdır. 
- ***Dikkatli ve İzinli Kullanın*** : Tüm keşif araçlarında olduğu gibi, Google Dorking'i kurumsal verileri keşfetmek için kullanmadan önce yetkilendirildiğinizden emin olun. 
 


---


### ***Shodan, Maltego ve Google Dorking'i karşılaştırma*** 
Bu araçların her biri keşif için benzersiz güçler ve yetenekler sunmaktadır:

| **Araç** | **En iyisi için** | **Temel Özellikler** | **Kısıtlamalar** |
|-----------------|-------------------------------------------------------|--------------------------------------------------------|--------------------------------------------------|
| **Shodan** | Nesnelerin İnterneti (IoT) ve ağ cihazı keşfi | Bağlı cihazları arar, açık portları ortaya çıkarır | Genel cihazları ifşa edebilir ancak tüm özel sistemleri ifşa edemez |
| **Maltego** | İlişki haritalama ve veri görselleştirme | Bağlantıları görselleştirir, birden fazla veri dönüşümü kullanır | Tam kullanım için dönüşüm bilgisi gerekir |
| **Google Dorking** | osyaları, dizinleri ve genel kaynakları bulma | Hedeflenen bilgiler için gelişmiş arama operatörleri | Google tarafından indekslenen verilerle sınırlıdır |


Bu araçlar birbirini tamamlayarak keşif aşamasında bilgi toplamaya yönelik kapsamlı bir yaklaşım sunar.


---


### ***Etik Hususlar ve Yasal Sınırlar*** 
Shodan, Maltego ve Google Dorking gibi keşif araçları güçlüdür, ancak sorumlu bir şekilde kullanılmaları gerekir. Sistemlerde yetkisiz keşif yapmak yasadışı olabilir ve gizlilik politikalarını ihlal edebilir. Etik hackerlar her zaman şunları yapmalıdır:
 
- Verileri toplamadan önce hedef kuruluştan açık izin alın. 
- Penetrasyon testi sözleşmelerinde ve etik hackleme yönergelerinde belirtilen kurallara uyun. 
- Keşfedilen tüm güvenlik açıklarının ilgili taraflara bildirildiğinden emin olun. 
 
Siber güvenlik uzmanları etik standartlara bağlı kalarak, yasal sınırları aşmadan bir kuruluşun güvenlik duruşunu iyileştirmek için bu araçları kullanabilirler.


---


### ***Sonuç*** 
Shodan, Maltego ve Google Dorking, siber güvenlik profesyonellerinin sırt çantasındaki vazgeçilmez araçlardır. İnternete bağlı cihazlar, sosyal ağlar, web sitesi yapıları ve çok daha fazlası hakkında içgörüler sunarak etik hackerların güvenlik açıklarını belirlemesine ve olası tehditleri değerlendirmesine yardımcı olurlar. Bu araçlar birlikte kullanıldığında, hedef ortamın kapsamlı bir görünümünü sunarak etkili güvenlik değerlendirmeleri için temel oluşturan kapsamlı bir keşif aşamasına olanak tanır.

Her aracın yeteneklerini ve sınırlamalarını anlamak, etik hackerların verileri verimli ve etik bir şekilde toplamasına, kuruluşları olası tehditlerden korumasına ve siber güvenlik savunmalarını güçlendirmesine olanak tanır. Doğru bilgiyle, bu keşif araçları kuruluşların saldırganlardan bir adım önde olmasını sağlayabilir.

---

### ***Keşif Araçları Hakkında SSS: Shodan, Maltego ve Google Dorking*** 

***1. Shodan'ın temel amacı nedir?*** 

Shodan, bağlı cihazları internette tarayarak, açığa çıkan portlar, servisler ve güvenlik açıkları hakkında bilgi sağlar.

***2. Maltego keşifte nasıl yardımcı olur?*** 

Maltego, veri noktaları arasındaki ilişkileri ve bağlantıları görselleştirerek ağ yapılarını ve sosyal ağları haritalamaya yardımcı olur.

***3. Google Dorking nedir ve yasal mıdır?*** 

Google Dorking, çevrimiçi olarak belirli bilgileri bulmak için gelişmiş arama operatörlerinin kullanılmasıdır. Yasal olsa da, özellikle yetkili hedeflerle sorumlu bir şekilde kullanılmalıdır.

***4. Shodan özel ağları tarayabilir mi?*** 

Hayır, Shodan yalnızca internete bakan cihazları tarar. Özel ağların veya güvenlik duvarlarının arkasındaki cihazlara erişemez.

***5. Bu keşif araçlarını kullanmak için en iyi uygulamalar nelerdir?*** 

En iyi uygulamalar, bu araçları yalnızca izinle kullanmayı, geniş aramalarla başlamayı ve hassas verilere doğrudan erişmekten kaçınmayı içerir.

***6. Keşif için etik izin neden önemlidir?*** 

Etik izin, yasal ve gizlilik standartlarına uyumu garanti eder ve siber güvenlik uzmanlarını yasal sonuçlardan korur.