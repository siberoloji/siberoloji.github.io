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

  İnternet, ister iş, ister iletişim, ister eğlence veya eğitim olsun, günlük hayatımızın önemli bir parçası haline geldi. Ancak çoğumuz web sitelerinde gezinmemizi, e-posta göndermemizi veya video akışı yapmamızı sağlayan teknolojileri tam olarak anlamıyor olabiliriz. Bu temel teknolojilerden biri de interneti daha erişilebilir ve kullanıcı dostu hale getirmede hayati bir rol oynayan DNS veya&nbsp;<strong>Alan Adı Sistemi'dir</strong>&nbsp;. Bu blog yazısında DNS'in temellerine, DNS sunucularının ne olduğuna, nasıl çalıştıklarına ve günlük yaşamdaki önemini gösteren örneklere dalacağız. 
 

<!-- wp:heading {"level":3} -->
 ### 1. DNS Nedir?</h3>
<!-- /wp:heading -->

  <strong>DNS, esasen internetin telefon rehberi olan Alan Adı Sistemi</strong>&nbsp;anlamına gelir&nbsp;. Cep telefonunuzdaki kişilerin telefon numaralarını sakladığınız gibi, DNS de alan adlarını (örneğin&nbsp;<code>www.google.com</code>) ilgili IP adresleriyle (örneğin&nbsp;<code>172.217.3.110</code>) depolamaya ve eşleştirmeye yardımcı olur. Bir IP adresi, internetteki bir bilgisayar veya sunucu için benzersiz bir tanımlayıcıdır. Ancak, sayı dizilerini hatırlamak zor olabilir, bu nedenle DNS web sitelerine erişimi kolaylaştırmak için geliştirilmiştir. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Örnek:</h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>tarayıcınıza <code>192.168.1.1</code> gibi bir IP adresi yazmak yerine , <code>www.example.com</code> yazabilirsiniz ve DNS bu alan adını karşılık gelen IP adresine çevirir. Bu işlem milisaniyeler içinde gerçekleşir, bu nedenle kullanıcılar bunun gerçekleştiğini bile fark etmezler.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Önemli Noktalar:</strong> 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>DNS, insanların anlayabileceği alan adlarını IP adreslerine çevirir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Bu sistem kullanıcıların sayısal IP adreslerini ezberlemeye gerek kalmadan web sitelerine kolayca erişebilmelerini sağlıyor.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 2. DNS Sunucusu Nedir?</h3>
<!-- /wp:heading -->

  DNS&nbsp;<strong>sunucusu,</strong>&nbsp;etki alanı adlarının ve bunlara karşılık gelen IP adreslerinin veritabanını tutan bir makinedir (sunucu). Web tarayıcınıza bir etki alanı adı yazdığınızda, bilgisayarınız o etki alanı için doğru IP adresini bulmak üzere bir DNS sunucusuyla iletişim kurar. Bu arama sürecinin çeşitli aşamalarından sorumlu olan farklı DNS sunucusu türleri vardır. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">DNS Sunucularının Türleri:</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Özyinelemeli DNS Sunucusu</strong>&nbsp;: Bu sunucu, bilgisayarınızdan (veya cihazınızdan) DNS sorgusunu alır ve eğer önceden depolanmış bilgi yoksa, etki alanı adını bir IP adresine çözümlemek için diğer DNS sunucularına sorgulamaya başlar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kök Ad Sunucusu</strong>&nbsp;: Özyinelemeli DNS sunucusu etki alanını çözemediğinde, sorguyu bir kök ad sunucusuna iletir. Dünya çapında 13 kök sunucu vardır ve bu sunucular&nbsp;<code>.com</code>,&nbsp;<code>.org</code>, , vb. gibi Üst Düzey Etki Alanı (TLD) sunucularının nerede bulunacağını bilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>TLD İsim Sunucusu</strong> : Bu sunucular <code>.org</code>, .<code>com</code> , <code>.net</code>, veya gibi üst düzey alan adlarıyla ilgili bilgileri depolar. Sorguyu doğru yetkili isim sunucusuna yönlendirmeye yardımcı olurlar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Yetkili DNS Sunucusu</strong>&nbsp;: DNS sorgusundaki son durak olan bu sunucu, söz konusu etki alanının gerçek IP adresini tutar. IP adresiyle yanıt verir ve tarayıcınıza geri göndererek web sitesini yüklemesine olanak tanır.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  <strong>Önemli Çıkarım:</strong> 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>DNS sunucuları, DNS arama sürecinin omurgasını oluşturur ve alan adlarını IP adreslerine çevirerek bilgisayarınızı doğru web sitesine yönlendirmeye yardımcı olur.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 3. DNS Nasıl Çalışır?</h3>
