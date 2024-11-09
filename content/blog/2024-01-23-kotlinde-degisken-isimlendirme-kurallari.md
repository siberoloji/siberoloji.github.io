---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "1"
categories:
- Temel Kotlin
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-23T17:18:03Z"
excerpt: Seçtiğiniz değişken ismi, tam olarak değişkenin ne işe yaradığını anlatmalıdır.  Kodunuzun
  karmaşık ve anlaşılmaz hale gelmemesi için uymanız tavsiye edilen kuralları sırayla
  görelim.
guid: https://www.siberoloji.com/?p=737
id: 737
image: /assets/images/2024/01/kotlin-1.png
tags:
- kotlin
- yazılım
title: Kotlin&#8217;de değişken isimlendirme kuralları
url: /tr/kotlinde-degisken-isimlendirme-kurallari/
---

 <p>Bildiğiniz gibi, her değişkenin benzersiz bir ismi bulunmalıdır. Başlangıçta problemsiz görünse de yazılımınız genişledikçe kodlarınızın anlaşılması zor hale gelebilir. Yazılımcıların zamanının çoğu kod yazmak ile değil başkalarının yazdığı kodu okumakla geçer.
 

 <p>Sizin yazdığınız kodun kolay okunabilir ve takip edilebilir olmasını istiyorsanız, isimlendirme kurallarına uymanız oldukça önemlidir. Seçtiğiniz değişken ismi, tam olarak değişkenin ne işe yaradığını anlatmalıdır.  Kodunuzun karmaşık ve anlaşılmaz hale gelmemesi için uymanız tavsiye edilen kuralları sırayla görelim.
 

 
 ## Uyulması Zorunlu İsimlendirme Kuralları
<!-- /wp:heading -->

<!-- wp:list -->
 <!-- wp:list-item -->
- İsimler büyük küçük harf duyarlıdır. (<em>number</em> ile <em>Number</em> aynı ifade değildir.) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- İsimler sadece harf, rakam ve alt çizgilerden oluşmalıdır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- İsimlerin en başında rakam olamaz (1month ***yanlış***  kullanımdır.) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Kotlin yazılımının kendisi için ayırdığı anahtar kelimeler (val, var, fun vb.) değişken adı olarak kullanılamaz. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Tavsiye Edilen İsimlendirme Kuralları
<!-- /wp:heading -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Bir değişken adı tek kelimeden oluşuyorsa tamamı küçük harfle yazılmalıdır. (<code>name</code>, <code>message</code>) 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Bir değişken adı birden fazla kelimeden oluşuyorsa, küçük harfli Deve tarzı yazım kullanılmalıdır. (numberOfStudents, numberOfPages). Görüldüğü gibi, ilk kelimenin tamamı küçük harf ile yazıldıktan sonra her bir kelimenin sadece ilk harfi büyük yazılmalıdır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Yasak olmamasına rağmen değişken adına _ alt çizgi ile başlamamalısınız. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Değişkenle anlamlı isimler vermelisiniz. Değişken adı olarak <code>renk</code> ismi <code>r</code> ifadesinden daha açıklayıcı ve anlamlı olacaktır. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Sihirli Sayılar
<!-- /wp:heading -->

 <p>Aşağıdaki örnek komutta, ekrana 7 sayısı yazılmaktadır. Bu programı okuyan başka bir programcı için 7 sayısının, neyin sayısı olduğunun bilinmesi çok zordur. Bu tür durumlarda sayılar bir sabit dahi olsalar const kullanılarak isimlendirilmeli ve o şekilde kullanılmalıdır. İsimlendirirken, BÜYÜK_HARFLİ_YILAN türü kullanılmalıdır. Bu kullanım, kodun anlaşılması için büyük kolaylık sağlayacaktır.
 


 ### Tavsiye Edilmeyen Kullanım
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    println(7)
}
/* Output
7

Process finished with exit code 0
 */</code></pre>
<!-- /wp:code -->


 ### Tavsiye Edilen Kullanım
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">const val DAYS_OF_THE_WEEK = 7

fun main() {
    println(DAYS_OF_THE_WEEK)
}
/* Output
7

Process finished with exit code 0
 */</code></pre>
<!-- /wp:code -->

 <p>Yukarıda açıkladığımız kurallara mümkün olduğunca uymanız durumunda hem size, hem de sonradan projeye dahil olacak arkadaşlarınıza çok yardımcı olacak ve zaman kazandıracaktır.
 