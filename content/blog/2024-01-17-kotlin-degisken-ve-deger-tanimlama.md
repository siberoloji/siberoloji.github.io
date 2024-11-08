---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "14"
categories:
- Temel Kotlin
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-17T18:43:39Z"
excerpt: 'Değişken, içerisinde bir rakam, yazı veya diğer her türlü bilginin tutulduğu
  kayıt yeridir. Değişkenler, programlama da neredeyse en önemli yapı taşlarıdır.
  Yapacağımız bütün işlemlerin içerisinde bu değerlerin tutulduğu değişkenler bulunur.
  İsmine değişken diyoruz çünkü, içerisindeki kayıtlı olan değer değişebilmektedir. '
guid: https://www.siberoloji.com/?p=694
id: 694
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- kotlin
- yazılım
title: Kotlin Değişken ve Değer tanımlama
url: /tr/kotlin-degisken-ve-deger-tanimlama/
---

 
 ## Değişken nedir?</h2>
<!-- /wp:heading -->

  Değişken, içerisinde bir rakam, yazı veya diğer her türlü bilginin tutulduğu kayıt yeridir. Değişkenler, programlama da neredeyse en önemli yapı taşlarıdır. Yapacağımız bütün işlemlerin içerisinde bu değerlerin tutulduğu değişkenler bulunur. İsmine değişken diyoruz çünkü, içerisindeki kayıtlı olan değer değişebilmektedir.  </p>
 

  Örneğin, bir okul ve içinde sınıfları düşünün. Her bir sınıfın adını bir yerde kayıt etmeli ve her sınıfın öğrenci sayısını da bir yerde kayıt etmeliyiz. Her değişkenin, diğer değişkenlerden ayırt edilmeye yarayan bir adı (tanımlayıcı) bulunmalıdır. Bu durumda "sınıf adı" ve "öğrenci sayısı" olarak ifade edeceğimiz iki değişkenimiz olacaktır.</p>
 

 
 ## Değişken tanımlama</h2>
<!-- /wp:heading -->

  Yazacağımız programda, değişkeni kullanabilmemiz için önceden tanımlamış olmalıyız. Değişken tanımlamak için Kotlin iki anahtar kelime sunmaktadır. Değişken ismi rakamla başlamamalı ve büyük küçük harf duyarlılığı olduğu unutulmamalıdır.</p>
 

<!-- wp:heading {"level":3} -->
 ### val (value)</h3>
<!-- /wp:heading -->

  val ifadesi ile tanımladığımız değişkenler program başlangıcında içine değer atandıktan sonra değerin bir daha değişmediği değişken türüdür. Örneğin işlem yapmak istediğimiz bir Roman'ın adını verebiliriz. Farklı basım tarzları sonucunda sayfa sayısı değişse bile yazarın adı ve romanın adı sabit kalacaktır. Ancak bu, başka bir kitap için yine sabit olan bir yazar adı ve kitap ismi gerektirmektedir. İşte bu ihtiyaçtan dolayı, programın ilk çalıştırılması esnasında içerisine istediğimiz değeri bir defaya mahsus atayabildiğimiz ancak sonradan değiştiremediğimiz türden değişkenleri <strong>val</strong> ifadesi ile tanımlayacağız. </p>
 

  Bu tür değişkenlerin içeriği <em>çalışma zamanında</em> belirlenir.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
val language = "Kotlin"
    println(language)
}

/* Output
Kotlin

Process finished with exit code 0
 */</code></pre>
<!-- /wp:code -->

  Yukarıdaki örnekte language adında bir değişken tanımlanmış ve değeri String türünde "Kotlin" olarak atanmıştır. Değeri atamak için = işareti kullanıldığına dikkat etmelisiniz. Şimdi bu değişkeni program içerisinde kodlarımızı yazarken artık "language" orada çağırabiliriz.</p>
 

<!-- wp:heading {"level":3} -->
 ### var (variable)</h3>
<!-- /wp:heading -->

  İçerisinde tutulan değeri istediğimiz zaman istediğimiz kadar değiştirebileceğimiz bir değişken türüdür. Değiştirilebilir değişken olarak ifade edebiliriz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    var dayOfWeek = "Monday"
    println(dayOfWeek) // ekrana Monday yazar
    dayOfWeek = "Sunday" // değişkenimize yeni değer ataması yaptık.
    println(dayOfWeek) // ekrana Sunday yazar
}

/* Output
Monday
Sunday

Process finished with exit code 0
 */</code></pre>
<!-- /wp:code -->

  Yukarıdaki örnekte gördüğünüz gibi, dayOfWeek değişkenine önce Monday değerini verip ekrana yazdırdık. Ardından, Sunday değerini vererek yeni değeri de ekrana yazdırdık. Bu sayede bir değişkenin içindeki değerleri değiştirerek kullanmış olduk.</p>
 

<!-- wp:heading {"level":3} -->
 ### const (constant)</h3>
<!-- /wp:heading -->

  Program kodlanırken bilinen ve yazılımı kim kullanırsa kullansın değişmeyecek olan değerlere <strong>sabit</strong> denmektedir. Sabitlerin de bir yere kayıt edilmesi gerekmektedir. Bu sebeple <strong>const</strong> ifadesi <strong>val</strong> ifadesi ile birlikte kullanılarak sabit değerler atanır.</p>
 

  Bu tür değişkenlerin içeriği <em>derleme zamanında</em> belirlenir.</p>
 

<!-- wp:heading {"level":3} -->
 ### Farklı değer tiplerinde veriler atama</h3>
<!-- /wp:heading -->

  Kotlin içerisinde farklı veri tiplerini saklamak için istediğiniz kadar değişken tanımlayabilirsiniz. Aşağıda bunun bir örneğini görebilirsiniz. </p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val ten = 10
    val greeting = "Hello"
    val firstLetter = 'A'

    println(ten) // ekrana 10 yazar
    println(greeting) // ekrana Hello yazar
    println(firstLetter) // ekrana A yazar
}

/* Output
10
Hello
A

Process finished with exit code 0
 */</code></pre>
<!-- /wp:code -->

  Burada belirtmemiz gereken önemli bir kural bulunuyor. Örneğin, Bir değişkene ilk olarak var kullanarak Int yani tamsayı değeri ataması yaptığınızı düşünürsek (val ten = 10) bundan sonra o değişkene atayacağımız değerler hep tamsayı olmalı. İlk atanan veri tipi ne ise, sonradan atanacak veri tipi de hep aynı olmalı.</p>
 

 
 ## Sonuç</h2>
<!-- /wp:heading -->

  Artık değişken tanımlamak için val ve var anahtar kelimelerinin kullanıldığını, değişken isimlerinin harf ile başlaması gerektiğini ve değişkenlerin ilk atanan değer türü ne ise sonradan da ancak o tür değerler atanabileceğini biliyoruz. Bu bilgiler sonraki aşamalar için oldukça işimize yarayacaktır.</p>
 