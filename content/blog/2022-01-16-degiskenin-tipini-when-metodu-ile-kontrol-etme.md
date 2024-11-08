---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Kotlin Kod Örnekleri
date: "2022-01-16T09:14:23Z"
guid: https://blog.siberoloji.com/?p=132
id: 132
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- android
- değişken kontrolü
- when() ile değişken kontrolü
title: Değişkenin tipini when() metodu ile kontrol etme
url: /tr/degiskenin-tipini-when-metodu-ile-kontrol-etme/
---

  Bu yazıda, veri tipi ile When() kullanımına bir örnek görebilirsiniz. Veri türü, çalıştırılacak kodu belirleyecektir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> val x : Any = 12.75
    when(x){
        is Int -&gt; println("$x is an Integer")
        is Double -&gt; println("$x is a Double")
        is String -&gt; println("$x is a String")
        else -&gt; println("$x is not Int,Double or String")

    }

</code></pre>
<!-- /wp:code -->

<!-- wp:image {"id":157,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://www.siberoloji.com/assets/images/2022/02/when_datatype_check_kotlin.png-1024x593.webp" alt="" class="wp-image-157" /></figure>
<!-- /wp:image -->