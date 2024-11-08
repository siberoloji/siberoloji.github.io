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
date: "2024-06-30T23:24:05Z"
guid: https://www.siberoloji.com/?p=1392
id: 1392
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: Correct and incorrect variable naming conventions in C++
url: /correct-and-incorrect-variable-naming-conventions-in-c/
---

  This program example demonstrates the correct and incorrect variable naming conventions in C++ 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">/**
 * @file main.cpp
 * @brief This program demonstrates the correct and incorrect variable naming conventions in C++.
 */

#include &lt;iostream&gt;
using namespace std;

int main() {
    // Correct variable naming conventions
    int number; ///&lt; Variable names can start with a letter
    int Number; ///&lt; Variable names are case sensitive
    string NUMBER; ///&lt; Variable names can be in uppercase
    float number1; ///&lt; Variable names can contain numbers
    bool number_1; ///&lt; Variable names can contain underscores
    int number_1_; ///&lt; Variable names can end with an underscore
    int _number; ///&lt; Variable names can start with an underscore
    int _number_; ///&lt; Variable names can start and end with an underscore
    int _1number; ///&lt; Variable names can contain numbers after an underscore
    int _1_number; ///&lt; Variable names can contain underscores and numbers
    int _1_number_; ///&lt; Variable names can start and end with an underscore and contain numbers
    int number1_; ///&lt; Variable names can end with a number and an underscore

    // Incorrect variable naming conventions
    // int 1number; // Variable names cannot start with a number
    // int number$; // Variable names cannot contain special characters
    // int number one; // Variable names cannot contain spaces
    // int number-one; // Variable names cannot contain special characters
    // int number@; // Variable names cannot contain special characters
    // int number#; // Variable names cannot contain special characters

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation </h2>
<!-- /wp:heading -->

  The provided C++ code is a simple program designed to illustrate the correct and incorrect conventions for naming variables in C++. 
 

  The program begins with the inclusion of the <code>iostream</code> library, which is used for input/output operations. The <code>using namespace std;</code> statement is used to avoid having to prefix standard library components with <code>std::</code>. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;</code></pre>
<!-- /wp:code -->

  The <code>main</code> function is where the execution of the program starts. Inside this function, several variables are declared to demonstrate the correct naming conventions in C++. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int number; ///&lt; Variable names can start with a letter
int Number; ///&lt; Variable names are case sensitive
string NUMBER; ///&lt; Variable names can be in uppercase</code></pre>
<!-- /wp:code -->

  In C++, variable names can start with a letter, are case sensitive, and can be in uppercase. They can also contain numbers and underscores. For example, <code>number1</code>, <code>number_1</code>, and <code>number_1_</code> are all valid variable names. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">float number1; ///&lt; Variable names can contain numbers
bool number_1; ///&lt; Variable names can contain underscores
int number_1_; ///&lt; Variable names can end with an underscore</code></pre>
<!-- /wp:code -->

  Variable names can also start with an underscore, and they can contain numbers after an underscore. For instance, <code>_number</code>, <code>_1number</code>, and <code>_1_number</code> are all valid variable names. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int _number; ///&lt; Variable names can start with an underscore
int _1number; ///&lt; Variable names can contain numbers after an underscore
int _1_number; ///&lt; Variable names can contain underscores and numbers</code></pre>
<!-- /wp:code -->

  The program also includes commented-out lines of code that demonstrate incorrect variable naming conventions. In C++, variable names cannot start with a number, contain special characters, or contain spaces. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">// int 1number; // Variable names cannot start with a number
// int number$; // Variable names cannot contain special characters
// int number one; // Variable names cannot contain spaces</code></pre>
<!-- /wp:code -->

  Finally, the <code>main</code> function returns 0, indicating successful execution of the program. 
 