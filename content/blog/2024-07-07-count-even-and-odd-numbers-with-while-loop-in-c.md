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
date: "2024-07-07T17:26:02Z"
guid: https://www.siberoloji.com/?p=1447
id: 1447
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
title: Count even and odd numbers with while loop in C++
url: /count-even-and-odd-numbers-with-while-loop-in-c/
---

  The provided C++ code is designed to count the number of even and odd numbers entered by the user, excluding the terminating 0.  
 

 
 ## Code</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">/*
* Program to count even and odd numbers.
 *
 * This program prompts the user to enter a sequence of integers, ending the sequence with a 0.
 * It then counts the number of even and odd numbers entered (excluding the final 0) and displays the counts.
 *
 * How it works:
 * 1. The program initializes two counters for even and odd numbers.
 * 2. It prompts the user to enter a number and reads the user input.
 * 3. If the number is not 0, it checks if the number is even or odd and increments the respective counter.
 * 4. The program repeats steps 2 and 3 until the user enters 0.
 * 5. Finally, it displays the counts of even and odd numbers.
 *
 * Note: The program considers 0 as neither even nor odd for the purpose of this count.
 */

#include &lt;iostream&gt;
using namespace std;

int main() {
    int evenCount = 0; // Counter for even numbers
    int oddCount = 0;  // Counter for odd numbers
    int userInput;     // Variable to store the user's input

    cout &lt;&lt; "Enter a number: ";
    cin &gt;&gt; userInput;

    while (userInput != 0) {
        if (userInput % 2 == 1)
            oddCount++; // Increment odd counter if the number is odd
        else
            evenCount++; // Increment even counter if the number is even

        cout &lt;&lt; "Enter a number: ";
        cin &gt;&gt; userInput;
    }

    cout &lt;&lt; "Even numbers : " &lt;&lt; evenCount &lt;&lt; endl; // Display the count of even numbers
    cout &lt;&lt; "Odd numbers : " &lt;&lt; oddCount &lt;&lt; endl;   // Display the count of odd numbers

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation </h2>
<!-- /wp:heading -->

  The provided C++ code is designed to count the number of even and odd numbers entered by the user, excluding the terminating 0. The program operates in a loop, prompting the user to input integers until a 0 is entered, which signals the end of input. It utilizes the modulo operator (<code>%</code>) to distinguish between even and odd numbers. 
 

  Initially, the program declares and initializes two integer variables, <code>evenCount</code> and <code>oddCount</code>, to zero. These variables serve as counters for the even and odd numbers, respectively. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int evenCount = 0; // Counter for even numbers
int oddCount = 0;  // Counter for odd numbers</code></pre>
<!-- /wp:code -->

  The program then enters a loop, first prompting the user to enter a number. This is achieved using <code>cout</code> for the prompt and <code>cin</code> to read the user's input into the variable <code>userInput</code>. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "Enter a number: ";
cin &gt;&gt; userInput;</code></pre>
<!-- /wp:code -->

  Within the loop, the program checks if the input is not 0. If it's not, it determines whether the number is even or odd by using the modulo operation (<code>userInput % 2</code>). If the result is 1, the number is odd, and <code>oddCount</code> is incremented. Otherwise, the number is even, and <code>evenCount</code> is incremented. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">if (userInput % 2 == 1)
    oddCount++; // Increment odd counter if the number is odd
else
    evenCount++; // Increment even counter if the number is even</code></pre>
<!-- /wp:code -->

  This process repeats until the user inputs 0, at which point the loop terminates. Finally, the program outputs the counts of even and odd numbers using <code>cout</code>. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "Even numbers : " &lt;&lt; evenCount &lt;&lt; endl;
cout &lt;&lt; "Odd numbers : " &lt;&lt; oddCount &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  This code snippet effectively demonstrates basic C++ input/output operations, conditional statements, and loop control structures, making it a straightforward example for developers familiar with C++ but new to this specific logic. 
 

 
 ## Output </h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">Enter a number: 13
Enter a number: 212
Enter a number: 345
Enter a number: 23
Enter a number: 0
Even numbers : 1
Odd numbers : 3

Process finished with exit code 0</code></pre>
<!-- /wp:code -->