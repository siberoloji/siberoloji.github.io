---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Kotlin Code Samples
date: "2022-02-28T20:55:17Z"
guid: https://blog.siberoloji.com/?p=177
id: 177
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- class()
- kotlin
- Kotlin Code Samples
title: Creating a Class() example in Kotlin
url: /creating-a-class-example-in-kotlin/
---

  In Object-Oriented Programming Languages, the classes are important. You can find a simple Class creating example in this post.
 

<!-- wp:more -->
<!--more-->
<!-- /wp:more -->

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
<pre title="Output" class="wp-block-code"><code lang="kotlin" class="language-kotlin">A new person object created with First Name: Mike and Last Name: Sunshine
A new person object created with First Name: John and Last Name: Doe
A new person object created with First Name: John and Last Name: Peterson

Process finished with exit code 0
</code></pre>
<!-- /wp:code -->