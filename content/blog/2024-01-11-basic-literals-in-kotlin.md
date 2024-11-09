---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Kotlin Fundamentals
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-11T22:48:55Z"
excerpt: No matter how complicated, all programming languages perform operations on
  integers, characters, strings, etc. performed on values. We call these values Literal
  expressions
guid: https://www.siberoloji.com/?p=620
id: 620
image: /assets/images/2024/01/james-harrison-vpOeXr5wmR4-unsplash.jpg
tags:
- kotlin
- kotlin fundamentals
- software
title: Basic Literals in Kotlin
url: /basic-literals-in-kotlin/
---

  No matter how complicated, all programming languages perform operations on integers, characters, strings, etc. performed on values. We call these values Literal expressions. It would be very appropriate to explain these types before starting to write a program. These are integers, characters, and strings. 
 

 
 ## Integers
<!-- /wp:heading -->

  We constantly use integers to count things in our daily lives and in mathematics. The same integers are also used in Kotlin. All the numbers you see below are integers. For example;<br>0, 1, 2, 10, 11, 100<br>If an integer contains many digits, we can split the integer into blocks using _ (underscore) to make it easier to read and understand. For example;<br>Instead of 1000000, we can write it as 1_000_000. This means the same integer for both Kotlins. As long as the underscore is not at the beginning or end of the numbers, it can be used as desired. 1__000_000 , 1_2_3 These expressions are also true.<br>An error occurs when you type _<em>10 or 100</em>_. 
 

 
 ## Characters
<!-- /wp:heading -->

  A single number, font and space, * - etc. It is a data type used to represent some special characters. The first thing to consider here is that there should be a single character. Characters are written in single quotes ' ' as seen below.<br>'A', 'a', 'x', 'y', '2', '8', '*', ' ', '$' all these expressions are called characters.<br>Since the character data type can contain a single expression, the following expressions are incorrect even if enclosed in single quotes.<br>‘abc’, ‘543’ 
 

 
 ## Strings
<!-- /wp:heading -->

  They are character strings formed by the combination of one or more characters. Unlike characters, they are shown in double quotes “ “. Below you can find a few correct usage examples. Any desired character, including the space character, can be used within double quotes.<br>“Text”, “I want to learn Kotlin”, “123 456”, “email@email.com”<br>You should note that a character string can also contain a single character.<br>“A” - It is a string because it is written in double quotes.<br>'A' - It is a character because it is written in single quotes. 
 

 
 ## Conclusion
<!-- /wp:heading -->

  Apart from the 3 different data types explained above, there are other data types in Kotlin. We will explain those further when appropriate. These 3 data types will be enough to start with to explain basic commands and operations. 
 