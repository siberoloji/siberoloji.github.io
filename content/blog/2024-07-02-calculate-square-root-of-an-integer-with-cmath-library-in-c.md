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
date: "2024-07-02T14:48:36Z"
guid: https://www.siberoloji.com/?p=1435
id: 1435
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: Calculate square root of an integer with cmath library in C++
url: /calculate-square-root-of-an-integer-with-cmath-library-in-c/
---

  The provided C++ code is a simple program that calculates the square root of a user-provided number. It begins by including the necessary libraries, <code>iostream</code> for input/output operations and <code>cmath</code> for mathematical operations.</p>
 

 
 ## Code</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
#include &lt;cmath&gt;
using namespace std;

// Main function of the program
int main() {
    // Declare a float variable to store the user's input
    float inputNumber;

    // Prompt the user to enter a number
    cout &lt;&lt; "Enter a number to calculate its square root: ";
    // Store the user's input in the variable
    cin &gt;&gt; inputNumber;

    // Check if the input number is non-negative
    if (inputNumber &gt;= 0.0) {
        // Calculate the square root of the input number
        float squareRoot = sqrt(inputNumber);
        // Print the input number
        cout &lt;&lt; "Input number: " &lt;&lt; inputNumber &lt;&lt; "\n";
        // Print the square root of the input number
        cout &lt;&lt; "Square root: " &lt;&lt; squareRoot &lt;&lt; "\n";
    }
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation</h2>
<!-- /wp:heading -->

  The provided C++ code is a simple program that calculates the square root of a user-provided number. It begins by including the necessary libraries, <code>iostream</code> for input/output operations and <code>cmath</code> for mathematical operations.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
#include &lt;cmath&gt;
using namespace std;</code></pre>
<!-- /wp:code -->

  The main function of the program starts with the declaration of a float variable <code>inputNumber</code> which is used to store the user's input.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">float inputNumber;</code></pre>
<!-- /wp:code -->

  The program then prompts the user to enter a number using <code>cout</code> and stores the user's input in the <code>inputNumber</code> variable using <code>cin</code>.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "Enter a number to calculate its square root: ";
cin &gt;&gt; inputNumber;</code></pre>
<!-- /wp:code -->

  The program checks if the input number is non-negative using an <code>if</code> statement. This is important because the square root of a negative number is not a real number and would result in an error.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">if (inputNumber &gt;= 0.0) {</code></pre>
<!-- /wp:code -->

  Inside the <code>if</code> statement, the program calculates the square root of the input number using the <code>sqrt</code> function from the <code>cmath</code> library and stores the result in the <code>squareRoot</code> variable.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">float squareRoot = sqrt(inputNumber);</code></pre>
<!-- /wp:code -->

  Finally, the program prints the input number and its square root using <code>cout</code>.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "Input number: " &lt;&lt; inputNumber &lt;&lt; "\n";
cout &lt;&lt; "Square root: " &lt;&lt; squareRoot &lt;&lt; "\n";</code></pre>
<!-- /wp:code -->

  This code is a simple demonstration of user input, conditional statements, and mathematical operations in C++.</p>
 

 
 ## Output</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">Enter a number to calculate its square root: 15
Input number: 15
Square root: 3.87298

Process finished with exit code 0</code></pre>
<!-- /wp:code -->