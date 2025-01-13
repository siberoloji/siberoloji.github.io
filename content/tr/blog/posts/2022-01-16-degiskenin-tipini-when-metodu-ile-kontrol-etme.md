---
draft: false

title:  'Değişkenin tipini when() metodu ile kontrol etme'
date: '2022-01-16T09:14:23+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/degiskenin-tipini-when-metodu-ile-kontrol-etme/
featured_image: /images/KotlinFullColorLogoMarkRGB-250-250.png
categories:
    - 'Kotlin Kod Örnekleri'
tags:
    - android
    - 'değişken kontrolü'
    - 'when() ile değişken kontrolü'
---
Bu yazıda, veri tipi ile When() kullanımına bir örnek görebilirsiniz. Veri türü, çalıştırılacak kodu belirleyecektir.
```bash
 val x : Any = 12.75
    when(x){
        is Int -> println("$x is an Integer")
        is Double -> println("$x is a Double")
        is String -> println("$x is a String")
        else -> println("$x is not Int,Double or String")

    }

```
<!-- wp:image {"id":157,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://www.siberoloji.com/wp-content/uploads/2022/02/when_datatype_check_kotlin.png-1024x593.webp" alt="" class="wp-image-157" /></figure>
<!-- /wp:image -->