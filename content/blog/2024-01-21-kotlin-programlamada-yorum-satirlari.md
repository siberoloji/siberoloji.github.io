---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "12"
categories:
- Temel Kotlin
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-21T21:01:57Z"
excerpt: projeden ayrılan yazılımcının yerine yeni gelen başka bir yazılımcı da kodları
  okuyarak programı öğrenmesi gerekir. İşte bu durumda, kodların yanına yazılan açıklama,
  not ve buna benzer ifadelere yorum satırı adı verilir.
guid: https://www.siberoloji.com/?p=717
id: 717
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- kotlin
- yazılım
title: Kotlin Programlamada Yorum Satırları
url: /tr/kotlin-programlamada-yorum-satirlari/
---

<!-- wp:paragraph -->
<p>Bir bilgisayar programı, çeşitli kod parçalarının bir araya gelmesi ve bunların uyumlu bir şekilde çalışmasıyla meydana gelir. Her bir kod bloğu, kendisinden beklenen işlemi yapar. Bu kodları yazan program geliştiricileri ilerleyen zamanlarda, geçmişe dönük olarak hangi kodun ne işlem yaptığını unutmaya, karıştırmaya başlarlar. Ayrıca projeden ayrılan yazılımcının yerine yeni gelen başka bir yazılımcı da kodları okuyarak programı öğrenmesi gerekir. İşte bu durumda, kodların yanına yazılan açıklama, not ve buna benzer ifadelere yorum satırı adı verilir.</p>
  

<!-- wp:paragraph -->
<p>Yorum satırları program derleyiciler tarafından dikkate alınmaz, işleme dahil edilmezler. Kotlin'de 3 farklı yorum satırı kullanımı vardır.</p>
  

 
 ## Satır Sonu Yorumları</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Tek satırı aşmayan uzunlukta yorumlardır. // işaretinin ardından yazılırlar. // işaretinden sonra gelen ve satır sonuna kadar olan her şey yorum olarak kabul edilir. Aşağıdaki örnekte // ile kullanılan yorum satırları gösterilmiştir.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val name: String = "John"
    //identifier =name , Type = String, initialization = John
    var age: Int = 16
    //identifier =age , Type = Int, initialization = 16
    println(name)
    println(age)
}</code></pre>
<!-- /wp:code -->

 
 ## Çok Satırlı Yorumlar</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Başlangıcı /* işaretiyle başlayan ve arada kaç satır olursa olsun */ işaretine kadar arada kalan tüm açıklamalar yorum olarak kabul edilir. Derleyici tarafından dikkate alınmaz. /* Yorum */ formatını tek satır veya çok satırlı yorumlar için kullanabilirsiniz. Aşağıda çok satırlı yorum örneği bulunmaktadır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val name: String = "John"
    /* 
    identifier =name , Type = String, initialization = John
    identifier =age , Type = Int, initialization = 16 
    */
    var age: Int = 16

    println(name)
    println(age)
}</code></pre>
<!-- /wp:code -->

 
 ## Dokümantasyon Yorumları</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Yazılımımız hakkında kullanım kılavuzu hazırlamak, copyright ifadeleri eklemek vb. amaçlarla /** ile */ arasına yazılan yorumlardır. Her satıra ayrıca * işareti de konulur. Bu formatta yazdığınız yorumları başka bir yazılım aracılığıyla derleyerek dokümantasyon oluşturabilirsiniz. Aşağıda dokümantasyon yorumu örneği bulunmaktadır.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">/**
 * Copyright siberoloji.com 2024 MIT license
 * main() function declares 2 variables with standard assignment template.
 * We can omit Type here because it is redundant.
 * Kotlin decides the type of variable with "Type Inference"
 */

fun main() {
    val name: String = "John"
    /*
    identifier =name , Type = String, initialization = John
    identifier =age , Type = Int, initialization = 16
    */
    var age: Int = 16

    println(name)
    println(age)
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Yorum satırlarını, bazı kodları denemek içinde kullanabiliriz. Deneme esnasında iptal etmek istediğimiz kodları, silip tekrar yazmak yerine yorum satırı içine alabiliriz. Ayrıca yorum satırlarını daha az kullanmanın da bazı yöntemleri bulunmaktadır. Mesela, değişken isimlerini daha anlamlı vermek, yazılan kodun daha okunur olmasını sağlayacaktır. Bu konuyu başka bir yazıda açıklayacağız.</p>
  