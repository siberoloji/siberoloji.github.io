---
draft: false

title:  'C++ Nested if statement'
date: '2024-06-22T23:33:59+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /c-nested-if-statement/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
    - 'nested if'
---


In this article, we share an example showing C++ nested if statement.


```cpp
#include <iostream>

using namespace std;

int main() {
/* nested if else statement */
    int a;
    cout << "Enter a positive integer number: ";
    cin >> a;
    if (a < 20) {
        cout << "a is less than 20 ";
        if (a < 10)
            cout << "a is less than 10 ";
        else
            cout << "a is not less than 10 ";
    } else {
        if (a == 20) {
            cout << "a is equal to 20 ";
        } else
            cout << "a is greater than 20 ";
    }
    return 0;
}
```
