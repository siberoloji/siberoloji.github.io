---
draft: false

title:  'Finding whether a number is positive or negative with C++'
date: '2024-06-27T23:24:08+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'In this example, we check whether the number entered from the keyboard is positive, negative or zero by using if-else if.' 
 
url:  /finding-whether-a-number-is-positive-or-negative-with-c/ 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
---


In this example, we check whether the number entered from the keyboard is positive, negative or zero by using if-else if.


```bash
#include <iostream>
using namespace std;

int main() {
    int number;
    cout << "Please enter a number: ";
    cin >> number;

    if (number > 0) {
        cout << "Number is positive";
    } else if (number < 0) {
        cout << "Number is negative";
    } else {
        cout << "Number is zero";
    }

    return 0;
}
```
