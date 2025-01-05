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
#include &lt;iostream&gt;

using namespace std;

int main() {
/* nested if else statement */
    int a;
    cout &lt;&lt; "Enter a positive integer number: ";
    cin &gt;&gt; a;
    if (a &lt; 20) {
        cout &lt;&lt; "a is less than 20\n";
        if (a &lt; 10)
            cout &lt;&lt; "a is less than 10\n";
        else
            cout &lt;&lt; "a is not less than 10\n";
    } else {
        if (a == 20) {
            cout &lt;&lt; "a is equal to 20\n";
        } else
            cout &lt;&lt; "a is greater than 20\n";
    }
    return 0;
}
```
