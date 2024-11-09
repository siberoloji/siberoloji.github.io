---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Açık Kaynak İstihbaratı (AKİ)
date: "2024-10-15T11:53:58Z"
guid: https://www.siberoloji.com/?p=3573
id: 3573
image: /assets/images/2024/10/osint3.webp
tags:
- aki
- cyber security
- osint
- siber güvenlik
title: 'OSINT Amaçlı Karanlık Web Sitelerini Araştırma: Teknikler ve Araçlar'
url: /tr/osint-amacli-karanlik-web-sitelerini-arastirma-teknikler-ve-araclar/
---

  Karanlık&nbsp;***web genellikle yasadışı faaliyetlerle ilişkilendirilir, ancak aynı zamanda&nbsp;*** ***Açık Kaynak İstihbaratı (OSINT)*** &nbsp;profesyonelleri için değerli bir kaynaktır&nbsp;. Suç faaliyetlerini izleme, siber tehdit istihbaratı toplama ve kolluk kuvvetleri, siber güvenlik şirketleri ve araştırmacılar için soruşturmalar yürütme konusunda yardımcı olabilecek bir bilgi zenginliği içerir. Ancak, gizli yapısı ve teknik zorlukları nedeniyle, OSINT için&nbsp;***karanlık web sitelerini taramak*** &nbsp;özel bilgi ve araçlar gerektirir.
 

  Bu blog yazısında, OSINT amaçları için karanlık web sitelerini kazımak için kullanılan yöntemleri ve araçları, ayrıca yasal ve etik hususları inceleyeceğiz. Ele alacağımız konular şunlardır:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Dark Web Nedir? 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- OSINT için Karanlık Web'i Neden Kazıyoruz? 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Yasal ve Etik Hususlar 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Karanlık Web Sitelerini Kazımak İçin Araçlar 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Karanlık Web'i Kazıma Teknikleri 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Dark Web Verilerini Kazımada Karşılaşılan Zorluklar 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Karanlık Web Sitelerini Kazımak İçin En İyi Uygulamalar 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Çözüm 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 1. Dark Web Nedir?
<!-- /wp:heading -->

  Karanlık&nbsp;***web , Google veya Bing gibi geleneksel&nbsp;*** <a href="https://www.siberoloji.com/scraping-dark-web-sites-for-osint-purposes-techniques-tools-and-considerations/#">arama</a>&nbsp;motorları tarafından dizine eklenmemiş web siteleri ve hizmetlerden oluşan&nbsp;***derin web'in*** &nbsp;bir alt kümesidir&nbsp;. Yüzey web'in (internetin herkese açık kısmı) aksine, karanlık web'e yalnızca özel yazılımlar aracılığıyla erişilebilir, en yaygın olanı&nbsp;***Tor'dur*** &nbsp;(The Onion Router). Tor, kullanıcıların bağlantılarını şifreler ve onları birden fazla sunucuya yönlendirerek anonimlik sağlar ve konumlarını gizler.<a href="https://www.siberoloji.com/scraping-dark-web-sites-for-osint-purposes-techniques-tools-and-considerations/#">&nbsp;</a>****** 
 

  Karanlık web'deki web siteleri,&nbsp;<code>.onion</code>Tor bağlantısı olmadan normal tarayıcılar kullanılarak erişilemeyen bir alan adı kullanır. Bu anonimlik katmanı, karanlık web'i yasadışı pazar yerleri, siber suç forumları ve çalıntı veri alışverişleri gibi yasadışı faaliyetler için bir cennet haline getirir. Ancak, muhbir platformları, gizlilik savunuculuğu siteleri ve sansürden kurtulmak isteyen bireyler için forumlar gibi kaynaklar da içerir.
 


 ### Karanlık Web'in Temel Bileşenleri
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Pazar Yerleri*** : Uyuşturucu, silah, çalıntı veri veya sahte ürünler gibi yasa dışı malların satıldığı siteler. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Hacker Forumları*** : Siber suçluların bilgisayar korsanlığı araçlarını paylaştıkları, güvenlik açıklarını tartıştıkları ve DDoS saldırıları veya kötü amaçlı yazılım oluşturma gibi hizmetleri sattıkları forumlar. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Çalınan Veri Dökümleri*** : Kullanıcıların çalınan kredi kartı bilgileri, oturum açma bilgileri veya kişisel veriler gibi hassas bilgileri satın aldığı, sattığı veya takas ettiği siteler. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Muhabir Siteleri*** : İnsanların hassas belgeleri anonim olarak paylaşmalarına olanak tanıyan SecureDrop veya WikiLeaks gibi platformlar. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 2. OSINT için Dark Web'i Neden Taramalıyız?
<!-- /wp:heading -->

  Karanlık web'i kazımak, çok çeşitli&nbsp;***OSINT uygulamaları*** &nbsp;için değerli içgörüler sağlar . Bu kaynaklardan istihbarat toplamak, ortaya çıkan tehditleri belirlemeye, suç faaliyetlerini izlemeye ve soruşturmaları desteklemeye yardımcı olabilir. Bazı yaygın kullanım örnekleri şunlardır:
 


 ### a.&nbsp;***Siber Tehdit İstihbaratı*** 
