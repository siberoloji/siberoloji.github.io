---
draft: false

title:  'C++ int ile float değişkenlerinin toplanması'
date: '2024-06-28T16:03:59+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/c-int-ile-float-degiskenlerinin-toplanmasi/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Kod Örnekleri'
tags:
    - c++
---


Bu örneğimizde int ve float türünde 2 değişkenin toplamını bulmayı gösteriyoruz.


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
