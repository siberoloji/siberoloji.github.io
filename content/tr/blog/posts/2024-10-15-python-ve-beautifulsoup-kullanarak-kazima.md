---
draft: false
title: Python ve BeautifulSoup Kullanarak Kazıma
date: 2024-10-15T12:07:37+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /tr/python-ve-beautifulsoup-kullanarak-kazima/
featured_image: /images/osint2.webp
categories:
  - Açık Kaynak İstihbaratı (AKİ)
tags:
  - aki
  - cybersecurity
  - osint
  - siber güvenlik
---


**Açık Kaynak İstihbaratı (OSINT)** dünyasında , kamuya açık kaynaklardan bilgi toplamak araştırma, analiz ve karar alma için kritik öneme sahiptir. İster siber güvenlik, gazetecilik, kolluk kuvvetleri veya rekabet istihbaratı için içgörü toplamak olsun, **web kazıma,** web sitelerinden verileri verimli bir şekilde çıkarmak için değerli bir teknik haline gelmiştir. Web kazıma için en popüler araçlar arasında Python ve **BeautifulSoup** kütüphanesi yer almaktadır.



**Bu blog yazısında, Python ve BeautifulSoup'un web kazıma için** kullanımını inceleyeceğiz ve bu tekniklerin **OSINT** için nasıl uygulanabileceğine odaklanacağız . Şunları ele alacağız:


* Web Scraping Nedir?

* OSINT Web Kazımada Yasal ve Etik Hususlar

* Python ve BeautifulSoup'a Giriş

* Python ve BeautifulSoup Kullanarak Web Kazıma Teknikleri

* Web Kazımada Ortak Zorluklar

* BeautifulSoup ile Kazıma İçin En İyi Uygulamalar

* Çözüm






## 1. Web Kazıma Nedir?



**Web kazıma,** web sitelerinden otomatik olarak veri çıkarma işlemidir. Bir web sitesine HTTP istekleri göndermeyi, HTML içeriğini almayı ve ardından metin, resim veya tablo gibi belirli bilgi parçalarını toplamak için verileri ayrıştırmayı içerir. Kazıma genellikle şu durumlarda kullanılır:


* **Verilere API'ler aracılığıyla kolayca erişilemez** : Birçok web sitesi veri erişimi için API'ler (Uygulama Programlama Arayüzleri) sağlamaz ve bu da veri kazımayı tek seçenek haline getirir.

* **Büyük hacimli verilerin toplanması** : Veri toplama, manuel olarak yapılması zaman alıcı olacak olan verilerin birden fazla web sayfasından etkin bir şekilde toplanmasını sağlar.




OSINT profesyonelleri için web kazıma, bloglar, forumlar, haber siteleri ve sosyal medya platformları gibi çeşitli çevrimiçi kaynaklardan gerçek zamanlı veri toplama olanağı sunar.



Web Kazıma için OSINT Kullanım Örnekleri


* **Siber Güvenlik** : Hacker forumlarını ve karanlık web pazar yerlerini tarayarak tehditleri tespit etmek.

* **Kolluk kuvvetleri** : Cezai soruşturmalar için çevrimiçi faaliyetlerin izlenmesi.

* **Gazetecilik** : Araştırmacı gazetecilik amacıyla birden fazla haber kuruluşundan bilgi toplamak.

* **Rekabet İstihbaratı** : Rakiplerin web sitesi güncellemelerini, fiyat değişikliklerini veya yeni ürün lansmanlarını takip etme.






## 2. OSINT Web Kazımada Yasal ve Etik Hususlar



Web kazıma, veri toplamak için güçlü bir araç olabilse de, akılda tutulması gereken önemli **yasal ve etik hususlar** vardır . Tüm web siteleri kazımaya izin vermez ve farklı yargı bölgelerinin kamu sitelerinden veri toplama konusunda farklı kuralları vardır.



Yasal Hususlar


* **Hizmet Şartları (ToS)** : Birçok web sitesi, ToS'larında kazımanın izin verilip verilmediğini açıkça belirtir. Bir web sitesinin ToS'unu ihlal etmek, hesabın askıya alınması, yasal işlem veya durdurma ve vazgeçme emirleri gibi yasal sonuçlara yol açabilir.

* **Telif Hakkı** : Belirli türdeki içeriklerin (telif hakkıyla korunan metinler, resimler veya veritabanları gibi) izinsiz olarak kopyalanması fikri mülkiyet haklarını ihlal edebilir.

