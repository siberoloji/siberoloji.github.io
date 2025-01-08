---
draft: false

title:  'Printing int, float and string values ​​with printf in C++'
date: '2024-06-28T01:19:55+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'This code defines a main function where the int and float variables are constants and the text variable is not. Prints the values ​​number, realNumber, and text and then returns 0.' 
 
url:  /printing-int-float-and-string-values-with-printf-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
    - printf
---


This code defines a main function where the int and float variables are constants and the text variable is not. Prints the values ​​number, realNumber, and text and then returns 0.


```cpp
#include <iostream>
#include <cstdio>
#include <string>
using namespace std;

int main() {
    constexpr int number = 123;
    constexpr float realNumber = 3.146;
    string text = "Hello World";
    printf("Number: %d ", number);
    printf("Pi value: %.2f ", realNumber);
    printf("Text: %s ", text.c_str());
    return 0;
}
```
