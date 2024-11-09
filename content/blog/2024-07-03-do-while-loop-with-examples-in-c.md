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
date: "2024-07-03T23:14:07Z"
guid: https://www.siberoloji.com/?p=1441
id: 1441
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: do while loop with examples in C++
url: /do-while-loop-with-examples-in-c/
---

  The provided C++ code demonstrates the use of <code>do-while</code> loops, a variant of loop that ensures the loop's body is executed at least once before the condition is checked. 
 

 
 ## Code
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;

/**
 * Demonstrates various uses of the do-while loop in C++.
 *
 * This program includes examples of basic do-while loops, and do-while loops with control
 * flow statements such as break, continue, and return to manage loop execution.
 */
int main() {
    int i = 0;

    // Basic do-while loop example
    // This loop will execute the block at least once and then check the condition at the end.
    i = 0;
    do {
        cout &lt;&lt; i &lt;&lt; endl; // Prints numbers from 0 to 9
        i++;
    } while (i &lt; 10);
    cout &lt;&lt; "Done" &lt;&lt; endl; // Indicates the end of the loop

    // Do-while loop with break statement
    // This loop demonstrates how to exit the loop prematurely using a break statement.
    i = 0;
    do {
        if (i == 5) {
            break; // Exits the loop when i equals 5
        }
        cout &lt;&lt; i &lt;&lt; endl; // Prints numbers from 0 to 4
        i++;
    } while (i &lt; 10);
    cout &lt;&lt; "Done" &lt;&lt; endl; // Indicates the end of the loop

    // Do-while loop with continue statement
    // This loop shows how to skip the rest of the loop body for the current iteration using continue.
    i = 0;
    do {
        if (i == 5) {
            i++; // Increment before continue to avoid infinite loop
            continue; // Skips printing 5
        }
        cout &lt;&lt; i &lt;&lt; endl; // Prints numbers from 0 to 9, skipping 5
        i++;
    } while (i &lt; 10);
    cout &lt;&lt; "Done" &lt;&lt; endl; // Indicates the end of the loop

    // Do-while loop with return statement
    // This loop demonstrates using return within a loop to exit the program based on a condition.
    i = 0;
    do {
        if (i == 5) {
            return 0; // Exits the program when i equals 5
        }
        cout &lt;&lt; i &lt;&lt; endl; // Prints numbers from 0 to 4
        i++;
    } while (i &lt; 10);
    cout &lt;&lt; "Done" &lt;&lt; endl; // This line is never reached due to the return statement

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation 
<!-- /wp:heading -->

  The provided C++ code demonstrates the use of <code>do-while</code> loops, a variant of loop that ensures the loop's body is executed at least once before the condition is checked. This characteristic differentiates <code>do-while</code> loops from the more common <code>while</code> loops, where the condition is evaluated before the loop body is executed. 
 

  The first example in the code is a basic <code>do-while</code> loop that prints numbers from 0 to 9. The loop starts with <code>i</code> initialized to 0 and increments <code>i</code> in each iteration. The condition <code>i &lt; 10</code> is checked after the loop body is executed, ensuring that the loop runs at least once. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">do {
    cout &lt;&lt; i &lt;&lt; endl;
    i++;
} while (i &lt; 10);</code></pre>
<!-- /wp:code -->

  Next, the code demonstrates how to use a <code>break</code> statement within a <code>do-while</code> loop to exit the loop prematurely. In this example, the loop is designed to break when <code>i</code> equals 5, thus it prints numbers from 0 to 4 before exiting. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">do {
    if (i == 5) {
        break;
    }
    cout &lt;&lt; i &lt;&lt; endl;
    i++;
} while (i &lt; 10);</code></pre>
<!-- /wp:code -->

  Following that, a <code>do-while</code> loop with a <code>continue</code> statement is shown. This loop skips the current iteration when <code>i</code> equals 5 by using <code>continue</code>, which causes the loop to immediately proceed to the next iteration. To prevent an infinite loop, <code>i</code> is incremented before the <code>continue</code> statement. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">do {
    if (i == 5) {
        i++;
        continue;
    }
    cout &lt;&lt; i &lt;&lt; endl;
    i++;
} while (i &lt; 10);</code></pre>
<!-- /wp:code -->

  Lastly, the code includes a <code>do-while</code> loop with a <code>return</code> statement. This loop exits not just the loop but the entire program when <code>i</code> equals 5. This demonstrates how a <code>return</code> statement can be used within a loop to control the flow of the program based on certain conditions. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">do {
    if (i == 5) {
        return 0;
    }
    cout &lt;&lt; i &lt;&lt; endl;
    i++;
} while (i &lt; 10);</code></pre>
<!-- /wp:code -->

  Each of these examples illustrates different ways to control the execution flow within <code>do-while</code> loops, showcasing their flexibility and utility in scenarios where at least one iteration of the loop is required. 
 

 
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