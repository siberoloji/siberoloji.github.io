---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "2"
categories:
- Kotlin Fundamentals
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-20T15:23:16Z"
excerpt: 'In this article, we will explain some of the finer points you need to know
  about defining variables in the Kotlin programming language. '
guid: https://www.siberoloji.com/?p=715
id: 715
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- kotlin
- kotlin fundamentals
- software
title: Kotlin value assignment and type inference
url: /kotlin-value-assignment-and-type-inference/
---

  In this article, we will explain some of the finer points you need to know about defining variables in the Kotlin programming language. We have prepared this article in addition to the rules we explained in our previous two articles ("<a href="https://www.siberoloji.com/en/kotlin-variable-and-value-definition/" data-type="post" data-id="696" target="_blank" rel="noreferrer noopener">Kotlin Variable and Value definition</a>", "<a href="https://www.siberoloji.com/en/constants-and-variables-in-kotlin/" data-type="post" data-id="706" target="_blank" rel="noreferrer noopener">Constants and variables in Kotlin</a>").
 

  We all know that numbers and letters are different types. While mathematical operations can be performed with numbers, mathematical operations cannot be performed with texts. We should note that this distinction also exists in programming languages. Therefore, every variable must have a type.
 

  The variable definition template in the Kotlin programming language is as follows.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">val/var identifier: Type = initialization</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- At the very beginning is the expression val or var. Val or var selection is made depending on the behavior of the value of the variable. We explained the differences in our article titled "<a href="https://www.siberoloji.com/en/kotlin-variable-and-value-definition/" data-type="post" data-id="696">Kotlin Variable and Value Definition</a>". 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- identifier: So it should be the name of the variable. Choosing a name that is meaningful and explains what it does to avoid confusion with other variables will always be beneficial. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Type: We write the type of the variable here. Expressions that express the type of the value, such as String, Int, Boolean, start with a capital letter. Type is written after writing a colon after the name of the variable. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Initialization: We assign the initial value to our variable. It means initial value. When the type of the variable is determined, the initial value does not have to be assigned immediately. We will give examples of correct and incorrect usage below. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Now let's write an example according to this template. The example below has a structure that fulfills all the rules completely.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val name: String = "John"
    //identifier =name , Type = String, initialization = John
    var age: Int = 16
    //identifier =age , Type = Int, initialization = 16
    println(name)
    println(age)
}
John
16

Process finished with exit code 0</code></pre>
<!-- /wp:code -->

 
 ## Determining the Data Type (type inference)
<!-- /wp:heading -->

  If we determine its initial value (initializer) when we define a variable, we may not write the data type. Kotlin will detect its type by looking at the first value entered. In this way, our codes become simpler. The example is below. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val name= "John"
    //identifier =name , initialization = John
    var age= 16
    //identifier =age , initialization = 16
  
    println(name::class.simpleName)
    println(age::class.simpleName)
}

/* Expected Output
String
Int

Process finished with exit code 0
*/</code></pre>
<!-- /wp:code -->

  As seen in the example above, Kotlin automatically determined the data type by looking at the type of the initial values even though the data types were not entered. When you examine the subject from foreign sources, you can see that this process is referred to as "type inference".
 

 
 ## Defining a Variable Without Initial Value
<!-- /wp:heading -->

  If you want to define a variable but determine its initial value later, you must write the type of the variable. Kotlin cannot determine the type of the variable without the initial value. When a variable is defined for Kotlin, its type must also be determined. The type cannot be changed later. You can see an example of this below.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val name: String
    //identifier =name , Type = String
    var age: Int
    //identifier =age , Type
    name = "John"
    age = 16
}</code></pre>
<!-- /wp:code -->

  As seen in the example, the variable name and type are determined, but the initial value is determined elsewhere. This usage is correct. If the initial value is determined at another time, it is necessary to write the variable type.
 

 
 ## Incorrect variable definition
<!-- /wp:heading -->

  Defining a variable without both a data type and an initial value will cause you to encounter an error. The usage below is incorrect. Your program will not compile.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">fun main() {
    val name //error
    name = "John"
   
    var age //error
    age = 16
}</code></pre>
<!-- /wp:code -->