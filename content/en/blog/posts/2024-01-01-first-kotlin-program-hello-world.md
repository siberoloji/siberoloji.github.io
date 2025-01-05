---
draft: false

title:  'First Kotlin Program &#8220;Hello World&#8221;'
date: '2024-01-01T14:13:06+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'When starting to learn programming languages, we always start with the same example. Let''s start our Kotlin programming article with the "Hello World" program without breaking tradition.' 
 
url:  /first-kotlin-program-hello-world/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
featured_image: /images/KotlinFullColorLogoMarkRGB-250-250.png
categories:
    - 'Kotlin Fundamentals'
tags:
    - kotlin
    - 'kotlin fundamentals'
    - software
---


When starting to learn programming languages, we always start with the same example. Let's start our Kotlin programming article with the "Hello World" program without breaking tradition.



You can copy the code you see below and paste it into your editor, or you can go to the "<a href="https://play.kotlinlang.org/" data-type="link" data-id="https://play.kotlinlang.org/">Kotlin Playground</a>" page via your Web browser and try the codes there.


```kotlin
// First program in kotlin
fun main() {
    println("Hello World")
}
```



Explanation:



The line that starts with the `//` sign is the comment line. The compiler does not accept this line as code. It is used to take notes or make explanations about which code does what.



The `fun` expression refers to the beginning of a function.



`main()` is the entry point of Kotlin programs. It is case sensitive.



A code block is written between `{ }` signs.



`println("Hello World")` is a code expression you see here. When we send the "Hello World" parameter to the println() function, it will write the sent parameter to the screen and move to the next line. If you want, you can print more than one line under each other. Here is an example.


```kotlin
// First program in kotlin
fun main() {
    println("Hello World")
    println("I am the first Kotlin Program")
}
```



When we run the example above, you should get the following output.


```kotlin
Hello World
I am the first Kotlin Program

Process finished with exit code 0```
