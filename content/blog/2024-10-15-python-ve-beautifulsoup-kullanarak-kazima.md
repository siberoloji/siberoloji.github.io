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

  <strong>Açık Kaynak İstihbaratı (OSINT)</strong>&nbsp;dünyasında&nbsp;, kamuya açık kaynaklardan bilgi toplamak araştırma, analiz ve karar alma için kritik öneme sahiptir. İster siber güvenlik, gazetecilik, kolluk kuvvetleri veya rekabet istihbaratı için içgörü toplamak olsun,&nbsp;<strong>web kazıma,</strong>&nbsp;web sitelerinden verileri verimli bir şekilde çıkarmak için değerli bir teknik haline gelmiştir. Web kazıma için en popüler araçlar arasında Python ve&nbsp;<strong>BeautifulSoup</strong>&nbsp;kütüphanesi yer almaktadır. 
 

  <strong>Bu blog yazısında, Python ve BeautifulSoup'un web kazıma için</strong>&nbsp;kullanımını inceleyeceğiz ve bu tekniklerin&nbsp;<strong>OSINT</strong>&nbsp;için nasıl uygulanabileceğine odaklanacağız&nbsp;. Şunları ele alacağız: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Web Scraping Nedir?</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>OSINT Web Kazımada Yasal ve Etik Hususlar</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Python ve BeautifulSoup'a Giriş</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Python ve BeautifulSoup Kullanarak Web Kazıma Teknikleri</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Web Kazımada Ortak Zorluklar</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>BeautifulSoup ile Kazıma İçin En İyi Uygulamalar</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Çözüm</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 1. Web Kazıma Nedir?</h2>
<!-- /wp:heading -->

  <strong>Web kazıma,</strong>&nbsp;web sitelerinden otomatik olarak veri çıkarma işlemidir. Bir web sitesine HTTP istekleri göndermeyi, HTML içeriğini almayı ve ardından metin, resim veya tablo gibi belirli bilgi parçalarını toplamak için verileri ayrıştırmayı içerir. Kazıma genellikle şu durumlarda kullanılır: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Verilere API'ler aracılığıyla kolayca erişilemez</strong> : Birçok web sitesi veri erişimi için API'ler (Uygulama Programlama Arayüzleri) sağlamaz ve bu da veri kazımayı tek seçenek haline getirir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Büyük hacimli verilerin toplanması</strong> : Veri toplama, manuel olarak yapılması zaman alıcı olacak olan verilerin birden fazla web sayfasından etkin bir şekilde toplanmasını sağlar.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  OSINT profesyonelleri için web kazıma, bloglar, forumlar, haber siteleri ve sosyal medya platformları gibi çeşitli çevrimiçi kaynaklardan gerçek zamanlı veri toplama olanağı sunar. 
 

<!-- wp:heading {"level":3} -->
 ### Web Kazıma için OSINT Kullanım Örnekleri</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Siber Güvenlik</strong> : Hacker forumlarını ve karanlık web pazar yerlerini tarayarak tehditleri tespit etmek.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kolluk kuvvetleri</strong> : Cezai soruşturmalar için çevrimiçi faaliyetlerin izlenmesi.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Gazetecilik</strong> : Araştırmacı gazetecilik amacıyla birden fazla haber kuruluşundan bilgi toplamak.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Rekabet İstihbaratı</strong> : Rakiplerin web sitesi güncellemelerini, fiyat değişikliklerini veya yeni ürün lansmanlarını takip etme.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 2. OSINT Web Kazımada Yasal ve Etik Hususlar</h2>
<!-- /wp:heading -->

  Web kazıma, veri toplamak için güçlü bir araç olabilse de, akılda tutulması gereken önemli&nbsp;<strong>yasal ve etik hususlar</strong>&nbsp;vardır . Tüm web siteleri kazımaya izin vermez ve farklı yargı bölgelerinin kamu sitelerinden veri toplama konusunda farklı kuralları vardır. 
 

<!-- wp:heading {"level":3} -->
 ### Yasal Hususlar</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Hizmet Şartları (ToS)</strong> : Birçok web sitesi, ToS'larında kazımanın izin verilip verilmediğini açıkça belirtir. Bir web sitesinin ToS'unu ihlal etmek, hesabın askıya alınması, yasal işlem veya durdurma ve vazgeçme emirleri gibi yasal sonuçlara yol açabilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Telif Hakkı</strong> : Belirli türdeki içeriklerin (telif hakkıyla korunan metinler, resimler veya veritabanları gibi) izinsiz olarak kopyalanması fikri mülkiyet haklarını ihlal edebilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Veri Gizliliği Yasaları</strong> : Avrupa'daki <strong>Genel Veri Koruma Yönetmeliği (GDPR)</strong> ve ABD'deki <strong>Kaliforniya Tüketici Gizlilik Yasası (CCPA)</strong> gibi düzenlemeler, kişisel verilerin nasıl toplanabileceği, saklanabileceği ve işlenebileceği konusunda katı kurallar getirir. Kişisel verileri rıza olmadan toplamak bu yasaları ihlal edebilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Etik Hususlar</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Kullanıcı Gizliliğine Saygı</strong> : Veriler kamuya açık olsa bile, özellikle hassas veriler söz konusu olduğunda kişisel bilgilerin toplanması etik kaygılara yol açabilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Veri Kötüye Kullanımından Kaçınma</strong> : Toplanan veriler yalnızca araştırma, soruşturma veya rekabet analizi gibi meşru ve etik amaçlar için kullanılmalıdır. Toplanan verilerin taciz, istismar veya yasa dışı amaçlar için kötüye kullanılması etik dışıdır.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Bir OSINT uzmanı olarak, bu sorunlarda dikkatli bir şekilde gezinmeniz ve veri toplama faaliyetlerinizin her zaman yasal ve etik olduğundan emin olmanız önemlidir. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 3. Python ve BeautifulSoup'a Giriş</h2>
