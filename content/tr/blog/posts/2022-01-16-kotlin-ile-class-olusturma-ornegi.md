---
draft: false

title:  'Kotlin ile Class() oluşturma örneği'
date: '2022-01-16T08:50:29+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/kotlin-ile-class-olusturma-ornegi/
burst_total_pageviews_count:
    - '1'
featured_image: /images/KotlinFullColorLogoMarkRGB-250-250.png
categories:
    - 'Kotlin Kod Örnekleri'
tags:
    - 'kotlin class'
    - 'kotlin class oluşturma örneği'
---


Nesne Yönelimli Programlama Dillerinde sınıflar önemlidir. Bu gönderide basit bir Sınıf oluşturma örneği bulabilirsiniz.


```kotlin
fun main() {
    var personA = Person("Mike","Sunshine")
    var personB = Person()
    var personC = Person(lastName = "Peterson")

}

class Person (firstName:String ="John" , lastName:String="Doe"){

    init {
        println("A new person object created with First Name: $firstName and " +
                "Last Name: $lastName" )
    }
}
```


<!-- wp:code -->
<pre title="Sonuç" class="wp-block-code"><code lang="kotlin" class="language-kotlin">A new person object created with First Name: Mike and Last Name: Sunshine
A new person object created with First Name: John and Last Name: Doe
A new person object created with First Name: John and Last Name: Peterson

Process finished with exit code 0```
