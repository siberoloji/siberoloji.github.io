---
draft: false
title: İlk Kotlin Programı Merhaba Dünya
date: 2024-01-01T13:48:45+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Genel olarak programlama dillerini öğrenmeye başlarken hep aynı örnek ile başlanır. Biz de Kotlin programlama yazımıza geleneği bozmadan "Merhaba Dünya" programı ile başlayalım.
url: /tr/ilk-kotlin-programi-merhaba-dunya/
featured_image: /images/KotlinFullColorLogoMarkRGB-250-250.png
categories:
    - Temel Kotlin
tags:
    - kotlin
    - yazılım
---


Genel olarak programlama dillerini öğrenmeye başlarken hep aynı örnek ile başlanır. Biz de Kotlin programlama yazımıza geleneği bozmadan "Merhaba Dünya" programı ile başlayalım.



Aşağıda gördüğünüz kodu kopyalayıp editörünüze yapıştırabilir veya Web tarayıcınız üzerinden "<a href="https://play.kotlinlang.org/">Kotlin Playground</a>" sayfasına girip kodları orada da deneyebilirsiniz.


```kotlin
// Kotlin'de ilk program
fun main() {
    println("Merhaba Dünya")
}
```



Açıklama:



`//` işaretiyle başlayan satır, yorum satırıdır. Derleyici bu satırı kod olarak kabul etmez. Hangi kodun ne işe yaradığı ile ilgili notlar almak veya açıklamalar yapmak için kullanılır.



`fun` ifadesi function yani bir fonksiyonun başlangıcını ifade eder.



`main()` Kotlin programlarının giriş noktasıdır. Büyük küçük harf duyarlıdır. 



`{ }` işaretlerinin arasına kod bloğu yazılır.



`println("Merhaba Dünya")` burada gördüğünüz bir kod ifadesidir. `println()` fonksiyonuna "Merhaba Dünya" parametresini gönderdiğimizde, ekrana gönderilen parametreyi yazacak ve bir alt satıra geçecektir. İsterseniz alt alta birden fazla satır yazdırabilirsiniz. İşte bir örnek.


```kotlin
fun main() {
    println("Merhaba Dünya")
    println("Ben Kotlin Programıyım")
}
```



Yukarıda bulunan örneği çalıştırdığımızda aşağıdaki çıktıyı elde etmelisiniz.


```kotlin
Merhaba Dünya
Ben Kotlin Programıyım

Process finished with exit code 0```
