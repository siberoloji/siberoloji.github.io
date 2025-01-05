---
draft: false

title:  'Combining 2 variables of type char in C++'
date: '2024-06-27T23:39:08+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'In this example, you can see how to combine 2 char variables with a length of 50 characters using the strcat method.' 
 
url:  /combining-2-variables-of-type-char-in-c/ 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
    - strcat
---


In this example, you can see how to combine 2 char variables with a length of 50 characters using the strcat method.


```cpp
#include &lt;iostream&gt;
#include &lt;cstring&gt;
using namespace std;

int main() {
    constexpr size_t bufferSize = 50;
    char firstString[bufferSize] = "abc";
    char secondString[bufferSize] = "def";

    cout &lt;&lt; "First string: " &lt;&lt; firstString &lt;&lt; ' ';
    cout &lt;&lt; "Second string: " &lt;&lt; secondString &lt;&lt; ' ';

    strcat(firstString, secondString);

    cout &lt;&lt; "Concatenated string: " &lt;&lt; firstString &lt;&lt; ' ';

    return 0;
}
```
