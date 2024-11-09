---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Açık Kaynak İstihbaratı (AKİ)
date: "2024-10-15T12:07:37Z"
guid: https://www.siberoloji.com/?p=3581
id: 3581
image: /assets/images/2024/10/osint2.webp
tags:
- aki
- cyber security
- osint
- siber güvenlik
title: Python ve BeautifulSoup Kullanarak Kazıma
url: /tr/python-ve-beautifulsoup-kullanarak-kazima/
---

  ***Açık Kaynak İstihbaratı (OSINT)*** &nbsp;dünyasında&nbsp;, kamuya açık kaynaklardan bilgi toplamak araştırma, analiz ve karar alma için kritik öneme sahiptir. İster siber güvenlik, gazetecilik, kolluk kuvvetleri veya rekabet istihbaratı için içgörü toplamak olsun,&nbsp;***web kazıma,*** &nbsp;web sitelerinden verileri verimli bir şekilde çıkarmak için değerli bir teknik haline gelmiştir. Web kazıma için en popüler araçlar arasında Python ve&nbsp;***BeautifulSoup*** &nbsp;kütüphanesi yer almaktadır. 
 

  ***Bu blog yazısında, Python ve BeautifulSoup'un web kazıma için*** &nbsp;kullanımını inceleyeceğiz ve bu tekniklerin&nbsp;***OSINT*** &nbsp;için nasıl uygulanabileceğine odaklanacağız&nbsp;. Şunları ele alacağız: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Web Scraping Nedir? 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- OSINT Web Kazımada Yasal ve Etik Hususlar 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Python ve BeautifulSoup'a Giriş 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Python ve BeautifulSoup Kullanarak Web Kazıma Teknikleri 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Web Kazımada Ortak Zorluklar 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- BeautifulSoup ile Kazıma İçin En İyi Uygulamalar 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Çözüm 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 1. Web Kazıma Nedir?
