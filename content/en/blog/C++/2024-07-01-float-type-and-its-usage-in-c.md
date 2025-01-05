---
draft: false

title:  'float type and its usage in C++'
date: '2024-07-01T01:58:13+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /float-type-and-its-usage-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided C++ code is a demonstration of how to use and display floating point numbers in different formats using the `iostream` and `iomanip` libraries.


```cpp
#include &lt;iostream&gt;
#include &lt;iomanip&gt;
using namespace std;

int main() {
    float f = 3.14159;
    float g = .4;
    float h = 3.14e-2;
    float i = 3.14e2;
    float j = 3.14e+2;

    cout &lt;&lt; "f: " &lt;&lt; f &lt;&lt; endl;
    cout &lt;&lt; "g: " &lt;&lt; g &lt;&lt; endl;
    cout &lt;&lt; "h: " &lt;&lt; h &lt;&lt; endl;
    cout &lt;&lt; "i: " &lt;&lt; i &lt;&lt; endl;
    cout &lt;&lt; "j: " &lt;&lt; j &lt;&lt; endl;

    cout &lt;&lt; "f (precision 10): " &lt;&lt; setprecision(10) &lt;&lt; f &lt;&lt; endl;
    cout &lt;&lt; "g (precision 10): " &lt;&lt; setprecision(10) &lt;&lt; g &lt;&lt; endl;
    cout &lt;&lt; "h (precision 10): " &lt;&lt; setprecision(10) &lt;&lt; h &lt;&lt; endl;
    cout &lt;&lt; "i (precision 10): " &lt;&lt; setprecision(10) &lt;&lt; i &lt;&lt; endl;
    cout &lt;&lt; "j: " &lt;&lt; setprecision(10) &lt;&lt; j &lt;&lt; endl;

    cout &lt;&lt; "f (scientific): " &lt;&lt; scientific &lt;&lt; f &lt;&lt; endl;
    cout &lt;&lt; "g (scientific): " &lt;&lt; scientific &lt;&lt; g &lt;&lt; endl;
    cout &lt;&lt; "h (scientific): " &lt;&lt; scientific &lt;&lt; h &lt;&lt; endl;
    cout &lt;&lt; "i (scientific): " &lt;&lt; scientific &lt;&lt; i &lt;&lt; endl;
    cout &lt;&lt; "j (scientific): " &lt;&lt; scientific &lt;&lt; j &lt;&lt; endl;

    cout &lt;&lt; "f (fixed): " &lt;&lt; fixed &lt;&lt; f &lt;&lt; endl;
    cout &lt;&lt; "g (fixed): " &lt;&lt; fixed &lt;&lt; g &lt;&lt; endl;
    cout &lt;&lt; "h (fixed): " &lt;&lt; fixed &lt;&lt; h &lt;&lt; endl;
    cout &lt;&lt; "i (fixed): " &lt;&lt; fixed &lt;&lt; i &lt;&lt; endl;
    cout &lt;&lt; "j (fixed): " &lt;&lt; fixed &lt;&lt; j &lt;&lt; endl;

    cout &lt;&lt; "f (precision 10 and scientific): " &lt;&lt; setprecision(10) &lt;&lt; scientific &lt;&lt; f &lt;&lt; endl;
    cout &lt;&lt; "g (precision 10 and scientific): " &lt;&lt; setprecision(10) &lt;&lt; scientific &lt;&lt; g &lt;&lt; endl;
    cout &lt;&lt; "h (precision 10 and scientific): " &lt;&lt; setprecision(10) &lt;&lt; scientific &lt;&lt; h &lt;&lt; endl;
    cout &lt;&lt; "i (precision 10 and scientific): " &lt;&lt; setprecision(10) &lt;&lt; scientific &lt;&lt; i &lt;&lt; endl;

    cout &lt;&lt; "f (precision 10 and fixed): " &lt;&lt; setprecision(10) &lt;&lt; fixed &lt;&lt; f &lt;&lt; endl;
    cout &lt;&lt; "g (precision 10 and fixed): " &lt;&lt; setprecision(10) &lt;&lt; fixed &lt;&lt; g &lt;&lt; endl;
    cout &lt;&lt; "h (precision 10 and fixed): " &lt;&lt; setprecision(10) &lt;&lt; fixed &lt;&lt; h &lt;&lt; endl;
    cout &lt;&lt; "i (precision 10 and fixed): " &lt;&lt; setprecision(10) &lt;&lt; fixed &lt;&lt; i &lt;&lt; endl;

    cout &lt;&lt; "f (precision 10, scientific and uppercase): " &lt;&lt; setprecision(10) &lt;&lt; scientific &lt;&lt; uppercase &lt;&lt; f &lt;&lt; endl;
    cout &lt;&lt; "g (precision 10, scientific and uppercase): " &lt;&lt; setprecision(10) &lt;&lt; scientific &lt;&lt; uppercase &lt;&lt; g &lt;&lt; endl;
    cout &lt;&lt; "h (precision 10, scientific and uppercase): " &lt;&lt; setprecision(10) &lt;&lt; scientific &lt;&lt; uppercase &lt;&lt; h &lt;&lt; endl;
    cout &lt;&lt; "i (precision 10, scientific and uppercase): " &lt;&lt; setprecision(10) &lt;&lt; scientific &lt;&lt; uppercase &lt;&lt; i &lt;&lt; endl;


    return 0;
}
```



