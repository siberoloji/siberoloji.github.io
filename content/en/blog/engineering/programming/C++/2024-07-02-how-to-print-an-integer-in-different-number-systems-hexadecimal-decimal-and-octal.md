---
draft: false

title:  'How to print an integer in different number systems: hexadecimal, decimal, and octal?'
date: '2024-07-02T14:04:46+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /how-to-print-an-integer-in-different-number-systems-hexadecimal-decimal-and-octal/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code is a simple program that demonstrates how to print an integer in different number systems: hexadecimal, decimal, and octal.



## Code


```cpp
/**
* This is the main function of the program.
 * It demonstrates different ways to print an integer
 * in different number systems (hexadecimal, decimal, and octal).
 *
 * The function does the following:
 * 1. Declares an integer variable named `byte` and initializes it with the value 255.
 * 2. Prints the value of `byte` in hexadecimal format.
 * 3. Prints the value of `byte` in the last used number base
 * (which is hexadecimal from the previous line),
 * then it changes the number base to decimal and prints the `byte` again.
 * 4. Changes the number base to octal and prints the `byte`.
 *
 * @return 0 if the program runs successfully.
 */
#include <iostream>
#include <iomanip>

using namespace std;
int main() {
    int byte = 255;
    cout << hex << byte << endl;
    cout << byte << dec << byte << endl;
    cout << oct << byte << endl;
    // we can achieve same result with setbase function
    // setbase accept only 2, 8, 10 or 16 as parameter
    // setbase requires iomanip header

    cout << setbase(16) << byte << endl;
    cout << setbase(10) << byte << endl;
    cout << setbase(8) << byte << endl;
    cout << setbase(2) << byte << endl;

    return 0;
}
```



## Explanation



The provided C++ code is a simple program that demonstrates how to print an integer in different number systems: hexadecimal, decimal, and octal.



The program begins by including the necessary libraries, `iostream` for input/output operations and `iomanip` for input/output manipulations. The `using namespace std;` line allows the program to use the standard namespace, which includes functions like `cout` and `endl`.


```cpp
#include <iostream>
#include <iomanip>
using namespace std;
```



The `main` function is the entry point of the program. Inside this function, an integer variable named `byte` is declared and initialized with the value 255.


```cpp
int main() {
    int byte = 255;
```



The program then prints the value of `byte` in hexadecimal format using the `hex` manipulator.


```cpp
cout << hex << byte << endl;
```



Next, the program prints the value of `byte` in the last used number base (which is hexadecimal from the previous line), then it changes the number base to decimal using the `dec` manipulator and prints the `byte` again.


```cpp
cout << byte << dec << byte << endl;
```



The number base is then changed to octal using the `oct` manipulator and the `byte` is printed again.


```cpp
cout << oct << byte << endl;
```



Finally, the program demonstrates another way to change the number base using the `setbase` function from the `iomanip` library. This function accepts only 2, 8, 10, or 16 as parameters, representing binary, octal, decimal, and hexadecimal number systems respectively. cout << setbase(16) << byte << endl; cout << setbase(10) << byte << endl; cout << setbase(8) << byte << endl;



## Output


```cpp
ff
ff255
377
ff
255
377
255

Process finished with exit code 0```
