---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Haberler
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-09-20T00:55:07Z"
guid: https://www.siberoloji.com/?p=1654
id: 1654
image: /assets/images/2024/09/dnsserver-scaled.webp
tags:
- dns
- dns sunucu
title: DNS ve DNS Sunucusu Nedir? Kapsamlı Bir Kılavuz
url: /tr/dns-ve-dns-sunucusu-nedir-kapsamli-bir-kilavuz/
---

  İnternet, ister iş, ister iletişim, ister eğlence veya eğitim olsun, günlük hayatımızın önemli bir parçası haline geldi. Ancak çoğumuz web sitelerinde gezinmemizi, e-posta göndermemizi veya video akışı yapmamızı sağlayan teknolojileri tam olarak anlamıyor olabiliriz. Bu temel teknolojilerden biri de interneti daha erişilebilir ve kullanıcı dostu hale getirmede hayati bir rol oynayan DNS veya&nbsp;***Alan Adı Sistemi'dir*** &nbsp;. Bu blog yazısında DNS'in temellerine, DNS sunucularının ne olduğuna, nasıl çalıştıklarına ve günlük yaşamdaki önemini gösteren örneklere dalacağız. 
 


 ### 1. DNS Nedir?
<!-- /wp:heading -->

  ***DNS, esasen internetin telefon rehberi olan Alan Adı Sistemi*** &nbsp;anlamına gelir&nbsp;. Cep telefonunuzdaki kişilerin telefon numaralarını sakladığınız gibi, DNS de alan adlarını (örneğin&nbsp;<code>www.google.com</code>) ilgili IP adresleriyle (örneğin&nbsp;<code>172.217.3.110</code>) depolamaya ve eşleştirmeye yardımcı olur. Bir IP adresi, internetteki bir bilgisayar veya sunucu için benzersiz bir tanımlayıcıdır. Ancak, sayı dizilerini hatırlamak zor olabilir, bu nedenle DNS web sitelerine erişimi kolaylaştırmak için geliştirilmiştir. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Örnek: 
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- tarayıcınıza <code>192.168.1.1</code> gibi bir IP adresi yazmak yerine , <code>www.example.com</code> yazabilirsiniz ve DNS bu alan adını karşılık gelen IP adresine çevirir. Bu işlem milisaniyeler içinde gerçekleşir, bu nedenle kullanıcılar bunun gerçekleştiğini bile fark etmezler. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Önemli Noktalar:***  
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- DNS, insanların anlayabileceği alan adlarını IP adreslerine çevirir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Bu sistem kullanıcıların sayısal IP adreslerini ezberlemeye gerek kalmadan web sitelerine kolayca erişebilmelerini sağlıyor. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 2. DNS Sunucusu Nedir?
<!-- /wp:heading -->

  DNS&nbsp;***sunucusu,*** &nbsp;etki alanı adlarının ve bunlara karşılık gelen IP adreslerinin veritabanını tutan bir makinedir (sunucu). Web tarayıcınıza bir etki alanı adı yazdığınızda, bilgisayarınız o etki alanı için doğru IP adresini bulmak üzere bir DNS sunucusuyla iletişim kurar. Bu arama sürecinin çeşitli aşamalarından sorumlu olan farklı DNS sunucusu türleri vardır. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">DNS Sunucularının Türleri: 
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Özyinelemeli DNS Sunucusu*** &nbsp;: Bu sunucu, bilgisayarınızdan (veya cihazınızdan) DNS sorgusunu alır ve eğer önceden depolanmış bilgi yoksa, etki alanı adını bir IP adresine çözümlemek için diğer DNS sunucularına sorgulamaya başlar. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Kök Ad Sunucusu*** &nbsp;: Özyinelemeli DNS sunucusu etki alanını çözemediğinde, sorguyu bir kök ad sunucusuna iletir. Dünya çapında 13 kök sunucu vardır ve bu sunucular&nbsp;<code>.com</code>,&nbsp;<code>.org</code>, , vb. gibi Üst Düzey Etki Alanı (TLD) sunucularının nerede bulunacağını bilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***TLD İsim Sunucusu***  : Bu sunucular <code>.org</code>, .<code>com</code> , <code>.net</code>, veya gibi üst düzey alan adlarıyla ilgili bilgileri depolar. Sorguyu doğru yetkili isim sunucusuna yönlendirmeye yardımcı olurlar. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Yetkili DNS Sunucusu*** &nbsp;: DNS sorgusundaki son durak olan bu sunucu, söz konusu etki alanının gerçek IP adresini tutar. IP adresiyle yanıt verir ve tarayıcınıza geri göndererek web sitesini yüklemesine olanak tanır. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Önemli Çıkarım:***  
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- DNS sunucuları, DNS arama sürecinin omurgasını oluşturur ve alan adlarını IP adreslerine çevirerek bilgisayarınızı doğru web sitesine yönlendirmeye yardımcı olur. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 3. DNS Nasıl Çalışır?
<!-- /wp:heading -->

  DNS çözümleme süreci birkaç adımdan oluşur, ancak genellikle o kadar hızlı gerçekleşir ki kullanıcılar herhangi bir gecikme fark etmez. DNS'in daha ayrıntılı olarak nasıl çalıştığı aşağıda açıklanmıştır: 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Adım Adım DNS Arama İşlemi: 
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Kullanıcı Eylemi***  : Tarayıcınıza bir alan adı (örneğin <code>www.example.com</code>) yazarsınız . 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Tekrarlayan DNS Sorgusu*** &nbsp;: Tarayıcınız önce etki alanı adını yakın zamanda çözüp çözmediğini görmek için kendi önbelleğini kontrol eder. Eğer değilse, İnternet Servis Sağlayıcınızın (İSS) tekrarlayan DNS sunucusuna bir DNS sorgusu gönderir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Kök Sunucu Sorgusu***  : Özyinelemeli sunucunun alan adı bilgileri önbelleğe alınmamışsa, TLD sunucusunun konumunu bulmak için bir kök sunucuya sorgu gönderir (örneğin, <code>.com</code> için <code>www.example.com</code>). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***TLD Sunucu Sorgusu*** &nbsp;: Kök sunucu, sorguyu alan adı için yetkili DNS sunucusunun nerede bulunacağını bilen TLD ad sunucusuna yönlendirir&nbsp;<code>example.com</code>. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Yetkili DNS Sorgusu*** &nbsp;: TLD sunucusu, özyinelemeli sunucuyu IP adresini tutan yetkili DNS sunucusuna yönlendirir&nbsp;<code>www.example.com</code>. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***IP Adresi Yanıtı***  : Yetkili DNS sunucusu, <code>www.example.com</code> için IP adresini yinelemeli sunucuya döndürür ve ardından bu adres tarayıcınıza iletilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Web Sitesi Yükleniyor*** &nbsp;: Tarayıcınız artık doğru IP adresine sahip ve istediğiniz web sitesini yükleyebilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Bütün bunlar göz açıp kapayıncaya kadar, genellikle milisaniyeler içinde gerçekleşir. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 4. Günlük Kullanımda DNS'nin Yaygın Örnekleri
<!-- /wp:heading -->

  Artık DNS'in teknik yönünü anladığımıza göre, DNS'in günlük internet kullanımınızı nasıl etkilediğine bakalım. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Örnek 1: Web'de gezinme 
