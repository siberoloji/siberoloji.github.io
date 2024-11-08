---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Sızma Testi Safhaları
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-04-16T16:28:00Z"
excerpt: 'Bu yazımızdan itibaren, Sızma Testinin 2.Safhası olan Bilgi Toplama işlemleri
  ve detaylarına başlangıç yapıyoruz. Aşağıda listesi bulunan konuları sırasıyla ayrı
  ayrı yazılarla açıklama yolunu takip edeceğiz. '
guid: https://www.siberoloji.com/?p=1070
id: 1070
image: /assets/images/2024/06/cyber7.jpg
tags:
- siber güvenlik
title: Bilgi Toplama İşlemleri -1- Temel Yaklaşım
url: /tr/bilgi-toplama-islemleri-1-temel-yaklasim/
---

<!-- wp:paragraph -->
<p>Bu yazımızdan itibaren, Sızma Testinin 2.Safhası olan Bilgi Toplama işlemleri ve detaylarına başlangıç yapıyoruz. Aşağıda listesi bulunan konuları sırasıyla ayrı ayrı yazılarla açıklama yolunu takip edeceğiz. Genel safhaları bu&nbsp;<a href="https://www.siberoloji.com/sizma-testi-safhalari-nelerdir/" data-type="post" data-id="1049" target="_blank" rel="noreferrer noopener">yazımızdan</a>&nbsp;tekrar gözden geçirebilirsiniz. Doğru ve etkin olarak gerçekleştirilecek bilgi toplama işlemleri, ilerleyen safhalara girdi sağlayacaktır. Bu safhada anlatılacaklar, bilgi güvenliğini gerçekleştirmek isteyen tüm kurum ve firmalara da bilgiyi korumak adına almaları gereken tedbirleri gösterecektir. Bilgi toplama safhasının neleri kapsadığının ortaya konulması, her düzeyde yöneticiye hangi tedbirleri alması gerektiği konusunda ışık tutacaktır çünkü&nbsp; testi yapan güvenlik ekibinin takip ettiği bilgi toplama işlemleri gerçek hayatta kötü niyetli yapıların da takip ettikleri işlemlere çok benzer.&nbsp;<a href="https://www.siberoloji.com/siber-uzay-tanimi-ve-aktorleri/" data-type="post" data-id="1058" target="_blank" rel="noreferrer noopener">Siber Uzay tanımı ve Aktörleri</a>&nbsp;konulu yazıyı incelemenizi tavsiye ediyoruz.</p>
  

