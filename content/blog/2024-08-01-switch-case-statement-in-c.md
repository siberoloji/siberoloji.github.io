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
date: "2024-08-01T23:28:01Z"
guid: https://www.siberoloji.com/?p=1455
id: 1455
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: Switch &amp; Case statement in C++
url: /switch-case-statement-in-c/
---

  The provided C++ code demonstrates the use of a <code>switch-case</code> statement to handle different user inputs. 
 

 
 ## Code</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;

/**
 * \brief Main function demonstrating the use of switch-case statement in C++.
 *
 * This program prompts the user to enter a number and then uses a switch-case
 * statement to print the corresponding word for numbers 1 to 5. For numbers 6
 * and 7, it prints "Six or Seven". For any other number, it prints "Invalid number".
 *
 * \return int Returns 0 upon successful execution.
 */
int main() {
    int number;  ///&lt; Variable to store the user input number.
    cout &lt;&lt; "Enter a number between 1-7: ";
    cin &gt;&gt; number;

    switch (number) {
        case 1:
            cout &lt;&lt; "One" &lt;&lt; endl;  ///&lt; Prints "One" if the number is 1.
        break;
        case 2:
            cout &lt;&lt; "Two" &lt;&lt; endl;  ///&lt; Prints "Two" if the number is 2.
        break;
        case 3:
            cout &lt;&lt; "Three" &lt;&lt; endl;  ///&lt; Prints "Three" if the number is 3.
        break;
        case 4:
            cout &lt;&lt; "Four" &lt;&lt; endl;  ///&lt; Prints "Four" if the number is 4.
        break;
        case 5:
            cout &lt;&lt; "Five" &lt;&lt; endl;  ///&lt; Prints "Five" if the number is 5.
        break;
        case 6:
        case 7:
            cout &lt;&lt; "Six or Seven" &lt;&lt; endl;  ///&lt; Prints "Six or Seven" if the number is 6 or 7.
        break;
        default:
            cout &lt;&lt; "Invalid number" &lt;&lt; endl;  ///&lt; Prints "Invalid number" for any other number.
    }

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation</h2>
<!-- /wp:heading -->

  The provided C++ code demonstrates the use of a <code>switch-case</code> statement to handle different user inputs. The program begins by including the necessary header file <code>&lt;iostream&gt;</code> and using the <code>std</code> namespace to simplify the code. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;</code></pre>
<!-- /wp:code -->

  The <code>main</code> function is the entry point of the program. It starts by declaring an integer variable <code>number</code> to store the user's input. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int main() {
    int number;
    cout &lt;&lt; "Enter a number between 1-7: ";
    cin &gt;&gt; number;</code></pre>
<!-- /wp:code -->

  The program then uses a <code>switch-case</code> statement to determine the output based on the value of <code>number</code>. Each <code>case</code> corresponds to a specific number, and the program prints the corresponding word for numbers 1 to 5. For example, if the user inputs <code>1</code>, the program prints "One". 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">switch (number) {
    case 1:
        cout &lt;&lt; "One" &lt;&lt; endl;
        break;
    case 2:
        cout &lt;&lt; "Two" &lt;&lt; endl;
        break;
    // ... other cases
}</code></pre>
<!-- /wp:code -->

  For the numbers <code>6</code> and <code>7</code>, the program prints "Six or Seven". This is achieved by grouping these cases together without a <code>break</code> statement between them. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">case 6:
case 7:
    cout &lt;&lt; "Six or Seven" &lt;&lt; endl;
    break;</code></pre>
<!-- /wp:code -->

  If the user inputs any number outside the range of 1 to 7, the <code>default</code> case is executed, and the program prints "Invalid number". 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">default:
    cout &lt;&lt; "Invalid number" &lt;&lt; endl;
}</code></pre>
<!-- /wp:code -->

  Finally, the <code>main</code> function returns <code>0</code> to indicate successful execution. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">return 0;
}</code></pre>
<!-- /wp:code -->

  This code effectively demonstrates how to use a <code>switch-case</code> statement in C++ to handle multiple conditions based on user input. 
 

 
 ## Output</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">Enter a number between 1-7: 3
Three

Process finished with exit code 0</code></pre>
<!-- /wp:code -->