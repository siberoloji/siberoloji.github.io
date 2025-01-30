---
draft: false

title:  'Shortcut operators in C++'
date: '2024-07-01T14:31:46+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /shortcut-operators-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided code is a C++ program that demonstrates the use of shortcut operators. It includes the `iostream` library, which is used for input/output operations, and the `std` namespace is being used.



## Code


```cpp
/**
* Main function to demonstrate shortcut operators in C++.
 *
 * @return 0 indicating successful execution
 */

#include <iostream>
using namespace std;

int main() {
    int num1 = 1;
    int num2 = 2;
    int num3 = 3;
    int num4 = 4;
    int num5 = 5;
    int num6 = 6;
    int num7 = 7;
    int num8 = 8;
    int num9 = 9;
    int num10 = 10;

    num1 += num2;
    num3 -= num4;
    num5 *= num6;
    num7 /= num8;
    num9 %= num10;

    cout << "num1 = " << num1 << endl;
    cout << "num3 = " << num3 << endl;
    cout << "num5 = " << num5 << endl;
    cout << "num7 = " << num7 << endl;
    cout << "num9 = " << num9 << endl;

    return 0;
}
```



## Explanation



The provided code is a C++ program that demonstrates the use of shortcut operators. It includes the `iostream` library, which is used for input/output operations, and the `std` namespace is being used.



The `main` function is the entry point of the program. It initializes ten integer variables `num1` through `num10` with values from 1 to 10 respectively.


```cpp
int num1 = 1;
int num2 = 2;
// ...
int num10 = 10;
```



The program then demonstrates the use of various shortcut operators. The `+=` operator adds the value of `num2` to `num1` and assigns the result to `num1`. The `-=` operator subtracts `num4` from `num3` and assigns the result to `num3`. The `*=` operator multiplies `num5` by `num6` and assigns the result to `num5`. The `/=` operator divides `num7` by `num8` and assigns the result to `num7`. The `%=` operator calculates the remainder of `num9` divided by `num10` and assigns the result to `num9`.


```cpp
num1 += num2;
num3 -= num4;
num5 *= num6;
num7 /= num8;
num9 %= num10;
```



Finally, the program prints the values of `num1`, `num3`, `num5`, `num7`, and `num9` to the console using the `cout` object and the `<<` operator, which is used to send output to the standard output device (usually the screen).


```cpp
cout << "num1 = " << num1 << endl;
// ...
cout << "num9 = " << num9 << endl;
```



The `endl` manipulator is used to insert a new line. The program ends by returning 0, indicating successful execution.



## Output


```cpp
num1 = 3
num3 = -1
num5 = 30
num7 = 0
num9 = 9

Process finished with exit code 0```
