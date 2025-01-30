---
draft: false

title:  'logical AND (&amp;&amp;) and OR (||) operators in C++'
date: '2024-07-16T19:13:03+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /logical-and-and-or-operators-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code demonstrates the use of logical operators: AND (`&amp;&amp;`), OR (`||`), and NOT (`!`), through a series of comparisons between three initialized integer variables (`x`, `y`, and `z`).



## Code


```cpp
/**
* @file main.cpp
 * @brief Demonstrates the use of logical AND (&amp;&amp;) and OR (||) operators in C++.
 *
 * This program initializes three integer variables, x, y, and z, and then demonstrates
 * the use of logical AND (&amp;&amp;) and OR (||) operators by comparing these variables in
 * various expressions. It also shows the use of the NOT (!) operator and explains
 * the precedence of logical operators in C++.
 */

#include <iostream>
using namespace std;

int main() {
    // Initialize variables
    int x = 5, y = 10, z = 15;

    // Display the values of x, y, and z
    cout << "x = " << x << ", y = " << y << ", z = " << z << endl;

    // Demonstrate logical AND (&amp;&amp;)
    cout << "x < y &amp;&amp; y < z = " << (x < y &amp;&amp; y < z) << endl; // True, both conditions are true
    cout << "x < y &amp;&amp; y > z = " << (x < y &amp;&amp; y > z) << endl; // False, second condition is false

    // Demonstrate logical OR (||)
    cout << "x < y || y > z = " << (x < y || y > z) << endl; // True, first condition is true
    cout << "x > y || y > z = " << (x > y || y > z) << endl; // False, both conditions are false

    // Demonstrate logical NOT (!)
    cout << "!(x < y) = " << !(x < y) << endl; // False, negates true condition
    cout << "!(x > y) = " << !(x > y) << endl; // True, negates false condition

    // Explain operator precedence
    cout << "priority of &amp;&amp; is higher than ||" << endl;

    // Demonstrate precedence with examples
    cout << "x < y &amp;&amp; y < z || x > z = " << (x < y &amp;&amp; y < z || x > z) << endl;
    // True, &amp;&amp; evaluated first
    cout << "x < y || y < z &amp;&amp; x > z = " << (x < y || y < z &amp;&amp; x > z) << endl;
    // True, &amp;&amp; evaluated first despite || appearing first

    return 0;
}
```



## Explanation



The provided C++ code demonstrates the use of logical operators: AND (`&amp;&amp;`), OR (`||`), and NOT (`!`), through a series of comparisons between three initialized integer variables (`x`, `y`, and `z`). It serves as an educational example to illustrate how these operators function in conditional statements and their precedence rules.



Initially, the code sets up three variables `x`, `y`, and `z` with values 5, 10, and 15, respectively. This setup is crucial for the subsequent comparisons:


```cpp
int x = 5, y = 10, z = 15;
```



The demonstration of the logical AND (`&amp;&amp;`) operator is shown through two examples. The first example checks if `x` is less than `y` AND `y` is less than `z`, which evaluates to true since both conditions are satisfied:


```cpp
cout << "x < y &amp;&amp; y < z = " << (x < y &amp;&amp; y < z) << endl;
```



The logical OR (`||`) operator is similarly demonstrated. An example provided checks if `x` is less than `y` OR `y` is greater than `z`. This expression evaluates to true because the first condition is true, illustrating that only one condition needs to be true for the OR operator to result in true:


```cpp
cout << "x < y || y > z = " << (x < y || y > z) << endl;
```



The NOT (`!`) operator's demonstration negates the truth value of the condition it precedes. For instance, negating the condition `x < y` results in false because `x < y` is true, and NOT true is false:


```cpp
cout << "!(x < y) = " << !(x < y) << endl;
```



Lastly, the code touches upon the precedence of logical operators, stating that AND (`&amp;&amp;`) has a higher precedence than OR (`||`). This is crucial in understanding how complex logical expressions are evaluated. The provided examples show that even if OR appears first in an expression, the AND part is evaluated first due to its higher precedence:


```cpp
cout << "x < y &amp;&amp; y < z || x > z = " << (x < y &amp;&amp; y < z || x > z) << endl;
```



This code snippet is a straightforward demonstration aimed at those familiar with C++ but perhaps not with the intricacies of logical operators and their precedence.



## Output


```cpp
x = 5, y = 10, z = 15
x < y &amp;&amp; y < z = 1
x < y &amp;&amp; y > z = 0
x < y || y > z = 1
x > y || y > z = 0
!(x < y) = 0
!(x > y) = 1
priority of &amp;&amp; is higher than ||
x < y &amp;&amp; y < z || x > z = 1
x < y || y < z &amp;&amp; x > z = 1

Process finished with exit code 0```