<!-- /wp:heading -->

  Siber güvenlik uzmanları, yaygın olarak kullanılmadan önce yeni bilgisayar korsanlığı araçlarını, kötü amaçlı yazılım türlerini veya güvenlik açıklarını belirlemek için karanlık web forumlarını ve pazar yerlerini tarar. Karanlık web tarama, kuruluşların olası tehditleri anlamak ve ağlarını güvence altına almak için proaktif önlemler almak amacıyla bilgisayar korsanları arasındaki konuşmaları izlemelerine yardımcı olur.
 


 ### b.&nbsp;***Kolluk Kuvvetleri Soruşturmaları*** 
<!-- /wp:heading -->

  Kolluk kuvvetleri genellikle uyuşturucu kaçakçılığı, insan kaçakçılığı veya mali suçlar gibi yasa dışı faaliyetler hakkında bilgi toplamak için karanlık web sitelerini tarar. Konuşmalardaki veya işlemlerdeki kalıpları analiz ederek, araştırmacılar şüphelileri belirleyebilir, yasa dışı malları takip edebilir veya suç ağlarını çökertmeye yardımcı olan ipuçları bulabilir.
 


 ### c.&nbsp;***Veri İhlali Tespiti*** 
<!-- /wp:heading -->

  Kuruluşlar, hassas verilerinin (oturum açma kimlik bilgileri, finansal bilgiler veya fikri mülkiyet gibi) sızdırılıp sızdırılmadığını veya satılıp satılmadığını tespit etmek için karanlık ağı izler. Karanlık ağ pazar yerlerini ve forumlarını çalınan verilerden bahsetmek için taramak, şirketlerin veri ihlallerine hızlı bir şekilde yanıt vermesine ve hasarı azaltmasına yardımcı olabilir.
 


 ### d.&nbsp;***Dolandırıcılık Tespiti*** 
<!-- /wp:heading -->

  Finansal kuruluşlar, çalıntı kredi kartlarının, sahte hesapların veya sahte finansal ürünlerin satışını tespit etmek için karanlık web kazıma kullanabilir. Bu faaliyetleri erken tespit ederek, dolandırıcılığı önleyebilir ve müşterilerini koruyabilirler.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 3. Yasal ve Etik Hususlar
