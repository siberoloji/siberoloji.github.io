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
date: "2024-07-16T19:13:03Z"
guid: https://www.siberoloji.com/?p=1450
id: 1450
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: logical AND (&amp;&amp;) and OR (||) operators in C++
url: /logical-and-and-or-operators-in-c/
---

<!-- wp:paragraph -->
<p>The provided C++ code demonstrates the use of logical operators: AND (<code>&amp;&amp;</code>), OR (<code>||</code>), and NOT (<code>!</code>), through a series of comparisons between three initialized integer variables (<code>x</code>, <code>y</code>, and <code>z</code>).
  

 
 ## Code
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">/**
* @file main.cpp
 * @brief Demonstrates the use of logical AND (&amp;&amp;) and OR (||) operators in C++.
 *
 * This program initializes three integer variables, x, y, and z, and then demonstrates
 * the use of logical AND (&amp;&amp;) and OR (||) operators by comparing these variables in
 * various expressions. It also shows the use of the NOT (!) operator and explains
 * the precedence of logical operators in C++.
 */

#include &lt;iostream&gt;
using namespace std;

int main() {
    // Initialize variables
    int x = 5, y = 10, z = 15;

    // Display the values of x, y, and z
    cout &lt;&lt; "x = " &lt;&lt; x &lt;&lt; ", y = " &lt;&lt; y &lt;&lt; ", z = " &lt;&lt; z &lt;&lt; endl;

    // Demonstrate logical AND (&amp;&amp;)
    cout &lt;&lt; "x &lt; y &amp;&amp; y &lt; z = " &lt;&lt; (x &lt; y &amp;&amp; y &lt; z) &lt;&lt; endl; // True, both conditions are true
    cout &lt;&lt; "x &lt; y &amp;&amp; y &gt; z = " &lt;&lt; (x &lt; y &amp;&amp; y &gt; z) &lt;&lt; endl; // False, second condition is false

    // Demonstrate logical OR (||)
    cout &lt;&lt; "x &lt; y || y &gt; z = " &lt;&lt; (x &lt; y || y &gt; z) &lt;&lt; endl; // True, first condition is true
    cout &lt;&lt; "x &gt; y || y &gt; z = " &lt;&lt; (x &gt; y || y &gt; z) &lt;&lt; endl; // False, both conditions are false

    // Demonstrate logical NOT (!)
    cout &lt;&lt; "!(x &lt; y) = " &lt;&lt; !(x &lt; y) &lt;&lt; endl; // False, negates true condition
    cout &lt;&lt; "!(x &gt; y) = " &lt;&lt; !(x &gt; y) &lt;&lt; endl; // True, negates false condition

    // Explain operator precedence
    cout &lt;&lt; "priority of &amp;&amp; is higher than ||" &lt;&lt; endl;

    // Demonstrate precedence with examples
    cout &lt;&lt; "x &lt; y &amp;&amp; y &lt; z || x &gt; z = " &lt;&lt; (x &lt; y &amp;&amp; y &lt; z || x &gt; z) &lt;&lt; endl;
    // True, &amp;&amp; evaluated first
    cout &lt;&lt; "x &lt; y || y &lt; z &amp;&amp; x &gt; z = " &lt;&lt; (x &lt; y || y &lt; z &amp;&amp; x &gt; z) &lt;&lt; endl;
    // True, &amp;&amp; evaluated first despite || appearing first

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The provided C++ code demonstrates the use of logical operators: AND (<code>&amp;&amp;</code>), OR (<code>||</code>), and NOT (<code>!</code>), through a series of comparisons between three initialized integer variables (<code>x</code>, <code>y</code>, and <code>z</code>). It serves as an educational example to illustrate how these operators function in conditional statements and their precedence rules.
  

<!-- wp:paragraph -->
<p>Initially, the code sets up three variables <code>x</code>, <code>y</code>, and <code>z</code> with values 5, 10, and 15, respectively. This setup is crucial for the subsequent comparisons:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int x = 5, y = 10, z = 15;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The demonstration of the logical AND (<code>&amp;&amp;</code>) operator is shown through two examples. The first example checks if <code>x</code> is less than <code>y</code> AND <code>y</code> is less than <code>z</code>, which evaluates to true since both conditions are satisfied:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "x &lt; y &amp;&amp; y &lt; z = " &lt;&lt; (x &lt; y &amp;&amp; y &lt; z) &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The logical OR (<code>||</code>) operator is similarly demonstrated. An example provided checks if <code>x</code> is less than <code>y</code> OR <code>y</code> is greater than <code>z</code>. This expression evaluates to true because the first condition is true, illustrating that only one condition needs to be true for the OR operator to result in true:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "x &lt; y || y &gt; z = " &lt;&lt; (x &lt; y || y &gt; z) &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The NOT (<code>!</code>) operator's demonstration negates the truth value of the condition it precedes. For instance, negating the condition <code>x &lt; y</code> results in false because <code>x &lt; y</code> is true, and NOT true is false:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "!(x &lt; y) = " &lt;&lt; !(x &lt; y) &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Lastly, the code touches upon the precedence of logical operators, stating that AND (<code>&amp;&amp;</code>) has a higher precedence than OR (<code>||</code>). This is crucial in understanding how complex logical expressions are evaluated. The provided examples show that even if OR appears first in an expression, the AND part is evaluated first due to its higher precedence:
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "x &lt; y &amp;&amp; y &lt; z || x &gt; z = " &lt;&lt; (x &lt; y &amp;&amp; y &lt; z || x &gt; z) &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This code snippet is a straightforward demonstration aimed at those familiar with C++ but perhaps not with the intricacies of logical operators and their precedence.
  

 
 ## Output
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">x = 5, y = 10, z = 15
x &lt; y &amp;&amp; y &lt; z = 1
x &lt; y &amp;&amp; y &gt; z = 0
x &lt; y || y &gt; z = 1
x &gt; y || y &gt; z = 0
!(x &lt; y) = 0
!(x &gt; y) = 1
priority of &amp;&amp; is higher than ||
x &lt; y &amp;&amp; y &lt; z || x &gt; z = 1
x &lt; y || y &lt; z &amp;&amp; x &gt; z = 1

Process finished with exit code 0</code></pre>
<!-- /wp:code -->