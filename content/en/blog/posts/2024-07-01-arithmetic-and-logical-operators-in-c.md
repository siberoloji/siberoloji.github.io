---
draft: false

title:  'Arithmetic and Logical operators in C++'
date: '2024-07-01T12:47:14+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /arithmetic-and-logical-operators-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


This code snippet demonstrates various operators in C++:



* Arithmetic operators: Multiplication, Division, Addition, Subtraction, Modulus

* Increment and Decrement operators

* Assignment operator

* Comparison operators: Equal, Greater, Less, Not Equal, Greater or Equal, Less or Equal

* Bitwise operators: AND, OR, XOR, NOT

* Logical operators: AND, OR




It also includes output statements to display the results of these operations.



## Code


```cpp
// Lets explain operators in C++ with examples multiplacaion, division, addition, subtraction,
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
```



## Explanation



The provided C++ code is a simple demonstration of various operators in C++. It includes arithmetic, assignment, comparison, logical, and bitwise operators.



The code begins by declaring two integer variables, `num1` and `num2`, with values 10 and 5 respectively.


```cpp
int num1 = 10;
int num2 = 5;
```



The arithmetic operators are then demonstrated. These include multiplication (`*`), division (`/`), addition (`+`), subtraction (`-`), and modulus (`%`). The results of these operations are printed to the console.


```cpp
cout &lt;&lt; "Multiplication: " &lt;&lt; num1 * num2 &lt;&lt; endl;
cout &lt;&lt; "Division: " &lt;&lt; num1 / num2 &lt;&lt; endl;
```



The increment (`++`) and decrement (`--`) operators are demonstrated next. The variable `result` is incremented and decremented, and the results are printed to the console.


```cpp
result++;
cout &lt;&lt; "After increment: " &lt;&lt; result &lt;&lt; endl;
```



The assignment operator (`=`) is used to assign the value of `num1` to `result`.


```cpp
result = num1;
cout &lt;&lt; "Assignment: " &lt;&lt; result &lt;&lt; endl;
```



The comparison operators (`==`, `&gt;`, `&lt;`, `!=`, `&gt;=`, `&lt;=`) are used to compare `num1` and `num2`. The results of these comparisons are printed to the console.


```cpp
if (num1 == num2) {
    cout &lt;&lt; "Equal" &lt;&lt; endl;
}
```



The bitwise operators (`&amp;`, `|`, `^`, `~`) are used to perform bitwise operations on `num1` and `num2`. The results of these operations are printed to the console.


```cpp
cout &lt;&lt; "Bitwise AND: " &lt;&lt; (num1 &amp; num2) &lt;&lt; endl;
```



Finally, the logical operators (`&amp;&amp;`, `||`) are used to perform logical operations on `num1` and `num2`. The results of these operations are printed to the console.


```cpp
cout &lt;&lt; "Logical AND: " &lt;&lt; (num1 &amp;&amp; num2) &lt;&lt; endl;
```



In summary, this code provides a comprehensive demonstration of the various operators available in C++.



## Output


```cpp
Multiplication: 50
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
True```
