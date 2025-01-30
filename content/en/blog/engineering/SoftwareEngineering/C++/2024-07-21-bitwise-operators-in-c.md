---
draft: false

title:  'Bitwise operators in C++'
date: '2024-07-21T16:39:05+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /bitwise-operators-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code demonstrates the use of various bitwise operators. 



## Code


```cpp
#include <iostream>
using namespace std;

/**
 * Demonstrates the use of bitwise operators in C++.
 *
 * Bitwise operators used:
 * - &amp; (AND)
 * - | (OR)
 * - ^ (XOR)
 * - ~ (NOT)
 * - << (LEFT SHIFT)
 * - >> (RIGHT SHIFT)
 *
 * The program performs bitwise operations on two integers and prints the results.
 *
 * @return int Exit status of the program.
 */
int main() {
    int i = 15; // First integer
    int j = 22; // Second integer

    // Perform bitwise AND operation and print the result
    cout << (i &amp; j) << endl; // Expected output: 6

    // Perform bitwise OR operation and print the result
    cout << (i | j) << endl; // Expected output: 31

    // Perform bitwise XOR operation and print the result
    cout << (i ^ j) << endl; // Expected output: 25

    // Perform bitwise NOT operation on the first integer and print the result
    cout << (~i) << endl; // Expected output: -16

    // Perform left shift operation on the first integer and print the result
    cout << (i << 2) << endl; // Expected output: 60

    // Perform right shift operation on the second integer and print the result
    cout << (j >> 2) << endl; // Expected output: 5

    return 0;
}
```



## Explanation 



The provided C++ code demonstrates the use of various bitwise operators. The program begins by including the necessary header file `iostream` and using the `std` namespace to simplify the code.


```cpp
#include <iostream>
using namespace std;
```



The `main` function initializes two integer variables, `i` and `j`, with the values 15 and 22, respectively.


```cpp
int i = 15; // First integer
int j = 22; // Second integer```



The program then performs several bitwise operations on these integers and prints the results using `cout`.


* **Bitwise AND (`&amp;`)**: This operation compares each bit of `i` and `j` and returns a new integer where each bit is set to 1 only if both corresponding bits of `i` and `j` are 1. The result of `i &amp; j` is 6.



```cpp
cout << (i &amp; j) << endl; // Expected output: 6```





* **Bitwise OR (`|`)**: This operation compares each bit of `i` and `j` and returns a new integer where each bit is set to 1 if at least one of the corresponding bits of `i` or `j` is 1. The result of `i | j` is 31.



```cpp
cout << (i | j) << endl; // Expected output: 31```





* **Bitwise XOR (`^`)**: This operation compares each bit of `i` and `j` and returns a new integer where each bit is set to 1 if only one of the corresponding bits of `i` or `j` is 1. The result of `i ^ j` is 25.



```cpp
cout << (i ^ j) << endl; // Expected output: 25```





* **Bitwise NOT (`~`)**: This operation inverts all the bits of `i`, turning 1s into 0s and vice versa. The result of `~i` is -16.



```cpp
cout << (~i) << endl; // Expected output: -16```





* **Left Shift (`<<`)**: This operation shifts the bits of `i` to the left by 2 positions, effectively multiplying `i` by 2^2 (or 4). The result of `i << 2` is 60.



```cpp
cout << (i << 2) << endl; // Expected output: 60```





* **Right Shift (`>>`)**: This operation shifts the bits of `j` to the right by 2 positions, effectively dividing `j` by 2^2 (or 4). The result of `j >> 2` is 5.



```cpp
cout << (j >> 2) << endl; // Expected output: 5```



Finally, the `main` function returns 0, indicating that the program has executed successfully.


```cpp
return 0;
```



This code provides a clear and concise demonstration of how bitwise operators work in C++, making it a useful reference for developers looking to understand these operations.



## Output


```cpp
6
31
25
-16
60
5

Process finished with exit code 0```
