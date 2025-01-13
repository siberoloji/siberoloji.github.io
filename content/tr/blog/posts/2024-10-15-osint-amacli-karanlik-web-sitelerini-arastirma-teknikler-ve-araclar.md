---
draft: false
title: "OSINT Amaçlı Karanlık Web Sitelerini Araştırma: Teknikler ve Araçlar"
date: 2024-10-15T11:53:58+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /tr/osint-amacli-karanlik-web-sitelerini-arastirma-teknikler-ve-araclar/
featured_image: /images/osint3.webp
categories:
  - Açık Kaynak İstihbaratı (AKİ)
tags:
  - aki
  - cybersecurity
  - osint
  - siber güvenlik
---
Karanlık **web genellikle yasadışı faaliyetlerle ilişkilendirilir, ancak aynı zamanda ****Açık Kaynak İstihbaratı (OSINT)** profesyonelleri için değerli bir kaynaktır . Suç faaliyetlerini izleme, siber tehdit istihbaratı toplama ve kolluk kuvvetleri, siber güvenlik şirketleri ve araştırmacılar için soruşturmalar yürütme konusunda yardımcı olabilecek bir bilgi zenginliği içerir. Ancak, gizli yapısı ve teknik zorlukları nedeniyle, OSINT için **karanlık web sitelerini taramak** özel bilgi ve araçlar gerektirir.

Bu blog yazısında, OSINT amaçları için karanlık web sitelerini kazımak için kullanılan yöntemleri ve araçları, ayrıca yasal ve etik hususları inceleyeceğiz. Ele alacağımız konular şunlardır:
* Dark Web Nedir?

* OSINT için Karanlık Web'i Neden Kazıyoruz?

* Yasal ve Etik Hususlar

* Karanlık Web Sitelerini Kazımak İçin Araçlar

* Karanlık Web'i Kazıma Teknikleri

* Dark Web Verilerini Kazımada Karşılaşılan Zorluklar

* Karanlık Web Sitelerini Kazımak İçin En İyi Uygulamalar

* Çözüm

## 1. Dark Web Nedir?

Karanlık **web , Google veya Bing gibi geleneksel **<a href="https://www.siberoloji.com/scraping-dark-web-sites-for-osint-purposes-techniques-tools-and-considerations/#">arama</a> motorları tarafından dizine eklenmemiş web siteleri ve hizmetlerden oluşan **derin web'in** bir alt kümesidir . Yüzey web'in (internetin herkese açık kısmı) aksine, karanlık web'e yalnızca özel yazılımlar aracılığıyla erişilebilir, en yaygın olanı **Tor'dur** (The Onion Router). Tor, kullanıcıların bağlantılarını şifreler ve onları birden fazla sunucuya yönlendirerek anonimlik sağlar ve konumlarını gizler.<a href="https://www.siberoloji.com/scraping-dark-web-sites-for-osint-purposes-techniques-tools-and-considerations/#"> </a>****

Karanlık web'deki web siteleri, `.onion`Tor bağlantısı olmadan normal tarayıcılar kullanılarak erişilemeyen bir alan adı kullanır. Bu anonimlik katmanı, karanlık web'i yasadışı pazar yerleri, siber suç forumları ve çalıntı veri alışverişleri gibi yasadışı faaliyetler için bir cennet haline getirir. Ancak, muhbir platformları, gizlilik savunuculuğu siteleri ve sansürden kurtulmak isteyen bireyler için forumlar gibi kaynaklar da içerir.

Karanlık Web'in Temel Bileşenleri
* **Pazar Yerleri** : Uyuşturucu, silah, çalıntı veri veya sahte ürünler gibi yasa dışı malların satıldığı siteler.

* **Hacker Forumları** : Siber suçluların bilgisayar korsanlığı araçlarını paylaştıkları, güvenlik açıklarını tartıştıkları ve DDoS saldırıları veya kötü amaçlı yazılım oluşturma gibi hizmetleri sattıkları forumlar.

* **Çalınan Veri Dökümleri** : Kullanıcıların çalınan kredi kartı bilgileri, oturum açma bilgileri veya kişisel veriler gibi hassas bilgileri satın aldığı, sattığı veya takas ettiği siteler.

* **Muhabir Siteleri** : İnsanların hassas belgeleri anonim olarak paylaşmalarına olanak tanıyan SecureDrop veya WikiLeaks gibi platformlar.

## 2. OSINT için Dark Web'i Neden Taramalıyız?

