---
draft: false

title:  'C++ Example calculating the factorial of the entered number'
date: '2024-06-28T16:20:50+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'In this example, we show how to calculate the factorial of the entered number with the help of a function.' 
 
url:  /c-example-calculating-the-factorial-of-the-entered-number/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
---


In this example, we show how to calculate the factorial of the entered number with the help of a function.


```bash
#include <iostream>
using namespace std;

int factorial(int num) {
    int result = 1;
    for (int i = 2; i <= num; i++) {
        result *= i;
    }
    return result;
}

int main() {
    int number;
    cout << "Enter a number: ";
    cin >> number;
    int factorialResult = factorial(number);
    cout << "Factorial: " << factorialResult << endl;

    return 0;
}
```
