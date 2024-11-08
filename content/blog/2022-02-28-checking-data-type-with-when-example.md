---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Kotlin Code Samples
date: "2022-02-28T20:50:52Z"
guid: https://blog.siberoloji.com/?p=173
id: 173
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- data type check with when
- kotlin
- Kotlin Code Samples
- kotlin data type checking
title: Checking data type with when() example
url: /checking-data-type-with-when-example/
---

  In this short note, you can see an example of when() usage with data type. The type of data will determine the code to run. 
 

<!-- wp:more -->
<!--more-->
<!-- /wp:more -->

<!-- wp:code -->
<pre title="when condition is the type of data" class="wp-block-code"><code lang="kotlin" class="language-kotlin"> val x : Any = 12.75
    when(x){
        is Int -&gt; println("$x is an Integer")
        is Double -&gt; println("$x is a Double")
        is String -&gt; println("$x is a String")
        else -&gt; println("$x is not Int,Double or String")

    }</code></pre>
<!-- /wp:code -->

  You can see the output below. 
 

<!-- wp:image {"id":157,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://www.siberoloji.com/assets/images/2022/02/when_datatype_check_kotlin.png-1024x593.webp" alt="" class="wp-image-157" /></figure>
<!-- /wp:image -->