Karanlık web'i kazımak, çok çeşitli **OSINT uygulamaları** için değerli içgörüler sağlar . Bu kaynaklardan istihbarat toplamak, ortaya çıkan tehditleri belirlemeye, suç faaliyetlerini izlemeye ve soruşturmaları desteklemeye yardımcı olabilir. Bazı yaygın kullanım örnekleri şunlardır:

a. **Siber Tehdit İstihbaratı**

Siber güvenlik uzmanları, yaygın olarak kullanılmadan önce yeni bilgisayar korsanlığı araçlarını, kötü amaçlı yazılım türlerini veya güvenlik açıklarını belirlemek için karanlık web forumlarını ve pazar yerlerini tarar. Karanlık web tarama, kuruluşların olası tehditleri anlamak ve ağlarını güvence altına almak için proaktif önlemler almak amacıyla bilgisayar korsanları arasındaki konuşmaları izlemelerine yardımcı olur.

b. **Kolluk Kuvvetleri Soruşturmaları**

Kolluk kuvvetleri genellikle uyuşturucu kaçakçılığı, insan kaçakçılığı veya mali suçlar gibi yasa dışı faaliyetler hakkında bilgi toplamak için karanlık web sitelerini tarar. Konuşmalardaki veya işlemlerdeki kalıpları analiz ederek, araştırmacılar şüphelileri belirleyebilir, yasa dışı malları takip edebilir veya suç ağlarını çökertmeye yardımcı olan ipuçları bulabilir.

c. **Veri İhlali Tespiti**

Kuruluşlar, hassas verilerinin (oturum açma kimlik bilgileri, finansal bilgiler veya fikri mülkiyet gibi) sızdırılıp sızdırılmadığını veya satılıp satılmadığını tespit etmek için karanlık ağı izler. Karanlık ağ pazar yerlerini ve forumlarını çalınan verilerden bahsetmek için taramak, şirketlerin veri ihlallerine hızlı bir şekilde yanıt vermesine ve hasarı azaltmasına yardımcı olabilir.

d. **Dolandırıcılık Tespiti**

Finansal kuruluşlar, çalıntı kredi kartlarının, sahte hesapların veya sahte finansal ürünlerin satışını tespit etmek için karanlık web kazıma kullanabilir. Bu faaliyetleri erken tespit ederek, dolandırıcılığı önleyebilir ve müşterilerini koruyabilirler.
## 3. Yasal ve Etik Hususlar

**OSINT için karanlık web sitelerini taramak değerli istihbarat sağlayabilir ancak buna yasal ve etik hususları** anlayarak yaklaşmak önemlidir .

Yasal Hususlar
* **Yargı Yetkisi Farklılığı** : Karanlık web'den gelen verilerin kullanımını çevreleyen yasalar ülkeye ve bölgeye göre değişebilir. Bir yargı yetkisinde yasal olan bir şey başka bir yargı yetkisinde yasadışı olabilir. Karanlık web kazıma faaliyetleri yürütmeden önce hukuk müşavirliğine danışmak önemlidir.

* **Hizmet Şartları İhlalleri** : Çoğu karanlık web sitesinin resmi hizmet şartları olmasa da, herhangi bir web içeriğini kazımak potansiyel olarak veri gizliliği yasalarını veya siber güvenlik düzenlemelerini ihlal edebilir. **Genel Veri Koruma Yönetmeliği (GDPR)** veya **<a href="https://www.siberoloji.com/scraping-dark-web-sites-for-osint-purposes-techniques-tools-and-considerations/#"> Bilgisayar</a> Sahtekarlığı ve Kötüye Kullanımı Yasası (CFAA)** gibi ilgili yasalara uyumu sağlayın .

* **Yasadışı İçerik** : Karanlık web sitelerini tararken dikkatli olun, çünkü birçoğu çocuk istismarı materyali veya yasadışı uyuşturucular gibi yasadışı içerikler barındırır. Bu içeriğe istemeden bile olsa erişmek veya depolamak sizi yasal risklere maruz bırakabilir.
Etik Hususlar
* **Kullanıcı Gizliliği** : Anonimlik karanlık web'in temel bir özelliği olsa da, karanlık web verilerini toplamak yine de bireyler hakkında hassas bilgiler toplamayı içerebilir. Topladığınız verilerin, özellikle de kişisel nitelikteyse, kullanıcı gizliliğine saygı gösterip göstermediğini göz önünde bulundurun.