* **Veri Gizliliği Yasaları** : Avrupa'daki **Genel Veri Koruma Yönetmeliği (GDPR)** ve ABD'deki **Kaliforniya Tüketici Gizlilik Yasası (CCPA)** gibi düzenlemeler, kişisel verilerin nasıl toplanabileceği, saklanabileceği ve işlenebileceği konusunda katı kurallar getirir. Kişisel verileri rıza olmadan toplamak bu yasaları ihlal edebilir.




Etik Hususlar


* **Kullanıcı Gizliliğine Saygı** : Veriler kamuya açık olsa bile, özellikle hassas veriler söz konusu olduğunda kişisel bilgilerin toplanması etik kaygılara yol açabilir.

* **Veri Kötüye Kullanımından Kaçınma** : Toplanan veriler yalnızca araştırma, soruşturma veya rekabet analizi gibi meşru ve etik amaçlar için kullanılmalıdır. Toplanan verilerin taciz, istismar veya yasa dışı amaçlar için kötüye kullanılması etik dışıdır.




Bir OSINT uzmanı olarak, bu sorunlarda dikkatli bir şekilde gezinmeniz ve veri toplama faaliyetlerinizin her zaman yasal ve etik olduğundan emin olmanız önemlidir.





## 3. Python ve BeautifulSoup'a Giriş



**Python,** web kazıma için en yaygın kullanılan programlama dillerinden biridir, bunun başlıca nedeni basitliği, çok yönlülüğü ve geniş kütüphane ekosistemidir. Python'da bulunan birçok kazıma kütüphanesi arasında **BeautifulSoup** , HTML ve XML belgelerini ayrıştırmadaki kullanım kolaylığıyla öne çıkar.



Web Kazıma İçin Neden Python?


* **Öğrenmesi Kolay** : Python'un basit söz dizimi, onu programcı olmayanlar için bile yeni başlayanların kullanımına uygun hale getirir.

* **Kapsamlı Kütüphaneler** : Python , web kazıma için **BeautifulSoup** , **Scrapy** ve **Selenium** gibi kütüphaneler sunar ; her biri farklı ihtiyaçlara göre uyarlanmıştır.

* **Topluluk Desteği** : Python'un geniş ve aktif bir topluluğu vardır; bu da sorun giderme için bol miktarda dokümantasyon, eğitim ve forum bulunduğu anlamına gelir.




BeautifulSoup Nedir?



**BeautifulSoup,** HTML ve XML belgelerini ayrıştırmak için kullanılan bir Python kütüphanesidir. Web sayfalarından belirli veri parçalarını çıkarmaya ve bunları okunabilir bir biçime dönüştürmeye yardımcı olur. BeautifulSoup, bir web sitesine HTTP istekleri gönderen ve ayrıştırma için HTML içeriğini alan Python'un **istekler modülüyle birlikte çalışır.**





## 4. Python ve BeautifulSoup Kullanarak Web Kazıma Teknikleri



Şimdi, OSINT amaçları için veri toplamaya yönelik tipik iş akışına odaklanarak Python ve BeautifulSoup'un web kazıma için nasıl kullanılacağını inceleyelim.



Adım 1: Gerekli Kitaplıkları Yükleyin



Başlamadan önce, Python'un paket yükleyicisini kullanarak **istekleri** ve **BeautifulSoup** kütüphanelerini yüklemeniz gerekecektir .`pip`


```bash
pip install requests
pip install beautifulsoup4```



Adım 2: Bir Web Sitesine HTTP İsteği Gönderin



**Web kazıma işleminin ilk adımı, HTML içeriğini almak için web sitesinin sunucusuna bir HTTP isteği göndermektir. Bunun için, istekler** kitaplığını kullanacaksınız .


```bash
import requests

url = 'https://example.com'
response = requests.get(url)

if response.status_code == 200:
    print("Website content retrieved successfully")
else:
    print("Failed to retrieve website content")```



Bu betik `GET`belirtilen URL'ye bir istek gönderir ve isteğin başarılı olup olmadığını (HTTP durum kodu 200) kontrol eder.



Adım 3: HTML İçeriğini Ayrıştırın



HTML içeriğine sahip olduğunuzda, bir sonraki adım onu ​​BeautifulSoup kullanarak ayrıştırmaktır.


```bash
from bs4 import BeautifulSoup

soup = BeautifulSoup(response.content, 'html.parser')

# Print the title of the page
print(soup.title.text)```



Bu kod, HTML belgesini temsil eden bir BeautifulSoup nesnesi oluşturur. Daha sonra sayfadan belirli öğeleri, örneğin sayfa başlığını çıkarmak için çeşitli yöntemler kullanabilirsiniz.



Adım 4: Sayfadan Verileri Çıkarın



