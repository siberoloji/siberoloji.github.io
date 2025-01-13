---
draft: false

title:  'DNS ve DNS Sunucusu Nedir? Kapsamlı Bir Kılavuz'
date: '2024-09-20T00:55:07+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/dns-ve-dns-sunucusu-nedir-kapsamli-bir-kilavuz/
 
featured_image: /images/dnsserver-scaled.webp
categories:
    - Haberler
tags:
    - dns
    - 'dns sunucu'
---
İnternet, ister iş, ister iletişim, ister eğlence veya eğitim olsun, günlük hayatımızın önemli bir parçası haline geldi. Ancak çoğumuz web sitelerinde gezinmemizi, e-posta göndermemizi veya video akışı yapmamızı sağlayan teknolojileri tam olarak anlamıyor olabiliriz. Bu temel teknolojilerden biri de interneti daha erişilebilir ve kullanıcı dostu hale getirmede hayati bir rol oynayan DNS veya **Alan Adı Sistemi'dir** . Bu blog yazısında DNS'in temellerine, DNS sunucularının ne olduğuna, nasıl çalıştıklarına ve günlük yaşamdaki önemini gösteren örneklere dalacağız.

1. DNS Nedir?

**DNS, esasen internetin telefon rehberi olan Alan Adı Sistemi** anlamına gelir . Cep telefonunuzdaki kişilerin telefon numaralarını sakladığınız gibi, DNS de alan adlarını (örneğin `www.google.com`) ilgili IP adresleriyle (örneğin `172.217.3.110`) depolamaya ve eşleştirmeye yardımcı olur. Bir IP adresi, internetteki bir bilgisayar veya sunucu için benzersiz bir tanımlayıcıdır. Ancak, sayı dizilerini hatırlamak zor olabilir, bu nedenle DNS web sitelerine erişimi kolaylaştırmak için geliştirilmiştir.
#### Örnek:
* tarayıcınıza `192.168.1.1` gibi bir IP adresi yazmak yerine , `www.example.com` yazabilirsiniz ve DNS bu alan adını karşılık gelen IP adresine çevirir. Bu işlem milisaniyeler içinde gerçekleşir, bu nedenle kullanıcılar bunun gerçekleştiğini bile fark etmezler.
**Önemli Noktalar:**
* DNS, insanların anlayabileceği alan adlarını IP adreslerine çevirir.

* Bu sistem kullanıcıların sayısal IP adreslerini ezberlemeye gerek kalmadan web sitelerine kolayca erişebilmelerini sağlıyor.

2. DNS Sunucusu Nedir?

DNS **sunucusu,** etki alanı adlarının ve bunlara karşılık gelen IP adreslerinin veritabanını tutan bir makinedir (sunucu). Web tarayıcınıza bir etki alanı adı yazdığınızda, bilgisayarınız o etki alanı için doğru IP adresini bulmak üzere bir DNS sunucusuyla iletişim kurar. Bu arama sürecinin çeşitli aşamalarından sorumlu olan farklı DNS sunucusu türleri vardır.
#### DNS Sunucularının Türleri:
* **Özyinelemeli DNS Sunucusu** : Bu sunucu, bilgisayarınızdan (veya cihazınızdan) DNS sorgusunu alır ve eğer önceden depolanmış bilgi yoksa, etki alanı adını bir IP adresine çözümlemek için diğer DNS sunucularına sorgulamaya başlar.

* **Kök Ad Sunucusu** : Özyinelemeli DNS sunucusu etki alanını çözemediğinde, sorguyu bir kök ad sunucusuna iletir. Dünya çapında 13 kök sunucu vardır ve bu sunucular `.com`, `.org`, , vb. gibi Üst Düzey Etki Alanı (TLD) sunucularının nerede bulunacağını bilir.

* **TLD İsim Sunucusu** : Bu sunucular `.org`, .`com` , `.net`, veya gibi üst düzey alan adlarıyla ilgili bilgileri depolar. Sorguyu doğru yetkili isim sunucusuna yönlendirmeye yardımcı olurlar.

