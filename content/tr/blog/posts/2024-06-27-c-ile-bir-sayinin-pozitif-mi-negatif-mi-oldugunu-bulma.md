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
#include &lt;iostream&gt;
using namespace std;

int main() {
    int number;
    cout &lt;&lt; "Please enter a number: ";
    cin &gt;&gt; number;

    if (number &gt; 0) {
        cout &lt;&lt; "Number is positive";
    } else if (number &lt; 0) {
        cout &lt;&lt; "Number is negative";
    } else {
        cout &lt;&lt; "Number is zero";
    }

    return 0;
}
```
