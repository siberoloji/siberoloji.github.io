---
draft: false

title:  'Variable naming rules in Kotlin'
date: '2024-01-23T18:13:19+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'The variable name you choose should explain exactly what the variable does. Let''s see in order the rules that you are advised to follow so that your code does not become complex and incomprehensible.' 
 
url:  /variable-naming-rules-in-kotlin/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
featured_image: /images/kotlin-1.png
categories:
    - 'Kotlin Fundamentals'
tags:
    - kotlin
    - 'kotlin fundamentals'
    - software
---


As you know, every variable must have a unique name. Although it may seem problem-free at first, as your software expands, your codes may become difficult to understand. Most of the software developers' time is spent reading the code written by others, not writing code.

If you want the code you write to be easy to read and follow, it is very important to follow the naming rules. The variable name you choose should explain exactly what the variable does. Let's see in order the rules that you are advised to follow so that your code does not become complex and incomprehensible.

## Mandatory Naming Rules

*
* Names are case sensitive. (number and Number are not the same expression.)

* Names must consist only of letters, numbers and underscores.

* Names cannot have a number at the beginning (1month is the wrong usage.)

* Keywords that the Kotlin software reserves for itself (val, var, fun, etc.) cannot be used as variable names.

## Recommended Naming Conventions

*
* If a variable name consists of a single word, it must be written in all lowercase letters. (`name`, `message`)

* If a variable name consists of more than one word, lowercase Camel style notation should be used. (numberOfStudents, numberOfPages). As can be seen, after the entire first word is written in lowercase, only the first letter of each word should be capitalized.

* Although it is not prohibited, you should not start the variable name with an underscore _.

* You must give meaningful names to the variable. As a variable name, the `color` name will be more descriptive and meaningful than the `c` expression.

## Magic Numbers

In the example command below, the number 7 is written to the screen. It is very difficult for another programmer reading this program to know what the number 7 is. In such cases, numbers should be named using const and used that way, even if they are a constant. When naming, the UPPERCASE_LETTER_SNAKE type should be used. This usage will provide great convenience to understand the code.

Not Recommended Use

```kotlin
fun main() {
    println(7)
}
/* Output
7

Process finished with exit code 0
 */```



Recommended Use


```kotlin
const val DAYS_OF_THE_WEEK = 7

fun main() {
    println(DAYS_OF_THE_WEEK)
}
/* Output
7

Process finished with exit code 0
 */```



If you follow the rules we explained above as much as possible, it will be very helpful and save time for both you and your friends who will be involved in the project later.