* **Yetkili DNS Sunucusu** : DNS sorgusundaki son durak olan bu sunucu, söz konusu etki alanının gerçek IP adresini tutar. IP adresiyle yanıt verir ve tarayıcınıza geri göndererek web sitesini yüklemesine olanak tanır.
**Önemli Çıkarım:**
* DNS sunucuları, DNS arama sürecinin omurgasını oluşturur ve alan adlarını IP adreslerine çevirerek bilgisayarınızı doğru web sitesine yönlendirmeye yardımcı olur.

3. DNS Nasıl Çalışır?

DNS çözümleme süreci birkaç adımdan oluşur, ancak genellikle o kadar hızlı gerçekleşir ki kullanıcılar herhangi bir gecikme fark etmez. DNS'in daha ayrıntılı olarak nasıl çalıştığı aşağıda açıklanmıştır:
#### Adım Adım DNS Arama İşlemi:
* **Kullanıcı Eylemi** : Tarayıcınıza bir alan adı (örneğin `www.example.com`) yazarsınız .

* **Tekrarlayan DNS Sorgusu** : Tarayıcınız önce etki alanı adını yakın zamanda çözüp çözmediğini görmek için kendi önbelleğini kontrol eder. Eğer değilse, İnternet Servis Sağlayıcınızın (İSS) tekrarlayan DNS sunucusuna bir DNS sorgusu gönderir.

* **Kök Sunucu Sorgusu** : Özyinelemeli sunucunun alan adı bilgileri önbelleğe alınmamışsa, TLD sunucusunun konumunu bulmak için bir kök sunucuya sorgu gönderir (örneğin, `.com` için `www.example.com`).

* **TLD Sunucu Sorgusu** : Kök sunucu, sorguyu alan adı için yetkili DNS sunucusunun nerede bulunacağını bilen TLD ad sunucusuna yönlendirir `example.com`.

* **Yetkili DNS Sorgusu** : TLD sunucusu, özyinelemeli sunucuyu IP adresini tutan yetkili DNS sunucusuna yönlendirir `www.example.com`.

* **IP Adresi Yanıtı** : Yetkili DNS sunucusu, `www.example.com` için IP adresini yinelemeli sunucuya döndürür ve ardından bu adres tarayıcınıza iletilir.

* **Web Sitesi Yükleniyor** : Tarayıcınız artık doğru IP adresine sahip ve istediğiniz web sitesini yükleyebilir.
Bütün bunlar göz açıp kapayıncaya kadar, genellikle milisaniyeler içinde gerçekleşir.
4. Günlük Kullanımda DNS'nin Yaygın Örnekleri

Artık DNS'in teknik yönünü anladığımıza göre, DNS'in günlük internet kullanımınızı nasıl etkilediğine bakalım.
#### Örnek 1: Web'de gezinme

Tarayıcınıza `www.facebook.com` gibi bir alan adı yazdığınızda, DNS bu adı bir IP adresine çözer ve Facebook sunucularına bağlanmanızı sağlar. DNS olmadan, gerçek IP adresini bilmeniz gerekir ki bu daha az kullanışlıdır.
#### Örnek 2: E-posta Gönderme

E-posta sistemleri de düzgün bir şekilde çalışmak için DNS'e güvenir. Bir e-posta gönderdiğinizde, posta sunucusu alıcının posta sunucusunu etki alanı adına göre bulmak için DNS'i kullanır. Örneğin, adresine bir e-posta göndermek, `john@example.com`posta sunucusunun IP adresini bulmak için bir DNS sorgusunu tetikler `example.com`.
#### Örnek 3: Mobil Uygulamalar

Birçok mobil uygulama, özellikle internet erişimi gerektirenler, sundukları hizmetlere bağlanmak için DNS'e güvenir. Bir sosyal medya uygulamasını açtığınızda veya bir navigasyon hizmeti kullandığınızda, DNS sizi bu uygulamalar için doğru sunuculara yönlendirmek için perde arkasında çalışır.
5. DNS Neden Önemlidir?

