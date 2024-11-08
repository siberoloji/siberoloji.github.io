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
date: "2024-06-30T23:05:54Z"
guid: https://www.siberoloji.com/?p=1390
id: 1390
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: The use of octal, binary and hexadecimal literals in C++
url: /the-use-of-octal-binary-and-hexadecimal-literals-in-c/
---

  This function defines three integer variables, each initialized with a different type of literal (hexadecimal, octal, binary). It then prints the values of these variables to the console.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">/**
 * @file main.cpp
 * @author ibrahim
 * @date 30-06-2024
 * @brief This program demonstrates the use of octal, binary and hexadecimal literals in C++.
 */

#include &lt;iostream&gt;
using namespace std;

/**
 * @brief The main function of the program.
 *
 * This function defines three integer variables,
 * each initialized with a different type of literal (hexadecimal, octal, binary).
 * It then prints the values of these variables to the console.
 *
 * @return int Returns 0 upon successful execution.
 */
int main() {
    int a = 0x1A; ///&lt; @brief Integer variable 'a' initialized with a hexadecimal literal. The value of 'a' is 26.
    int b = 032; ///&lt; @brief Integer variable 'b' initialized with an octal literal. The value of 'b' is 26.
    int c = 0b1101; ///&lt; @brief Integer variable 'c' initialized with a binary literal. The value of 'c' is 13.

    cout &lt;&lt; "Hexadecimal literal: " &lt;&lt; a &lt;&lt; endl; ///&lt; Prints the value of 'a' to the console.
    cout &lt;&lt; "Octal literal: " &lt;&lt; b &lt;&lt; endl; ///&lt; Prints the value of 'b' to the console.
    cout &lt;&lt; "Binary literal: " &lt;&lt; c &lt;&lt; endl; ///&lt; Prints the value of 'c' to the console.

    return 0; ///&lt; Returns 0 upon successful execution.
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation</h2>
<!-- /wp:heading -->

  The provided C++ code is a simple program that demonstrates the use of different types of integer literals in C++. It includes hexadecimal, octal, and binary literals.</p>
 

  The program begins by including the <code>iostream</code> library, which provides facilities for input/output operations. The <code>using namespace std;</code> statement is used to avoid prefixing the <code>cout</code> and <code>endl</code> with <code>std::</code>.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;</code></pre>
<!-- /wp:code -->

  The <code>main</code> function is the entry point of the program. Inside this function, three integer variables <code>a</code>, <code>b</code>, and <code>c</code> are declared and initialized with a hexadecimal, octal, and binary literal, respectively.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int a = 0x1A; 
int b = 032; 
int c = 0b1101;</code></pre>
<!-- /wp:code -->

  In C++, hexadecimal literals are prefixed with <code>0x</code> or <code>0X</code>, octal literals are prefixed with <code>0</code>, and binary literals are prefixed with <code>0b</code> or <code>0B</code>. The hexadecimal literal <code>0x1A</code> and the octal literal <code>032</code> both represent the decimal number 26, while the binary literal <code>0b1101</code> represents the decimal number 13.</p>
 

  The program then uses <code>cout</code> to print the values of these variables to the console. The <code>endl</code> manipulator is used to insert a new line.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "Hexadecimal literal: " &lt;&lt; a &lt;&lt; endl;
cout &lt;&lt; "Octal literal: " &lt;&lt; b &lt;&lt; endl;
cout &lt;&lt; "Binary literal: " &lt;&lt; c &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  Finally, the <code>main</code> function returns 0 to indicate successful execution of the program.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">return 0;</code></pre>
<!-- /wp:code -->

  This code is a good demonstration of how different types of integer literals can be used in C++.</p>
 