<!-- /wp:heading -->

  ***Web kazıma,*** &nbsp;web sitelerinden otomatik olarak veri çıkarma işlemidir. Bir web sitesine HTTP istekleri göndermeyi, HTML içeriğini almayı ve ardından metin, resim veya tablo gibi belirli bilgi parçalarını toplamak için verileri ayrıştırmayı içerir. Kazıma genellikle şu durumlarda kullanılır: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Verilere API'ler aracılığıyla kolayca erişilemez***  : Birçok web sitesi veri erişimi için API'ler (Uygulama Programlama Arayüzleri) sağlamaz ve bu da veri kazımayı tek seçenek haline getirir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Büyük hacimli verilerin toplanması***  : Veri toplama, manuel olarak yapılması zaman alıcı olacak olan verilerin birden fazla web sayfasından etkin bir şekilde toplanmasını sağlar. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  OSINT profesyonelleri için web kazıma, bloglar, forumlar, haber siteleri ve sosyal medya platformları gibi çeşitli çevrimiçi kaynaklardan gerçek zamanlı veri toplama olanağı sunar. 
 


 ### Web Kazıma için OSINT Kullanım Örnekleri
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Siber Güvenlik***  : Hacker forumlarını ve karanlık web pazar yerlerini tarayarak tehditleri tespit etmek. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Kolluk kuvvetleri***  : Cezai soruşturmalar için çevrimiçi faaliyetlerin izlenmesi. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Gazetecilik***  : Araştırmacı gazetecilik amacıyla birden fazla haber kuruluşundan bilgi toplamak. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Rekabet İstihbaratı***  : Rakiplerin web sitesi güncellemelerini, fiyat değişikliklerini veya yeni ürün lansmanlarını takip etme. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 2. OSINT Web Kazımada Yasal ve Etik Hususlar
<!-- /wp:heading -->

  Web kazıma, veri toplamak için güçlü bir araç olabilse de, akılda tutulması gereken önemli&nbsp;***yasal ve etik hususlar*** &nbsp;vardır . Tüm web siteleri kazımaya izin vermez ve farklı yargı bölgelerinin kamu sitelerinden veri toplama konusunda farklı kuralları vardır. 
 


 ### Yasal Hususlar
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Hizmet Şartları (ToS)***  : Birçok web sitesi, ToS'larında kazımanın izin verilip verilmediğini açıkça belirtir. Bir web sitesinin ToS'unu ihlal etmek, hesabın askıya alınması, yasal işlem veya durdurma ve vazgeçme emirleri gibi yasal sonuçlara yol açabilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Telif Hakkı***  : Belirli türdeki içeriklerin (telif hakkıyla korunan metinler, resimler veya veritabanları gibi) izinsiz olarak kopyalanması fikri mülkiyet haklarını ihlal edebilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Veri Gizliliği Yasaları***  : Avrupa'daki ***Genel Veri Koruma Yönetmeliği (GDPR)***  ve ABD'deki ***Kaliforniya Tüketici Gizlilik Yasası (CCPA)***  gibi düzenlemeler, kişisel verilerin nasıl toplanabileceği, saklanabileceği ve işlenebileceği konusunda katı kurallar getirir. Kişisel verileri rıza olmadan toplamak bu yasaları ihlal edebilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Etik Hususlar
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Kullanıcı Gizliliğine Saygı***  : Veriler kamuya açık olsa bile, özellikle hassas veriler söz konusu olduğunda kişisel bilgilerin toplanması etik kaygılara yol açabilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Veri Kötüye Kullanımından Kaçınma***  : Toplanan veriler yalnızca araştırma, soruşturma veya rekabet analizi gibi meşru ve etik amaçlar için kullanılmalıdır. Toplanan verilerin taciz, istismar veya yasa dışı amaçlar için kötüye kullanılması etik dışıdır. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Bir OSINT uzmanı olarak, bu sorunlarda dikkatli bir şekilde gezinmeniz ve veri toplama faaliyetlerinizin her zaman yasal ve etik olduğundan emin olmanız önemlidir. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 3. Python ve BeautifulSoup'a Giriş
<!-- /wp:heading -->

  ***Python,*** &nbsp;web kazıma için en yaygın kullanılan programlama dillerinden biridir, bunun başlıca nedeni basitliği, çok yönlülüğü ve geniş kütüphane ekosistemidir. Python'da bulunan birçok kazıma kütüphanesi arasında&nbsp;***BeautifulSoup*** &nbsp;, HTML ve XML belgelerini ayrıştırmadaki kullanım kolaylığıyla öne çıkar. 
 


 ### Web Kazıma İçin Neden Python?
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Öğrenmesi Kolay***  : Python'un basit söz dizimi, onu programcı olmayanlar için bile yeni başlayanların kullanımına uygun hale getirir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Kapsamlı Kütüphaneler***  : Python , web kazıma için ***BeautifulSoup***  , ***Scrapy***  ve ***Selenium***  gibi kütüphaneler sunar ; her biri farklı ihtiyaçlara göre uyarlanmıştır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Topluluk Desteği***  : Python'un geniş ve aktif bir topluluğu vardır; bu da sorun giderme için bol miktarda dokümantasyon, eğitim ve forum bulunduğu anlamına gelir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### BeautifulSoup Nedir?
<!-- /wp:heading -->

  ***BeautifulSoup,*** &nbsp;HTML ve XML belgelerini ayrıştırmak için kullanılan bir Python kütüphanesidir. Web sayfalarından belirli veri parçalarını çıkarmaya ve bunları okunabilir bir biçime dönüştürmeye yardımcı olur. BeautifulSoup,&nbsp;bir web sitesine HTTP istekleri gönderen ve ayrıştırma için HTML içeriğini alan Python'un&nbsp;***istekler modülüyle birlikte çalışır.***  
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 4. Python ve BeautifulSoup Kullanarak Web Kazıma Teknikleri
<!-- /wp:heading -->

  Şimdi, OSINT amaçları için veri toplamaya yönelik tipik iş akışına odaklanarak Python ve BeautifulSoup'un web kazıma için nasıl kullanılacağını inceleyelim. 
 


 ### Adım 1: Gerekli Kitaplıkları Yükleyin