* **Veri Kötüye Kullanımı** : Karanlık web kazıma yoluyla toplanan veriler yalnızca suçu önlemek veya güvenliği artırmak gibi meşru amaçlar için kullanılmalıdır. Kazınan verileri kötü amaçlı olarak kötüye kullanmak veya yetkisiz taraflarla paylaşmak hem etik dışı hem de potansiyel olarak yasadışıdır.

## 4. Karanlık Web Sitelerini Kazımak İçin Araçlar

`.onion`Karanlık web'i kazımak , web sitelerini ve sundukları benzersiz zorlukları ele alabilen özel araçlar gerektirir . Aşağıda, OSINT amaçları için karanlık web sitelerini kazımak için kullanılan bazı temel araçlar ve teknolojiler yer almaktadır.

a. **Tor Tarayıcısı**

Tor **Tarayıcısı,** karanlık web'e açılan kapıdır ve `.onion`sitelere erişim için olmazsa olmazdır. Ancak, Tor Tarayıcısı otomasyon için tasarlanmamıştır, bu nedenle büyük ölçekli kazıma için ideal değildir. Bunun yerine, otomasyon araçları ve kazıyıcıların Tor ağıyla entegre olması gerekir.

b. **İstekler ve BeautifulSoup (Tor ile)**

Temel kazıma için, Python'un **Requests** kütüphanesi (HTTP istekleri göndermek için) ve **BeautifulSoup (HTML ayrıştırmak için) ****Tor** ile birlikte kullanılabilir . Requests'i trafiği Tor ağı üzerinden yönlendirecek şekilde yapılandırarak `.onion`siteleri kazıyabilirsiniz .
```bash
import requests
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
print(soup.title.text)```

c. **Scrapy (Tor ile)**

**Scrapy,** karanlık web sitelerini kazımak için Tor ile çalışacak şekilde yapılandırılabilen güçlü bir Python web kazıma çerçevesidir. Karmaşık web sitelerini idare etme, eşzamanlılığı yönetme ve kazınan verileri verimli bir şekilde depolama yeteneği nedeniyle özellikle büyük ölçekli kazıma için kullanışlıdır.

d. **Soğan Taraması**

**OnionScan,** özellikle karanlık web sitelerini taramak ve istihbarat toplamak için tasarlanmış ücretsiz bir araçtır. Daha çok güvenlik açığı tespiti ve karanlık web altyapısını haritalamaya odaklanmış olsa da, karanlık web'deki web siteleri hakkında veri toplamak için de kullanılabilir.

e. **Sezgisel**

**Hunchly,** hem yüzey web hem de karanlık web içeriği dahil olmak üzere, gezinirken web sayfalarını yakalayan ve dizine ekleyen bir araçtır. Özellikle karanlık web araştırmaları için kullanışlıdır çünkü tarama geçmişinizin ayrıntılı bir günlüğünü oluşturur ve web sayfalarının anlık görüntülerini otomatik olarak kaydeder.
## 5. Karanlık Web'i Kazıma Teknikleri

Karanlık web'i kazırken, belirli teknikler ve stratejiler sürecin etkili ve güvenli olmasını sağlamaya yardımcı olabilir. İşte `.onion`OSINT amaçları için siteleri kazımak için kullanılan bazı yaygın teknikler:

a. **Bir Tor Proxy'si Kurma**

**Karanlık web sitelerine yalnızca Tor üzerinden erişilebildiğinden, kazıma işleminin ilk adımı kazıyıcınızı bir Tor proxy'si kullanacak şekilde yapılandırmaktır. Bu, bir SOCKS5 proxy'si** ayarlayarak ve tüm HTTP isteklerini Tor üzerinden yönlendirerek yapılabilir.

b. **Dönen Tor Devreleri**

Karanlık web siteleri tarafından engellenmemek veya kendinizi trafik analizine maruz bırakmamak için Tor devrelerinizi düzenli olarak döndürmeniz çok önemlidir. Bunu Tor hizmetini periyodik olarak yeniden başlatarak veya IP'leri belirli aralıklarla otomatik olarak değiştiren araçları kullanarak yapabilirsiniz.

c. **CAPTCHA ve Anti-Bot Önlemlerinin Ele Alınması**

