---
draft: false

title:  'C++ int, float ve string değerlerini printf ile yazdırma'
date: '2024-06-28T01:17:31+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu kod, int ve float değişkenlerinin sabit, metin değişkenin sabit olmadığı bir main işlevi tanımlar.  number, realNumber ve text değerlerini yazdırır ve ardından 0 değerini döndürür.' 
 
url:  /tr/c-int-float-ve-string-degerlerini-printf-ile-yazdirma/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Kod Örnekleri'
tags:
    - c_str()
    - c++
    - printf
---
Bu kod, int ve float değişkenlerinin sabit, metin değişkenin sabit olmadığı bir main işlevi tanımlar. number, realNumber ve text değerlerini yazdırır ve ardından 0 değerini döndürür.
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
