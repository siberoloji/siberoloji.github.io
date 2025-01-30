---
draft: false

title:  'Comment Lines in Kotlin Programming'
date: '2024-01-21T21:10:46+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Comment lines are not taken into account by program compilers and are not included in the process. There are 3 different types of comment lines in Kotlin.' 
 
url:  /comment-lines-in-kotlin-programming/
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


A computer program consists of various pieces of code coming together and working in harmony. Each block of code does what is expected of it. As time goes on, the program developers who write these codes begin to forget and get confused about which code does what. In addition, a new developer who replaces the developer who left the project must learn the program by reading the codes. In this case, explanations, notes and similar expressions written next to the codes are called comment lines.



Comment lines are not taken into account by program compilers and are not included in the process. There are 3 different types of comment lines in Kotlin.



## End of Line Comments



These are comments that do not exceed one line in length. They are written after the // sign. Everything after the // sign and up to the end of the line is considered a comment. The example below shows the comment lines used with //.


```kotlin
fun main() {
    val name: String = "John"
    //identifier =name , Type = String, initialization = John
    var age: Int = 16
    //identifier =age , Type = Int, initialization = 16
    println(name)
    println(age)
}
```



## Multi-Line Comments



All comments starting with the /* sign and ending with the */ sign, regardless of how many lines there are, are considered comments. It is ignored by the compiler. You can use the /* Comment */ format for single-line or multi-line comments. Below is an example of a multi-line comment.


```kotlin
fun main() {
    val name: String = "John"
    /* 
    identifier =name , Type = String, initialization = John
    identifier =age , Type = Int, initialization = 16 
    */
    var age: Int = 16

    println(name)
    println(age)
}
```



## Documentation Comments



Preparing a user guide about our software, adding copyright statements, etc. These are comments written between /** and */ for the following purposes. An * sign is also placed on each line. You can create documentation by compiling the comments you write in this format through another software. Below is an example of a documentation comment.


```kotlin
/**
 * Copyright siberoloji.com 2024 MIT license
 * main() function declares 2 variables with standard assignment template.
 * We can omit Type here because it is redundant.
 * Kotlin decides the type of variable with "Type Inference"
 */

fun main() {
    val name: String = "John"
    /*
    identifier =name , Type = String, initialization = John
    identifier =age , Type = Int, initialization = 16
    */
    var age: Int = 16

    println(name)
    println(age)
}
```



We can use comment lines to test some codes. We can put the codes we want to cancel during the experiment in the comment line instead of deleting and retyping them. There are also some ways to use less comment lines. For example, giving variable names more meaningful will make the written code more readable. We will explain this issue in another article.
