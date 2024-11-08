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
date: "2024-07-01T14:31:46Z"
guid: https://www.siberoloji.com/?p=1422
id: 1422
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: Shortcut operators in C++
url: /shortcut-operators-in-c/
---

  The provided code is a C++ program that demonstrates the use of shortcut operators. It includes the <code>iostream</code> library, which is used for input/output operations, and the <code>std</code> namespace is being used. 
 

 
 ## Code</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">/**
* Main function to demonstrate shortcut operators in C++.
 *
 * @return 0 indicating successful execution
 */

#include &lt;iostream&gt;
using namespace std;

int main() {
    int num1 = 1;
    int num2 = 2;
    int num3 = 3;
    int num4 = 4;
    int num5 = 5;
    int num6 = 6;
    int num7 = 7;
    int num8 = 8;
    int num9 = 9;
    int num10 = 10;

    num1 += num2;
    num3 -= num4;
    num5 *= num6;
    num7 /= num8;
    num9 %= num10;

    cout &lt;&lt; "num1 = " &lt;&lt; num1 &lt;&lt; endl;
    cout &lt;&lt; "num3 = " &lt;&lt; num3 &lt;&lt; endl;
    cout &lt;&lt; "num5 = " &lt;&lt; num5 &lt;&lt; endl;
    cout &lt;&lt; "num7 = " &lt;&lt; num7 &lt;&lt; endl;
    cout &lt;&lt; "num9 = " &lt;&lt; num9 &lt;&lt; endl;

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation</h2>
<!-- /wp:heading -->

  The provided code is a C++ program that demonstrates the use of shortcut operators. It includes the <code>iostream</code> library, which is used for input/output operations, and the <code>std</code> namespace is being used. 
 

  The <code>main</code> function is the entry point of the program. It initializes ten integer variables <code>num1</code> through <code>num10</code> with values from 1 to 10 respectively. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int num1 = 1;
int num2 = 2;
// ...
int num10 = 10;</code></pre>
<!-- /wp:code -->

  The program then demonstrates the use of various shortcut operators. The <code>+=</code> operator adds the value of <code>num2</code> to <code>num1</code> and assigns the result to <code>num1</code>. The <code>-=</code> operator subtracts <code>num4</code> from <code>num3</code> and assigns the result to <code>num3</code>. The <code>*=</code> operator multiplies <code>num5</code> by <code>num6</code> and assigns the result to <code>num5</code>. The <code>/=</code> operator divides <code>num7</code> by <code>num8</code> and assigns the result to <code>num7</code>. The <code>%=</code> operator calculates the remainder of <code>num9</code> divided by <code>num10</code> and assigns the result to <code>num9</code>. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">num1 += num2;
num3 -= num4;
num5 *= num6;
num7 /= num8;
num9 %= num10;</code></pre>
<!-- /wp:code -->

  Finally, the program prints the values of <code>num1</code>, <code>num3</code>, <code>num5</code>, <code>num7</code>, and <code>num9</code> to the console using the <code>cout</code> object and the <code>&lt;&lt;</code> operator, which is used to send output to the standard output device (usually the screen). 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "num1 = " &lt;&lt; num1 &lt;&lt; endl;
// ...
cout &lt;&lt; "num9 = " &lt;&lt; num9 &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  The <code>endl</code> manipulator is used to insert a new line. The program ends by returning 0, indicating successful execution. 
 

 
 ## Output</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">num1 = 3
num3 = -1
num5 = 30
num7 = 0
num9 = 9

Process finished with exit code 0</code></pre>
<!-- /wp:code -->