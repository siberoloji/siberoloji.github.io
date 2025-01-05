---
draft: false

title:  'C++ Cascade if else statement'
date: '2024-06-22T14:08:08+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'You can see the usage of cascade if-else statement example below.' 
 
url:  /c-cascade-if-else-statement/ 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
---


You can see the usage of cascade if-else statement example below.


```cpp
#include &lt;iostream&gt;

using namespace std;

int main() {
/* cascade if else statement */
    int a;
    cout &lt;&lt; "Enter a positive integer number: ";
    cin &gt;&gt; a;
    if (a &lt; 20) {
        cout &lt;&lt; "a is less than 20\n";
    } else if (a == 20) {
        cout &lt;&lt; "a is equal to 20\n";
    } else {
        cout &lt;&lt; "a is greater than 20\n";
    }
    return 0;
}
```
