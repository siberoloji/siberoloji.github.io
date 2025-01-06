---
draft: false

title:  'Kotlin'
de Sabitler ve değişkenler'
date: '2024-01-17T22:45:39+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Kotlin programlama dilinde değişkenleri tanımlama ve değer atama konusuna bir önceki yazımızda giriş yapmıştık. Bu yazımızda const ve val ile değer atamaya daha yakından bakacağız.' 
 
url:  /tr/kotlinde-sabitler-ve-degiskenler/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
burst_total_pageviews_count:
    - '6'
featured_image: /images/KotlinFullColorLogoMarkRGB-250-250.png
categories:
    - 'Temel Kotlin'
tags:
    - kotlin
    - yazılım
---


Kotlin programlama dilinde değişkenleri tanımlama ve değer atama konusuna <a href="https://www.siberoloji.com/kotlin-degisken-ve-deger-tanimlama/" data-type="post" data-id="694" target="_blank" rel="noreferrer noopener">bir önceki yazımızda</a> giriş yapmıştık. Bu yazımızda `const` ve `val` ile değer atamaya daha yakından bakacağız.



## val değişkenler



Aşağıdaki kod, `pi` sabit sayısını içeren bir tam sayı ve `helloMsg` isimli bir String değerini içeren iki adet değişken tanımlamaktadır. Bu değerler ilk atanmalarından sonra tekrar değiştirilemezler.


```kotlin
fun main() {
    val pi = 3.1415
    val helloMsg = "Hello"

    println(pi)       // 3.1415
    println(helloMsg) // Hello
}
```



`val` anahtar kelimesi ile tanımlanmış ve ilk değeri atanmış `pi` değişkenine yeni bir değer atamaya çalışalım.  Aşağıdaki örnekte görüldüğü gibi pi sayısına yeni bir değer atamak istediğimizde "**Val cannot be reassigned**" hatası alırsınız.


```kotlin
fun main() {
val pi = 3.1415
val helloMsg = "Hello"

println(pi) // 3.1415
println(helloMsg) // Hello

pi = 3.1416 // Val cannot be reassigned
}
```



`val` ile tanımlanmış ancak ilk değeri atanmamış yani başlangıcı yapılmamış bir değişkeni komutlarınızda kullanamazsınız. Bunu bir örnekle açıklayalım. Aşağıdaki kod ile `boolFalse` isimli değişken `val` ile tanımlanmış ancak türü `Boolean` olarak belirtilse de ilk değeri (True veya False) atanmadığından "Variable 'boolFalse' must be initialized" hata mesajını alırsınız.


```kotlin
val boolFalse: Boolean
println(boolFalse) // error line
```



Doğru kullanım aşağıdaki gibi olmalıdır.


```kotlin
val boolFalse: Boolean // not initialized
    boolFalse = false      // initialized
    println(boolFalse)     // no errors here
```



## const değişkenler



Kotlin programlamada `const` anahtar kelimesi ile `val` ifadesinin birlikte tanımlandığı bir sabit değer atama yöntemi bulunmaktadır. Bu yöntem ile sabit değer, program kodları derlenirken oluşturulur ve bir daha değiştirilemez. Kural olarak `const` biçiminde tanımlanan değişkenlerin isimlerinin tamamının BÜYÜK HARF olması tavsiye edilir. 


```kotlin
const val WRITER_NAME = "JOHN DOE"
```



Bu şekilde sabit değer tanımlamanın bazı kuralları bulunmaktadır. 


* Sabit değerlere yalnızca String ve birincil türler dediğimiz INT, CHAR, DOUBLE, BOOLEAN veri tipleri atanabilir. Aşağıda buna ait bir örnek gösterilmektedir.

* Sabitler, fonksiyonların en dışında tanımlanmalıdır. Fonksiyon içerisinde const ifadesi ile tanımlanamazlar. 



```kotlin
const val CONST_INT = 256
const val CONST_DOUBLE = 3.14
const val CONST_CHAR = 'f'
const val CONST_STRING = "I am constant"
const val CONST_ARRAY = arrayOf(1, 2, 3) // error: only primitives and strings are allowed
fun main() {
    println(CONST_INT)
    println(CONST_STRING)

}
```



Bu açıklamalar ve kurallar başlangıçta bir miktar karışık gelmiş olabilir. Bunların, yazılan kodun doğru ve hatasız çalışması için gerekli olduğunu unutmayın. Pratik yaptıkça bu kuralları daha yakından tanıyacaksınız.
