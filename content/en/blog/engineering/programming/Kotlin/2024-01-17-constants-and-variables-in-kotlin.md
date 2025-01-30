---
draft: false

title:  'Constants and variables in Kotlin'
date: '2024-01-17T23:01:33+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'We introduced the topic of defining variables and assigning values in the Kotlin programming language in our previous article. In this article, we will take a closer look at assigning values with const and val.' 
 
url:  /constants-and-variables-in-kotlin/
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


We introduced the topic of defining variables and assigning values in the Kotlin programming language in our <a href="https://www.siberoloji.com/en/kotlin-variable-and-value-definition/" data-type="post" data-id="696" target="_blank" rel="noreferrer noopener">previous article</a>. In this article, we will take a closer look at assigning values with const and val.



## val variables



The code below defines two variables, an integer containing the constant number `pi` and a String value named `helloMsg`. These values cannot be changed again after they are first assigned.


```kotlin
fun main() {
    val pi = 3.1415
    val helloMsg = "Hello"

    println(pi)       // 3.1415
    println(helloMsg) // Hello
}
```



Let's try to assign a new value to the `pi` variable, which is defined with the `val` keyword and assigned its initial value. As seen in the example below, when we want to assign a new value to the number `pi`, you receive the error "**Val cannot be reassigned**".


```kotlin
fun main() {
val pi = 3.1415
val helloMsg = "Hello"

println(pi) // 3.1415
println(helloMsg) // Hello

pi = 3.1416 // Val cannot be reassigned
}
```



You cannot use a variable that is defined with `val` but has not been initialized, that is, has not been initialized, in your commands. Let's explain this with an example. With the code below, the variable named `boolFalse` is defined with `val`, but since its initial value (True or False) is not assigned even though its type is specified as Boolean, you will receive the error message "**Variable 'boolFalse' must be initialized**".


```kotlin
val boolFalse: Boolean
println(boolFalse) // error line```



Correct usage should be as follows.


```kotlin
val boolFalse: Boolean // not initialized
    boolFalse = false      // initialized
    println(boolFalse)     // no errors here```



## const variables



In Kotlin programming, there is a constant value assignment method in which the `const` keyword and the `val` expression are defined together. With this method, the constant value is created when the program codes are compiled and cannot be changed again. As a rule, it is recommended that the names of variables defined as `const` be in all CAPITAL LETTERS. 


```kotlin
const val WRITER_NAME = "JOHN DOE"```



There are some rules for defining a constant value in this way.


* 
* Only String and INT, CHAR, DOUBLE, BOOLEAN data types, which we call primary types, can be assigned to constant values. An example of this is shown below.

* Constants should be defined outside functions. They cannot be defined with a const statement within a function.



```kotlin
const val CONST_INT = 256
const val CONST_DOUBLE = 3.14
const val CONST_CHAR = 'f'
const val CONST_STRING = "I am constant"
const val CONST_ARRAY = arrayOf(1, 2, 3) // error: only primitives and strings are allowed
fun main() {
    println(CONST_INT)
    println(CONST_STRING)

}
```



These explanations and rules may seem a bit confusing at first. Remember that these are necessary for the written code to work correctly and without errors. As you practice, you will become more familiar with these rules.