**Karanlık web siteleri genellikle kazımayı önlemek için CAPTCHA sistemleri ve anti-bot önlemleri kullanır. CAPTCHA'ları atlatmak gri bir alan olsa da, CAPTCHA'ları otomatik olarak çözmek için 2Captcha** veya **Anti-Captcha** gibi hizmetleri kullanabilirsiniz . Alternatif olarak, bazı siteler manuel müdahale gerektirebilir.

d. **Oran Sınırlarına Saygı Göstermek**

Çok agresif bir şekilde kazıma yapmak IP'nizin engellenmesine yol açabilir. Bunu önlemek için, istekler arasında gecikmeler koyarak ve daha yavaş bir hızda kazıma yaparak oran sınırlarına uyun. Bu, tespit şansını azaltır ve sitenin kullanılabilirliğini korur.
## 6. Dark Web Verilerini Kazımada Karşılaşılan Zorluklar

Karanlık ağı kazımak, yüzey ağını kazımaya kıyasla benzersiz olan birkaç zorluk sunar. Bu zorluklar şunları içerir:

a. **Kararsız Siteler**

Karanlık web siteleri bilindiği üzere istikrarsızdır, birçoğu sık sık çevrimdışı olur veya tamamen kaybolur. Bu, kazıma işlemlerini aksatabilir ve verileri tutarlı bir şekilde toplamayı zorlaştırabilir.

b. **Dinamik İçerik**

Birçok karanlık web sitesi, içeriğin çıkarılmadan önce tam olarak işlenmesi için **Selenium** gibi gelişmiş tarama araçları gerektiren dinamik içerik, JavaScript ve diğer modern web teknolojilerini kullanır .

c. **Anonimlik ve Gizlilik Endişeleri**

Karanlık web'i taramak, hassas bilgileri istemeden açığa çıkarabilir veya gizliliği ihlal edebilir.

meşru sebeplerle karanlık ağı kullanan kişiler. Veri toplayıcılar kendilerini anonimleştirmek ve topladıkları verilerin gizliliği ihlal etmediğinden emin olmak için ekstra özen göstermelidir.
## 7. Karanlık Web Sitelerini Kazımak İçin En İyi Uygulamalar

Başarılı ve etik karanlık web kazıma işlemini garantilemek için OSINT profesyonelleri şu en iyi uygulamaları takip etmelidir:
* **Anonimlik Araçlarını Kullanın** : IP adresinizin veya kimliğinizin açığa çıkmasını önlemek için her zaman Tor veya başka bir anonimlik aracını kullanın.

* **Site Kurallarına Saygı Gösterin** : Bazı karanlık web sitelerinin veri toplama veya kazıma konusunda kendi kuralları olabilir. Yasaklanmaktan kaçınmak için bu kurallara saygı gösterin.

* **Veri Minimizasyonu** : Yalnızca ihtiyacınız olan verileri toplayın ve gereksiz yere büyük miktarda kişisel veri depolamaktan kaçının.

* **Otomatik Kazımayı Dikkatli Bir Şekilde Yapın** : Otomasyon yararlı olsa da, siteyi aşırı yüklememeye veya bot karşıtı önlemleri tetiklememeye dikkat edin.

* **Yasalara Uygunluğu Sağlayın** : Kazıma faaliyetlerinizin ilgili yasa ve yönetmeliklere uygun olduğundan emin olmak için hukuk müşavirinize danışın.

## 8. Sonuç

**OSINT için karanlık web sitelerini taramak,** siber tehditler, suç faaliyetleri ve veri ihlalleri hakkında istihbarat toplamanın güçlü bir yoludur. Ancak, özel araçlar, teknikler ve hem karanlık web hem de ilgili etik/yasal sorunlar hakkında derin bir anlayış gerektirir. OSINT profesyonelleri, bu karmaşıklıkları dikkatlice aşarak, bilinçli kararlar almak ve soruşturma çabalarını güçlendirmek için karanlık web verilerinden yararlanabilirler.

Python, BeautifulSoup ve Scrapy gibi araçları Tor ile kullanarak ve proxy'leri döndürme ve hız sınırlarına saygı gösterme gibi en iyi uygulamaları izleyerek, profesyoneller gizlilik ve güvenliği korurken karanlık ağı etkili bir şekilde tarayabilirler. Ancak, çabalarının dürüst ve sorumlu kalmasını sağlamak için yasal ve etik zorlukların da farkında olmaları gerekir.<a href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.siberoloji.com%2Fscraping-dark-web-sites-for-osint-purposes-techniques-tools-and-considerations%2F" target="_blank" rel="noreferrer noopener"></a>