<!-- /wp:heading -->

  DNS çözümleme süreci birkaç adımdan oluşur, ancak genellikle o kadar hızlı gerçekleşir ki kullanıcılar herhangi bir gecikme fark etmez. DNS'in daha ayrıntılı olarak nasıl çalıştığı aşağıda açıklanmıştır: 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Adım Adım DNS Arama İşlemi:</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Kullanıcı Eylemi</strong> : Tarayıcınıza bir alan adı (örneğin <code>www.example.com</code>) yazarsınız .</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Tekrarlayan DNS Sorgusu</strong>&nbsp;: Tarayıcınız önce etki alanı adını yakın zamanda çözüp çözmediğini görmek için kendi önbelleğini kontrol eder. Eğer değilse, İnternet Servis Sağlayıcınızın (İSS) tekrarlayan DNS sunucusuna bir DNS sorgusu gönderir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Kök Sunucu Sorgusu</strong> : Özyinelemeli sunucunun alan adı bilgileri önbelleğe alınmamışsa, TLD sunucusunun konumunu bulmak için bir kök sunucuya sorgu gönderir (örneğin, <code>.com</code> için <code>www.example.com</code>).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>TLD Sunucu Sorgusu</strong>&nbsp;: Kök sunucu, sorguyu alan adı için yetkili DNS sunucusunun nerede bulunacağını bilen TLD ad sunucusuna yönlendirir&nbsp;<code>example.com</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Yetkili DNS Sorgusu</strong>&nbsp;: TLD sunucusu, özyinelemeli sunucuyu IP adresini tutan yetkili DNS sunucusuna yönlendirir&nbsp;<code>www.example.com</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>IP Adresi Yanıtı</strong> : Yetkili DNS sunucusu, <code>www.example.com</code> için IP adresini yinelemeli sunucuya döndürür ve ardından bu adres tarayıcınıza iletilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Web Sitesi Yükleniyor</strong>&nbsp;: Tarayıcınız artık doğru IP adresine sahip ve istediğiniz web sitesini yükleyebilir.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Bütün bunlar göz açıp kapayıncaya kadar, genellikle milisaniyeler içinde gerçekleşir. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 4. Günlük Kullanımda DNS'nin Yaygın Örnekleri</h3>
<!-- /wp:heading -->

  Artık DNS'in teknik yönünü anladığımıza göre, DNS'in günlük internet kullanımınızı nasıl etkilediğine bakalım. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Örnek 1: Web'de gezinme</h4>
<!-- /wp:heading -->

  Tarayıcınıza <code>www.facebook.com</code> gibi bir alan adı yazdığınızda, DNS bu adı bir IP adresine çözer ve Facebook sunucularına bağlanmanızı sağlar. DNS olmadan, gerçek IP adresini bilmeniz gerekir ki bu daha az kullanışlıdır. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Örnek 2: E-posta Gönderme</h4>
<!-- /wp:heading -->

  E-posta sistemleri de düzgün bir şekilde çalışmak için DNS'e güvenir. Bir e-posta gönderdiğinizde, posta sunucusu alıcının posta sunucusunu etki alanı adına göre bulmak için DNS'i kullanır. Örneğin, adresine bir e-posta göndermek,&nbsp;<code>john@example.com</code>posta sunucusunun IP adresini bulmak için bir DNS sorgusunu tetikler&nbsp;<code>example.com</code>. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Örnek 3: Mobil Uygulamalar</h4>
