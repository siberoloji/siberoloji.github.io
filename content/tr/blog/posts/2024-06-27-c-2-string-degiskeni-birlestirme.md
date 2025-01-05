---
draft: false

title:  'C++ 2 string değişkeni birleştirme'
date: '2024-06-27T23:56:31+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazımızda, 2 adet string değişkeni birleştirme örneğini gösteriyoruz.' 
 
url:  /tr/c-2-string-degiskeni-birlestirme/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Kod Örnekleri'
tags:
    - c++
    - 'string birleştirme'
---


Bu yazımızda, 2 adet string değişkeni birleştirme örneğini gösteriyoruz.


```cpp
#include &lt;iostream&gt;
#include &lt;string&gt;

int main() {
    std::string firstString = "prs";
    std::string secondString = "def";
    std::string result;
    result = firstString + secondString;
    std::cout &lt;&lt; result &lt;&lt; std::endl;
    return 0;
}
```
