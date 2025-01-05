---
draft: false

title:  'The usage of pre-increment and post-increment operators'
date: '2024-07-01T14:12:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /the-usage-of-pre-increment-and-post-increment-operators/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


This code snippet demonstrates the usage of pre-increment and post-increment operators in C++.



## Code


```cpp
/**
* Main function that demonstrates the usage of pre-increment and post-increment operators.
 *
 * @return 0 indicating successful execution
 *
 * @throws None
 */

#include &lt;iostream&gt;
using namespace std;

int main() {
    int numberOne = 1;
    int numberTwo = 2;
    int numberThree = 3;
    int numberFour = 4;

    // numberOne current value is 1
    int result = numberOne++; // Assignment and increment after the operation
    cout &lt;&lt; "Number One: " &lt;&lt; numberOne &lt;&lt; endl;
    cout &lt;&lt; "Result: " &lt;&lt; result &lt;&lt; endl;
    cout &lt;&lt; "----" &lt;&lt; endl;

    //numberTwo current value is 2
    result = ++numberTwo; // Increment and assignment before the operation
    cout &lt;&lt; "Number Two: " &lt;&lt; numberTwo &lt;&lt; endl;
    cout &lt;&lt; "Result: " &lt;&lt; result &lt;&lt; endl;
    cout &lt;&lt; "----" &lt;&lt; endl;

    //numberThree current value is 3
    result = numberThree--; // Assignment and decrement after the operation
    cout &lt;&lt; "Number Three: " &lt;&lt; numberThree &lt;&lt; endl;
    cout &lt;&lt; "Result: " &lt;&lt; result &lt;&lt; endl;
    cout &lt;&lt; "----" &lt;&lt; endl;

    //numberFour current value is 4
    result = --numberFour; // Decrement and assignment before the operation
    cout &lt;&lt; "Number Four: " &lt;&lt; numberFour &lt;&lt; endl;
    cout &lt;&lt; "Result: " &lt;&lt; result &lt;&lt; endl;

    return 0;
}
```



## Explanation



The provided C++ code is a simple demonstration of the usage of pre-increment (`++var`), post-increment (`var++`), pre-decrement (`--var`), and post-decrement (`var--`) operators in C++.



The main function starts by declaring four integer variables `numberOne`, `numberTwo`, `numberThree`, and `numberFour` with initial values of 1, 2, 3, and 4 respectively.



The first operation is `numberOne++`. This is a post-increment operation, which means the current value of `numberOne` is assigned to `result` before `numberOne` is incremented. Therefore, `result` will be 1 (the original value of `numberOne`), and `numberOne` will be incremented to 2.



Next, the operation `++numberTwo` is a pre-increment operation. Here, `numberTwo` is incremented before the assignment operation. So, `numberTwo` becomes 3, and this new value is assigned to `result`.



The third operation is `numberThree--`, a post-decrement operation. Similar to the post-increment, the current value of `numberThree` is assigned to `result` before `numberThree` is decremented. So, `result` will be 3, and `numberThree` will be decremented to 2.



Finally, the operation `--numberFour` is a pre-decrement operation. Here, `numberFour` is decremented before the assignment operation. So, `numberFour` becomes 3, and this new value is assigned to `result`.



After each operation, the new values of the variables and `result` are printed to the console for verification. The function then returns 0, indicating successful execution.



## Output


```cpp
Number One: 2
Result: 1
----
Number Two: 3
Result: 3
----
Number Three: 2
Result: 3
----
Number Four: 3
Result: 3

Process finished with exit code 0```
