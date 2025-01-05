---
draft: false

title:  'C++ do-while döngüsü ile faktöriyel hesaplama'
date: '2024-06-28T23:19:21+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu örneğimizde, do while döngüsünü kullanarak faktöriyel hesaplaması nasıl yapılır konusunu gösteriyoruz.' 
 
url:  /tr/c-do-while-dongusu-ile-faktoriyel-hesaplama/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Kod Örnekleri'
tags:
    - c++
    - 'do while'
---


Bu örneğimizde, do while döngüsünü kullanarak faktöriyel hesaplaması nasıl yapılır konusunu gösteriyoruz.


```cpp
#include &lt;iostream&gt;
using namespace std;

int calculateFactorial(int number) {
    int result = 1;
    for (int i = 1; i &lt;= number; i++) {
        result *= i;
    }
    return result;
}

int main() {
    int inputNumber;
    char exitKey;
    
    do {
        cout &lt;&lt; "Enter a number between 1 and 10: ";
        cin &gt;&gt; inputNumber;
        
        if (inputNumber &lt; 1) {
            cout &lt;&lt; "Number must be greater than 0. ";
        } else if (inputNumber &gt; 10) {
            cout &lt;&lt; "Number must be less than or equal to 10. ";
        } else {
            int factorial = calculateFactorial(inputNumber);
            cout &lt;&lt; "Result: " &lt;&lt; factorial &lt;&lt; endl;
        }
        
        cout &lt;&lt; "Press 'h' to exit, any other key to continue: ";
        cin &gt;&gt; exitKey;
    } while (exitKey != 'h');
    
    return 0;
}
```
