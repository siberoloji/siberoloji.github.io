---
draft: false

title:  'The use of octal, binary and hexadecimal literals in C++'
date: '2024-06-30T23:05:54+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /the-use-of-octal-binary-and-hexadecimal-literals-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


This function defines three integer variables, each initialized with a different type of literal (hexadecimal, octal, binary). It then prints the values of these variables to the console.


```cpp
/**
 * @file main.cpp
 * @author ibrahim
 * @date 30-06-2024
 * @brief This program demonstrates the use of octal, binary and hexadecimal literals in C++.
 */

#include <iostream>
using namespace std;

/**
 * @brief The main function of the program.
 *
 * This function defines three integer variables,
 * each initialized with a different type of literal (hexadecimal, octal, binary).
 * It then prints the values of these variables to the console.
 *
 * @return int Returns 0 upon successful execution.
 */
int main() {
    int a = 0x1A; ///< @brief Integer variable 'a' initialized with a hexadecimal literal. The value of 'a' is 26.
    int b = 032; ///< @brief Integer variable 'b' initialized with an octal literal. The value of 'b' is 26.
    int c = 0b1101; ///< @brief Integer variable 'c' initialized with a binary literal. The value of 'c' is 13.

    cout << "Hexadecimal literal: " << a << endl; ///< Prints the value of 'a' to the console.
    cout << "Octal literal: " << b << endl; ///< Prints the value of 'b' to the console.
    cout << "Binary literal: " << c << endl; ///< Prints the value of 'c' to the console.

    return 0; ///< Returns 0 upon successful execution.
}
```



## Explanation



The provided C++ code is a simple program that demonstrates the use of different types of integer literals in C++. It includes hexadecimal, octal, and binary literals.



The program begins by including the `iostream` library, which provides facilities for input/output operations. The `using namespace std;` statement is used to avoid prefixing the `cout` and `endl` with `std::`.


```cpp
#include <iostream>
using namespace std;
```



The `main` function is the entry point of the program. Inside this function, three integer variables `a`, `b`, and `c` are declared and initialized with a hexadecimal, octal, and binary literal, respectively.


```cpp
int a = 0x1A; 
int b = 032; 
int c = 0b1101;
```



In C++, hexadecimal literals are prefixed with `0x` or `0X`, octal literals are prefixed with `0`, and binary literals are prefixed with `0b` or `0B`. The hexadecimal literal `0x1A` and the octal literal `032` both represent the decimal number 26, while the binary literal `0b1101` represents the decimal number 13.



The program then uses `cout` to print the values of these variables to the console. The `endl` manipulator is used to insert a new line.


```cpp
cout << "Hexadecimal literal: " << a << endl;
cout << "Octal literal: " << b << endl;
cout << "Binary literal: " << c << endl;
```



Finally, the `main` function returns 0 to indicate successful execution of the program.


```cpp
return 0;
```



This code is a good demonstration of how different types of integer literals can be used in C++.