DNS, insan tarafından okunabilen etki alanı adları ile bilgisayarların birbirleriyle iletişim kurmak için kullandığı makine tarafından okunabilen IP adresleri arasında bir ağ geçidi görevi gördüğü için önemlidir. DNS olmadan, internet çok daha az kullanıcı dostu olurdu ve kullanıcıların basit etki alanı adları yerine IP adreslerini hatırlamaları gerekirdi.
#### DNS'in Faydaları:
* **Kullanıcı Dostu İnternet** : Kullanıcıların IP adresleri yerine alan adlarını kullanmalarına olanak vererek web sitelerine erişimi kolaylaştırır.

* **Yük Dengeleme** : DNS, trafiği birden fazla sunucu arasında dağıtabilir ve böylece web sitelerinin yoğun trafik sırasında bile erişilebilir kalmasını sağlar.

* **Güvenlik Özellikleri** : DNS, spam, kötü amaçlı yazılım veya kimlik avı ile ilişkili belirli alan adlarını engelleyerek kötü amaçlı web sitelerini filtrelemeye yardımcı olabilir.

6. DNS Sorunları ve Sorun Giderme

DNS genellikle sorunsuz bir şekilde çalışırken, kullanıcılar zaman zaman sorunlarla karşılaşabilir. İşte bazı yaygın DNS sorunları ve bunları gidermek için ipuçları:
#### Yaygın DNS Sorunları:
* **DNS Önbellek Zehirlenmesi** : Kötü niyetli kişiler önbelleğe alınmış DNS kayıtlarını bozarak kullanıcıları zararlı web sitelerine yönlendirebilir.

* **DNS Sunucusu Çöktü** : Bir DNS sunucusu çöktüğünde, alan adları IP adreslerine çözümlenmediğinden kullanıcılar web sitelerine erişemez.

* **DNS Çözümleme Gecikmesi** : Bazen DNS arama süreci normalden daha uzun sürebilir ve bu da web sitesi yükleme sürelerinin yavaşlamasına neden olabilir.

#### DNS Sorunlarını Giderme:
* **DNS Önbelleğinizi Temizleyin** : Bazen yerel DNS önbelleğinizi temizlemek tarama sorunlarını çözebilir. Bu, cihazınızın yeni bilgiler için DNS sunucusuna sorgu göndermesini zorunlu kılar.

* **DNS Sunucularını Değiştirin** : İSS'nizin DNS sunucuları yavaşsa veya yanıt vermiyorsa, Google DNS (`8.8.8.8` ve `8.8.4.4`) veya Cloudflare DNS (`1.1.1.`1) gibi genel DNS sunucularına geçebilirsiniz.

* **Yönlendiricinizi Yeniden Başlatın** : Ağınıza bağlı tüm cihazlarda yaygın DNS sorunları yaşıyorsanız, bazen basit bir yönlendirici yeniden başlatması sorunu çözebilir.

7. Sonuç

DNS, internet altyapısının temel bir parçasıdır ve insan dostu alan adları ile bilgisayarların kullandığı sayısal IP adresleri arasındaki çeviriyi sağlar. Günlük kullanıcıların teknik ayrıntıları anlamalarına gerek kalmadan web'de gezinmeyi, e-posta iletişimini ve uygulama kullanımını kolaylaştırır. En sevdiğiniz web sitelerine erişmekten e-posta göndermeye kadar DNS, günlük olarak güvendiğimiz birçok çevrimiçi hizmeti sessizce destekler.

DNS sorunlarıyla karşılaşırsanız, DNS önbelleğinizi temizlemek veya DNS sunucularını değiştirmek gibi uygulayabileceğiniz basit sorun giderme adımları vardır; böylece tarama deneyiminizin sorunsuz ve akıcı olmasını sağlayabilirsiniz.
