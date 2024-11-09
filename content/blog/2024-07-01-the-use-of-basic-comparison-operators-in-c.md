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
date: "2024-07-01T23:14:53Z"
guid: https://www.siberoloji.com/?p=1427
id: 1427
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: The use of basic comparison operators in C++
url: /the-use-of-basic-comparison-operators-in-c/
---

  The provided C++ code is a simple console application that demonstrates the use of basic comparison operators in C++. 
 

 
 ## Code
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;

int main() {
    // Initialize two integer variables x and y
    int x = 0, y = 0;

    // Print the question: is x equal to y?
    cout &lt;&lt; "Question: is x equal to y?" &lt;&lt; endl;

    // Check if x is equal to y
    if (x == y) {
        // If x is equal to y, print the result
        cout &lt;&lt; "x is equal to y" &lt;&lt; endl;
    }

    // Change the values of x and y
    x = 0, y = 1;

    // Print the question: is x not equal to y?
    cout &lt;&lt; "Question: is x not equal to y?" &lt;&lt; endl;

    // Check if x is not equal to y
    if (x != y) {
        // If x is not equal to y, print the result
        cout &lt;&lt; "x is not equal to y" &lt;&lt; endl;
    }

    // Change the values of x and y
    x = 1, y = 0;

    // Print the question: is x greater than y?
    cout &lt;&lt; "Question: is x greater than y?" &lt;&lt; endl;

    // Check if x is greater than y
    if (x &gt; y) {
        // If x is greater than y, print the result
        cout &lt;&lt; "x is greater than y" &lt;&lt; endl;
    }

    // Change the values of x and y
    x = 2, y = 1;

    // Print the question: is x greater than or equal to y?
    cout &lt;&lt; "Question: is x greater than or equal to y?" &lt;&lt; endl;

    // Check if x is greater than or equal to y
    if (x &gt;= y) {
        // If x is greater than or equal to y, print the result
        cout &lt;&lt; "x is greater than or equal to y" &lt;&lt; endl;
    }

    // Change the values of x and y
    x = 1, y = 2;

    // Print the question: is x less than (or equal to) y?
    cout &lt;&lt; "Question: is x less than (or equal to) y?" &lt;&lt; endl;

    // Check if x is less than or equal to y
    if (x &lt;= y) {
        // If x is less than or equal to y, print the result
        cout &lt;&lt; "x is less than or equal to y" &lt;&lt; endl;
    }

    // End of the program
    return 0;
}
</code></pre>
<!-- /wp:code -->

 
 ## Explanation
<!-- /wp:heading -->

  The provided C++ code is a simple console application that demonstrates the use of basic comparison operators in C++. It does so by initializing two integer variables, <code>x</code> and <code>y</code>, and then comparing them using different operators. 
 

  Initially, <code>x</code> and <code>y</code> are both set to <code>0</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int x = 0, y = 0;</code></pre>
<!-- /wp:code -->

  The code then prints a question to the console asking if <code>x</code> is equal to <code>y</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "Question: is x equal to y?" &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  This is followed by an <code>if</code> statement that checks if <code>x</code> is indeed equal to <code>y</code> using the <code>==</code> operator. If the condition is true, it prints a message to the console: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">if (x == y) {
    cout &lt;&lt; "x is equal to y" &lt;&lt; endl;
}</code></pre>
<!-- /wp:code -->

  The code then changes the values of <code>x</code> and <code>y</code> and repeats the process with different comparison operators (<code>!=</code>, <code>&gt;</code>, <code>&gt;=</code>, <code>&lt;</code>, <code>&lt;=</code>). Each time, it prints a question to the console, checks the condition, and prints a message if the condition is true. 
 

  For example, after changing <code>x</code> to <code>0</code> and <code>y</code> to <code>1</code>, the code checks if <code>x</code> is not equal to <code>y</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">x = 0, y = 1;
cout &lt;&lt; "Question: is x not equal to y?" &lt;&lt; endl;
if (x != y) {
    cout &lt;&lt; "x is not equal to y" &lt;&lt; endl;
}</code></pre>
<!-- /wp:code -->

  This pattern continues until all the comparison operators have been demonstrated. The program then ends with a <code>return 0;</code> statement, indicating successful execution. 
 

 
 ## Output
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">Question: is x equal to y?
x is equal to y
Question: is x not equal to y?
x is not equal to y
Question: is x greater than y?
x is greater than y
Question: is x greater than or equal to y?
x is greater than or equal to y
Question: is x less than (or equal to) y?
x is less than or equal to y

Process finished with exit code 0</code></pre>
<!-- /wp:code -->