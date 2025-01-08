---
draft: false

title:  'The use of basic comparison operators in C++'
date: '2024-07-01T23:14:53+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /the-use-of-basic-comparison-operators-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code is a simple console application that demonstrates the use of basic comparison operators in C++.



## Code


```cpp
#include <iostream>
using namespace std;

int main() {
    // Initialize two integer variables x and y
    int x = 0, y = 0;

    // Print the question: is x equal to y?
    cout << "Question: is x equal to y?" << endl;

    // Check if x is equal to y
    if (x == y) {
        // If x is equal to y, print the result
        cout << "x is equal to y" << endl;
    }

    // Change the values of x and y
    x = 0, y = 1;

    // Print the question: is x not equal to y?
    cout << "Question: is x not equal to y?" << endl;

    // Check if x is not equal to y
    if (x != y) {
        // If x is not equal to y, print the result
        cout << "x is not equal to y" << endl;
    }

    // Change the values of x and y
    x = 1, y = 0;

    // Print the question: is x greater than y?
    cout << "Question: is x greater than y?" << endl;

    // Check if x is greater than y
    if (x > y) {
        // If x is greater than y, print the result
        cout << "x is greater than y" << endl;
    }

    // Change the values of x and y
    x = 2, y = 1;

    // Print the question: is x greater than or equal to y?
    cout << "Question: is x greater than or equal to y?" << endl;

    // Check if x is greater than or equal to y
    if (x >= y) {
        // If x is greater than or equal to y, print the result
        cout << "x is greater than or equal to y" << endl;
    }

    // Change the values of x and y
    x = 1, y = 2;

    // Print the question: is x less than (or equal to) y?
    cout << "Question: is x less than (or equal to) y?" << endl;

    // Check if x is less than or equal to y
    if (x <= y) {
        // If x is less than or equal to y, print the result
        cout << "x is less than or equal to y" << endl;
    }

    // End of the program
    return 0;
}
```



## Explanation



The provided C++ code is a simple console application that demonstrates the use of basic comparison operators in C++. It does so by initializing two integer variables, `x` and `y`, and then comparing them using different operators.



Initially, `x` and `y` are both set to `0`:


```cpp
int x = 0, y = 0;
```



The code then prints a question to the console asking if `x` is equal to `y`:


```cpp
cout << "Question: is x equal to y?" << endl;
```



This is followed by an `if` statement that checks if `x` is indeed equal to `y` using the `==` operator. If the condition is true, it prints a message to the console:


```cpp
if (x == y) {
    cout << "x is equal to y" << endl;
}
```



The code then changes the values of `x` and `y` and repeats the process with different comparison operators (`!=`, `>`, `>=`, `<`, `<=`). Each time, it prints a question to the console, checks the condition, and prints a message if the condition is true.



For example, after changing `x` to `0` and `y` to `1`, the code checks if `x` is not equal to `y`:


```cpp
x = 0, y = 1;
cout << "Question: is x not equal to y?" << endl;
if (x != y) {
    cout << "x is not equal to y" << endl;
}
```



This pattern continues until all the comparison operators have been demonstrated. The program then ends with a `return 0;` statement, indicating successful execution.



## Output


```cpp
Question: is x equal to y?
x is equal to y
Question: is x not equal to y?
x is not equal to y
Question: is x greater than y?
x is greater than y
Question: is x greater than or equal to y?
x is greater than or equal to y
Question: is x less than (or equal to) y?
x is less than or equal to y

Process finished with exit code 0```
