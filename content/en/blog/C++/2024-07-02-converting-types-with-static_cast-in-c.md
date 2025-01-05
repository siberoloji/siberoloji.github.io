---
draft: false

title:  'Converting types with static_cast in C++'
date: '2024-07-02T14:23:56+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /converting-types-with-static_cast-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code is a simple demonstration of the `static_cast` operator, which is used to convert an expression to a new type.



## Code


```cpp
// This program demonstrates the use of static_cast in C++
// static_cast&lt;newtype&gt;(expr) is used to cast an expression to a new type

#include &lt;iostream&gt;
using namespace std;

int main() {
    // Declare and initialize integer variables
    int numberOne = 56;
    int numberTwo = 92;

    // Declare and initialize a character variable
    char character = 'a';

    // Display the character equivalent of numberOne
    // static_cast&lt;char&gt;(numberOne) converts the integer to a character
    cout &lt;&lt; "a" &lt;&lt; " " &lt;&lt; static_cast&lt;char&gt;(numberOne) &lt;&lt; endl;

    // Display the character equivalent of numberTwo
    // static_cast&lt;char&gt;(numberTwo) converts the integer to a character
    cout &lt;&lt; "b" &lt;&lt; " " &lt;&lt; static_cast&lt;char&gt;(numberTwo) &lt;&lt; endl;

    // Display the integer equivalent of character
    // static_cast&lt;int&gt;(character) converts the character to an integer
    cout &lt;&lt; "c" &lt;&lt; " " &lt;&lt; static_cast&lt;int&gt;(character) &lt;&lt; endl;

    // End of program
    return 0;
}
```



## Explanation



The provided C++ code is a simple demonstration of the `static_cast` operator, which is used to convert an expression to a new type.



The program begins by including the `iostream` library and declaring the `std` namespace for usage. This is a common practice in C++ to allow for easier usage of standard library functions, such as `cout` for console output.


```cpp
#include &lt;iostream&gt;
using namespace std;
```



In the `main` function, three variables are declared and initialized: two integers (`numberOne` and `numberTwo`) and one character (`character`).


```cpp
int numberOne = 56;
int numberTwo = 92;
char character = 'a';
```



The `static_cast` operator is then used to convert these variables to different types. The `static_cast&lt;char&gt;(numberOne)` expression converts the integer `numberOne` to a character, and its result is printed to the console. The same operation is performed for `numberTwo`.


```cpp
cout &lt;&lt; "a" &lt;&lt; " " &lt;&lt; static_cast&lt;char&gt;(numberOne) &lt;&lt; endl;
cout &lt;&lt; "b" &lt;&lt; " " &lt;&lt; static_cast&lt;char&gt;(numberTwo) &lt;&lt; endl;
```



Finally, the `character` variable is converted to an integer using `static_cast&lt;int&gt;(character)`, and the result is printed to the console.


```cpp
cout &lt;&lt; "c" &lt;&lt; " " &lt;&lt; static_cast&lt;int&gt;(character) &lt;&lt; endl;
```



In summary, this program demonstrates how to use the `static_cast` operator in C++ to convert between different data types. It's a simple but effective illustration of type casting in C++.



## Output


```cpp
a 8
b \
c 97

Process finished with exit code 0```
