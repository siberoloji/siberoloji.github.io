---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Temel Kotlin
date: "2024-01-01T13:48:45Z"
excerpt: Genel olarak programlama dillerini öğrenmeye başlarken hep aynı örnek ile
  başlanır. Biz de Kotlin programlama yazımıza geleneği bozmadan "Merhaba Dünya" programı
  ile başlayalım.
guid: https://www.siberoloji.com/?p=514
id: 514
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- kotlin
- yazılım
title: İlk Kotlin Programı &#8220;Merhaba Dünya&#8221;
url: /tr/ilk-kotlin-programi-merhaba-dunya/
---

<!-- wp:paragraph -->
 Genel olarak programlama dillerini öğrenmeye başlarken hep aynı örnek ile başlanır. Biz de Kotlin programlama yazımıza geleneği bozmadan "Merhaba Dünya" programı ile başlayalım.
 

<!-- wp:paragraph -->
 Aşağıda gördüğünüz kodu kopyalayıp editörünüze yapıştırabilir veya Web tarayıcınız üzerinden "<a href="https://play.kotlinlang.org/">Kotlin Playground</a>" sayfasına girip kodları orada da deneyebilirsiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">// Kotlin'de ilk program
fun main() {
    println("Merhaba Dünya")
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
 Açıklama:
 

<!-- wp:paragraph -->
 <code>//</code> işaretiyle başlayan satır, yorum satırıdır. Derleyici bu satırı kod olarak kabul etmez. Hangi kodun ne işe yaradığı ile ilgili notlar almak veya açıklamalar yapmak için kullanılır.
 

<!-- wp:paragraph -->
 <code>fun</code> ifadesi function yani bir fonksiyonun başlangıcını ifade eder.
 

<!-- wp:paragraph -->
 <code>main()</code> Kotlin programlarının giriş noktasıdır. Büyük küçük harf duyarlıdır. 
 

<!-- wp:paragraph -->
 <code>{ }</code> işaretlerinin arasına kod bloğu yazılır.
 

<!-- wp:paragraph -->
 <code>println("Merhaba Dünya")</code> burada gördüğünüz bir kod ifadesidir. <code>println()</code> fonksiyonuna "Merhaba Dünya" parametresini gönderdiğimizde, ekrana gönderilen parametreyi yazacak ve bir alt satıra geçecektir. İsterseniz alt alta birden fazla satır yazdırabilirsiniz. İşte bir örnek.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    println("Merhaba Dünya")
    println("Ben Kotlin Programıyım")
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
 Yukarıda bulunan örneği çalıştırdığımızda aşağıdaki çıktıyı elde etmelisiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">Merhaba Dünya
Ben Kotlin Programıyım

Process finished with exit code 0</code></pre>
<!-- /wp:code -->