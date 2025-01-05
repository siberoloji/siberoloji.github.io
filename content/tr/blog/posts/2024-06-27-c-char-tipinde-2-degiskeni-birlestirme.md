---
draft: false

title:  'C++ char tipinde 2 değişkeni birleştirme'
date: '2024-06-27T23:37:05+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu örneğimizde, uzunluğu 50 karakter olarak belirlenmiş 2 adet char değişkenini, strcat metodu ile birleştirmeyi görebilirsiniz.' 
 
url:  /tr/c-char-tipinde-2-degiskeni-birlestirme/ 
featured_image: /images/cpp.png
categories:
    - 'C++ Kod Örnekleri'
tags:
    - c++
    - strcat
---


Bu örneğimizde, uzunluğu 50 karakter olarak belirlenmiş 2 adet char değişkenini, strcat metodu ile birleştirmeyi görebilirsiniz.


```cpp
#include &lt;iostream&gt;
#include &lt;cstring&gt;
using namespace std;

int main() {
    constexpr size_t bufferSize = 50;
    char firstString[bufferSize] = "abc";
    char secondString[bufferSize] = "def";

    cout &lt;&lt; "First string: " &lt;&lt; firstString &lt;&lt; '\n';
    cout &lt;&lt; "Second string: " &lt;&lt; secondString &lt;&lt; '\n';

    strcat(firstString, secondString);

    cout &lt;&lt; "Concatenated string: " &lt;&lt; firstString &lt;&lt; '\n';

    return 0;
}
```