<!-- /wp:heading -->

  Başlamadan önce, Python'un paket yükleyicisini kullanarak&nbsp;***istekleri*** &nbsp;ve&nbsp;***BeautifulSoup*** &nbsp;kütüphanelerini&nbsp;yüklemeniz gerekecektir .<code>pip</code> 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">pip install requests
pip install beautifulsoup4</code></pre>
<!-- /wp:code -->


 ### Adım 2: Bir Web Sitesine HTTP İsteği Gönderin
<!-- /wp:heading -->

  ***Web kazıma işleminin ilk adımı, HTML içeriğini almak için web sitesinin sunucusuna bir HTTP isteği göndermektir. Bunun için, istekler*** &nbsp;kitaplığını kullanacaksınız&nbsp;. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">import requests

url = 'https://example.com'
response = requests.get(url)

if response.status_code == 200:
    print("Website content retrieved successfully")
else:
    print("Failed to retrieve website content")</code></pre>
<!-- /wp:code -->

  Bu betik&nbsp;<code>GET</code>belirtilen URL'ye bir istek gönderir ve isteğin başarılı olup olmadığını (HTTP durum kodu 200) kontrol eder. 
 


 ### Adım 3: HTML İçeriğini Ayrıştırın
<!-- /wp:heading -->

  HTML içeriğine sahip olduğunuzda, bir sonraki adım onu ​​BeautifulSoup kullanarak ayrıştırmaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">from bs4 import BeautifulSoup

soup = BeautifulSoup(response.content, 'html.parser')

# Print the title of the page
print(soup.title.text)</code></pre>
<!-- /wp:code -->

  Bu kod, HTML belgesini temsil eden bir BeautifulSoup nesnesi oluşturur. Daha sonra sayfadan belirli öğeleri, örneğin sayfa başlığını çıkarmak için çeşitli yöntemler kullanabilirsiniz. 
 


 ### Adım 4: Sayfadan Verileri Çıkarın
<!-- /wp:heading -->

  Verileri çıkarmak için, ilgilendiğiniz HTML öğelerini tanımlamanız gerekir. Örneğin, bir haber sitesinden tüm başlıkları çıkarmak istiyorsanız, uygun HTML etiketlerini (örneğin&nbsp;<code>&lt;h1&gt;</code>,&nbsp;<code>&lt;h2&gt;</code>veya&nbsp;<code>&lt;a&gt;</code>) hedefleyebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Extract all headlines
headlines = soup.find_all('h2')

for headline in headlines:
    print(headline.text)</code></pre>
<!-- /wp:code -->

  <code>find_all()</code>Bu örnekte, tüm etiketleri bulmak&nbsp;<code>&lt;h2&gt;</code>ve içlerindeki metni yazdırmak için&nbsp;kullanıyoruz . 
 


 ### Adım 5: Analiz için Verileri Kaydedin
<!-- /wp:heading -->

  İstediğiniz verileri çıkardıktan sonra, muhtemelen daha fazla analiz için saklamak isteyeceksiniz. Daha kolay düzenleme için bir CSV veya JSON dosyasına kaydedebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">import csv

