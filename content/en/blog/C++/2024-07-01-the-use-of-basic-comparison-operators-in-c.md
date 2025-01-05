---
draft: false

title:  'The use of basic comparison operators in C++'
date: '2024-07-01T23:14:53+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /the-use-of-basic-comparison-operators-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code is a simple console application that demonstrates the use of basic comparison operators in C++.



## Code


```cpp
#include &lt;iostream&gt;
using namespace std;

int main() {
    // Initialize two integer variables x and y
    int x = 0, y = 0;

    // Print the question: is x equal to y?
    cout &lt;&lt; "Question: is x equal to y?" &lt;&lt; endl;

    // Check if x is equal to y
    if (x == y) {
        // If x is equal to y, print the result
        cout &lt;&lt; "x is equal to y" &lt;&lt; endl;
    }

    // Change the values of x and y
    x = 0, y = 1;

    // Print the question: is x not equal to y?
    cout &lt;&lt; "Question: is x not equal to y?" &lt;&lt; endl;

    // Check if x is not equal to y
    if (x != y) {
        // If x is not equal to y, print the result
        cout &lt;&lt; "x is not equal to y" &lt;&lt; endl;
    }

    // Change the values of x and y
    x = 1, y = 0;

    // Print the question: is x greater than y?
    cout &lt;&lt; "Question: is x greater than y?" &lt;&lt; endl;

    // Check if x is greater than y
    if (x &gt; y) {
        // If x is greater than y, print the result
        cout &lt;&lt; "x is greater than y" &lt;&lt; endl;
    }

    // Change the values of x and y
    x = 2, y = 1;

    // Print the question: is x greater than or equal to y?
    cout &lt;&lt; "Question: is x greater than or equal to y?" &lt;&lt; endl;

    // Check if x is greater than or equal to y
    if (x &gt;= y) {
        // If x is greater than or equal to y, print the result
        cout &lt;&lt; "x is greater than or equal to y" &lt;&lt; endl;
    }

    // Change the values of x and y
    x = 1, y = 2;

    // Print the question: is x less than (or equal to) y?
    cout &lt;&lt; "Question: is x less than (or equal to) y?" &lt;&lt; endl;

    // Check if x is less than or equal to y
    if (x &lt;= y) {
        // If x is less than or equal to y, print the result
        cout &lt;&lt; "x is less than or equal to y" &lt;&lt; endl;
    }

    // End of the program
    return 0;
}
```



## Explanation



The provided C++ code is a simple console application that demonstrates the use of basic comparison operators in C++. It does so by initializing two integer variables, `x` and `y`, and then comparing them using different operators.



Initially, `x` and `y` are both set to `0`:


```cpp
int x = 0, y = 0;
```



The code then prints a question to the console asking if `x` is equal to `y`:


```cpp
cout &lt;&lt; "Question: is x equal to y?" &lt;&lt; endl;
```



This is followed by an `if` statement that checks if `x` is indeed equal to `y` using the `==` operator. If the condition is true, it prints a message to the console:


```cpp
if (x == y) {
    cout &lt;&lt; "x is equal to y" &lt;&lt; endl;
}
```



The code then changes the values of `x` and `y` and repeats the process with different comparison operators (`!=`, `&gt;`, `&gt;=`, `&lt;`, `&lt;=`). Each time, it prints a question to the console, checks the condition, and prints a message if the condition is true.



For example, after changing `x` to `0` and `y` to `1`, the code checks if `x` is not equal to `y`:


```cpp
x = 0, y = 1;
cout &lt;&lt; "Question: is x not equal to y?" &lt;&lt; endl;
if (x != y) {
    cout &lt;&lt; "x is not equal to y" &lt;&lt; endl;
}
```



This pattern continues until all the comparison operators have been demonstrated. The program then ends with a `return 0;` statement, indicating successful execution.



## Output


```cpp
Question: is x equal to y?
x is equal to y
Question: is x not equal to y?
x is not equal to y
Question: is x greater than y?
x is greater than y
Question: is x greater than or equal to y?
x is greater than or equal to y
Question: is x less than (or equal to) y?
x is less than or equal to y

Process finished with exit code 0```
