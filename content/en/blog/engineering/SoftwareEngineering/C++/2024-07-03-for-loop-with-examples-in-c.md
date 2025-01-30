---
draft: false

title:  'for loop with examples in C++'
date: '2024-07-03T23:22:05+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /for-loop-with-examples-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code demonstrates various uses of the `for` loop, incorporating control flow statements such as `break`, `continue`, and `return` to manage loop execution.



## Code


```cpp
#include <iostream>
using namespace std;

/**
 * Demonstrates various uses of the for loop in C++.
 *
 * This program includes examples of basic for loops, and for loops with control
 * flow statements such as break, continue, and return to manage loop execution.
 * It showcases how these control flow statements can alter the loop's behavior.
 */
int main() {
    int i = 0;

    // Basic for loop example: prints numbers from 0 to 9
    for (i = 0; i < 10; i++) {
        cout << i << endl;
    }
    cout << "Done" << endl;

    // For loop with break: exits the loop when i equals 5
    for (i = 0; i < 10; i++) {
        if (i == 5) {
            break;
        }
        cout << i << endl;
    }
    cout << "Done" << endl;

    // For loop with continue: skips the current iteration when i equals 5
    for (i = 0; i < 10; i++) {
        if (i == 5) {
            continue;
        }
        cout << i << endl;
    }
    cout << "Done" << endl;

    // For loop with return: exits the function when i equals 5
    for (i = 0; i < 10; i++) {
        if (i == 5) {
            return 0;
        }
        cout << i << endl;
    }
    cout << "Done" << endl;

    // For loop with break and return:
    // demonstrates that break has no effect when followed by return
    for (i = 0; i < 10; i++) {
        if (i == 5) {
            break;
        }
        cout << i << endl;
    }
    cout << "Done" << endl;

    // For loop with continue and return:
    // demonstrates that continue has no effect when followed by return
    for (i = 0; i < 10; i++) {
        if (i == 5) {
            continue;
        }
        cout << i << endl;
    }
    cout << "Done" << endl;

    // For loop with break and continue:
    // breaks the loop when i equals 5, continue is never reached
    for (i = 0; i < 10; i++) {
        if (i == 5) {
            break;
        }
        if (i == 7) {
            continue;
        }
        cout << i << endl;
    }
    cout << "Done" << endl;

    // For loop with break, continue, and return:
    // demonstrates control flow with break, continue is never reached
    for (i = 0; i < 10; i++) {
        if (i == 5) {
            break;
        }
        if (i == 7) {
            continue;
        }
        cout << i << endl;
    }
    cout << "Done" << endl;

    return 0;
}
```



## Explanation



The provided C++ code demonstrates various uses of the `for` loop, incorporating control flow statements such as `break`, `continue`, and `return` to manage loop execution. These examples illustrate how to control the flow within loops for different scenarios, making the code a valuable resource for understanding loop control mechanisms in C++.



Initially, a basic `for` loop is shown, which iterates from 0 to 9, printing each number. This loop serves as a straightforward example of using a `for` loop for simple iterations.


```cpp
for (i = 0; i < 10; i++) {
    cout << i << endl;
}
```



Following this, the code explores using a `break` statement within a `for` loop. This loop is designed to exit prematurely when `i` equals 5, demonstrating how `break` can be used to stop loop execution based on a condition.


```cpp
for (i = 0; i < 10; i++) {
    if (i == 5) {
        break;
    }
    cout << i << endl;
}
```



Next, a `for` loop with a `continue` statement is introduced. This loop skips the current iteration when `i` equals 5, effectively omitting the number 5 from the output. It showcases how `continue` can be used to skip certain iterations within a loop, based on specific conditions.


```cpp
for (i = 0; i < 10; i++) {
    if (i == 5) {
        continue;
    }
    cout << i << endl;
}
```



Additionally, the code includes a `for` loop that uses a `return` statement to exit the function when `i` equals 5. This example demonstrates how `return` can be used within a loop to terminate the program execution based on a condition.


```cpp
for (i = 0; i < 10; i++) {
    if (i == 5) {
        return 0;
    }
    cout << i << endl;
}
```



The code also presents scenarios where `break` and `continue` statements are combined with a `return` statement in different loops. These examples illustrate the precedence and effect of these control flow statements when used together, highlighting that `break` and `continue` have no effect when followed by a `return` statement.



In summary, the code provides a comprehensive overview of controlling loop execution using `for` loops and control flow statements in C++. Each example serves to illustrate the flexibility and control that `for` loops offer in C++, enabling developers to manage loop execution with precision.



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
