---
draft: false

title:  'Simple demonstration of operator precedence and type casting in C++'
date: '2024-07-01T13:44:57+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /simple-demonstration-of-operator-precedence-and-type-casting-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code is a simple demonstration of operator precedence and type casting in C++.



## Code


```cpp
// Let's demonstrate how to use operator priority in C++

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
}
```



## Explanation



The provided C++ code is a simple demonstration of operator precedence and type casting in C++.



The code begins by declaring four integer variables `num1`, `num2`, `num3`, and `num4`, each initialized with values from 1 to 4 respectively.


```cpp
int num1 = 1;
int num2 = 2;
int num3 = 3;
int num4 = 4;
```



Then, six double variables `result1` to `result6` are declared. Each of these variables is assigned the result of a mathematical expression involving the previously declared integer variables. The expressions are designed to demonstrate how operator precedence (the order in which operations are performed) can affect the result of a calculation.



For example, `result1` is calculated as follows:


```cpp
double result1 = static_cast&lt;double&gt;(num1 + num2 * num3) / num4;
```



In this expression, due to operator precedence, multiplication (`num2 * num3`) is performed before addition (`num1 +`). The entire expression within the parentheses is then type-casted to a double before division by `num4`. This ensures that the division operation produces a double result, not an integer.



The other `result` variables are calculated in a similar manner, but with different arrangements of parentheses to demonstrate how they can be used to override operator precedence.



Finally, the values of all `result` variables are printed to the console using `cout`:


```cpp
cout &lt;&lt; result1 &lt;&lt; endl;
cout &lt;&lt; result2 &lt;&lt; endl;
cout &lt;&lt; result3 &lt;&lt; endl;
cout &lt;&lt; result4 &lt;&lt; endl;
cout &lt;&lt; result5 &lt;&lt; endl;
cout &lt;&lt; result6 &lt;&lt; endl;
```



This allows the user to see the different results produced by the different expressions, illustrating the effects of operator precedence and type casting in C++.



## Output


```cpp
1.75
2.25
0
2.25
2.25
2.25

Process finished with exit code 0```



## Operator Precedence Rules



In C++, operators have a specific order in which they are evaluated when an expression has several of them. This is known as operator precedence. Here are some common operator precedence rules in C++, from highest to lowest precedence:


*  **Parentheses `()`**: Parentheses have the highest precedence and can be used to force an expression to evaluate in the order you want.

* **Unary operators `++`, `--`, `!`, `~`, `-`, `+`, `*`, `&amp;`, `sizeof`, `new`, `delete`**: These operators have the next highest precedence after parentheses. They are used with only one operand. For example, the increment (`++`) and decrement (`--`) operators.

* **Multiplicative operators `*`, `/`, `%`**: These operators are evaluated next. They perform multiplication, division, and modulus operations.

* **Additive operators `+`, `-`**: These operators are used for addition and subtraction operations.

* **Shift operators `&lt;&lt;`, `&gt;&gt;`**: These operators are used to shift bits to the left or right.

* **Relational operators `&lt;`, `&lt;=`, `&gt;`, `&gt;=`**: These operators are used to compare two values.

* **Equality operators `==`, `!=`**: These operators are used to check the equality or inequality of two operands.

* **Bitwise AND operator `&amp;`**: This operator performs a bitwise AND operation.

* **Bitwise XOR operator `^`**: This operator performs a bitwise XOR operation.

* **Bitwise OR operator `|`**: This operator performs a bitwise OR operation.

* **Logical AND operator `&amp;&amp;`**: This operator performs a logical AND operation.

* **Logical OR operator `||`**: This operator performs a logical OR operation.

* **Conditional operator `?:`**: This operator works as a simple `if-else` statement.

* **Assignment operators `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `&lt;&lt;=`, `&gt;&gt;=`, `&amp;=`, `^=`, `|=`**: These operators are used to assign values to variables.

* **Comma operator `,`**: This operator is used to link related expressions together.




Remember, when operators have the same precedence, the rule of associativity (left-to-right or right-to-left) is used to determine the order of operations.
