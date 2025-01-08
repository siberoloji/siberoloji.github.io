---
draft: false

title:  'C++ Defining a Pointer and changing its value'
date: '2024-06-28T23:59:21+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'In this example, we define a pointer and show how to view and change its value.' 
 
url:  /c-defining-a-pointer-and-changing-its-value/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
---


In this example, we define a pointer and show how to view and change its value.


```cpp
/**
* @brief Main function that demonstrates pointer manipulation.
 *
 * This function initializes an integer variable `value` with the value 10.
 * It then creates a pointer `pointer` that points to the memory address of `value`.
 * The program prints the initial value of `value`, its address,
 * and the value pointed to by `pointer`.
 * 
 * The program then updates the value pointed to by `pointer` to 20.
 * Finally, it prints the new value of `value`.
 *
 * @return 0 indicating successful execution of the program
 */
#include <iostream>
using namespace std;

int main() {
    int value = 10; // Initialize an integer variable with the value 10
    int* pointer = &amp;value; // Create a pointer that points to the memory address of value

    cout << "Initial value: " << value << endl; // Print the initial value of value
    cout << "Address of value: " << &amp;value << endl; // Print the memory address of value
    cout << "Value pointed to by pointer: " << *pointer << endl; // Print the value pointed to by pointer

    *pointer = 20; // Update the value pointed to by pointer to 20

    cout << "New value of value: " << value << endl; // Print the new value of value

    return 0; // Return 0 indicating successful execution of the program
}
```
