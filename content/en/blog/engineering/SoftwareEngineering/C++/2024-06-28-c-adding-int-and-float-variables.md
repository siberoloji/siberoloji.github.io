---
draft: false

title:  'C++ adding int and float variables'
date: '2024-06-28T16:06:12+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /c-adding-int-and-float-variables/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
---


In this example, we show how to find the sum of 2 variables of type int and float.


```cpp
#include <iostream>

int main() {
    int firstNumber = 11;
    float secondNumber = 12.8;
    float sum = firstNumber + secondNumber;

    std::cout << "Sum: " << sum << std::endl;

    return 0;
}
```
