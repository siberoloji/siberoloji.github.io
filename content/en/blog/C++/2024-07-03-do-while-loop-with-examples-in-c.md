---
draft: false

title:  'do while loop with examples in C++'
date: '2024-07-03T23:14:07+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /do-while-loop-with-examples-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code demonstrates the use of `do-while` loops, a variant of loop that ensures the loop's body is executed at least once before the condition is checked.



## Code


```cpp
#include <iostream>
using namespace std;

/**
 * Demonstrates various uses of the do-while loop in C++.
 *
 * This program includes examples of basic do-while loops, and do-while loops with control
 * flow statements such as break, continue, and return to manage loop execution.
 */
int main() {
    int i = 0;

    // Basic do-while loop example
    // This loop will execute the block at least once and then check the condition at the end.
    i = 0;
    do {
        cout << i << endl; // Prints numbers from 0 to 9
        i++;
    } while (i < 10);
    cout << "Done" << endl; // Indicates the end of the loop

    // Do-while loop with break statement
    // This loop demonstrates how to exit the loop prematurely using a break statement.
    i = 0;
    do {
        if (i == 5) {
            break; // Exits the loop when i equals 5
        }
        cout << i << endl; // Prints numbers from 0 to 4
        i++;
    } while (i < 10);
    cout << "Done" << endl; // Indicates the end of the loop

    // Do-while loop with continue statement
    // This loop shows how to skip the rest of the loop body for the current iteration using continue.
    i = 0;
    do {
        if (i == 5) {
            i++; // Increment before continue to avoid infinite loop
            continue; // Skips printing 5
        }
        cout << i << endl; // Prints numbers from 0 to 9, skipping 5
        i++;
    } while (i < 10);
    cout << "Done" << endl; // Indicates the end of the loop

    // Do-while loop with return statement
    // This loop demonstrates using return within a loop to exit the program based on a condition.
    i = 0;
    do {
        if (i == 5) {
            return 0; // Exits the program when i equals 5
        }
        cout << i << endl; // Prints numbers from 0 to 4
        i++;
    } while (i < 10);
    cout << "Done" << endl; // This line is never reached due to the return statement

    return 0;
}
```



## Explanation 



The provided C++ code demonstrates the use of `do-while` loops, a variant of loop that ensures the loop's body is executed at least once before the condition is checked. This characteristic differentiates `do-while` loops from the more common `while` loops, where the condition is evaluated before the loop body is executed.



The first example in the code is a basic `do-while` loop that prints numbers from 0 to 9. The loop starts with `i` initialized to 0 and increments `i` in each iteration. The condition `i < 10` is checked after the loop body is executed, ensuring that the loop runs at least once.


```cpp
do {
    cout << i << endl;
    i++;
} while (i < 10);
```



Next, the code demonstrates how to use a `break` statement within a `do-while` loop to exit the loop prematurely. In this example, the loop is designed to break when `i` equals 5, thus it prints numbers from 0 to 4 before exiting.


```cpp
do {
    if (i == 5) {
        break;
    }
    cout << i << endl;
    i++;
} while (i < 10);
```



Following that, a `do-while` loop with a `continue` statement is shown. This loop skips the current iteration when `i` equals 5 by using `continue`, which causes the loop to immediately proceed to the next iteration. To prevent an infinite loop, `i` is incremented before the `continue` statement.


```cpp
do {
    if (i == 5) {
        i++;
        continue;
    }
    cout << i << endl;
    i++;
} while (i < 10);
```



Lastly, the code includes a `do-while` loop with a `return` statement. This loop exits not just the loop but the entire program when `i` equals 5. This demonstrates how a `return` statement can be used within a loop to control the flow of the program based on certain conditions.


```cpp
do {
    if (i == 5) {
        return 0;
    }
    cout << i << endl;
    i++;
} while (i < 10);
```



Each of these examples illustrates different ways to control the execution flow within `do-while` loops, showcasing their flexibility and utility in scenarios where at least one iteration of the loop is required.



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
