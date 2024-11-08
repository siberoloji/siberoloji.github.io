---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "1"
categories:
- Kotlin Kod Örnekleri
date: "2022-01-16T08:50:29Z"
guid: https://blog.siberoloji.com/?p=126
id: 126
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- kotlin class
- kotlin class oluşturma örneği
title: Kotlin ile Class() oluşturma örneği
url: /tr/kotlin-ile-class-olusturma-ornegi/
---

<!-- wp:paragraph -->
<p>Nesne Yönelimli Programlama Dillerinde sınıflar önemlidir. Bu gönderide basit bir Sınıf oluşturma örneği bulabilirsiniz.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    var personA = Person("Mike","Sunshine")
    var personB = Person()
    var personC = Person(lastName = "Peterson")

}

class Person (firstName:String ="John" , lastName:String="Doe"){

    init {
        println("A new person object created with First Name: $firstName and " +
                "Last Name: $lastName" )
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre title="Sonuç" class="wp-block-code"><code lang="kotlin" class="language-kotlin">A new person object created with First Name: Mike and Last Name: Sunshine
A new person object created with First Name: John and Last Name: Doe
A new person object created with First Name: John and Last Name: Peterson

Process finished with exit code 0</code></pre>
<!-- /wp:code -->