<!-- wp:paragraph -->
<p>Konuyu aşağıdaki başlıklar altında araştıracağız. Yazının devamında Bilgi Toplama konusunda temel yaklaşımı açıkladık.</p>
  

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Temel Yaklaşım</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Hedef Seçimi</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Açık Kaynak İstihbaratı</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Örtülü Bilgi Toplama</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Koruma Mekanizmalarını Tespit</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":1} -->
# Temel Yaklaşım 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bilgi toplama işlemlerini, kullanılan araçlar ve elde edilen çıktılara göre belli gruplara ayırmak gerekmektedir. Bu ayırım yapılmadığı takdirde elde edilen sonuçlar, tespit edilen kapsam ve amacın dışına çok kolay taşabilir. Araçların ayırımı, kapsam dahilinde kalmayı sağlar. Bu sebeple, gerçekleştirilecek işlemleri 3 Katmana ayıracağız. Bu konuda hazırlanacak diğer yazılarda açıklanan konuların yanında, hangi katmanda işlem yapılabileceğini belirteceğiz. Örneğin, bir konunun yanında 1K-2K ifadesi gördüğünüzde, bu 1.Katman ve 2.Katman bilgi toplama işlemlerinin kastedildiği anlamına gelmektedir. Böylece, işlemler daha net olarak kavranabilir.</p>
  

 
 ## 1.Katman</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bu katman, bilgi toplamanın en hızlı ve otomatik programlar aracılığı ile gerçekleştirilen kısmıdır. Bu otomatik bilgi toplama araçları, arama motorları ve internet arşivlerini tarayarak hedef hakkında sonuçlar üretirler.<br>Ayrıca, hedefin belli standart bilgi güvenliği politikaları olup olmadığını ve bu standartlara ne kadar uyulduğunu araştırmayı da kapsar. Bilgi Toplama safhasının gerçekleştirildiğini söyleyebilmek için bu katman mutlaka uygulanmalıdır.<br>Bir firma, sektör standardına uygunluk testi yaptırmak istiyorsa (Örn.: ISO 27001) bu katman yeterli olacaktır.</p>
  

 
 ## 2. Katman</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>1.Katmanda gerçekleştirilen işlemlerin yanında özellikle elle yapılan detaylı bilgi toplama işlemleridir. Belli bir takım sorulara cevap arayan bilgi toplama yöntemleri ve Açık Kaynak İstihbaratını da kapsar. Daha çok fiziksel yerleşim, adres bilgisi ve iş ilişkilerinin detayları incelenir.<br>Bir firma, sektör standardına uygunlukla birlikte uzun dönem bilgi güvenliği hedefliyorsa ve 3. taraf tedarikçilerle iş anlaşması yapmayı planlıyorsa bu katmanı da kullanmayı düşünmelidir.</p>
  

 
 ## 3. Katman</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Çok ileri düzey sızma testlerinde gerekli olabilecek ve detaylı bilgi toplama işlemleridir. Uzun zamana yayılmış ve mümkün olan her türlü tekniğin kullanıldığı katmandır. Her sızma testinde yapılma zorunluluğu yoktur. Bu katmana ait bilgi toplama daha çok devletler düzeyini ilgilendirir.<br>Bilgi toplamanın yanında, sürekli ve kadrolu siber savunma teşkilatı kurmayı planlayan yapılar bu katmanı kullanmalıdır.</p>
  

 
 ## Bilgi Toplama Nedir?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sızma Testinin ilerleyen safhalarında zafiyet analizi ve sisteme giriş işlemleri yapılacaktır. Bu safhaların sonuçsuz kalmaması için bir takım temel bilgilere ihtiyaç vardır. Bu safhada ne kadar bilgi toplanırsa, ortaya konabilecek saldırı vektörleri sayısı ve başarı ihtimali artacaktır.<br>Saldırı vektörü, saldırının yolunu tarif eder. Toplanan bilgiler ışığında 10 ayrı yöntem kullanılabileceği ve bunların hangi aşamaları takip ederek gerçekleştirilebileceğinin ortaya çıkarıldığını düşünelim. Bu 10 ayrı yöntemin her birisine saldırı vektörü denir fakat bunlar da kendi arasında başarı ihtimali hesaplanarak derecelendirilir. Hepsini birden uygulama ihtimali yoktur.<br>Sızma Testi sonuç raporunda firmaya tüm vektörler ve potansiyel tehlikeler mutlaka rapor edilmelidir.</p>
  

 
 ## Bilgi Toplama Niçin Yapılır?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sızma Testi Bilgi Toplama işlemi tamamen Açık Kaynak İstihbaratı ile ilgilidir. Bu sayede, firma kendisine ait bilgilerin ne kadarının açık kaynakların elinde olduğunu tespit edecek ve gerekli önlemleri alabilecektir.<br>Bu süreçte, sisteme giriş ihtimali olan noktalar ortaya çıkarılmaya çalışılır. Bunlar, elektronik olabileceği gibi fiziki ve insan kaynaklı da olabilir. Fiziksel zafiyetler, fiziki güvenlik alanında alınması gereken tedbirleri, insan kaynaklı zafiyetler sosyal mühendislik ve çalışan eğitimlerine ışık tutacaktır.</p>
  

 
 ## Bilgi Toplama Ne Değildir?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bilgi toplama işlemleri esnasında kullanılan katmanlar aracılığı ile istenilen bir bilgiye ulaşılamaz ise mutlaka bulmak için standart dışı yöntemlere başvurulmaz. Bu yaklaşım Sızma Testinin kapsamı dışındadır. Örneğin, çöp karıştırma tarzı işlemler kapsam dışıdır.</p>
  