## Explanation



The provided C++ code is a demonstration of how to use and display floating point numbers in different formats using the `iostream` and `iomanip` libraries.



Initially, five floating point variables `f`, `g`, `h`, `i`, and `j` are declared and assigned different values. These variables are then printed to the console using the `cout` object.


```cpp
float f = 3.14159;
// ... other variable declarations
cout &lt;&lt; "f: " &lt;&lt; f &lt;&lt; endl;
// ... other print statements
```



The code then uses the `setprecision` function from the `iomanip` library to control the number of digits displayed when the floating point numbers are printed. The `setprecision(10)` call sets the precision to 10 digits.


```cpp
cout &lt;&lt; "f (precision 10): " &lt;&lt; setprecision(10) &lt;&lt; f &lt;&lt; endl;
// ... other print statements
```



The `scientific` and `fixed` manipulators are then used to change the format in which the floating point numbers are displayed. The `scientific` manipulator causes the number to be displayed in scientific notation, while the `fixed` manipulator causes the number to be displayed in fixed-point notation.


```cpp
cout &lt;&lt; "f (scientific): " &lt;&lt; scientific &lt;&lt; f &lt;&lt; endl;
// ... other print statements
cout &lt;&lt; "f (fixed): " &lt;&lt; fixed &lt;&lt; f &lt;&lt; endl;
// ... other print statements
```



Finally, the `uppercase` manipulator is used in conjunction with the `scientific` manipulator to display the numbers in scientific notation with an uppercase 'E'.


```cpp
cout &lt;&lt; "f (precision 10, scientific and uppercase): " &lt;&lt; setprecision(10) &lt;&lt; scientific &lt;&lt; uppercase &lt;&lt; f &lt;&lt; endl;
// ... other print statements
```



In summary, this code demonstrates various ways to control the display of floating point numbers in C++.



## Output


```cpp
f: 3.14159
g: 0.4
h: 0.0314
i: 314
j: 314
f (precision 10): 3.141590118
g (precision 10): 0.400000006
h (precision 10): 0.03139999881
i (precision 10): 314
j: 314
f (scientific): 3.1415901184e+00
g (scientific): 4.0000000596e-01
h (scientific): 3.1399998814e-02
i (scientific): 3.1400000000e+02
j (scientific): 3.1400000000e+02
f (fixed): 3.1415901184
g (fixed): 0.4000000060
h (fixed): 0.0313999988
i (fixed): 314.0000000000
j (fixed): 314.0000000000
f (precision 10 and scientific): 3.1415901184e+00
g (precision 10 and scientific): 4.0000000596e-01
h (precision 10 and scientific): 3.1399998814e-02
i (precision 10 and scientific): 3.1400000000e+02
f (precision 10 and fixed): 3.1415901184
g (precision 10 and fixed): 0.4000000060
h (precision 10 and fixed): 0.0313999988
i (precision 10 and fixed): 314.0000000000
f (precision 10, scientific and uppercase): 3.1415901184E+00
g (precision 10, scientific and uppercase): 4.0000000596E-01
h (precision 10, scientific and uppercase): 3.1399998814E-02
i (precision 10, scientific and uppercase): 3.1400000000E+02

Process finished with exit code 0```
