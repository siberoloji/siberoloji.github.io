---
draft: false

title:  'while loop with examples in C++'
date: '2024-07-03T23:06:58+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /while-loop-with-examples-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code demonstrates various uses of the `while` loop, showcasing how it can be utilized for basic iteration, and how control flow statements like `break`, `continue`, and `return` can be integrated within these loops to manage their execution more precisely.



## Code


```cpp
#include <iostream>
using namespace std;

/**
 * Demonstrates various uses of the while loop in C++.
 *
 * This program includes examples of basic while loops, and while loops with control
 * flow statements such as break, continue, and return to manage loop execution.
 */
int main() {
    // Basic while loop example
    int i = 0;
    while (i < 10) {
        cout << i << endl; // Prints numbers from 0 to 9
        i++;
    }
    cout << "Done" << endl; // Indicates the end of the loop

    // While loop with break statement
    i = 0;
    while (i < 10) {
        if (i == 5) {
            break; // Exits the loop when i equals 5
        }
        cout << i << endl; // Prints numbers from 0 to 4
        i++;
    }
    cout << "Done" << endl; // Indicates the end of the loop

    // While loop with continue statement
    i = 0;
    while (i < 10) {
        if (i == 5) {
            i++; // Increment before continue to avoid infinite loop
            continue; // Skips the rest of the loop body when i equals 5
        }
        cout << i << endl; // Prints numbers from 0 to 9, skipping 5
        i++;
    }
    cout << "Done" << endl; // Indicates the end of the loop

    // While loop with return statement
    i = 0;
    while (i < 10) {
        if (i == 5) {
            return 0; // Exits the program when i equals 5
        }
        cout << i << endl; // Prints numbers from 0 to 4
        i++;
    }
    cout << "Done" << endl; // This line is never reached due to the return statement

    return 0;
}
```



## Explanation 



The provided C++ code demonstrates various uses of the `while` loop, showcasing how it can be utilized for basic iteration, and how control flow statements like `break`, `continue`, and `return` can be integrated within these loops to manage their execution more precisely.



Initially, the code presents a basic `while` loop example where a counter `i` is incremented in each iteration until it reaches 10. This loop prints numbers from 0 to 9, illustrating the fundamental use of `while` for repetitive tasks.


```cpp
int i = 0;
while (i < 10) {
    cout << i << endl;
    i++;
}
```



Following this, the code explores a `while` loop that incorporates a `break` statement. This loop is designed to exit prematurely when `i` equals 5. Until that point, it functions similarly to the first loop, printing numbers from 0 to 4. The `break` statement demonstrates how to exit a loop based on a condition, offering a way to halt iteration when a specific criterion is met.


```cpp
if (i == 5) {
    break;
}
```



Next, the code introduces a `while` loop with a `continue` statement. This loop skips the current iteration when `i` equals 5, effectively omitting the number 5 from the output. It highlights how `continue` can be used to skip certain iterations within a loop, based on specific conditions, without exiting the loop entirely.


```cpp
if (i == 5) {
    i++;
    continue;
}
```



Lastly, the code features a `while` loop that employs a `return` statement to exit not just the loop but the entire program when `i` equals 5. This example shows how `return` can be used within a loop to terminate the program execution based on a condition, providing a direct way to control the flow of the program from within iterative structures.


```cpp
if (i == 5) {
    return 0;
}
```



Each of these examples serves to illustrate the flexibility and control that `while` loops offer in C++, enabling developers to manage loop execution with precision through the use of control flow statements.



## Output


```cpp
0
1
2
3
4
5
6
7
8
9
Done
0
1
2
3
4
Done
0
1
2
3
4
6
7
8
9
Done
0
1
2
3
4

Process finished with exit code 0```