<!-- /wp:heading -->

  ***OSINT için karanlık web sitelerini taramak değerli istihbarat sağlayabilir ancak buna yasal ve etik hususları*** &nbsp;anlayarak yaklaşmak önemlidir&nbsp;.
 


 ### Yasal Hususlar
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Yargı Yetkisi Farklılığı*** : Karanlık web'den gelen verilerin kullanımını çevreleyen yasalar ülkeye ve bölgeye göre değişebilir. Bir yargı yetkisinde yasal olan bir şey başka bir yargı yetkisinde yasadışı olabilir. Karanlık web kazıma faaliyetleri yürütmeden önce hukuk müşavirliğine danışmak önemlidir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Hizmet Şartları İhlalleri*** : Çoğu karanlık web sitesinin resmi hizmet şartları olmasa da, herhangi bir web içeriğini kazımak potansiyel olarak veri gizliliği yasalarını veya siber güvenlik düzenlemelerini ihlal edebilir.***Genel Veri Koruma Yönetmeliği (GDPR)*** veya***<a href="https://www.siberoloji.com/scraping-dark-web-sites-for-osint-purposes-techniques-tools-and-considerations/#">Bilgisayar</a>Sahtekarlığı ve Kötüye Kullanımı Yasası (CFAA)*** gibi ilgili yasalara uyumu sağlayın . 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Yasadışı İçerik*** : Karanlık web sitelerini tararken dikkatli olun, çünkü birçoğu çocuk istismarı materyali veya yasadışı uyuşturucular gibi yasadışı içerikler barındırır. Bu içeriğe istemeden bile olsa erişmek veya depolamak sizi yasal risklere maruz bırakabilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Etik Hususlar
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Kullanıcı Gizliliği*** : Anonimlik karanlık web'in temel bir özelliği olsa da, karanlık web verilerini toplamak yine de bireyler hakkında hassas bilgiler toplamayı içerebilir. Topladığınız verilerin, özellikle de kişisel nitelikteyse, kullanıcı gizliliğine saygı gösterip göstermediğini göz önünde bulundurun. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Veri Kötüye Kullanımı*** : Karanlık web kazıma yoluyla toplanan veriler yalnızca suçu önlemek veya güvenliği artırmak gibi meşru amaçlar için kullanılmalıdır. Kazınan verileri kötü amaçlı olarak kötüye kullanmak veya yetkisiz taraflarla paylaşmak hem etik dışı hem de potansiyel olarak yasadışıdır. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 4. Karanlık Web Sitelerini Kazımak İçin Araçlar
<!-- /wp:heading -->

  <code>.onion</code>Karanlık web'i kazımak , web sitelerini ve sundukları benzersiz zorlukları&nbsp;ele alabilen özel araçlar gerektirir . Aşağıda, OSINT amaçları için karanlık web sitelerini kazımak için kullanılan bazı temel araçlar ve teknolojiler yer almaktadır.
 


 ### a.&nbsp;***Tor Tarayıcısı*** 
<!-- /wp:heading -->

  Tor&nbsp;***Tarayıcısı,*** &nbsp;karanlık web'e açılan kapıdır ve&nbsp;<code>.onion</code>sitelere erişim için olmazsa olmazdır. Ancak, Tor Tarayıcısı otomasyon için tasarlanmamıştır, bu nedenle büyük ölçekli kazıma için ideal değildir. Bunun yerine, otomasyon araçları ve kazıyıcıların Tor ağıyla entegre olması gerekir.
 


 ### b.&nbsp;***İstekler ve BeautifulSoup (Tor ile)*** 
<!-- /wp:heading -->

  Temel kazıma için, Python'un&nbsp;***Requests*** &nbsp;kütüphanesi (HTTP istekleri göndermek için) ve&nbsp;***BeautifulSoup (HTML ayrıştırmak için)&nbsp;*** ***Tor*** &nbsp;ile birlikte kullanılabilir . Requests'i trafiği Tor ağı üzerinden yönlendirecek şekilde yapılandırarak&nbsp;<code>.onion</code>siteleri&nbsp;kazıyabilirsiniz .
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">import requests
from bs4 import BeautifulSoup

# Set up Tor connection
proxies = {
    'http': 'socks5h://127.0.0.1:9050',
    'https': 'socks5h://127.0.0.1:9050'
}

# Access a dark web site
url = 'http://example.onion'
response = requests.get(url, proxies=proxies)

# Parse the content using BeautifulSoup
soup = BeautifulSoup(response.content, 'html.parser')
print(soup.title.text)</code></pre>
<!-- /wp:code -->


 ### c.&nbsp;***Scrapy (Tor ile)*** 