<!-- /wp:heading -->

  <strong>Python,</strong>&nbsp;web kazıma için en yaygın kullanılan programlama dillerinden biridir, bunun başlıca nedeni basitliği, çok yönlülüğü ve geniş kütüphane ekosistemidir. Python'da bulunan birçok kazıma kütüphanesi arasında&nbsp;<strong>BeautifulSoup</strong>&nbsp;, HTML ve XML belgelerini ayrıştırmadaki kullanım kolaylığıyla öne çıkar. 
 

<!-- wp:heading {"level":3} -->
 ### Web Kazıma İçin Neden Python?</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Öğrenmesi Kolay</strong> : Python'un basit söz dizimi, onu programcı olmayanlar için bile yeni başlayanların kullanımına uygun hale getirir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kapsamlı Kütüphaneler</strong> : Python , web kazıma için <strong>BeautifulSoup</strong> , <strong>Scrapy</strong> ve <strong>Selenium</strong> gibi kütüphaneler sunar ; her biri farklı ihtiyaçlara göre uyarlanmıştır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Topluluk Desteği</strong> : Python'un geniş ve aktif bir topluluğu vardır; bu da sorun giderme için bol miktarda dokümantasyon, eğitim ve forum bulunduğu anlamına gelir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### BeautifulSoup Nedir?</h3>
<!-- /wp:heading -->

  <strong>BeautifulSoup,</strong>&nbsp;HTML ve XML belgelerini ayrıştırmak için kullanılan bir Python kütüphanesidir. Web sayfalarından belirli veri parçalarını çıkarmaya ve bunları okunabilir bir biçime dönüştürmeye yardımcı olur. BeautifulSoup,&nbsp;bir web sitesine HTTP istekleri gönderen ve ayrıştırma için HTML içeriğini alan Python'un&nbsp;<strong>istekler modülüyle birlikte çalışır.</strong> 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 4. Python ve BeautifulSoup Kullanarak Web Kazıma Teknikleri</h2>
<!-- /wp:heading -->

  Şimdi, OSINT amaçları için veri toplamaya yönelik tipik iş akışına odaklanarak Python ve BeautifulSoup'un web kazıma için nasıl kullanılacağını inceleyelim. 
 

<!-- wp:heading {"level":3} -->
 ### Adım 1: Gerekli Kitaplıkları Yükleyin</h3>
<!-- /wp:heading -->

  Başlamadan önce, Python'un paket yükleyicisini kullanarak&nbsp;<strong>istekleri</strong>&nbsp;ve&nbsp;<strong>BeautifulSoup</strong>&nbsp;kütüphanelerini&nbsp;yüklemeniz gerekecektir .<code>pip</code> 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">pip install requests
pip install beautifulsoup4</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Adım 2: Bir Web Sitesine HTTP İsteği Gönderin</h3>
<!-- /wp:heading -->

  <strong>Web kazıma işleminin ilk adımı, HTML içeriğini almak için web sitesinin sunucusuna bir HTTP isteği göndermektir. Bunun için, istekler</strong>&nbsp;kitaplığını kullanacaksınız&nbsp;. 
 

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
 

<!-- wp:heading {"level":3} -->
 ### Adım 3: HTML İçeriğini Ayrıştırın</h3>
<!-- /wp:heading -->

  HTML içeriğine sahip olduğunuzda, bir sonraki adım onu ​​BeautifulSoup kullanarak ayrıştırmaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">from bs4 import BeautifulSoup

soup = BeautifulSoup(response.content, 'html.parser')

# Print the title of the page
print(soup.title.text)</code></pre>
<!-- /wp:code -->

  Bu kod, HTML belgesini temsil eden bir BeautifulSoup nesnesi oluşturur. Daha sonra sayfadan belirli öğeleri, örneğin sayfa başlığını çıkarmak için çeşitli yöntemler kullanabilirsiniz. 
 

<!-- wp:heading {"level":3} -->
 ### Adım 4: Sayfadan Verileri Çıkarın</h3>
