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
date: "2024-07-02T14:04:46Z"
guid: https://www.siberoloji.com/?p=1429
id: 1429
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: 'How to print an integer in different number systems: hexadecimal, decimal,
  and octal?'
url: /how-to-print-an-integer-in-different-number-systems-hexadecimal-decimal-and-octal/
---

  The provided C++ code is a simple program that demonstrates how to print an integer in different number systems: hexadecimal, decimal, and octal. 
 

 
 ## Code
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">/**
* This is the main function of the program.
 * It demonstrates different ways to print an integer
 * in different number systems (hexadecimal, decimal, and octal).
 *
 * The function does the following:
 * 1. Declares an integer variable named `byte` and initializes it with the value 255.
 * 2. Prints the value of `byte` in hexadecimal format.
 * 3. Prints the value of `byte` in the last used number base
 * (which is hexadecimal from the previous line),
 * then it changes the number base to decimal and prints the `byte` again.
 * 4. Changes the number base to octal and prints the `byte`.
 *
 * @return 0 if the program runs successfully.
 */
#include &lt;iostream&gt;
#include &lt;iomanip&gt;

using namespace std;
int main() {
    int byte = 255;
    cout &lt;&lt; hex &lt;&lt; byte &lt;&lt; endl;
    cout &lt;&lt; byte &lt;&lt; dec &lt;&lt; byte &lt;&lt; endl;
    cout &lt;&lt; oct &lt;&lt; byte &lt;&lt; endl;
    // we can achieve same result with setbase function
    // setbase accept only 2, 8, 10 or 16 as parameter
    // setbase requires iomanip header

    cout &lt;&lt; setbase(16) &lt;&lt; byte &lt;&lt; endl;
    cout &lt;&lt; setbase(10) &lt;&lt; byte &lt;&lt; endl;
    cout &lt;&lt; setbase(8) &lt;&lt; byte &lt;&lt; endl;
    cout &lt;&lt; setbase(2) &lt;&lt; byte &lt;&lt; endl;

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation
<!-- /wp:heading -->

  The provided C++ code is a simple program that demonstrates how to print an integer in different number systems: hexadecimal, decimal, and octal. 
 

  The program begins by including the necessary libraries, <code>iostream</code> for input/output operations and <code>iomanip</code> for input/output manipulations. The <code>using namespace std;</code> line allows the program to use the standard namespace, which includes functions like <code>cout</code> and <code>endl</code>. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
#include &lt;iomanip&gt;
using namespace std;</code></pre>
<!-- /wp:code -->

  The <code>main</code> function is the entry point of the program. Inside this function, an integer variable named <code>byte</code> is declared and initialized with the value 255. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int main() {
    int byte = 255;</code></pre>
<!-- /wp:code -->

  The program then prints the value of <code>byte</code> in hexadecimal format using the <code>hex</code> manipulator. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; hex &lt;&lt; byte &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  Next, the program prints the value of <code>byte</code> in the last used number base (which is hexadecimal from the previous line), then it changes the number base to decimal using the <code>dec</code> manipulator and prints the <code>byte</code> again. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; byte &lt;&lt; dec &lt;&lt; byte &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  The number base is then changed to octal using the <code>oct</code> manipulator and the <code>byte</code> is printed again. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; oct &lt;&lt; byte &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  Finally, the program demonstrates another way to change the number base using the <code>setbase</code> function from the <code>iomanip</code> library. This function accepts only 2, 8, 10, or 16 as parameters, representing binary, octal, decimal, and hexadecimal number systems respectively.<br>cout &lt;&lt; setbase(16) &lt;&lt; byte &lt;&lt; endl;<br>cout &lt;&lt; setbase(10) &lt;&lt; byte &lt;&lt; endl;<br>cout &lt;&lt; setbase(8) &lt;&lt; byte &lt;&lt; endl; 
 

 
 ## Output
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">ff
ff255
377
ff
255
377
255

Process finished with exit code 0</code></pre>
<!-- /wp:code -->