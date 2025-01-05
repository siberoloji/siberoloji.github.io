---
draft: false

title:  'C++ 2 string variable concatenation'
date: '2024-06-27T23:58:54+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'In this article, we show an example of combining 2 string variables.' 
 
url:  /c-2-string-variable-concatenation/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
    - 'string concatenation'
---


In this article, we show an example of combining 2 string variables.


```cpp
#include &lt;iostream&gt;
#include &lt;string&gt;

int main() {
    std::string firstString = "prs";
    std::string secondString = "def";
    std::string result;
    result = firstString + secondString;
    std::cout &lt;&lt; result &lt;&lt; std::endl;
    return 0;
}
```
