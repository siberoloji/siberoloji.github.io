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
date: "2024-07-02T14:36:11Z"
guid: https://www.siberoloji.com/?p=1433
id: 1433
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: User input with cin function in C++
url: /user-input-with-cin-function-in-c/
---

  The provided C++ code is a simple console application that prompts the user to enter an integer, outputs the entered integer, doubles the entered integer, and then outputs the doubled value. 
 

 
 ## Code</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt; // Include the iostream library to enable input/output operations
using namespace std; // Use the standard namespace

// Main function
int main() {
    int userInput; // Declare an integer variable to store user input

    // Prompt the user to enter an integer
    cout &lt;&lt; "Enter an integer: ";
    cin &gt;&gt; userInput; // Read the user input from the console

    // Output the entered integer
    cout &lt;&lt; "You entered: " &lt;&lt; userInput &lt;&lt; endl;

    userInput = 2 * userInput; // Double the user input

    // Output the doubled value
    cout &lt;&lt; "The doubled value is: " &lt;&lt; userInput &lt;&lt; endl;

    return 0; // Return 0 to indicate that the program has run successfully
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation</h2>
<!-- /wp:heading -->

  The provided C++ code is a simple console application that prompts the user to enter an integer, outputs the entered integer, doubles the entered integer, and then outputs the doubled value. 
 

  The code begins with the inclusion of the <code>iostream</code> library, which is necessary for input/output operations in C++. The <code>using namespace std;</code> statement is used to avoid having to prefix standard library functions with <code>std::</code>. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;</code></pre>
<!-- /wp:code -->

  The <code>main</code> function is the entry point of the program. Inside this function, an integer variable <code>userInput</code> is declared to store the user's input. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int main() {
    int userInput;</code></pre>
<!-- /wp:code -->

  The program then prompts the user to enter an integer using <code>cout</code>, and reads the user's input from the console using <code>cin</code>. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "Enter an integer: ";
cin &gt;&gt; userInput;</code></pre>
<!-- /wp:code -->

  The entered integer is then outputted to the console. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "You entered: " &lt;&lt; userInput &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  The <code>userInput</code> variable is then doubled by multiplying it by 2. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">userInput = 2 * userInput;</code></pre>
<!-- /wp:code -->

  Finally, the doubled value is outputted to the console, and the <code>main</code> function returns 0 to indicate that the program has run successfully. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "The doubled value is: " &lt;&lt; userInput &lt;&lt; endl;
return 0;</code></pre>
<!-- /wp:code -->

  This code is a basic example of user interaction and arithmetic operations in C++. 
 

 
 ## Output</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">Enter an integer: 12
You entered: 12
The doubled value is: 24

Process finished with exit code 0</code></pre>
<!-- /wp:code -->