Verileri çıkarmak için, ilgilendiğiniz HTML öğelerini tanımlamanız gerekir. Örneğin, bir haber sitesinden tüm başlıkları çıkarmak istiyorsanız, uygun HTML etiketlerini (örneğin `&lt;h1&gt;`, `&lt;h2&gt;`veya `&lt;a&gt;`) hedefleyebilirsiniz.


```bash
# Extract all headlines
headlines = soup.find_all('h2')

for headline in headlines:
    print(headline.text)```



`find_all()`Bu örnekte, tüm etiketleri bulmak `&lt;h2&gt;`ve içlerindeki metni yazdırmak için kullanıyoruz .



Adım 5: Analiz için Verileri Kaydedin



İstediğiniz verileri çıkardıktan sonra, muhtemelen daha fazla analiz için saklamak isteyeceksiniz. Daha kolay düzenleme için bir CSV veya JSON dosyasına kaydedebilirsiniz.


```bash
import csv

# Save headlines to a CSV file
with open('headlines.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Headline"])

    for headline in headlines:
        writer.writerow([headline.text])```



Bu kod, kazınmış başlıkları herhangi bir elektronik tablo yazılımı kullanılarak açılıp analiz edilebilen bir CSV dosyasına kaydeder.





## 5. Web Kazımada Ortak Zorluklar



Web kazıma güçlü bir araç olmasına rağmen, OSINT profesyonellerinin farkında olması gereken bazı zorlukları da beraberinde getirir:



a. **Kazıma Önleyici Mekanizmalar**



Birçok web sitesi CAPTCHA'lar, hız sınırlaması ve bot algılama sistemleri gibi veri kazıma karşıtı önlemler kullanır. Bu mekanizmalar, özellikle ölçekte veri kazımayı zorlaştırabilir.



b. **Dinamik İçerik**



İçeriği dinamik olarak yüklemek için JavaScript kullanan web sayfalarını (sosyal medya akışları gibi) yalnızca BeautifulSoup kullanarak kazımak zor olabilir. Bu gibi durumlarda, JavaScript'i işlemek ve verileri çıkarmak için **Selenium** veya **Splash** gibi kütüphaneler gerekebilir.



c. **IP Engelleme**



Bir web sitesinden çok sık tarama yaparsanız, IP adresiniz engellenebilir. Bunu önlemek için, dönen proxy'ler kullanmayı veya isteklerinizi hız sınırlaması ile sınırlamayı düşünün.





## 6. BeautifulSoup ile Kazıma İçin En İyi Uygulamalar



Web kazıma çabalarınızın etkili, yasal ve etik olmasını sağlamak için şu en iyi uygulamaları izleyin:


* **Web Sitesinin Hizmet Şartlarına Saygı Gösterin** : Web sitesinin taramaya izin verip vermediğini her zaman kontrol edin ve sitenin hangi bölümlerinin taranabileceğini gösteren robots.txt dosyasına saygı gösterin.

* **İstekleri Kısıtlayın** : Kısa bir süre içinde çok fazla istekle bir web sitesini boğmayın. İnsan tarama davranışını taklit etmek için istekler arasında gecikmeler uygulayın.

* **Proxy Kullanın** : Aynı siteden birden fazla sayfa topluyorsanız, IP yasaklarından kaçınmak için dönüşümlü proxy'ler kullanın.

* **Veri Gizliliği Yasalarına Uygun Olun** : Özellikle kişisel verilerle uğraşırken, veri toplama faaliyetlerinizin veri gizliliği düzenlemelerine uygun olduğundan emin olun.

* **Hataları Zarafetle Ele Alın** : Eksik öğeler, zaman aşımı veya sunucu arızaları gibi hataları ele almaya hazır olun. Sağlam hata işleme, kazıyıcınızı daha güvenilir hale getirir.






## 7. Sonuç



**Python** ve **BeautifulSoup** kullanarak web kazıma, web'den herkese açık veri toplamak isteyen **OSINT profesyonelleri** için olmazsa olmaz bir tekniktir . Çok miktarda bilgiyi verimli bir şekilde çıkarmanıza, analiz etmenize ve kullanmanıza olanak tanır. Ancak, özellikle kişisel veya hassas verilerle uğraşırken web kazımaya etik ve yasal bir şekilde yaklaşmak çok önemlidir.



Bu yazıda tartışılan araçlara ve tekniklere hakim olarak, OSINT çabalarınızı geliştiren, herkese açık olarak erişilebilen eyleme dönüştürülebilir istihbarat sağlayan güçlü kazıma iş akışları geliştirebilirsiniz.<a href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.siberoloji.com%2Fscraping-using-python-and-beautifulsoup%2F" target="_blank" rel="noreferrer noopener"></a>