<!-- /wp:heading -->

  Verileri çıkarmak için, ilgilendiğiniz HTML öğelerini tanımlamanız gerekir. Örneğin, bir haber sitesinden tüm başlıkları çıkarmak istiyorsanız, uygun HTML etiketlerini (örneğin&nbsp;<code>&lt;h1&gt;</code>,&nbsp;<code>&lt;h2&gt;</code>veya&nbsp;<code>&lt;a&gt;</code>) hedefleyebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># Extract all headlines
headlines = soup.find_all('h2')

for headline in headlines:
    print(headline.text)</code></pre>
<!-- /wp:code -->

  <code>find_all()</code>Bu örnekte, tüm etiketleri bulmak&nbsp;<code>&lt;h2&gt;</code>ve içlerindeki metni yazdırmak için&nbsp;kullanıyoruz . 
 

<!-- wp:heading {"level":3} -->
 ### Adım 5: Analiz için Verileri Kaydedin</h3>
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

 
 ## 5. Web Kazımada Ortak Zorluklar</h2>
<!-- /wp:heading -->

  Web kazıma güçlü bir araç olmasına rağmen, OSINT profesyonellerinin farkında olması gereken bazı zorlukları da beraberinde getirir: 
 

<!-- wp:heading {"level":3} -->
 ### a.&nbsp;<strong>Kazıma Önleyici Mekanizmalar</strong></h3>
<!-- /wp:heading -->

  Birçok web sitesi CAPTCHA'lar, hız sınırlaması ve bot algılama sistemleri gibi veri kazıma karşıtı önlemler kullanır. Bu mekanizmalar, özellikle ölçekte veri kazımayı zorlaştırabilir. 
 

<!-- wp:heading {"level":3} -->
 ### b.&nbsp;<strong>Dinamik İçerik</strong></h3>
<!-- /wp:heading -->

  İçeriği dinamik olarak yüklemek için JavaScript kullanan web sayfalarını (sosyal medya akışları gibi) yalnızca BeautifulSoup kullanarak kazımak zor olabilir. Bu gibi durumlarda, JavaScript'i işlemek ve verileri çıkarmak için&nbsp;<strong>Selenium</strong>&nbsp;veya&nbsp;<strong>Splash</strong>&nbsp;gibi kütüphaneler gerekebilir. 
 

<!-- wp:heading {"level":3} -->
 ### c.&nbsp;<strong>IP Engelleme</strong></h3>
<!-- /wp:heading -->

  Bir web sitesinden çok sık tarama yaparsanız, IP adresiniz engellenebilir. Bunu önlemek için, dönen proxy'ler kullanmayı veya isteklerinizi hız sınırlaması ile sınırlamayı düşünün. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 6. BeautifulSoup ile Kazıma İçin En İyi Uygulamalar</h2>
<!-- /wp:heading -->

  Web kazıma çabalarınızın etkili, yasal ve etik olmasını sağlamak için şu en iyi uygulamaları izleyin: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Web Sitesinin Hizmet Şartlarına Saygı Gösterin</strong> : Web sitesinin taramaya izin verip vermediğini her zaman kontrol edin ve sitenin hangi bölümlerinin taranabileceğini gösteren robots.txt dosyasına saygı gösterin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>İstekleri Kısıtlayın</strong> : Kısa bir süre içinde çok fazla istekle bir web sitesini boğmayın. İnsan tarama davranışını taklit etmek için istekler arasında gecikmeler uygulayın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Proxy Kullanın</strong> : Aynı siteden birden fazla sayfa topluyorsanız, IP yasaklarından kaçınmak için dönüşümlü proxy'ler kullanın.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Veri Gizliliği Yasalarına Uygun Olun</strong> : Özellikle kişisel verilerle uğraşırken, veri toplama faaliyetlerinizin veri gizliliği düzenlemelerine uygun olduğundan emin olun.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Hataları Zarafetle Ele Alın</strong> : Eksik öğeler, zaman aşımı veya sunucu arızaları gibi hataları ele almaya hazır olun. Sağlam hata işleme, kazıyıcınızı daha güvenilir hale getirir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

 
 ## 7. Sonuç</h2>
<!-- /wp:heading -->

  <strong>Python</strong>&nbsp;ve&nbsp;<strong>BeautifulSoup</strong>&nbsp;kullanarak web kazıma, web'den herkese açık veri toplamak isteyen&nbsp;<strong>OSINT profesyonelleri</strong>&nbsp;için olmazsa olmaz bir tekniktir&nbsp;. Çok miktarda bilgiyi verimli bir şekilde çıkarmanıza, analiz etmenize ve kullanmanıza olanak tanır. Ancak, özellikle kişisel veya hassas verilerle uğraşırken web kazımaya etik ve yasal bir şekilde yaklaşmak çok önemlidir. 
 

  Bu yazıda tartışılan araçlara ve tekniklere hakim olarak, OSINT çabalarınızı geliştiren, herkese açık olarak erişilebilen eyleme dönüştürülebilir istihbarat sağlayan güçlü kazıma iş akışları geliştirebilirsiniz.<a href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.siberoloji.com%2Fscraping-using-python-and-beautifulsoup%2F" target="_blank" rel="noreferrer noopener"></a> 
 