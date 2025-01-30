---
draft: false

title:  'Creating a Class() example in Kotlin'
date: '2022-02-28T20:55:17+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /creating-a-class-example-in-kotlin/
featured_image: /images/KotlinFullColorLogoMarkRGB-250-250.png
categories:
    - 'Kotlin Code Samples'
tags:
    - class()
    - kotlin
    - 'Kotlin Code Samples'
---


In Object-Oriented Programming Languages, the classes are important. You can find a simple Class creating example in this post.
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
<pre title="Output" class="wp-block-code"><code lang="kotlin" class="language-kotlin">A new person object created with First Name: Mike and Last Name: Sunshine
A new person object created with First Name: John and Last Name: Doe
A new person object created with First Name: John and Last Name: Peterson

Process finished with exit code 0
```
