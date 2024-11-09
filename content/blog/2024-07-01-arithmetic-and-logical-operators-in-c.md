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
date: "2024-07-01T12:47:14Z"
guid: https://www.siberoloji.com/?p=1410
id: 1410
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: Arithmetic and Logical operators in C++
url: /arithmetic-and-logical-operators-in-c/
---

  This code snippet demonstrates various operators in C++:
 

<!-- wp:list -->
 <!-- wp:list-item -->
- Arithmetic operators: Multiplication, Division, Addition, Subtraction, Modulus 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Increment and Decrement operators 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Assignment operator 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Comparison operators: Equal, Greater, Less, Not Equal, Greater or Equal, Less or Equal 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Bitwise operators: AND, OR, XOR, NOT 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Logical operators: AND, OR 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  It also includes output statements to display the results of these operations.
 

 
 ## Code
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">// Lets explain operators in C++ with examples multiplacaion, division, addition, subtraction,
// modulus, increment, decrement, assignment, comparison, logical and bitwise operators in C++

#include &lt;iostream&gt;

using namespace std;

int main() {
    int num1 = 10;
    int num2 = 5;

    cout &lt;&lt; "Multiplication: " &lt;&lt; num1 * num2 &lt;&lt; endl;
    cout &lt;&lt; "Division: " &lt;&lt; num1 / num2 &lt;&lt; endl;
    cout &lt;&lt; "Addition: " &lt;&lt; num1 + num2 &lt;&lt; endl;
    cout &lt;&lt; "Subtraction: " &lt;&lt; num1 - num2 &lt;&lt; endl;

    cout &lt;&lt; "Modulus: " &lt;&lt; num1 % num2 &lt;&lt; endl;

    int result = num1;
    cout &lt;&lt; "Before increment: " &lt;&lt; result &lt;&lt; endl;

    result++;
    cout &lt;&lt; "After increment: " &lt;&lt; result &lt;&lt; endl;

    result--;
    cout &lt;&lt; "Decrement: " &lt;&lt; result &lt;&lt; endl;

    result = num1;
    cout &lt;&lt; "Assignment: " &lt;&lt; result &lt;&lt; endl;

    // num1 value is 10
    // num2 value is 5
    if (num1 == num2) {
        cout &lt;&lt; "Equal" &lt;&lt; endl;
    } else if (num1 &gt; num2) {
        cout &lt;&lt; "Greater" &lt;&lt; endl;
    } else {
        cout &lt;&lt; "Less" &lt;&lt; endl;
    }

    //num1 value is 10 and num2 value is 5

    if (num1 != num2) {
        cout &lt;&lt; "Not Equal" &lt;&lt; endl;
    } else if (num1 &lt; num2) {
        cout &lt;&lt; "Not Greater" &lt;&lt; endl;
    } else {
        cout &lt;&lt; "Not Less" &lt;&lt; endl;
    }

    // num1 value is 10 and num2 value is 5
    if (num1 &gt;= num2) {
        cout &lt;&lt; "Greater or Equal" &lt;&lt; endl;
    } else if (num1 &lt;= num2) {
        cout &lt;&lt; "Less or Equal" &lt;&lt; endl;
    } else {
        cout &lt;&lt; "Not Equal" &lt;&lt; endl;
    }
    // Bitwise operators
    // num1 value is 10 and num2 value is 5
    cout &lt;&lt; "Bitwise AND: " &lt;&lt; (num1 &amp; num2) &lt;&lt; endl; // 0
    cout &lt;&lt; "Bitwise OR: " &lt;&lt; (num1 | num2) &lt;&lt; endl; // 15
    cout &lt;&lt; "Bitwise XOR: " &lt;&lt; (num1 ^ num2) &lt;&lt; endl; // 15
    cout &lt;&lt; "Bitwise NOT: " &lt;&lt; ~num1 &lt;&lt; endl; // -11

    // num1 value is 10 and num2 value is 5
    cout &lt;&lt; "Logical AND: " &lt;&lt; (num1 &amp;&amp; num2) &lt;&lt; endl;
    cout &lt;&lt; "Logical OR: " &lt;&lt; (num1 || num2) &lt;&lt; endl;

    // num1 value is 10 and num2 value is 5

    if (num1 &amp;&amp; num2) {
        cout &lt;&lt; "True" &lt;&lt; endl;
    } else {
        cout &lt;&lt; "False" &lt;&lt; endl;
    }

    // num1 value is 10 and num2 value is 5
    if (num1 || num2) {
        cout &lt;&lt; "True" &lt;&lt; endl;
    } else {
        cout &lt;&lt; "False" &lt;&lt; endl;
    }


    return 0;
}
</code></pre>
<!-- /wp:code -->

 
 ## Explanation
<!-- /wp:heading -->

  The provided C++ code is a simple demonstration of various operators in C++. It includes arithmetic, assignment, comparison, logical, and bitwise operators.
 

  The code begins by declaring two integer variables, <code>num1</code> and <code>num2</code>, with values 10 and 5 respectively.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int num1 = 10;
int num2 = 5;</code></pre>
<!-- /wp:code -->

  The arithmetic operators are then demonstrated. These include multiplication (<code>*</code>), division (<code>/</code>), addition (<code>+</code>), subtraction (<code>-</code>), and modulus (<code>%</code>). The results of these operations are printed to the console.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "Multiplication: " &lt;&lt; num1 * num2 &lt;&lt; endl;
cout &lt;&lt; "Division: " &lt;&lt; num1 / num2 &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  The increment (<code>++</code>) and decrement (<code>--</code>) operators are demonstrated next. The variable <code>result</code> is incremented and decremented, and the results are printed to the console.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">result++;
cout &lt;&lt; "After increment: " &lt;&lt; result &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  The assignment operator (<code>=</code>) is used to assign the value of <code>num1</code> to <code>result</code>.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">result = num1;
cout &lt;&lt; "Assignment: " &lt;&lt; result &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  The comparison operators (<code>==</code>, <code>&gt;</code>, <code>&lt;</code>, <code>!=</code>, <code>&gt;=</code>, <code>&lt;=</code>) are used to compare <code>num1</code> and <code>num2</code>. The results of these comparisons are printed to the console.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">if (num1 == num2) {
    cout &lt;&lt; "Equal" &lt;&lt; endl;
}</code></pre>
<!-- /wp:code -->

  The bitwise operators (<code>&amp;</code>, <code>|</code>, <code>^</code>, <code>~</code>) are used to perform bitwise operations on <code>num1</code> and <code>num2</code>. The results of these operations are printed to the console.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "Bitwise AND: " &lt;&lt; (num1 &amp; num2) &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  Finally, the logical operators (<code>&amp;&amp;</code>, <code>||</code>) are used to perform logical operations on <code>num1</code> and <code>num2</code>. The results of these operations are printed to the console.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; "Logical AND: " &lt;&lt; (num1 &amp;&amp; num2) &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  In summary, this code provides a comprehensive demonstration of the various operators available in C++.
 

 
 ## Output
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">Multiplication: 50
Division: 2
Addition: 15
Subtraction: 5
Modulus: 0
Before increment: 10
After increment: 11
Decrement: 10
Assignment: 10
Greater
Not Equal
Greater or Equal
Bitwise AND: 0
Bitwise OR: 15
Bitwise XOR: 15
Bitwise NOT: -11
Logical AND: 1
Logical OR: 1
True
True</code></pre>
<!-- /wp:code -->