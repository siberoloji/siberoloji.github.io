---
draft: false
title: C++ if else statement
date: 2024-06-22
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: In this article, you can examine the use of C++ if else statement.
url: /c-if-else-statement/
featured_image: /images/cpp.png
categories:
    - C++ Code Samples
tags:
    - c++
    - c++ code samples
    - c++ if else statement
---


In this article, you can examine the use of C++ if else statement.


```cpp
#include <iostream>

using namespace std;

int main() {
/* if else statement */
    int a;
    cout << "Enter a positive integer number: ";
    cin >> a;
    if (a < 20) {
        cout << "a is less than 20 ";
    } else {
        cout << "a is not less than 20 ";
    }
    return 0;
}
```
