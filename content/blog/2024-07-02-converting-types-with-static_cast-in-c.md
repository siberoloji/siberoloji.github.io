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
date: "2024-07-02T14:23:56Z"
guid: https://www.siberoloji.com/?p=1431
id: 1431
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: Converting types with static_cast in C++
url: /converting-types-with-static_cast-in-c/
---

  The provided C++ code is a simple demonstration of the <code>static_cast</code> operator, which is used to convert an expression to a new type. 
 

 
 ## Code
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">// This program demonstrates the use of static_cast in C++
// static_cast&lt;newtype&gt;(expr) is used to cast an expression to a new type

#include &lt;iostream&gt;
using namespace std;

int main() {
    // Declare and initialize integer variables
    int numberOne = 56;
    int numberTwo = 92;

    // Declare and initialize a character variable
    char character = 'a';

    // Display the character equivalent of numberOne
    // static_cast&lt;char&gt;(numberOne) converts the integer to a character
    cout &lt;&lt; "a" &lt;&lt; " " &lt;&lt; static_cast&lt;char&gt;(numberOne) &lt;&lt; endl;

    // Display the character equivalent of numberTwo
    // static_cast&lt;char&gt;(numberTwo) converts the integer to a character
    cout &lt;&lt; "b" &lt;&lt; " " &lt;&lt; static_cast&lt;char&gt;(numberTwo) &lt;&lt; endl;

    // Display the integer equivalent of character
    // static_cast&lt;int&gt;(character) converts the character to an integer
    cout &lt;&lt; "c" &lt;&lt; " " &lt;&lt; static_cast&lt;int&gt;(character) &lt;&lt; endl;

    // End of program
    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation
<!-- /wp:heading -->

  The provided C++ code is a simple demonstration of the <code>static_cast</code> operator, which is used to convert an expression to a new type. 
 

  The program begins by including the <code>iostream</code> library and declaring the <code>std</code> namespace for usage. This is a common practice in C++ to allow for easier usage of standard library functions, such as <code>cout</code> for console output. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;</code></pre>
<!-- /wp:code -->

  In the <code>main</code> function, three variables are declared and initialized: two integers (<code>numberOne</code> and <code>numberTwo</code>) and one character (<code>character</code>). 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int numberOne = 56;
int numberTwo = 92;
char character = 'a';</code></pre>
<!-- /wp:code -->

  The <code>static_cast</code> operator is then used to convert these variables to different types. The <code>static_cast&lt;char&gt;(numberOne)</code> expression converts the integer <code>numberOne</code> to a character, and its result is printed to the console. The same operation is performed for <code>numberTwo</code>. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "a" &lt;&lt; " " &lt;&lt; static_cast&lt;char&gt;(numberOne) &lt;&lt; endl;
cout &lt;&lt; "b" &lt;&lt; " " &lt;&lt; static_cast&lt;char&gt;(numberTwo) &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  Finally, the <code>character</code> variable is converted to an integer using <code>static_cast&lt;int&gt;(character)</code>, and the result is printed to the console. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "c" &lt;&lt; " " &lt;&lt; static_cast&lt;int&gt;(character) &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  In summary, this program demonstrates how to use the <code>static_cast</code> operator in C++ to convert between different data types. It's a simple but effective illustration of type casting in C++. 
 

 
 ## Output
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">a 8
b \
c 97

Process finished with exit code 0</code></pre>
<!-- /wp:code -->