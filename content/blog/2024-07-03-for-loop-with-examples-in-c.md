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
date: "2024-07-03T23:22:05Z"
guid: https://www.siberoloji.com/?p=1443
id: 1443
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: for loop with examples in C++
url: /for-loop-with-examples-in-c/
---

  The provided C++ code demonstrates various uses of the <code>for</code> loop, incorporating control flow statements such as <code>break</code>, <code>continue</code>, and <code>return</code> to manage loop execution. 
 

 
 ## Code
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;

/**
 * Demonstrates various uses of the for loop in C++.
 *
 * This program includes examples of basic for loops, and for loops with control
 * flow statements such as break, continue, and return to manage loop execution.
 * It showcases how these control flow statements can alter the loop's behavior.
 */
int main() {
    int i = 0;

    // Basic for loop example: prints numbers from 0 to 9
    for (i = 0; i &lt; 10; i++) {
        cout &lt;&lt; i &lt;&lt; endl;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl;

    // For loop with break: exits the loop when i equals 5
    for (i = 0; i &lt; 10; i++) {
        if (i == 5) {
            break;
        }
        cout &lt;&lt; i &lt;&lt; endl;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl;

    // For loop with continue: skips the current iteration when i equals 5
    for (i = 0; i &lt; 10; i++) {
        if (i == 5) {
            continue;
        }
        cout &lt;&lt; i &lt;&lt; endl;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl;

    // For loop with return: exits the function when i equals 5
    for (i = 0; i &lt; 10; i++) {
        if (i == 5) {
            return 0;
        }
        cout &lt;&lt; i &lt;&lt; endl;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl;

    // For loop with break and return:
    // demonstrates that break has no effect when followed by return
    for (i = 0; i &lt; 10; i++) {
        if (i == 5) {
            break;
        }
        cout &lt;&lt; i &lt;&lt; endl;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl;

    // For loop with continue and return:
    // demonstrates that continue has no effect when followed by return
    for (i = 0; i &lt; 10; i++) {
        if (i == 5) {
            continue;
        }
        cout &lt;&lt; i &lt;&lt; endl;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl;

    // For loop with break and continue:
    // breaks the loop when i equals 5, continue is never reached
    for (i = 0; i &lt; 10; i++) {
        if (i == 5) {
            break;
        }
        if (i == 7) {
            continue;
        }
        cout &lt;&lt; i &lt;&lt; endl;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl;

    // For loop with break, continue, and return:
    // demonstrates control flow with break, continue is never reached
    for (i = 0; i &lt; 10; i++) {
        if (i == 5) {
            break;
        }
        if (i == 7) {
            continue;
        }
        cout &lt;&lt; i &lt;&lt; endl;
    }
    cout &lt;&lt; "Done" &lt;&lt; endl;

    return 0;
}
</code></pre>
<!-- /wp:code -->

 
 ## Explanation
<!-- /wp:heading -->

  The provided C++ code demonstrates various uses of the <code>for</code> loop, incorporating control flow statements such as <code>break</code>, <code>continue</code>, and <code>return</code> to manage loop execution. These examples illustrate how to control the flow within loops for different scenarios, making the code a valuable resource for understanding loop control mechanisms in C++. 
 

  Initially, a basic <code>for</code> loop is shown, which iterates from 0 to 9, printing each number. This loop serves as a straightforward example of using a <code>for</code> loop for simple iterations. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">for (i = 0; i &lt; 10; i++) {
    cout &lt;&lt; i &lt;&lt; endl;
}</code></pre>
<!-- /wp:code -->

  Following this, the code explores using a <code>break</code> statement within a <code>for</code> loop. This loop is designed to exit prematurely when <code>i</code> equals 5, demonstrating how <code>break</code> can be used to stop loop execution based on a condition. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">for (i = 0; i &lt; 10; i++) {
    if (i == 5) {
        break;
    }
    cout &lt;&lt; i &lt;&lt; endl;
}</code></pre>
<!-- /wp:code -->

  Next, a <code>for</code> loop with a <code>continue</code> statement is introduced. This loop skips the current iteration when <code>i</code> equals 5, effectively omitting the number 5 from the output. It showcases how <code>continue</code> can be used to skip certain iterations within a loop, based on specific conditions. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">for (i = 0; i &lt; 10; i++) {
    if (i == 5) {
        continue;
    }
    cout &lt;&lt; i &lt;&lt; endl;
}</code></pre>
<!-- /wp:code -->

  Additionally, the code includes a <code>for</code> loop that uses a <code>return</code> statement to exit the function when <code>i</code> equals 5. This example demonstrates how <code>return</code> can be used within a loop to terminate the program execution based on a condition. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">for (i = 0; i &lt; 10; i++) {
    if (i == 5) {
        return 0;
    }
    cout &lt;&lt; i &lt;&lt; endl;
}</code></pre>
<!-- /wp:code -->

  The code also presents scenarios where <code>break</code> and <code>continue</code> statements are combined with a <code>return</code> statement in different loops. These examples illustrate the precedence and effect of these control flow statements when used together, highlighting that <code>break</code> and <code>continue</code> have no effect when followed by a <code>return</code> statement. 
 

  In summary, the code provides a comprehensive overview of controlling loop execution using <code>for</code> loops and control flow statements in C++. Each example serves to illustrate the flexibility and control that <code>for</code> loops offer in C++, enabling developers to manage loop execution with precision. 
 

 
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