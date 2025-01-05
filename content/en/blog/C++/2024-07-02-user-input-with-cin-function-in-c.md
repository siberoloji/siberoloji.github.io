---
draft: false

title:  'User input with cin function in C++'
date: '2024-07-02T14:36:11+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /user-input-with-cin-function-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code is a simple console application that prompts the user to enter an integer, outputs the entered integer, doubles the entered integer, and then outputs the doubled value.



## Code


```cpp
#include &lt;iostream&gt; // Include the iostream library to enable input/output operations
using namespace std; // Use the standard namespace

// Main function
int main() {
    int userInput; // Declare an integer variable to store user input

    // Prompt the user to enter an integer
    cout &lt;&lt; "Enter an integer: ";
    cin &gt;&gt; userInput; // Read the user input from the console

    // Output the entered integer
    cout &lt;&lt; "You entered: " &lt;&lt; userInput &lt;&lt; endl;

    userInput = 2 * userInput; // Double the user input

    // Output the doubled value
    cout &lt;&lt; "The doubled value is: " &lt;&lt; userInput &lt;&lt; endl;

    return 0; // Return 0 to indicate that the program has run successfully
}
```



## Explanation



The provided C++ code is a simple console application that prompts the user to enter an integer, outputs the entered integer, doubles the entered integer, and then outputs the doubled value.



The code begins with the inclusion of the `iostream` library, which is necessary for input/output operations in C++. The `using namespace std;` statement is used to avoid having to prefix standard library functions with `std::`.


```cpp
#include &lt;iostream&gt;
using namespace std;
```



The `main` function is the entry point of the program. Inside this function, an integer variable `userInput` is declared to store the user's input.


```cpp
int main() {
    int userInput;
```



The program then prompts the user to enter an integer using `cout`, and reads the user's input from the console using `cin`.


```cpp
cout &lt;&lt; "Enter an integer: ";
cin &gt;&gt; userInput;
```



The entered integer is then outputted to the console.


```cpp
cout &lt;&lt; "You entered: " &lt;&lt; userInput &lt;&lt; endl;
```



The `userInput` variable is then doubled by multiplying it by 2.


```cpp
userInput = 2 * userInput;
```



Finally, the doubled value is outputted to the console, and the `main` function returns 0 to indicate that the program has run successfully.


```cpp
cout &lt;&lt; "The doubled value is: " &lt;&lt; userInput &lt;&lt; endl;
return 0;
```



This code is a basic example of user interaction and arithmetic operations in C++.



## Output


```cpp
Enter an integer: 12
You entered: 12
The doubled value is: 24

Process finished with exit code 0```
