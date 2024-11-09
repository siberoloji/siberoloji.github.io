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
date: "2024-07-01T13:44:57Z"
guid: https://www.siberoloji.com/?p=1414
id: 1414
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: Simple demonstration of operator precedence and type casting in C++
url: /simple-demonstration-of-operator-precedence-and-type-casting-in-c/
---

  The provided C++ code is a simple demonstration of operator precedence and type casting in C++. 
 

 
 ## Code
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">// Let's demonstrate how to use operator priority in C++

#include &lt;iostream&gt;
using namespace std;

int main() {
    int num1 = 1;
    int num2 = 2;
    int num3 = 3;
    int num4 = 4;

    double result1 = static_cast&lt;double&gt;(num1 + num2 * num3) / num4;
    double result2 = static_cast&lt;double&gt;((num1 + num2) * num3) / num4;
    double result3 = static_cast&lt;double&gt;((num1 + num2) * (num3 / num4));

    double result4 = static_cast&lt;double&gt;((num1 + num2) * num3) / static_cast&lt;double&gt;(num4);
    double result5 = static_cast&lt;double&gt;((num1 + num2) * num3) / static_cast&lt;double&gt;(num4);
    double result6 = static_cast&lt;double&gt;((num1 + num2) * num3) / static_cast&lt;double&gt;(num4);

    cout &lt;&lt; result1 &lt;&lt; endl;
    cout &lt;&lt; result2 &lt;&lt; endl;
    cout &lt;&lt; result3 &lt;&lt; endl;
    cout &lt;&lt; result4 &lt;&lt; endl;
    cout &lt;&lt; result5 &lt;&lt; endl;
    cout &lt;&lt; result6 &lt;&lt; endl;

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation
<!-- /wp:heading -->

  The provided C++ code is a simple demonstration of operator precedence and type casting in C++. 
 

  The code begins by declaring four integer variables <code>num1</code>, <code>num2</code>, <code>num3</code>, and <code>num4</code>, each initialized with values from 1 to 4 respectively. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int num1 = 1;
int num2 = 2;
int num3 = 3;
int num4 = 4;</code></pre>
<!-- /wp:code -->

  Then, six double variables <code>result1</code> to <code>result6</code> are declared. Each of these variables is assigned the result of a mathematical expression involving the previously declared integer variables. The expressions are designed to demonstrate how operator precedence (the order in which operations are performed) can affect the result of a calculation. 
 

  For example, <code>result1</code> is calculated as follows: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">double result1 = static_cast&lt;double&gt;(num1 + num2 * num3) / num4;</code></pre>
<!-- /wp:code -->

  In this expression, due to operator precedence, multiplication (<code>num2 * num3</code>) is performed before addition (<code>num1 +</code>). The entire expression within the parentheses is then type-casted to a double before division by <code>num4</code>. This ensures that the division operation produces a double result, not an integer. 
 

  The other <code>result</code> variables are calculated in a similar manner, but with different arrangements of parentheses to demonstrate how they can be used to override operator precedence. 
 

  Finally, the values of all <code>result</code> variables are printed to the console using <code>cout</code>: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt; result1 &lt;&lt; endl;
cout &lt;&lt; result2 &lt;&lt; endl;
cout &lt;&lt; result3 &lt;&lt; endl;
cout &lt;&lt; result4 &lt;&lt; endl;
cout &lt;&lt; result5 &lt;&lt; endl;
cout &lt;&lt; result6 &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  This allows the user to see the different results produced by the different expressions, illustrating the effects of operator precedence and type casting in C++. 
 

 
 ## Output
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">1.75
2.25
0
2.25
2.25
2.25

Process finished with exit code 0</code></pre>
<!-- /wp:code -->

 
 ## Operator Precedence Rules
<!-- /wp:heading -->

  In C++, operators have a specific order in which they are evaluated when an expression has several of them. This is known as operator precedence. Here are some common operator precedence rules in C++, from highest to lowest precedence: 
 

<!-- wp:list {"ordered":true} -->
 <!-- wp:list-item -->
- ***Parentheses <code>()</code>*** : Parentheses have the highest precedence and can be used to force an expression to evaluate in the order you want. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Unary operators <code>++</code>, <code>--</code>, <code>!</code>, <code>~</code>, <code>-</code>, <code>+</code>, <code>*</code>, <code>&amp;</code>, <code>sizeof</code>, <code>new</code>, <code>delete</code>*** : These operators have the next highest precedence after parentheses. They are used with only one operand. For example, the increment (<code>++</code>) and decrement (<code>--</code>) operators. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Multiplicative operators <code>*</code>, <code>/</code>, <code>%</code>*** : These operators are evaluated next. They perform multiplication, division, and modulus operations. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Additive operators <code>+</code>, <code>-</code>*** : These operators are used for addition and subtraction operations. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Shift operators <code>&lt;&lt;</code>, <code>&gt;&gt;</code>*** : These operators are used to shift bits to the left or right. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Relational operators <code>&lt;</code>, <code>&lt;=</code>, <code>&gt;</code>, <code>&gt;=</code>*** : These operators are used to compare two values. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Equality operators <code>==</code>, <code>!=</code>*** : These operators are used to check the equality or inequality of two operands. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Bitwise AND operator <code>&amp;</code>*** : This operator performs a bitwise AND operation. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Bitwise XOR operator <code>^</code>*** : This operator performs a bitwise XOR operation. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Bitwise OR operator <code>|</code>*** : This operator performs a bitwise OR operation. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Logical AND operator <code>&amp;&amp;</code>*** : This operator performs a logical AND operation. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Logical OR operator <code>||</code>*** : This operator performs a logical OR operation. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Conditional operator <code>?:</code>*** : This operator works as a simple <code>if-else</code> statement. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Assignment operators <code>=</code>, <code>+=</code>, <code>-=</code>, <code>*=</code>, <code>/=</code>, <code>%=</code>, <code>&lt;&lt;=</code>, <code>&gt;&gt;=</code>, <code>&amp;=</code>, <code>^=</code>, <code>|=</code>*** : These operators are used to assign values to variables. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Comma operator <code>,</code>*** : This operator is used to link related expressions together. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Remember, when operators have the same precedence, the rule of associativity (left-to-right or right-to-left) is used to determine the order of operations. 
 