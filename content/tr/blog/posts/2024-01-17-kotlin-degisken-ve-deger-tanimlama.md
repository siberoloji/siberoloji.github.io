---
draft: false

title:  'Kotlin Değişken ve Değer tanımlama'
date: '2024-01-17T18:43:39+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Değişken, içerisinde bir rakam, yazı veya diğer her türlü bilginin tutulduğu kayıt yeridir. Değişkenler, programlama da neredeyse en önemli yapı taşlarıdır. Yapacağımız bütün işlemlerin içerisinde bu değerlerin tutulduğu değişkenler bulunur. İsmine değişken diyoruz çünkü, içerisindeki kayıtlı olan değer değişebilmektedir. ' 
 
url:  /tr/kotlin-degisken-ve-deger-tanimlama/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
burst_total_pageviews_count:
    - '14'
featured_image: /images/KotlinFullColorLogoMarkRGB-250-250.png
categories:
    - 'Temel Kotlin'
tags:
    - kotlin
    - yazılım
---


## Değişken nedir?



Değişken, içerisinde bir rakam, yazı veya diğer her türlü bilginin tutulduğu kayıt yeridir. Değişkenler, programlama da neredeyse en önemli yapı taşlarıdır. Yapacağımız bütün işlemlerin içerisinde bu değerlerin tutulduğu değişkenler bulunur. İsmine değişken diyoruz çünkü, içerisindeki kayıtlı olan değer değişebilmektedir.  



Örneğin, bir okul ve içinde sınıfları düşünün. Her bir sınıfın adını bir yerde kayıt etmeli ve her sınıfın öğrenci sayısını da bir yerde kayıt etmeliyiz. Her değişkenin, diğer değişkenlerden ayırt edilmeye yarayan bir adı (tanımlayıcı) bulunmalıdır. Bu durumda "sınıf adı" ve "öğrenci sayısı" olarak ifade edeceğimiz iki değişkenimiz olacaktır.



## Değişken tanımlama



Yazacağımız programda, değişkeni kullanabilmemiz için önceden tanımlamış olmalıyız. Değişken tanımlamak için Kotlin iki anahtar kelime sunmaktadır. Değişken ismi rakamla başlamamalı ve büyük küçük harf duyarlılığı olduğu unutulmamalıdır.



val (value)



val ifadesi ile tanımladığımız değişkenler program başlangıcında içine değer atandıktan sonra değerin bir daha değişmediği değişken türüdür. Örneğin işlem yapmak istediğimiz bir Roman'ın adını verebiliriz. Farklı basım tarzları sonucunda sayfa sayısı değişse bile yazarın adı ve romanın adı sabit kalacaktır. Ancak bu, başka bir kitap için yine sabit olan bir yazar adı ve kitap ismi gerektirmektedir. İşte bu ihtiyaçtan dolayı, programın ilk çalıştırılması esnasında içerisine istediğimiz değeri bir defaya mahsus atayabildiğimiz ancak sonradan değiştiremediğimiz türden değişkenleri **val** ifadesi ile tanımlayacağız. 



Bu tür değişkenlerin içeriği çalışma zamanında belirlenir.


```kotlin
fun main() {
val language = "Kotlin"
    println(language)
}

/* Output
Kotlin

Process finished with exit code 0
 */```



Yukarıdaki örnekte language adında bir değişken tanımlanmış ve değeri String türünde "Kotlin" olarak atanmıştır. Değeri atamak için = işareti kullanıldığına dikkat etmelisiniz. Şimdi bu değişkeni program içerisinde kodlarımızı yazarken artık "language" orada çağırabiliriz.



var (variable)



İçerisinde tutulan değeri istediğimiz zaman istediğimiz kadar değiştirebileceğimiz bir değişken türüdür. Değiştirilebilir değişken olarak ifade edebiliriz.


```kotlin
fun main() {
    var dayOfWeek = "Monday"
    println(dayOfWeek) // ekrana Monday yazar
    dayOfWeek = "Sunday" // değişkenimize yeni değer ataması yaptık.
    println(dayOfWeek) // ekrana Sunday yazar
}

/* Output
Monday
Sunday

Process finished with exit code 0
 */```



Yukarıdaki örnekte gördüğünüz gibi, dayOfWeek değişkenine önce Monday değerini verip ekrana yazdırdık. Ardından, Sunday değerini vererek yeni değeri de ekrana yazdırdık. Bu sayede bir değişkenin içindeki değerleri değiştirerek kullanmış olduk.



const (constant)



Program kodlanırken bilinen ve yazılımı kim kullanırsa kullansın değişmeyecek olan değerlere **sabit** denmektedir. Sabitlerin de bir yere kayıt edilmesi gerekmektedir. Bu sebeple **const** ifadesi **val** ifadesi ile birlikte kullanılarak sabit değerler atanır.



Bu tür değişkenlerin içeriği derleme zamanında belirlenir.



Farklı değer tiplerinde veriler atama



Kotlin içerisinde farklı veri tiplerini saklamak için istediğiniz kadar değişken tanımlayabilirsiniz. Aşağıda bunun bir örneğini görebilirsiniz. 


```kotlin
fun main() {
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
 */```



Burada belirtmemiz gereken önemli bir kural bulunuyor. Örneğin, Bir değişkene ilk olarak var kullanarak Int yani tamsayı değeri ataması yaptığınızı düşünürsek (val ten = 10) bundan sonra o değişkene atayacağımız değerler hep tamsayı olmalı. İlk atanan veri tipi ne ise, sonradan atanacak veri tipi de hep aynı olmalı.



## Sonuç



Artık değişken tanımlamak için val ve var anahtar kelimelerinin kullanıldığını, değişken isimlerinin harf ile başlaması gerektiğini ve değişkenlerin ilk atanan değer türü ne ise sonradan da ancak o tür değerler atanabileceğini biliyoruz. Bu bilgiler sonraki aşamalar için oldukça işimize yarayacaktır.
