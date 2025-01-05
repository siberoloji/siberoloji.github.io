---
draft: false

title:  'Correct and incorrect variable naming conventions in C++'
date: '2024-06-30T23:24:05+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /correct-and-incorrect-variable-naming-conventions-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


This program example demonstrates the correct and incorrect variable naming conventions in C++


```cpp
/**
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
}
```



## Explanation 



The provided C++ code is a simple program designed to illustrate the correct and incorrect conventions for naming variables in C++.



The program begins with the inclusion of the `iostream` library, which is used for input/output operations. The `using namespace std;` statement is used to avoid having to prefix standard library components with `std::`.


```cpp
#include &lt;iostream&gt;
using namespace std;
```



The `main` function is where the execution of the program starts. Inside this function, several variables are declared to demonstrate the correct naming conventions in C++.


```cpp
int number; ///&lt; Variable names can start with a letter
int Number; ///&lt; Variable names are case sensitive
string NUMBER; ///&lt; Variable names can be in uppercase```



In C++, variable names can start with a letter, are case sensitive, and can be in uppercase. They can also contain numbers and underscores. For example, `number1`, `number_1`, and `number_1_` are all valid variable names.


```cpp
float number1; ///&lt; Variable names can contain numbers
bool number_1; ///&lt; Variable names can contain underscores
int number_1_; ///&lt; Variable names can end with an underscore```



Variable names can also start with an underscore, and they can contain numbers after an underscore. For instance, `_number`, `_1number`, and `_1_number` are all valid variable names.


```cpp
int _number; ///&lt; Variable names can start with an underscore
int _1number; ///&lt; Variable names can contain numbers after an underscore
int _1_number; ///&lt; Variable names can contain underscores and numbers
```



The program also includes commented-out lines of code that demonstrate incorrect variable naming conventions. In C++, variable names cannot start with a number, contain special characters, or contain spaces.


```cpp
// int 1number; // Variable names cannot start with a number
// int number$; // Variable names cannot contain special characters
// int number one; // Variable names cannot contain spaces
```



Finally, the `main` function returns 0, indicating successful execution of the program.
