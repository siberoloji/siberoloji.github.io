---
draft: false

title:  'Switch &amp; Case statement in C++'
date: '2024-08-01T23:28:01+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /switch-case-statement-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code demonstrates the use of a `switch-case` statement to handle different user inputs.



## Code


```cpp
#include &lt;iostream&gt;
using namespace std;

/**
 * \brief Main function demonstrating the use of switch-case statement in C++.
 *
 * This program prompts the user to enter a number and then uses a switch-case
 * statement to print the corresponding word for numbers 1 to 5. For numbers 6
 * and 7, it prints "Six or Seven". For any other number, it prints "Invalid number".
 *
 * \return int Returns 0 upon successful execution.
 */
int main() {
    int number;  ///&lt; Variable to store the user input number.
    cout &lt;&lt; "Enter a number between 1-7: ";
    cin &gt;&gt; number;

    switch (number) {
        case 1:
            cout &lt;&lt; "One" &lt;&lt; endl;  ///&lt; Prints "One" if the number is 1.
        break;
        case 2:
            cout &lt;&lt; "Two" &lt;&lt; endl;  ///&lt; Prints "Two" if the number is 2.
        break;
        case 3:
            cout &lt;&lt; "Three" &lt;&lt; endl;  ///&lt; Prints "Three" if the number is 3.
        break;
        case 4:
            cout &lt;&lt; "Four" &lt;&lt; endl;  ///&lt; Prints "Four" if the number is 4.
        break;
        case 5:
            cout &lt;&lt; "Five" &lt;&lt; endl;  ///&lt; Prints "Five" if the number is 5.
        break;
        case 6:
        case 7:
            cout &lt;&lt; "Six or Seven" &lt;&lt; endl;  ///&lt; Prints "Six or Seven" if the number is 6 or 7.
        break;
        default:
            cout &lt;&lt; "Invalid number" &lt;&lt; endl;  ///&lt; Prints "Invalid number" for any other number.
    }

    return 0;
}
```



## Explanation



The provided C++ code demonstrates the use of a `switch-case` statement to handle different user inputs. The program begins by including the necessary header file `&lt;iostream&gt;` and using the `std` namespace to simplify the code.


```cpp
#include &lt;iostream&gt;
using namespace std;
```



The `main` function is the entry point of the program. It starts by declaring an integer variable `number` to store the user's input.


```cpp
int main() {
    int number;
    cout &lt;&lt; "Enter a number between 1-7: ";
    cin &gt;&gt; number;
```



The program then uses a `switch-case` statement to determine the output based on the value of `number`. Each `case` corresponds to a specific number, and the program prints the corresponding word for numbers 1 to 5. For example, if the user inputs `1`, the program prints "One".


```cpp
switch (number) {
    case 1:
        cout &lt;&lt; "One" &lt;&lt; endl;
        break;
    case 2:
        cout &lt;&lt; "Two" &lt;&lt; endl;
        break;
    // ... other cases
}
```



For the numbers `6` and `7`, the program prints "Six or Seven". This is achieved by grouping these cases together without a `break` statement between them.


```cpp
case 6:
case 7:
    cout &lt;&lt; "Six or Seven" &lt;&lt; endl;
    break;
```



If the user inputs any number outside the range of 1 to 7, the `default` case is executed, and the program prints "Invalid number".


```cpp
default:
    cout &lt;&lt; "Invalid number" &lt;&lt; endl;
}
```



Finally, the `main` function returns `0` to indicate successful execution.


```cpp
return 0;
}
```



This code effectively demonstrates how to use a `switch-case` statement in C++ to handle multiple conditions based on user input.



## Output


```cpp
Enter a number between 1-7: 3
Three

Process finished with exit code 0```
