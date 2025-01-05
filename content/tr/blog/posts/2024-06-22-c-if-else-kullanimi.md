---
draft: false

title:  'C++ if else kullanımı'
date: '2024-06-22T23:37:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazımızda, C++ if else kullanımını inceleyebilirsiniz. ' 
 
url:  /tr/c-if-else-kullanimi/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Kod Örnekleri'
tags:
    - 'c++ if else'
---


Bu yazımızda, C++ if else kullanımını inceleyebilirsiniz. 


```cpp
#include &lt;iostream&gt;

using namespace std;

int main() {
/* if else statement */
    int a;
    cout &lt;&lt; "Enter a positive integer number: ";
    cin &gt;&gt; a;
    if (a &lt; 20) {
        cout &lt;&lt; "a is less than 20 ";
    } else {
        cout &lt;&lt; "a is not less than 20 ";
    }
    return 0;
}
```
