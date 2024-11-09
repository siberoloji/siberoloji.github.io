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
date: "2024-01-01T14:13:06Z"
excerpt: When starting to learn programming languages, we always start with the same
  example. Let's start our Kotlin programming article with the "Hello World" program
  without breaking tradition.
guid: https://www.siberoloji.com/?p=517
id: 517
image: /assets/images/2022/02/KotlinFullColorLogoMarkRGB-250-250.png
tags:
- kotlin
- kotlin fundamentals
- software
title: First Kotlin Program &#8220;Hello World&#8221;
url: /first-kotlin-program-hello-world/
---

  When starting to learn programming languages, we always start with the same example. Let's start our Kotlin programming article with the "Hello World" program without breaking tradition.
 

  You can copy the code you see below and paste it into your editor, or you can go to the "<a href="https://play.kotlinlang.org/" data-type="link" data-id="https://play.kotlinlang.org/">Kotlin Playground</a>" page via your Web browser and try the codes there.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">// First program in kotlin
fun main() {
    println("Hello World")
}</code></pre>
<!-- /wp:code -->

  Explanation:
 

  The line that starts with the <code>//</code> sign is the comment line. The compiler does not accept this line as code. It is used to take notes or make explanations about which code does what.
 

  The <code>fun</code> expression refers to the beginning of a function.
 

  <code>main()</code> is the entry point of Kotlin programs. It is case sensitive.
 

  A code block is written between <code>{ }</code> signs.
 

  <code>println("Hello World")</code> is a code expression you see here. When we send the "Hello World" parameter to the println() function, it will write the sent parameter to the screen and move to the next line. If you want, you can print more than one line under each other. Here is an example.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">// First program in kotlin
fun main() {
    println("Hello World")
    println("I am the first Kotlin Program")
}</code></pre>
<!-- /wp:code -->

  When we run the example above, you should get the following output.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">Hello World
I am the first Kotlin Program

Process finished with exit code 0</code></pre>
<!-- /wp:code -->