<!-- /wp:heading -->

  ***Scrapy,*** &nbsp;karanlık web sitelerini kazımak için Tor ile çalışacak şekilde yapılandırılabilen güçlü bir Python web kazıma çerçevesidir. Karmaşık web sitelerini idare etme, eşzamanlılığı yönetme ve kazınan verileri verimli bir şekilde depolama yeteneği nedeniyle özellikle büyük ölçekli kazıma için kullanışlıdır.
 


 ### d.&nbsp;***Soğan Taraması*** 
<!-- /wp:heading -->

  ***OnionScan,*** &nbsp;özellikle karanlık web sitelerini taramak ve istihbarat toplamak için tasarlanmış ücretsiz bir araçtır. Daha çok güvenlik açığı tespiti ve karanlık web altyapısını haritalamaya odaklanmış olsa da, karanlık web'deki web siteleri hakkında veri toplamak için de kullanılabilir.
 


 ### e.&nbsp;***Sezgisel*** 
<!-- /wp:heading -->

  ***Hunchly,*** &nbsp;hem yüzey web hem de karanlık web içeriği dahil olmak üzere, gezinirken web sayfalarını yakalayan ve dizine ekleyen bir araçtır. Özellikle karanlık web araştırmaları için kullanışlıdır çünkü tarama geçmişinizin ayrıntılı bir günlüğünü oluşturur ve web sayfalarının anlık görüntülerini otomatik olarak kaydeder.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 5. Karanlık Web'i Kazıma Teknikleri
<!-- /wp:heading -->

  Karanlık web'i kazırken, belirli teknikler ve stratejiler sürecin etkili ve güvenli olmasını sağlamaya yardımcı olabilir. İşte&nbsp;<code>.onion</code>OSINT amaçları için siteleri kazımak için kullanılan bazı yaygın teknikler:
 


 ### a.&nbsp;***Bir Tor Proxy'si Kurma*** 
<!-- /wp:heading -->

  ***Karanlık web sitelerine yalnızca Tor üzerinden erişilebildiğinden, kazıma işleminin ilk adımı kazıyıcınızı bir Tor proxy'si kullanacak şekilde yapılandırmaktır. Bu, bir SOCKS5 proxy'si*** &nbsp;ayarlayarak&nbsp;ve tüm HTTP isteklerini Tor üzerinden yönlendirerek yapılabilir.
 


 ### b.&nbsp;***Dönen Tor Devreleri*** 
<!-- /wp:heading -->

  Karanlık web siteleri tarafından engellenmemek veya kendinizi trafik analizine maruz bırakmamak için Tor devrelerinizi düzenli olarak döndürmeniz çok önemlidir. Bunu Tor hizmetini periyodik olarak yeniden başlatarak veya IP'leri belirli aralıklarla otomatik olarak değiştiren araçları kullanarak yapabilirsiniz.
 


 ### c.&nbsp;***CAPTCHA ve Anti-Bot Önlemlerinin Ele Alınması*** 
<!-- /wp:heading -->

  ***Karanlık web siteleri genellikle kazımayı önlemek için CAPTCHA sistemleri ve anti-bot önlemleri kullanır. CAPTCHA'ları atlatmak gri bir alan olsa da, CAPTCHA'ları otomatik olarak çözmek için 2Captcha*** &nbsp;veya&nbsp;***Anti-Captcha*** &nbsp;gibi hizmetleri kullanabilirsiniz&nbsp;. Alternatif olarak, bazı siteler manuel müdahale gerektirebilir.
 


 ### d.&nbsp;***Oran Sınırlarına Saygı Göstermek*** 
<!-- /wp:heading -->

  Çok agresif bir şekilde kazıma yapmak IP'nizin engellenmesine yol açabilir. Bunu önlemek için, istekler arasında gecikmeler koyarak ve daha yavaş bir hızda kazıma yaparak oran sınırlarına uyun. Bu, tespit şansını azaltır ve sitenin kullanılabilirliğini korur.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 6. Dark Web Verilerini Kazımada Karşılaşılan Zorluklar
