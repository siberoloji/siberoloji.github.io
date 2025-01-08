---
draft: false

title:  'C++ int variable with different defining ways'
date: '2024-06-30T22:47:17+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /c-int-variable-with-different-defining-ways/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


We are explaining the use of int variables with different defining ways


```cpp
// Creator: ibrahim (30.06.2024 00:00)    
/**
 * @file main.cpp
 * @brief Demonstrates the use of int with different defining ways in C++
 */

#include <iostream>

/**
 * @brief Main function of the program
 * 
 * Defines four integer variables in different ways and prints their values.
 * 
 * @return int Returns 0 upon successful execution
 */
int main() {
    int numberOne = 5; ///< 5 is a decimal number by default in C++
    int numberTwo = 1111111111; ///< 1111111111 is a decimal number by default in C++
    int numberThree = 1'111'111'111; ///< 1'111'111'111 is a decimal number by default in C++
    int numberFour = -1'111'111'111; ///< -1'111'111'111 is a decimal number by default in C++

    std::cout << "numberOne: " << numberOne << std::endl;
    std::cout << "numberTwo: " << numberTwo << std::endl;
    std::cout << "numberThree: " << numberThree << std::endl;
    std::cout << "numberFour: " << numberFour << std::endl;

    return 0;
}
```



The provided C++ code is a simple demonstration of how to define integer variables in different ways. It includes the use of single quotes as digit separators for readability, which is a feature available in C++14 and later versions.



The code begins by including the `iostream` library, which provides facilities for input/output operations.


```cpp
#include <iostream>
```



In the `main` function, four integer variables are defined: `numberOne`, `numberTwo`, `numberThree`, and `numberFour`. Each of these variables is assigned a different integer value.


```cpp
int numberOne = 5;
int numberTwo = 1111111111;
```



The third and fourth variables, `numberThree` and `numberFour`, are defined using digit separators (single quotes) for better readability. This does not change the value of the integer; it's purely for making the code easier to read.


```cpp
int numberThree = 1'111'111'111;
int numberFour = -1'111'111'111;
```



The code then uses `std::cout` to print the values of these variables to the console. Each variable is printed on a new line.


```cpp
std::cout << "numberOne: " << numberOne << std::endl;
```



Finally, the `main` function returns 0, indicating successful execution of the program.
