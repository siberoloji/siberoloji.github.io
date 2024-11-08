---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- C++ Fundamentals
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-06-30T16:43:19Z"
guid: https://www.siberoloji.com/?p=1378
id: 1378
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: C++ Hello World with explanaition
url: /c-hello-world-with-explanaition/
---

<!-- wp:paragraph -->
<p>We tried to explain the most simple C++ program for beginners.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">#include &lt;iostream&gt;

int main() {
    std::cout &lt;&lt; "Hello, World!" &lt;&lt; std::endl;
    return 0;
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The provided code is a simple C++ program that prints "Hello, World!" to the console.</p>
  

<!-- wp:paragraph -->
<p>The first line <code>#include &lt;iostream&gt;</code> is a preprocessor directive that includes the iostream standard library. This library allows for input/output operations. In this case, it's used to output text to the console.</p>
  

<!-- wp:paragraph -->
<p>The next part is the <code>main</code> function. In C++, execution of the program begins with the <code>main</code> function, regardless of where the function is located within the code. The <code>main</code> function is defined with the syntax <code>int main()</code>. The <code>int</code> before <code>main</code> indicates that the function will return an integer value.</p>
  

<!-- wp:paragraph -->
<p>Inside the <code>main</code> function, there's a statement <code>std::cout &lt;&lt; "Hello, World!" &lt;&lt; std::endl;</code>. Here, <code>std::cout</code> is an object of the <code>ostream</code> class from the <code>iostream</code> library. The <code>&lt;&lt;</code> operator is used to send the string "Hello, World!" to the <code>cout</code> object, which then outputs it to the console. The <code>std::endl</code> is a manipulator that inserts a newline character and flushes the output buffer.</p>
  

<!-- wp:paragraph -->
<p>Finally, the <code>main</code> function ends with <code>return 0;</code>. This statement causes the program to exit and return a status of 0 to the operating system. In the context of the <code>main</code> function, returning 0 typically indicates that the program has run successfully without any errors.</p>
  