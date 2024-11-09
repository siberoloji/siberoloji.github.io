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
date: "2024-07-03T23:06:58Z"
guid: https://www.siberoloji.com/?p=1439
id: 1439
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: while loop with examples in C++
url: /while-loop-with-examples-in-c/
---

  The provided C++ code demonstrates various uses of the <code>while</code> loop, showcasing how it can be utilized for basic iteration, and how control flow statements like <code>break</code>, <code>continue</code>, and <code>return</code> can be integrated within these loops to manage their execution more precisely. 
 

 
 ## Code
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;

/**
 * Demonstrates various uses of the while loop in C++.
 *
 * This program includes examples of basic while loops, and while loops with control
 * flow statements such as break, continue, and return to manage loop execution.
 */
int main() {
    // Basic while loop example
    int i = 0;
    while (i &lt; 10) {
        cout &lt;&lt; i &lt;&lt; endl; // Prints numbers from 0 to 9
        i++;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl; // Indicates the end of the loop

    // While loop with break statement
    i = 0;
    while (i &lt; 10) {
        if (i == 5) {
            break; // Exits the loop when i equals 5
        }
        cout &lt;&lt; i &lt;&lt; endl; // Prints numbers from 0 to 4
        i++;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl; // Indicates the end of the loop

    // While loop with continue statement
    i = 0;
    while (i &lt; 10) {
        if (i == 5) {
            i++; // Increment before continue to avoid infinite loop
            continue; // Skips the rest of the loop body when i equals 5
        }
        cout &lt;&lt; i &lt;&lt; endl; // Prints numbers from 0 to 9, skipping 5
        i++;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl; // Indicates the end of the loop

    // While loop with return statement
    i = 0;
    while (i &lt; 10) {
        if (i == 5) {
            return 0; // Exits the program when i equals 5
        }
        cout &lt;&lt; i &lt;&lt; endl; // Prints numbers from 0 to 4
        i++;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl; // This line is never reached due to the return statement

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation 
<!-- /wp:heading -->

  The provided C++ code demonstrates various uses of the <code>while</code> loop, showcasing how it can be utilized for basic iteration, and how control flow statements like <code>break</code>, <code>continue</code>, and <code>return</code> can be integrated within these loops to manage their execution more precisely. 
 

  Initially, the code presents a basic <code>while</code> loop example where a counter <code>i</code> is incremented in each iteration until it reaches 10. This loop prints numbers from 0 to 9, illustrating the fundamental use of <code>while</code> for repetitive tasks. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int i = 0;
while (i &lt; 10) {
    cout &lt;&lt; i &lt;&lt; endl;
    i++;
}</code></pre>
<!-- /wp:code -->

  Following this, the code explores a <code>while</code> loop that incorporates a <code>break</code> statement. This loop is designed to exit prematurely when <code>i</code> equals 5. Until that point, it functions similarly to the first loop, printing numbers from 0 to 4. The <code>break</code> statement demonstrates how to exit a loop based on a condition, offering a way to halt iteration when a specific criterion is met. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">if (i == 5) {
    break;
}</code></pre>
<!-- /wp:code -->

  Next, the code introduces a <code>while</code> loop with a <code>continue</code> statement. This loop skips the current iteration when <code>i</code> equals 5, effectively omitting the number 5 from the output. It highlights how <code>continue</code> can be used to skip certain iterations within a loop, based on specific conditions, without exiting the loop entirely. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">if (i == 5) {
    i++;
    continue;
}</code></pre>
<!-- /wp:code -->

  Lastly, the code features a <code>while</code> loop that employs a <code>return</code> statement to exit not just the loop but the entire program when <code>i</code> equals 5. This example shows how <code>return</code> can be used within a loop to terminate the program execution based on a condition, providing a direct way to control the flow of the program from within iterative structures. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">if (i == 5) {
    return 0;
}</code></pre>
<!-- /wp:code -->

  Each of these examples serves to illustrate the flexibility and control that <code>while</code> loops offer in C++, enabling developers to manage loop execution with precision through the use of control flow statements. 
 

 
 ## Output
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">0
1
2
3
4
5
6
7
8
9
Done
0
1
2
3
4
Done
0
1
2
3
4
6
7
8
9
Done
0
1
2
3
4

Process finished with exit code 0</code></pre>
<!-- /wp:code -->