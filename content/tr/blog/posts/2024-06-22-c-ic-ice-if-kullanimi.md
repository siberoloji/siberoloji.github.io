---
draft: false

title:  'C++ iç içe if kullanımı'
date: '2024-06-22T23:32:25+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazımızda C++ iç içe geçmiş if ifadesini gösteren bir örnek paylaşıyoruz.' 
 
url:  /tr/c-ic-ice-if-kullanimi/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Kod Örnekleri'
tags:
    - 'içiçe if'
---
Bu yazımızda C++ iç içe geçmiş if ifadesini gösteren bir örnek paylaşıyoruz.
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
