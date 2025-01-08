---
draft: false

title:  'Factorial calculation with C++ do-while loop'
date: '2024-06-28T23:21:08+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'In this example, we show how to calculate factorial using the do while loop.' 
 
url:  /factorial-calculation-with-c-do-while-loop/ 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
---


In this example, we show how to calculate factorial using the do while loop.


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
