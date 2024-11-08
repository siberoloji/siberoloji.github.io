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
date: "2024-06-30T22:47:17Z"
guid: https://www.siberoloji.com/?p=1385
id: 1385
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: C++ int variable with different defining ways
url: /c-int-variable-with-different-defining-ways/
---

  We are explaining the use of int variables with different defining ways 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">// Creator: ibrahim (30.06.2024 00:00)    
/**
 * @file main.cpp
 * @brief Demonstrates the use of int with different defining ways in C++
 */

#include &lt;iostream&gt;

/**
 * @brief Main function of the program
 * 
 * Defines four integer variables in different ways and prints their values.
 * 
 * @return int Returns 0 upon successful execution
 */
int main() {
    int numberOne = 5; ///&lt; 5 is a decimal number by default in C++
    int numberTwo = 1111111111; ///&lt; 1111111111 is a decimal number by default in C++
    int numberThree = 1'111'111'111; ///&lt; 1'111'111'111 is a decimal number by default in C++
    int numberFour = -1'111'111'111; ///&lt; -1'111'111'111 is a decimal number by default in C++

    std::cout &lt;&lt; "numberOne: " &lt;&lt; numberOne &lt;&lt; std::endl;
    std::cout &lt;&lt; "numberTwo: " &lt;&lt; numberTwo &lt;&lt; std::endl;
    std::cout &lt;&lt; "numberThree: " &lt;&lt; numberThree &lt;&lt; std::endl;
    std::cout &lt;&lt; "numberFour: " &lt;&lt; numberFour &lt;&lt; std::endl;

    return 0;
}</code></pre>
<!-- /wp:code -->

  The provided C++ code is a simple demonstration of how to define integer variables in different ways. It includes the use of single quotes as digit separators for readability, which is a feature available in C++14 and later versions. 
 

  The code begins by including the <code>iostream</code> library, which provides facilities for input/output operations. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;</code></pre>
<!-- /wp:code -->

  In the <code>main</code> function, four integer variables are defined: <code>numberOne</code>, <code>numberTwo</code>, <code>numberThree</code>, and <code>numberFour</code>. Each of these variables is assigned a different integer value. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int numberOne = 5;
int numberTwo = 1111111111;</code></pre>
<!-- /wp:code -->

  The third and fourth variables, <code>numberThree</code> and <code>numberFour</code>, are defined using digit separators (single quotes) for better readability. This does not change the value of the integer; it's purely for making the code easier to read. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int numberThree = 1'111'111'111;
int numberFour = -1'111'111'111;</code></pre>
<!-- /wp:code -->

  The code then uses <code>std::cout</code> to print the values of these variables to the console. Each variable is printed on a new line. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">std::cout &lt;&lt; "numberOne: " &lt;&lt; numberOne &lt;&lt; std::endl;</code></pre>
<!-- /wp:code -->

  Finally, the <code>main</code> function returns 0, indicating successful execution of the program. 
 