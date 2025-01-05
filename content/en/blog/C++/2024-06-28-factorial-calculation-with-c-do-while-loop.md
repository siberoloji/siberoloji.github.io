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
