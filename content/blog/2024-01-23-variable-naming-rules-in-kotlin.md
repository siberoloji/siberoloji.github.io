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
date: "2024-01-23T18:13:19Z"
excerpt: The variable name you choose should explain exactly what the variable does.
  Let's see in order the rules that you are advised to follow so that your code does
  not become complex and incomprehensible.
guid: https://www.siberoloji.com/?p=743
id: 743
image: /assets/images/2024/01/kotlin-1.png
tags:
- kotlin
- kotlin fundamentals
- software
title: Variable naming rules in Kotlin
url: /variable-naming-rules-in-kotlin/
---

  As you know, every variable must have a unique name. Although it may seem problem-free at first, as your software expands, your codes may become difficult to understand. Most of the software developers' time is spent reading the code written by others, not writing code.</p>
 

  If you want the code you write to be easy to read and follow, it is very important to follow the naming rules. The variable name you choose should explain exactly what the variable does. Let's see in order the rules that you are advised to follow so that your code does not become complex and incomprehensible.</p>
 

 
 ## Mandatory Naming Rules</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Names are case sensitive. (number and Number are not the same expression.)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Names must consist only of letters, numbers and underscores.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Names cannot have a number at the beginning (1month is the wrong usage.)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Keywords that the Kotlin software reserves for itself (val, var, fun, etc.) cannot be used as variable names.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Recommended Naming Conventions</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>If a variable name consists of a single word, it must be written in all lowercase letters. (<code>name</code>, <code>message</code>)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>If a variable name consists of more than one word, lowercase Camel style notation should be used. (numberOfStudents, numberOfPages). As can be seen, after the entire first word is written in lowercase, only the first letter of each word should be capitalized.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Although it is not prohibited, you should not start the variable name with an underscore _.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>You must give meaningful names to the variable. As a variable name, the <code>color</code> name will be more descriptive and meaningful than the <code>c</code> expression.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Magic Numbers</h2>
<!-- /wp:heading -->

  In the example command below, the number 7 is written to the screen. It is very difficult for another programmer reading this program to know what the number 7 is. In such cases, numbers should be named using const and used that way, even if they are a constant. When naming, the UPPERCASE_LETTER_SNAKE type should be used. This usage will provide great convenience to understand the code.</p>
 

<!-- wp:heading {"level":3} -->
 ### Not Recommended Use</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    println(7)
}
/* Output
7

Process finished with exit code 0
 */</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Recommended Use</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">const val DAYS_OF_THE_WEEK = 7

fun main() {
    println(DAYS_OF_THE_WEEK)
}
/* Output
7

Process finished with exit code 0
 */</code></pre>
<!-- /wp:code -->

  If you follow the rules we explained above as much as possible, it will be very helpful and save time for both you and your friends who will be involved in the project later.</p>
 