# Save headlines to a CSV file
with open('headlines.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Headline"])

    for headline in headlines:
        writer.writerow([headline.text])</code></pre>
<!-- /wp:code -->

  Bu kod, kazınmış başlıkları herhangi bir elektronik tablo yazılımı kullanılarak açılıp analiz edilebilen bir CSV dosyasına kaydeder. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 5. Web Kazımada Ortak Zorluklar
<!-- /wp:heading -->

  Web kazıma güçlü bir araç olmasına rağmen, OSINT profesyonellerinin farkında olması gereken bazı zorlukları da beraberinde getirir: 
 


 ### a.&nbsp;***Kazıma Önleyici Mekanizmalar*** 
<!-- /wp:heading -->

  Birçok web sitesi CAPTCHA'lar, hız sınırlaması ve bot algılama sistemleri gibi veri kazıma karşıtı önlemler kullanır. Bu mekanizmalar, özellikle ölçekte veri kazımayı zorlaştırabilir. 
 


 ### b.&nbsp;***Dinamik İçerik*** 
<!-- /wp:heading -->

  İçeriği dinamik olarak yüklemek için JavaScript kullanan web sayfalarını (sosyal medya akışları gibi) yalnızca BeautifulSoup kullanarak kazımak zor olabilir. Bu gibi durumlarda, JavaScript'i işlemek ve verileri çıkarmak için&nbsp;***Selenium*** &nbsp;veya&nbsp;***Splash*** &nbsp;gibi kütüphaneler gerekebilir. 
 


 ### c.&nbsp;***IP Engelleme*** 
<!-- /wp:heading -->

  Bir web sitesinden çok sık tarama yaparsanız, IP adresiniz engellenebilir. Bunu önlemek için, dönen proxy'ler kullanmayı veya isteklerinizi hız sınırlaması ile sınırlamayı düşünün. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 6. BeautifulSoup ile Kazıma İçin En İyi Uygulamalar
<!-- /wp:heading -->

  Web kazıma çabalarınızın etkili, yasal ve etik olmasını sağlamak için şu en iyi uygulamaları izleyin: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Web Sitesinin Hizmet Şartlarına Saygı Gösterin***  : Web sitesinin taramaya izin verip vermediğini her zaman kontrol edin ve sitenin hangi bölümlerinin taranabileceğini gösteren robots.txt dosyasına saygı gösterin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***İstekleri Kısıtlayın***  : Kısa bir süre içinde çok fazla istekle bir web sitesini boğmayın. İnsan tarama davranışını taklit etmek için istekler arasında gecikmeler uygulayın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Proxy Kullanın***  : Aynı siteden birden fazla sayfa topluyorsanız, IP yasaklarından kaçınmak için dönüşümlü proxy'ler kullanın. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Veri Gizliliği Yasalarına Uygun Olun***  : Özellikle kişisel verilerle uğraşırken, veri toplama faaliyetlerinizin veri gizliliği düzenlemelerine uygun olduğundan emin olun. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Hataları Zarafetle Ele Alın***  : Eksik öğeler, zaman aşımı veya sunucu arızaları gibi hataları ele almaya hazır olun. Sağlam hata işleme, kazıyıcınızı daha güvenilir hale getirir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 7. Sonuç
<!-- /wp:heading -->

  ***Python*** &nbsp;ve&nbsp;***BeautifulSoup*** &nbsp;kullanarak web kazıma, web'den herkese açık veri toplamak isteyen&nbsp;***OSINT profesyonelleri*** &nbsp;için olmazsa olmaz bir tekniktir&nbsp;. Çok miktarda bilgiyi verimli bir şekilde çıkarmanıza, analiz etmenize ve kullanmanıza olanak tanır. Ancak, özellikle kişisel veya hassas verilerle uğraşırken web kazımaya etik ve yasal bir şekilde yaklaşmak çok önemlidir. 
 

  Bu yazıda tartışılan araçlara ve tekniklere hakim olarak, OSINT çabalarınızı geliştiren, herkese açık olarak erişilebilen eyleme dönüştürülebilir istihbarat sağlayan güçlü kazıma iş akışları geliştirebilirsiniz.<a href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.siberoloji.com%2Fscraping-using-python-and-beautifulsoup%2F" target="_blank" rel="noreferrer noopener"></a> 
 