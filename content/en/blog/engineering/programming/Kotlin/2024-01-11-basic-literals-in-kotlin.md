---
draft: false

title:  'Basic Literals in Kotlin'
date: '2024-01-11T22:48:55+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'No matter how complicated, all programming languages perform operations on integers, characters, strings, etc. performed on values. We call these values Literal expressions' 
 
url:  /basic-literals-in-kotlin/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
featured_image: /images/james-harrison-vpOeXr5wmR4-unsplash.jpg
categories:
    - 'Kotlin Fundamentals'
tags:
    - kotlin
    - 'kotlin fundamentals'
    - software
---


No matter how complicated, all programming languages perform operations on integers, characters, strings, etc. performed on values. We call these values Literal expressions. It would be very appropriate to explain these types before starting to write a program. These are integers, characters, and strings.



## Integers



We constantly use integers to count things in our daily lives and in mathematics. The same integers are also used in Kotlin. All the numbers you see below are integers. For example; 0, 1, 2, 10, 11, 100 If an integer contains many digits, we can split the integer into blocks using _ (underscore) to make it easier to read and understand. For example; Instead of 1000000, we can write it as 1_000_000. This means the same integer for both Kotlins. As long as the underscore is not at the beginning or end of the numbers, it can be used as desired. 1__000_000 , 1_2_3 These expressions are also true. An error occurs when you type _10 or 100_.



## Characters



A single number, font and space, * - etc. It is a data type used to represent some special characters. The first thing to consider here is that there should be a single character. Characters are written in single quotes ' ' as seen below. 'A', 'a', 'x', 'y', '2', '8', '*', ' ', '$' all these expressions are called characters. Since the character data type can contain a single expression, the following expressions are incorrect even if enclosed in single quotes. ‘abc’, ‘543’



## Strings



They are character strings formed by the combination of one or more characters. Unlike characters, they are shown in double quotes “ “. Below you can find a few correct usage examples. Any desired character, including the space character, can be used within double quotes. “Text”, “I want to learn Kotlin”, “123 456”, “email@email.com” You should note that a character string can also contain a single character. “A” - It is a string because it is written in double quotes. 'A' - It is a character because it is written in single quotes.



## Conclusion



Apart from the 3 different data types explained above, there are other data types in Kotlin. We will explain those further when appropriate. These 3 data types will be enough to start with to explain basic commands and operations.
