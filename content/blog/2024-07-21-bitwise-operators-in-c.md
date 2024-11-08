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
date: "2024-07-21T16:39:05Z"
guid: https://www.siberoloji.com/?p=1452
id: 1452
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: Bitwise operators in C++
url: /bitwise-operators-in-c/
---

  The provided C++ code demonstrates the use of various bitwise operators.  
 

 
 ## Code</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;

/**
 * Demonstrates the use of bitwise operators in C++.
 *
 * Bitwise operators used:
 * - &amp; (AND)
 * - | (OR)
 * - ^ (XOR)
 * - ~ (NOT)
 * - &lt;&lt; (LEFT SHIFT)
 * - &gt;&gt; (RIGHT SHIFT)
 *
 * The program performs bitwise operations on two integers and prints the results.
 *
 * @return int Exit status of the program.
 */
int main() {
    int i = 15; // First integer
    int j = 22; // Second integer

    // Perform bitwise AND operation and print the result
    cout &lt;&lt; (i &amp; j) &lt;&lt; endl; // Expected output: 6

    // Perform bitwise OR operation and print the result
    cout &lt;&lt; (i | j) &lt;&lt; endl; // Expected output: 31

    // Perform bitwise XOR operation and print the result
    cout &lt;&lt; (i ^ j) &lt;&lt; endl; // Expected output: 25

    // Perform bitwise NOT operation on the first integer and print the result
    cout &lt;&lt; (~i) &lt;&lt; endl; // Expected output: -16

    // Perform left shift operation on the first integer and print the result
    cout &lt;&lt; (i &lt;&lt; 2) &lt;&lt; endl; // Expected output: 60

    // Perform right shift operation on the second integer and print the result
    cout &lt;&lt; (j &gt;&gt; 2) &lt;&lt; endl; // Expected output: 5

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation </h2>
<!-- /wp:heading -->

  The provided C++ code demonstrates the use of various bitwise operators. The program begins by including the necessary header file <code>iostream</code> and using the <code>std</code> namespace to simplify the code. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;</code></pre>
<!-- /wp:code -->

  The <code>main</code> function initializes two integer variables, <code>i</code> and <code>j</code>, with the values 15 and 22, respectively. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int i = 15; // First integer
int j = 22; // Second integer</code></pre>
<!-- /wp:code -->

  The program then performs several bitwise operations on these integers and prints the results using <code>cout</code>. 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Bitwise AND (<code>&amp;</code>)</strong>: This operation compares each bit of <code>i</code> and <code>j</code> and returns a new integer where each bit is set to 1 only if both corresponding bits of <code>i</code> and <code>j</code> are 1. The result of <code>i &amp; j</code> is 6.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; (i &amp; j) &lt;&lt; endl; // Expected output: 6</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Bitwise OR (<code>|</code>)</strong>: This operation compares each bit of <code>i</code> and <code>j</code> and returns a new integer where each bit is set to 1 if at least one of the corresponding bits of <code>i</code> or <code>j</code> is 1. The result of <code>i | j</code> is 31.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; (i | j) &lt;&lt; endl; // Expected output: 31</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Bitwise XOR (<code>^</code>)</strong>: This operation compares each bit of <code>i</code> and <code>j</code> and returns a new integer where each bit is set to 1 if only one of the corresponding bits of <code>i</code> or <code>j</code> is 1. The result of <code>i ^ j</code> is 25.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; (i ^ j) &lt;&lt; endl; // Expected output: 25</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Bitwise NOT (<code>~</code>)</strong>: This operation inverts all the bits of <code>i</code>, turning 1s into 0s and vice versa. The result of <code>~i</code> is -16.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; (~i) &lt;&lt; endl; // Expected output: -16</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":5} -->
<ol start="5" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Left Shift (<code>&lt;&lt;</code>)</strong>: This operation shifts the bits of <code>i</code> to the left by 2 positions, effectively multiplying <code>i</code> by 2^2 (or 4). The result of <code>i &lt;&lt; 2</code> is 60.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; (i &lt;&lt; 2) &lt;&lt; endl; // Expected output: 60</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":6} -->
<ol start="6" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Right Shift (<code>&gt;&gt;</code>)</strong>: This operation shifts the bits of <code>j</code> to the right by 2 positions, effectively dividing <code>j</code> by 2^2 (or 4). The result of <code>j &gt;&gt; 2</code> is 5.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; (j &gt;&gt; 2) &lt;&lt; endl; // Expected output: 5</code></pre>
<!-- /wp:code -->

  Finally, the <code>main</code> function returns 0, indicating that the program has executed successfully. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">return 0;</code></pre>
<!-- /wp:code -->

  This code provides a clear and concise demonstration of how bitwise operators work in C++, making it a useful reference for developers looking to understand these operations. 
 

 
 ## Output</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">6
31
25
-16
60
5

Process finished with exit code 0</code></pre>
<!-- /wp:code -->