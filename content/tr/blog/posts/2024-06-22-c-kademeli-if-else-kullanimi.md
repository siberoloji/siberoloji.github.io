---
draft: false

title:  'C++ kademeli if else kullanımı'
date: '2024-06-22T14:05:48+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'C++ için kademeli if-else kullanım örneğini bulabilirsiniz.' 
 
url:  /tr/c-kademeli-if-else-kullanimi/ 
featured_image: /images/cpp.png
categories:
    - 'C++ Kod Örnekleri'
tags:
    - c++
---


Aşağıda, C++ için kademeli if-else kullanım örneğini bulabilirsiniz.


```cpp
#include &lt;iostream&gt;

using namespace std;

int main() {
/* cascade if else statement */
    int a;
    cout &lt;&lt; "Enter a positive integer number: ";
    cin &gt;&gt; a;
    if (a &lt; 20) {
        cout &lt;&lt; "a is less than 20 ";
    } else if (a == 20) {
        cout &lt;&lt; "a is equal to 20 ";
    } else {
        cout &lt;&lt; "a is greater than 20 ";
    }
    return 0;
}
```
