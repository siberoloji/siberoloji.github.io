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
date: "2024-07-01T14:12:00Z"
guid: https://www.siberoloji.com/?p=1420
id: 1420
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: The usage of pre-increment and post-increment operators
url: /the-usage-of-pre-increment-and-post-increment-operators/
---

  This code snippet demonstrates the usage of pre-increment and post-increment operators in C++.
 

 
 ## Code
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">/**
* Main function that demonstrates the usage of pre-increment and post-increment operators.
 *
 * @return 0 indicating successful execution
 *
 * @throws None
 */

#include &lt;iostream&gt;
using namespace std;

int main() {
    int numberOne = 1;
    int numberTwo = 2;
    int numberThree = 3;
    int numberFour = 4;

    // numberOne current value is 1
    int result = numberOne++; // Assignment and increment after the operation
    cout &lt;&lt; "Number One: " &lt;&lt; numberOne &lt;&lt; endl;
    cout &lt;&lt; "Result: " &lt;&lt; result &lt;&lt; endl;
    cout &lt;&lt; "----" &lt;&lt; endl;

    //numberTwo current value is 2
    result = ++numberTwo; // Increment and assignment before the operation
    cout &lt;&lt; "Number Two: " &lt;&lt; numberTwo &lt;&lt; endl;
    cout &lt;&lt; "Result: " &lt;&lt; result &lt;&lt; endl;
    cout &lt;&lt; "----" &lt;&lt; endl;

    //numberThree current value is 3
    result = numberThree--; // Assignment and decrement after the operation
    cout &lt;&lt; "Number Three: " &lt;&lt; numberThree &lt;&lt; endl;
    cout &lt;&lt; "Result: " &lt;&lt; result &lt;&lt; endl;
    cout &lt;&lt; "----" &lt;&lt; endl;

    //numberFour current value is 4
    result = --numberFour; // Decrement and assignment before the operation
    cout &lt;&lt; "Number Four: " &lt;&lt; numberFour &lt;&lt; endl;
    cout &lt;&lt; "Result: " &lt;&lt; result &lt;&lt; endl;

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation
<!-- /wp:heading -->

  The provided C++ code is a simple demonstration of the usage of pre-increment (<code>++var</code>), post-increment (<code>var++</code>), pre-decrement (<code>--var</code>), and post-decrement (<code>var--</code>) operators in C++.
 

  The main function starts by declaring four integer variables <code>numberOne</code>, <code>numberTwo</code>, <code>numberThree</code>, and <code>numberFour</code> with initial values of 1, 2, 3, and 4 respectively.
 

  The first operation is <code>numberOne++</code>. This is a post-increment operation, which means the current value of <code>numberOne</code> is assigned to <code>result</code> before <code>numberOne</code> is incremented. Therefore, <code>result</code> will be 1 (the original value of <code>numberOne</code>), and <code>numberOne</code> will be incremented to 2.
 

  Next, the operation <code>++numberTwo</code> is a pre-increment operation. Here, <code>numberTwo</code> is incremented before the assignment operation. So, <code>numberTwo</code> becomes 3, and this new value is assigned to <code>result</code>.
 

  The third operation is <code>numberThree--</code>, a post-decrement operation. Similar to the post-increment, the current value of <code>numberThree</code> is assigned to <code>result</code> before <code>numberThree</code> is decremented. So, <code>result</code> will be 3, and <code>numberThree</code> will be decremented to 2.
 

  Finally, the operation <code>--numberFour</code> is a pre-decrement operation. Here, <code>numberFour</code> is decremented before the assignment operation. So, <code>numberFour</code> becomes 3, and this new value is assigned to <code>result</code>.
 

  After each operation, the new values of the variables and <code>result</code> are printed to the console for verification. The function then returns 0, indicating successful execution.
 

 
 ## Output
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">Number One: 2
Result: 1
----
Number Two: 3
Result: 3
----
Number Three: 2
Result: 3
----
Number Four: 3
Result: 3

Process finished with exit code 0</code></pre>
<!-- /wp:code -->