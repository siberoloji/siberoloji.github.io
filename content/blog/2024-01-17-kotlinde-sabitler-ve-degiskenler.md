---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "6"
categories:
- Temel Kotlin
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-17T22:45:39Z"
excerpt: Kotlin programlama dilinde değişkenleri tanımlama ve değer atama konusuna
  bir önceki yazımızda giriş yapmıştık. Bu yazımızda const ve val ile değer atamaya
  daha yakından bakacağız.
guid: https://www.siberoloji.com/?p=700
id: 700
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- kotlin
- yazılım
title: Kotlin&#8217;de Sabitler ve değişkenler
url: /tr/kotlinde-sabitler-ve-degiskenler/
---

<!-- wp:paragraph -->
<p>Kotlin programlama dilinde değişkenleri tanımlama ve değer atama konusuna <a href="https://www.siberoloji.com/kotlin-degisken-ve-deger-tanimlama/" data-type="post" data-id="694" target="_blank" rel="noreferrer noopener">bir önceki yazımızda</a> giriş yapmıştık. Bu yazımızda <code>const</code> ve <code>val</code> ile değer atamaya daha yakından bakacağız. 
  

 
 ## val değişkenler
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Aşağıdaki kod, <code>pi</code> sabit sayısını içeren bir tam sayı ve <code>helloMsg</code> isimli bir String değerini içeren iki adet değişken tanımlamaktadır. Bu değerler ilk atanmalarından sonra tekrar değiştirilemezler. 
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val pi = 3.1415
    val helloMsg = "Hello"

    println(pi)       // 3.1415
    println(helloMsg) // Hello
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>val</code> anahtar kelimesi ile tanımlanmış ve ilk değeri atanmış <code>pi</code> değişkenine yeni bir değer atamaya çalışalım.  Aşağıdaki örnekte görüldüğü gibi pi sayısına yeni bir değer atamak istediğimizde "***<mark class="has-inline-color has-vivid-red-color">Val cannot be reassigned</mark>*** " hatası alırsınız. 
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
val pi = 3.1415
val helloMsg = "Hello"

println(pi) // 3.1415
println(helloMsg) // Hello

pi = 3.1416 // Val cannot be reassigned
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>val</code> ile tanımlanmış ancak ilk değeri atanmamış yani başlangıcı yapılmamış bir değişkeni komutlarınızda kullanamazsınız. Bunu bir örnekle açıklayalım. Aşağıdaki kod ile <code>boolFalse</code> isimli değişken <code>val</code> ile tanımlanmış ancak türü <code>Boolean</code> olarak belirtilse de ilk değeri (True veya False) atanmadığından "<mark class="has-inline-color has-vivid-red-color">Variable 'boolFalse' must be initialized</mark>" hata mesajını alırsınız. 
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">val boolFalse: Boolean
println(boolFalse) // error line</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Doğru kullanım aşağıdaki gibi olmalıdır. 
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">val boolFalse: Boolean // not initialized
    boolFalse = false      // initialized
    println(boolFalse)     // no errors here</code></pre>
<!-- /wp:code -->

 
 ## const değişkenler
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Kotlin programlamada <code>const</code> anahtar kelimesi ile <code>val</code> ifadesinin birlikte tanımlandığı bir sabit değer atama yöntemi bulunmaktadır. Bu yöntem ile sabit değer, program kodları derlenirken oluşturulur ve bir daha değiştirilemez. Kural olarak <code>const</code> biçiminde tanımlanan değişkenlerin isimlerinin tamamının BÜYÜK HARF olması tavsiye edilir.  
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">const val WRITER_NAME = "JOHN DOE"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Bu şekilde sabit değer tanımlamanın bazı kuralları bulunmaktadır.  
  

<!-- wp:list -->
 <!-- wp:list-item -->
- Sabit değerlere yalnızca String ve birincil türler dediğimiz INT, CHAR, DOUBLE, BOOLEAN veri tipleri atanabilir. Aşağıda buna ait bir örnek gösterilmektedir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Sabitler, fonksiyonların en dışında tanımlanmalıdır. Fonksiyon içerisinde const ifadesi ile tanımlanamazlar.  
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">const val CONST_INT = 256
const val CONST_DOUBLE = 3.14
const val CONST_CHAR = 'f'
const val CONST_STRING = "I am constant"
const val CONST_ARRAY = arrayOf(1, 2, 3) // error: only primitives and strings are allowed
fun main() {
    println(CONST_INT)
    println(CONST_STRING)

}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Bu açıklamalar ve kurallar başlangıçta bir miktar karışık gelmiş olabilir. Bunların, yazılan kodun doğru ve hatasız çalışması için gerekli olduğunu unutmayın. Pratik yaptıkça bu kuralları daha yakından tanıyacaksınız. 
  