<!-- /wp:heading -->

  Karanlık ağı kazımak, yüzey ağını kazımaya kıyasla benzersiz olan birkaç zorluk sunar. Bu zorluklar şunları içerir:
 


 ### a.&nbsp;***Kararsız Siteler*** 
<!-- /wp:heading -->

  Karanlık web siteleri bilindiği üzere istikrarsızdır, birçoğu sık sık çevrimdışı olur veya tamamen kaybolur. Bu, kazıma işlemlerini aksatabilir ve verileri tutarlı bir şekilde toplamayı zorlaştırabilir.
 


 ### b.&nbsp;***Dinamik İçerik*** 
<!-- /wp:heading -->

  Birçok karanlık web sitesi, içeriğin çıkarılmadan önce tam olarak işlenmesi için&nbsp;***Selenium*** &nbsp;gibi gelişmiş tarama araçları gerektiren dinamik içerik, JavaScript ve diğer modern web teknolojilerini kullanır .
 


 ### c.&nbsp;***Anonimlik ve Gizlilik Endişeleri*** 
<!-- /wp:heading -->

  Karanlık web'i taramak, hassas bilgileri istemeden açığa çıkarabilir veya gizliliği ihlal edebilir.
 

  meşru sebeplerle karanlık ağı kullanan kişiler. Veri toplayıcılar kendilerini anonimleştirmek ve topladıkları verilerin gizliliği ihlal etmediğinden emin olmak için ekstra özen göstermelidir.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 7. Karanlık Web Sitelerini Kazımak İçin En İyi Uygulamalar
<!-- /wp:heading -->

  Başarılı ve etik karanlık web kazıma işlemini garantilemek için OSINT profesyonelleri şu en iyi uygulamaları takip etmelidir:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Anonimlik Araçlarını Kullanın*** : IP adresinizin veya kimliğinizin açığa çıkmasını önlemek için her zaman Tor veya başka bir anonimlik aracını kullanın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Site Kurallarına Saygı Gösterin*** : Bazı karanlık web sitelerinin veri toplama veya kazıma konusunda kendi kuralları olabilir. Yasaklanmaktan kaçınmak için bu kurallara saygı gösterin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Veri Minimizasyonu*** : Yalnızca ihtiyacınız olan verileri toplayın ve gereksiz yere büyük miktarda kişisel veri depolamaktan kaçının. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Otomatik Kazımayı Dikkatli Bir Şekilde Yapın*** : Otomasyon yararlı olsa da, siteyi aşırı yüklememeye veya bot karşıtı önlemleri tetiklememeye dikkat edin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Yasalara Uygunluğu Sağlayın*** : Kazıma faaliyetlerinizin ilgili yasa ve yönetmeliklere uygun olduğundan emin olmak için hukuk müşavirinize danışın. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 8. Sonuç
<!-- /wp:heading -->

  ***OSINT için karanlık web sitelerini taramak,*** &nbsp;siber tehditler, suç faaliyetleri ve veri ihlalleri hakkında istihbarat toplamanın güçlü bir yoludur. Ancak, özel araçlar, teknikler ve hem karanlık web hem de ilgili etik/yasal sorunlar hakkında derin bir anlayış gerektirir. OSINT profesyonelleri, bu karmaşıklıkları dikkatlice aşarak, bilinçli kararlar almak ve soruşturma çabalarını güçlendirmek için karanlık web verilerinden yararlanabilirler.
 

  Python, BeautifulSoup ve Scrapy gibi araçları Tor ile kullanarak ve proxy'leri döndürme ve hız sınırlarına saygı gösterme gibi en iyi uygulamaları izleyerek, profesyoneller gizlilik ve güvenliği korurken karanlık ağı etkili bir şekilde tarayabilirler. Ancak, çabalarının dürüst ve sorumlu kalmasını sağlamak için yasal ve etik zorlukların da farkında olmaları gerekir.<a href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.siberoloji.com%2Fscraping-dark-web-sites-for-osint-purposes-techniques-tools-and-considerations%2F" target="_blank" rel="noreferrer noopener"></a>
 