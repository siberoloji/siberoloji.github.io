---
draft: false

title:  'C++ Girilen sayının faktöriyelini hesaplayan örnek'
date: '2024-06-28T16:19:02+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu örneğimizde, girilen sayının faktöriyelini bir fonksiyon yardımı ile hesaplamayı gösteriyoruz.' 
 
url:  /tr/c-girilen-sayinin-faktoriyelini-hesaplayan-ornek/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Kod Örnekleri'
tags:
    - c++
---


Bu örneğimizde, girilen sayının faktöriyelini bir fonksiyon yardımı ile hesaplamayı gösteriyoruz.


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
