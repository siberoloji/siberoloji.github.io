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
#include <iostream>
using namespace std;

int calculateFactorial(int number) {
    int result = 1;
    for (int i = 1; i <= number; i++) {
        result *= i;
    }
    return result;
}

int main() {
    int inputNumber;
    char exitKey;
    
    do {
        cout << "Enter a number between 1 and 10: ";
        cin >> inputNumber;
        
        if (inputNumber < 1) {
            cout << "Number must be greater than 0. ";
        } else if (inputNumber > 10) {
            cout << "Number must be less than or equal to 10. ";
        } else {
            int factorial = calculateFactorial(inputNumber);
            cout << "Result: " << factorial << endl;
        }
        
        cout << "Press 'h' to exit, any other key to continue: ";
        cin >> exitKey;
    } while (exitKey != 'h');
    
    return 0;
}
```
