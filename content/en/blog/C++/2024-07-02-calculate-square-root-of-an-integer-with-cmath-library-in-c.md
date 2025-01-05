---
draft: false

title:  'Calculate square root of an integer with cmath library in C++'
date: '2024-07-02T14:48:36+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /calculate-square-root-of-an-integer-with-cmath-library-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code is a simple program that calculates the square root of a user-provided number. It begins by including the necessary libraries, `iostream` for input/output operations and `cmath` for mathematical operations.



## Code


```cpp
#include &lt;iostream&gt;
#include &lt;cmath&gt;
using namespace std;

// Main function of the program
int main() {
    // Declare a float variable to store the user's input
    float inputNumber;

    // Prompt the user to enter a number
    cout &lt;&lt; "Enter a number to calculate its square root: ";
    // Store the user's input in the variable
    cin &gt;&gt; inputNumber;

    // Check if the input number is non-negative
    if (inputNumber &gt;= 0.0) {
        // Calculate the square root of the input number
        float squareRoot = sqrt(inputNumber);
        // Print the input number
        cout &lt;&lt; "Input number: " &lt;&lt; inputNumber &lt;&lt; " ";
        // Print the square root of the input number
        cout &lt;&lt; "Square root: " &lt;&lt; squareRoot &lt;&lt; " ";
    }
}
```



## Explanation



The provided C++ code is a simple program that calculates the square root of a user-provided number. It begins by including the necessary libraries, `iostream` for input/output operations and `cmath` for mathematical operations.


```cpp
#include &lt;iostream&gt;
#include &lt;cmath&gt;
using namespace std;
```



The main function of the program starts with the declaration of a float variable `inputNumber` which is used to store the user's input.


```cpp
float inputNumber;
```



The program then prompts the user to enter a number using `cout` and stores the user's input in the `inputNumber` variable using `cin`.


```cpp
cout &lt;&lt; "Enter a number to calculate its square root: ";
cin &gt;&gt; inputNumber;
```



The program checks if the input number is non-negative using an `if` statement. This is important because the square root of a negative number is not a real number and would result in an error.


```cpp
if (inputNumber &gt;= 0.0) {```



Inside the `if` statement, the program calculates the square root of the input number using the `sqrt` function from the `cmath` library and stores the result in the `squareRoot` variable.


```cpp
float squareRoot = sqrt(inputNumber);
```



Finally, the program prints the input number and its square root using `cout`.


```cpp
cout &lt;&lt; "Input number: " &lt;&lt; inputNumber &lt;&lt; " ";
cout &lt;&lt; "Square root: " &lt;&lt; squareRoot &lt;&lt; " ";
```



This code is a simple demonstration of user input, conditional statements, and mathematical operations in C++.



## Output


```cpp
Enter a number to calculate its square root: 15
Input number: 15
Square root: 3.87298

Process finished with exit code 0```
