---
draft: false

title:  'Comment types in C++'
date: '2024-06-30T23:57:38+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /comment-types-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


We are demontrating single line and multi line comments in C++


```cpp
#include <iostream>
using namespace std;
// we will demonstrate the use of comments  in this program
int main() {
    // This is a single line comment
    cout << "Hello, World!" << endl; // This is also a single line comment
    /* This is a multi-line comment
    This is a multi-line comment
    This is a multi-line comment
    */
    return 0;
}
```



In the above code, we have used single-line comments and multi-line comments. 



Single-line comments start with // and end at the end of the line. 



Multi-line comments start with /* and end with */. Comments are ignored by the compiler and are used to make the code more readable and understandable. Output: Hello, World! In the above code, we have used comments to explain the code. You can also use comments to disable a part of the code.
