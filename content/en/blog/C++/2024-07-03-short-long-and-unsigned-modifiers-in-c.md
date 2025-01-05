---
draft: false

title:  'Short long and unsigned modifiers in C++'
date: '2024-07-03T01:52:32+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /short-long-and-unsigned-modifiers-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code demonstrates the declaration and usage of various fundamental data types and their sizes.



## Code


```cpp
#include &lt;iostream&gt;
using namespace std;

/**
 * @brief Main function demonstrating the use of various data types in C++ and their sizes.
 *
 * This program declares variables of different data types including integer types
 * (int, short int, long int, unsigned int, unsigned short int, unsigned long int),
 * character types (char, unsigned char, signed char),
 * and floating-point types (float, double, long double).
 * It then prints the size of each data type in bytes.
 *
 * @return int Returns 0 upon successful execution.
 */
int main() {
    
    // Integer types
    int Integer; // Range: -2147483648 to 2147483647
    short int shortInteger; // Range: -32768 to 32767
    long int longInteger; // Range: -9223372036854775808 to 9223372036854775807
    unsigned int unsignedInteger; // Range: 0 to 4294967295
    unsigned short int unsignedShortInteger; // Range: 0 to 65535
    unsigned long int unsignedlongInteger; // Range: 0 to 18446744073709551615

    // Character types
    char normalChar; // Range: -128 to 127
    unsigned char unsignedChar; // Range: 0 to 255
    signed char signedCchar; // Range: -128 to 127 (same as char)

    // Floating-point types
    float normalFloat; // Range: 1.4012984643248171e-45 to 3.4028234663852886e+38
    double normalDouble; // Range: 2.2250738585072014e-308 to 1.7976931348623157e+308
    long double normalLongDouble; // Range: 2.2250738585072014e-308 to 1.7976931348623157e+308

    // Printing the size of each data type
    cout &lt;&lt;"The size of int is " &lt;&lt;sizeof(Integer) &lt;&lt; " bytes" &lt;&lt; endl;
    cout &lt;&lt;"The size of short int is " &lt;&lt;sizeof(shortInteger) &lt;&lt; " bytes" &lt;&lt; endl;
    cout &lt;&lt;"The size of long int is " &lt;&lt;sizeof(longInteger) &lt;&lt; " bytes" &lt;&lt; endl;
    cout &lt;&lt;"The size of unsigned int is " &lt;&lt;sizeof(unsignedInteger) &lt;&lt; " bytes" &lt;&lt; endl;
    cout &lt;&lt;"The size of unsigned short int is " &lt;&lt;sizeof(unsignedShortInteger) &lt;&lt; " bytes" &lt;&lt; endl;
    cout &lt;&lt;"The size of unsigned long int is " &lt;&lt;sizeof(unsignedlongInteger) &lt;&lt; " bytes" &lt;&lt; endl;
    cout &lt;&lt;"The size of char is " &lt;&lt;sizeof(normalChar) &lt;&lt; " bytes" &lt;&lt; endl;
    cout &lt;&lt;"The size of unsigned char is " &lt;&lt;sizeof(unsignedChar) &lt;&lt; " bytes" &lt;&lt; endl;
    cout &lt;&lt;"The size of signed char is " &lt;&lt;sizeof(signedCchar) &lt;&lt; " bytes" &lt;&lt; endl;
    cout &lt;&lt;"The size of float is " &lt;&lt;sizeof(normalFloat) &lt;&lt; " bytes" &lt;&lt; endl;
    cout &lt;&lt;"The size of double is " &lt;&lt;sizeof(normalDouble) &lt;&lt; " bytes" &lt;&lt; endl;
    cout &lt;&lt;"The size of long double is " &lt;&lt;sizeof(normalLongDouble) &lt;&lt; " bytes" &lt;&lt; endl;

    return 0;
}
```



## Explanation



The provided C++ code demonstrates the declaration and usage of various fundamental data types and their sizes. It begins by including the `&lt;iostream&gt;` header, enabling input and output operations, and uses the `std` namespace to avoid prefixing standard library entities with `std::`.



The main function, which is the entry point of the program, declares variables of different data types, including integer types (`int`, `short int`, `long int`, `unsigned int`, `unsigned short int`, `unsigned long int`), character types (`char`, `unsigned char`, `signed char`), and floating-point types (`float`, `double`, `long double`). Each variable is accompanied by a comment indicating its range, which is crucial for understanding the limits of each data type.



For example, the integer variable declaration is shown as follows:


```cpp
int Integer; // Range: -2147483648 to 2147483647```



This line declares an `int` variable named `Integer`, which can store values from -2,147,483,648 to 2,147,483,647.



After declaring these variables, the program prints the size of each data type in bytes using the `sizeof` operator. This is a compile-time operator that determines the size, in bytes, of a variable or data type. The output is directed to the console using `cout`, which is part of the `iostream` library.



For instance, the size of the `int` data type is printed with the following line:


```cpp
cout &lt;&lt;"The size of int is " &lt;&lt;sizeof(Integer) &lt;&lt; " bytes" &lt;&lt; endl;
```



This line outputs the size of an `int` in bytes, helping to understand how much memory each data type consumes.



The program concludes by returning 0, indicating successful execution. This code snippet is a practical demonstration for beginners to understand the sizes of different data types in C++, which is fundamental in choosing the appropriate type for variables based on the range of values they are expected to hold and the memory efficiency.



## Output


```cpp
The size of int is 4 bytes
The size of short int is 2 bytes
The size of long int is 8 bytes
The size of unsigned int is 4 bytes
The size of unsigned short int is 2 bytes
The size of unsigned long int is 8 bytes
The size of char is 1 bytes
The size of unsigned char is 1 bytes
The size of signed char is 1 bytes
The size of float is 4 bytes
The size of double is 8 bytes
The size of long double is 16 bytes

Process finished with exit code 0```
