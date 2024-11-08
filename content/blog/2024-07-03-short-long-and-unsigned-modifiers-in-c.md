---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- C++ Fundamentals
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-07-03T01:52:32Z"
guid: https://www.siberoloji.com/?p=1437
id: 1437
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: Short long and unsigned modifiers in C++
url: /short-long-and-unsigned-modifiers-in-c/
---

 <p>The provided C++ code demonstrates the declaration and usage of various fundamental data types and their sizes.</p>
 

 
 ## Code</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
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
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation</h2>
<!-- /wp:heading -->

 <p>The provided C++ code demonstrates the declaration and usage of various fundamental data types and their sizes. It begins by including the <code>&lt;iostream&gt;</code> header, enabling input and output operations, and uses the <code>std</code> namespace to avoid prefixing standard library entities with <code>std::</code>.</p>
 

 <p>The main function, which is the entry point of the program, declares variables of different data types, including integer types (<code>int</code>, <code>short int</code>, <code>long int</code>, <code>unsigned int</code>, <code>unsigned short int</code>, <code>unsigned long int</code>), character types (<code>char</code>, <code>unsigned char</code>, <code>signed char</code>), and floating-point types (<code>float</code>, <code>double</code>, <code>long double</code>). Each variable is accompanied by a comment indicating its range, which is crucial for understanding the limits of each data type.</p>
 

 <p>For example, the integer variable declaration is shown as follows:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">int Integer; // Range: -2147483648 to 2147483647</code></pre>
<!-- /wp:code -->

 <p>This line declares an <code>int</code> variable named <code>Integer</code>, which can store values from -2,147,483,648 to 2,147,483,647.</p>
 

 <p>After declaring these variables, the program prints the size of each data type in bytes using the <code>sizeof</code> operator. This is a compile-time operator that determines the size, in bytes, of a variable or data type. The output is directed to the console using <code>cout</code>, which is part of the <code>iostream</code> library.</p>
 

 <p>For instance, the size of the <code>int</code> data type is printed with the following line:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">cout &lt;&lt;"The size of int is " &lt;&lt;sizeof(Integer) &lt;&lt; " bytes" &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

 <p>This line outputs the size of an <code>int</code> in bytes, helping to understand how much memory each data type consumes.</p>
 

 <p>The program concludes by returning 0, indicating successful execution. This code snippet is a practical demonstration for beginners to understand the sizes of different data types in C++, which is fundamental in choosing the appropriate type for variables based on the range of values they are expected to hold and the memory efficiency.</p>
 

 
 ## Output</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">The size of int is 4 bytes
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

Process finished with exit code 0</code></pre>
<!-- /wp:code -->