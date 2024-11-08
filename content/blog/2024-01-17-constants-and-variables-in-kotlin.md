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
date: "2024-01-17T23:01:33Z"
excerpt: We introduced the topic of defining variables and assigning values in the
  Kotlin programming language in our previous article. In this article, we will take
  a closer look at assigning values with const and val.
guid: https://www.siberoloji.com/?p=706
id: 706
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- kotlin
- kotlin fundamentals
- software
title: Constants and variables in Kotlin
url: /constants-and-variables-in-kotlin/
---

  We introduced the topic of defining variables and assigning values in the Kotlin programming language in our <a href="https://www.siberoloji.com/en/kotlin-variable-and-value-definition/" data-type="post" data-id="696" target="_blank" rel="noreferrer noopener">previous article</a>. In this article, we will take a closer look at assigning values with const and val.</p>
 

 
 ## val variables</h2>
<!-- /wp:heading -->

  The code below defines two variables, an integer containing the constant number <code>pi</code> and a String value named <code>helloMsg</code>. These values cannot be changed again after they are first assigned.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val pi = 3.1415
    val helloMsg = "Hello"

    println(pi)       // 3.1415
    println(helloMsg) // Hello
}</code></pre>
<!-- /wp:code -->

  Let's try to assign a new value to the <code>pi</code> variable, which is defined with the <code>val</code> keyword and assigned its initial value. As seen in the example below, when we want to assign a new value to the number <code>pi</code>, you receive the error "<mark class="has-inline-color has-vivid-red-color"><strong>Val cannot be reassigned</strong></mark>".</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
val pi = 3.1415
val helloMsg = "Hello"

println(pi) // 3.1415
println(helloMsg) // Hello

pi = 3.1416 // Val cannot be reassigned
}</code></pre>
<!-- /wp:code -->

  You cannot use a variable that is defined with <code>val</code> but has not been initialized, that is, has not been initialized, in your commands. Let's explain this with an example. With the code below, the variable named <code>boolFalse</code> is defined with <code>val</code>, but since its initial value (True or False) is not assigned even though its type is specified as Boolean, you will receive the error message "<strong><mark class="has-inline-color has-vivid-red-color">Variable 'boolFalse' must be initialized</mark></strong>".</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">val boolFalse: Boolean
println(boolFalse) // error line</code></pre>
<!-- /wp:code -->

  Correct usage should be as follows.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">val boolFalse: Boolean // not initialized
    boolFalse = false      // initialized
    println(boolFalse)     // no errors here</code></pre>
<!-- /wp:code -->

 
 ## const variables</h2>
<!-- /wp:heading -->

  In Kotlin programming, there is a constant value assignment method in which the <code>const</code> keyword and the <code>val</code> expression are defined together. With this method, the constant value is created when the program codes are compiled and cannot be changed again. As a rule, it is recommended that the names of variables defined as <code>const</code> be in all CAPITAL LETTERS. </p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">const val WRITER_NAME = "JOHN DOE"</code></pre>
<!-- /wp:code -->

  There are some rules for defining a constant value in this way.</p>
 

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Only String and INT, CHAR, DOUBLE, BOOLEAN data types, which we call primary types, can be assigned to constant values. An example of this is shown below.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Constants should be defined outside functions. They cannot be defined with a const statement within a function.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">const val CONST_INT = 256
const val CONST_DOUBLE = 3.14
const val CONST_CHAR = 'f'
const val CONST_STRING = "I am constant"
const val CONST_ARRAY = arrayOf(1, 2, 3) // error: only primitives and strings are allowed
fun main() {
    println(CONST_INT)
    println(CONST_STRING)

}</code></pre>
<!-- /wp:code -->

  These explanations and rules may seem a bit confusing at first. Remember that these are necessary for the written code to work correctly and without errors. As you practice, you will become more familiar with these rules.</p>
 