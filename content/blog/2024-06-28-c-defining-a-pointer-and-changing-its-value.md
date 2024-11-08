---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- C++ Code Samples
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-06-28T23:59:21Z"
excerpt: In this example, we define a pointer and show how to view and change its
  value.
guid: https://www.siberoloji.com/?p=1306
id: 1306
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
title: C++ Defining a Pointer and changing its value
url: /c-defining-a-pointer-and-changing-its-value/
---

  In this example, we define a pointer and show how to view and change its value.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">/**
* @brief Main function that demonstrates pointer manipulation.
 *
 * This function initializes an integer variable `value` with the value 10.
 * It then creates a pointer `pointer` that points to the memory address of `value`.
 * The program prints the initial value of `value`, its address,
 * and the value pointed to by `pointer`.
 * 
 * The program then updates the value pointed to by `pointer` to 20.
 * Finally, it prints the new value of `value`.
 *
 * @return 0 indicating successful execution of the program
 */
#include &lt;iostream&gt;
using namespace std;

int main() {
    int value = 10; // Initialize an integer variable with the value 10
    int* pointer = &amp;value; // Create a pointer that points to the memory address of value

    cout &lt;&lt; "Initial value: " &lt;&lt; value &lt;&lt; endl; // Print the initial value of value
    cout &lt;&lt; "Address of value: " &lt;&lt; &amp;value &lt;&lt; endl; // Print the memory address of value
    cout &lt;&lt; "Value pointed to by pointer: " &lt;&lt; *pointer &lt;&lt; endl; // Print the value pointed to by pointer

    *pointer = 20; // Update the value pointed to by pointer to 20

    cout &lt;&lt; "New value of value: " &lt;&lt; value &lt;&lt; endl; // Print the new value of value

    return 0; // Return 0 indicating successful execution of the program
}</code></pre>
<!-- /wp:code -->