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

#include <iostream>

using namespace std;

int main() {
    int num1 = 10;
    int num2 = 5;

    cout << "Multiplication: " << num1 * num2 << endl;
    cout << "Division: " << num1 / num2 << endl;
    cout << "Addition: " << num1 + num2 << endl;
    cout << "Subtraction: " << num1 - num2 << endl;

    cout << "Modulus: " << num1 % num2 << endl;

    int result = num1;
    cout << "Before increment: " << result << endl;

    result++;
    cout << "After increment: " << result << endl;

    result--;
    cout << "Decrement: " << result << endl;

    result = num1;
    cout << "Assignment: " << result << endl;

    // num1 value is 10
    // num2 value is 5
    if (num1 == num2) {
        cout << "Equal" << endl;
    } else if (num1 > num2) {
        cout << "Greater" << endl;
    } else {
        cout << "Less" << endl;
    }

    //num1 value is 10 and num2 value is 5

    if (num1 != num2) {
        cout << "Not Equal" << endl;
    } else if (num1 < num2) {
        cout << "Not Greater" << endl;
    } else {
        cout << "Not Less" << endl;
    }

    // num1 value is 10 and num2 value is 5
    if (num1 >= num2) {
        cout << "Greater or Equal" << endl;
    } else if (num1 <= num2) {
        cout << "Less or Equal" << endl;
    } else {
        cout << "Not Equal" << endl;
    }
    // Bitwise operators
    // num1 value is 10 and num2 value is 5
    cout << "Bitwise AND: " << (num1 &amp; num2) << endl; // 0
    cout << "Bitwise OR: " << (num1 | num2) << endl; // 15
    cout << "Bitwise XOR: " << (num1 ^ num2) << endl; // 15
    cout << "Bitwise NOT: " << ~num1 << endl; // -11

    // num1 value is 10 and num2 value is 5
    cout << "Logical AND: " << (num1 &amp;&amp; num2) << endl;
    cout << "Logical OR: " << (num1 || num2) << endl;

    // num1 value is 10 and num2 value is 5

    if (num1 &amp;&amp; num2) {
        cout << "True" << endl;
    } else {
        cout << "False" << endl;
    }

    // num1 value is 10 and num2 value is 5
    if (num1 || num2) {
        cout << "True" << endl;
    } else {
        cout << "False" << endl;
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
cout << "Multiplication: " << num1 * num2 << endl;
cout << "Division: " << num1 / num2 << endl;
```



The increment (`++`) and decrement (`--`) operators are demonstrated next. The variable `result` is incremented and decremented, and the results are printed to the console.


```cpp
result++;
cout << "After increment: " << result << endl;
```



The assignment operator (`=`) is used to assign the value of `num1` to `result`.


```cpp
result = num1;
cout << "Assignment: " << result << endl;
```



The comparison operators (`==`, `>`, `<`, `!=`, `>=`, `<=`) are used to compare `num1` and `num2`. The results of these comparisons are printed to the console.


```cpp
if (num1 == num2) {
    cout << "Equal" << endl;
}
```



The bitwise operators (`&amp;`, `|`, `^`, `~`) are used to perform bitwise operations on `num1` and `num2`. The results of these operations are printed to the console.


```cpp
cout << "Bitwise AND: " << (num1 &amp; num2) << endl;
```



Finally, the logical operators (`&amp;&amp;`, `||`) are used to perform logical operations on `num1` and `num2`. The results of these operations are printed to the console.


```cpp
cout << "Logical AND: " << (num1 &amp;&amp; num2) << endl;
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
