---
draft: false

title:  'C++ Nested if statement'
date: '2024-06-22T23:33:59+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /c-nested-if-statement/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
    - 'nested if'
---


In this article, we share an example showing C++ nested if statement.


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
