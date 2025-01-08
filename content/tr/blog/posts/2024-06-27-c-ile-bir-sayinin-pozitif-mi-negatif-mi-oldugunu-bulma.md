---
draft: false

title:  'C++ ile bir sayının pozitif mi negatif mi olduğunu bulma'
date: '2024-06-27T23:18:46+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu örneğimizde, klavyeden girilen sayının pozitif, negatif veya sıfır mı olduğunu if- else if kullanımı ile kontrol ediyoruz.' 
 
url:  /tr/c-ile-bir-sayinin-pozitif-mi-negatif-mi-oldugunu-bulma/ 
featured_image: /images/cpp.png
categories:
    - 'C++ Kod Örnekleri'
tags:
    - c++
---


Bu örneğimizde, klavyeden girilen sayının pozitif, negatif veya sıfır mı olduğunu if- else if kullanımı ile kontrol ediyoruz.


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