<!-- /wp:heading -->

  Tarayıcınıza <code>www.facebook.com</code> gibi bir alan adı yazdığınızda, DNS bu adı bir IP adresine çözer ve Facebook sunucularına bağlanmanızı sağlar. DNS olmadan, gerçek IP adresini bilmeniz gerekir ki bu daha az kullanışlıdır. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Örnek 2: E-posta Gönderme 
<!-- /wp:heading -->

  E-posta sistemleri de düzgün bir şekilde çalışmak için DNS'e güvenir. Bir e-posta gönderdiğinizde, posta sunucusu alıcının posta sunucusunu etki alanı adına göre bulmak için DNS'i kullanır. Örneğin, adresine bir e-posta göndermek,&nbsp;<code>john@example.com</code>posta sunucusunun IP adresini bulmak için bir DNS sorgusunu tetikler&nbsp;<code>example.com</code>. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Örnek 3: Mobil Uygulamalar 
<!-- /wp:heading -->

  Birçok mobil uygulama, özellikle internet erişimi gerektirenler, sundukları hizmetlere bağlanmak için DNS'e güvenir. Bir sosyal medya uygulamasını açtığınızda veya bir navigasyon hizmeti kullandığınızda, DNS sizi bu uygulamalar için doğru sunuculara yönlendirmek için perde arkasında çalışır. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 5. DNS Neden Önemlidir?