<!-- /wp:heading -->

  Birçok mobil uygulama, özellikle internet erişimi gerektirenler, sundukları hizmetlere bağlanmak için DNS'e güvenir. Bir sosyal medya uygulamasını açtığınızda veya bir navigasyon hizmeti kullandığınızda, DNS sizi bu uygulamalar için doğru sunuculara yönlendirmek için perde arkasında çalışır. 
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 5. DNS Neden Önemlidir?</h3>
<!-- /wp:heading -->

  DNS, insan tarafından okunabilen etki alanı adları ile bilgisayarların birbirleriyle iletişim kurmak için kullandığı makine tarafından okunabilen IP adresleri arasında bir ağ geçidi görevi gördüğü için önemlidir. DNS olmadan, internet çok daha az kullanıcı dostu olurdu ve kullanıcıların basit etki alanı adları yerine IP adreslerini hatırlamaları gerekirdi. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">DNS'in Faydaları:</h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Kullanıcı Dostu İnternet</strong>&nbsp;: Kullanıcıların IP adresleri yerine alan adlarını kullanmalarına olanak vererek web sitelerine erişimi kolaylaştırır.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Yük Dengeleme</strong>&nbsp;: DNS, trafiği birden fazla sunucu arasında dağıtabilir ve böylece web sitelerinin yoğun trafik sırasında bile erişilebilir kalmasını sağlar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Güvenlik Özellikleri</strong>&nbsp;: DNS, spam, kötü amaçlı yazılım veya kimlik avı ile ilişkili belirli alan adlarını engelleyerek kötü amaçlı web sitelerini filtrelemeye yardımcı olabilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 6. DNS Sorunları ve Sorun Giderme</h3>
<!-- /wp:heading -->

  DNS genellikle sorunsuz bir şekilde çalışırken, kullanıcılar zaman zaman sorunlarla karşılaşabilir. İşte bazı yaygın DNS sorunları ve bunları gidermek için ipuçları: 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Yaygın DNS Sorunları:</h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>DNS Önbellek Zehirlenmesi</strong>&nbsp;: Kötü niyetli kişiler önbelleğe alınmış DNS kayıtlarını bozarak kullanıcıları zararlı web sitelerine yönlendirebilir.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>DNS Sunucusu Çöktü</strong>&nbsp;: Bir DNS sunucusu çöktüğünde, alan adları IP adreslerine çözümlenmediğinden kullanıcılar web sitelerine erişemez.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>DNS Çözümleme Gecikmesi</strong>&nbsp;: Bazen DNS arama süreci normalden daha uzun sürebilir ve bu da web sitesi yükleme sürelerinin yavaşlamasına neden olabilir.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">DNS Sorunlarını Giderme:</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>DNS Önbelleğinizi Temizleyin</strong>&nbsp;: Bazen yerel DNS önbelleğinizi temizlemek tarama sorunlarını çözebilir. Bu, cihazınızın yeni bilgiler için DNS sunucusuna sorgu göndermesini zorunlu kılar.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>DNS Sunucularını Değiştirin</strong> : İSS'nizin DNS sunucuları yavaşsa veya yanıt vermiyorsa, Google DNS (<code>8.8.8.8</code> ve <code>8.8.4.4</code>) veya Cloudflare DNS (<code>1.1.1.</code>1) gibi genel DNS sunucularına geçebilirsiniz.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Yönlendiricinizi Yeniden Başlatın</strong>&nbsp;: Ağınıza bağlı tüm cihazlarda yaygın DNS sorunları yaşıyorsanız, bazen basit bir yönlendirici yeniden başlatması sorunu çözebilir.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### 7. Sonuç</h3>
<!-- /wp:heading -->

  DNS, internet altyapısının temel bir parçasıdır ve insan dostu alan adları ile bilgisayarların kullandığı sayısal IP adresleri arasındaki çeviriyi sağlar. Günlük kullanıcıların teknik ayrıntıları anlamalarına gerek kalmadan web'de gezinmeyi, e-posta iletişimini ve uygulama kullanımını kolaylaştırır. En sevdiğiniz web sitelerine erişmekten e-posta göndermeye kadar DNS, günlük olarak güvendiğimiz birçok çevrimiçi hizmeti sessizce destekler. 
 

  DNS sorunlarıyla karşılaşırsanız, DNS önbelleğinizi temizlemek veya DNS sunucularını değiştirmek gibi uygulayabileceğiniz basit sorun giderme adımları vardır; böylece tarama deneyiminizin sorunsuz ve akıcı olmasını sağlayabilirsiniz. 
 