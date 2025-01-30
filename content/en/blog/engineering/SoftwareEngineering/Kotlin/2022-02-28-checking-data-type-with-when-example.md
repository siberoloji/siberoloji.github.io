---
draft: false

title:  'Checking data type with when() example'
date: '2022-02-28T20:50:52+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /checking-data-type-with-when-example/
featured_image: /images/KotlinFullColorLogoMarkRGB-250-250.png
categories:
    - 'Kotlin Code Samples'
tags:
    - 'data type check with when'
    - kotlin
    - 'Kotlin Code Samples'
    - 'kotlin data type checking'
---


In this short note, you can see an example of when() usage with data type. The type of data will determine the code to run.
<!-- wp:code -->
<pre title="when condition is the type of data" class="wp-block-code"><code lang="kotlin" class="language-kotlin"> val x : Any = 12.75
    when(x){
        is Int -> println("$x is an Integer")
        is Double -> println("$x is a Double")
        is String -> println("$x is a String")
        else -> println("$x is not Int,Double or String")

    }
```



You can see the output below.


<!-- wp:image {"id":157,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://www.siberoloji.com/wp-content/uploads/2022/02/when_datatype_check_kotlin.png-1024x593.webp" alt="" class="wp-image-157" /></figure>
<!-- /wp:image -->