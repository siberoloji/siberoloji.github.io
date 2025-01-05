---
draft: false

title:  'Kotlin&#8217;de Temel Veri Tipleri'
date: '2024-01-11T22:39:58+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Ne kadar karışık olursa olsun, tüm programlama dilleri işlemlerini tam sayı, karakter ve yazı dizileri vb. değerler üzerinde gerçekleştirilir. Bu değerlere Temel Değer ifadeleri adını veriyoruz.' 
 
url:  /tr/kotlinde-temel-veri-tipleri/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
featured_image: /images/james-harrison-vpOeXr5wmR4-unsplash.jpg
categories:
    - 'Temel Kotlin'
tags:
    - kotlin
    - yazılım
---


Ne kadar karışık olursa olsun, tüm programlama dilleri işlemlerini tam sayı, karakter ve yazı dizileri vb. değerler üzerinde gerçekleştirilir. Bu değerlere Temel Değer ifadeleri adını veriyoruz. Program yazmaya başlamadan önce bu türleri açıklamak çok yerinde olacaktır. Bunlar, tam sayılar, karakterler ve karakter dizileridir.



## Tam Sayılar (Integers):



Günlük yaşamımızda ve matematikte bir şeyleri saymak için tam sayıları sürekli kullanırız. Aynı tamsayılar Kotlin’de de kullanılmaktadır. Aşağıda gördüğünüz tüm rakamlar tamsayıdır. Örneğin;



0, 1, 2, 10, 11, 100



Eğer bir tam sayı çok sayıda basamak içeriyorsa, okunması ve algılanması kolay olması için _ (alt çizgi) kullanarak tam sayıyı bloklara ayırabiliriz. Örneğin;



1000000 yerine 1_000_000 şeklinde yazabiliriz. Bu iki Kotlin için aynı tam sayıyı ifade eder. Alt çizgi rakamların en başında ve sonunda olmadığı sürece istenildiği gibi kullanılabilir. 1__000_000 , 1_2_3 bu ifadeler de doğrudur.



_10 veya 100_ şeklinde yazdığınızda hata meydana gelir.



## Karakterler (Characters)



Tek bir rakam, yazı karakteri ve boşluk ve * - vb. bazı özel karakterleri ifade etmekte kullanılan bir veri türüdür. Burada dikkat edilmesi gereken ilk konu tek bir karakter olması gerektiğidir. Karakterler, aşağıda görüleceği gibi tek tırnak içinde yazılırlar.



‘A’, ‘a’, ‘x’, ‘y’, ‘2’, ‘8’,’*’, ‘ ‘, ‘$’ tüm bu ifadeler karakter olarak adlandırılır.



Karakter veri türü tek bir ifade içerebileceği için tek tırnak içine alınmış olsa bile aşağıdaki ifadeler yanlıştır.



‘abc’, ‘543’



## Karakter Dizileri (Strings)



Bir veya birden fazla karakterin bir araya gelerek oluşturdukları karakter dizileridir. Karakterlerden farklı olarak çift tırnak “ “ içinde gösterilirler. Bir kaç doğru kullanım örneğini aşağıda bulabilirsiniz. Çift tırnak içinde boşluk karakteri dahil istenen her türlü karakter kullanılabilir. 



“Text”, “Kotlin öğrenmek istiyorum”, “123 456”, “email@email.com”



Bir karakter dizisinde tek bir karakterin de bulunabileceğine dikkat etmelisiniz.



“A” - Çift tırnak içinde yazıldığı için karakter dizisidir.



‘A’ - Tek tırnak içinde yazıldığı için karakterdir.



## Sonuç



Yukarıda açıklanan 3 farklı veri tipinin dışında Kotlin’de başka veri tipleri de bulunur. Bunları yeri geldiğinde ayrıca açıklayacağız. Temel komut ve işlemleri açıklamak için bu 3 veri tipi başlangıç için yeterli olacaktır.