<!-- /wp:heading -->

  DNS, insan tarafından okunabilen etki alanı adları ile bilgisayarların birbirleriyle iletişim kurmak için kullandığı makine tarafından okunabilen IP adresleri arasında bir ağ geçidi görevi gördüğü için önemlidir. DNS olmadan, internet çok daha az kullanıcı dostu olurdu ve kullanıcıların basit etki alanı adları yerine IP adreslerini hatırlamaları gerekirdi. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">DNS'in Faydaları: 
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Kullanıcı Dostu İnternet*** &nbsp;: Kullanıcıların IP adresleri yerine alan adlarını kullanmalarına olanak vererek web sitelerine erişimi kolaylaştırır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Yük Dengeleme*** &nbsp;: DNS, trafiği birden fazla sunucu arasında dağıtabilir ve böylece web sitelerinin yoğun trafik sırasında bile erişilebilir kalmasını sağlar. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Güvenlik Özellikleri*** &nbsp;: DNS, spam, kötü amaçlı yazılım veya kimlik avı ile ilişkili belirli alan adlarını engelleyerek kötü amaçlı web sitelerini filtrelemeye yardımcı olabilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 6. DNS Sorunları ve Sorun Giderme
<!-- /wp:heading -->

  DNS genellikle sorunsuz bir şekilde çalışırken, kullanıcılar zaman zaman sorunlarla karşılaşabilir. İşte bazı yaygın DNS sorunları ve bunları gidermek için ipuçları: 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Yaygın DNS Sorunları: 
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***DNS Önbellek Zehirlenmesi*** &nbsp;: Kötü niyetli kişiler önbelleğe alınmış DNS kayıtlarını bozarak kullanıcıları zararlı web sitelerine yönlendirebilir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***DNS Sunucusu Çöktü*** &nbsp;: Bir DNS sunucusu çöktüğünde, alan adları IP adreslerine çözümlenmediğinden kullanıcılar web sitelerine erişemez. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***DNS Çözümleme Gecikmesi*** &nbsp;: Bazen DNS arama süreci normalden daha uzun sürebilir ve bu da web sitesi yükleme sürelerinin yavaşlamasına neden olabilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">DNS Sorunlarını Giderme: 
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***DNS Önbelleğinizi Temizleyin*** &nbsp;: Bazen yerel DNS önbelleğinizi temizlemek tarama sorunlarını çözebilir. Bu, cihazınızın yeni bilgiler için DNS sunucusuna sorgu göndermesini zorunlu kılar. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***DNS Sunucularını Değiştirin***  : İSS'nizin DNS sunucuları yavaşsa veya yanıt vermiyorsa, Google DNS (<code>8.8.8.8</code> ve <code>8.8.4.4</code>) veya Cloudflare DNS (<code>1.1.1.</code>1) gibi genel DNS sunucularına geçebilirsiniz. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Yönlendiricinizi Yeniden Başlatın*** &nbsp;: Ağınıza bağlı tüm cihazlarda yaygın DNS sorunları yaşıyorsanız, bazen basit bir yönlendirici yeniden başlatması sorunu çözebilir. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->


 ### 7. Sonuç
<!-- /wp:heading -->

  DNS, internet altyapısının temel bir parçasıdır ve insan dostu alan adları ile bilgisayarların kullandığı sayısal IP adresleri arasındaki çeviriyi sağlar. Günlük kullanıcıların teknik ayrıntıları anlamalarına gerek kalmadan web'de gezinmeyi, e-posta iletişimini ve uygulama kullanımını kolaylaştırır. En sevdiğiniz web sitelerine erişmekten e-posta göndermeye kadar DNS, günlük olarak güvendiğimiz birçok çevrimiçi hizmeti sessizce destekler. 
 

  DNS sorunlarıyla karşılaşırsanız, DNS önbelleğinizi temizlemek veya DNS sunucularını değiştirmek gibi uygulayabileceğiniz basit sorun giderme adımları vardır; böylece tarama deneyiminizin sorunsuz ve akıcı olmasını sağlayabilirsiniz. 
 