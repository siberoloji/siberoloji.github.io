---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- C++ Code Samples
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-06-28T01:19:55Z"
excerpt: This code defines a main function where the int and float variables are constants
  and the text variable is not. Prints the values ​​number, realNumber, and text and
  then returns 0.
guid: https://www.siberoloji.com/?p=1244
id: 1244
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
- printf
title: Printing int, float and string values ​​with printf in C++
url: /printing-int-float-and-string-values-with-printf-in-c/
---

  This code defines a main function where the int and float variables are constants and the text variable is not. Prints the values ​​number, realNumber, and text and then returns 0.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
#include &lt;cstdio&gt;
#include &lt;string&gt;
using namespace std;

int main() {
    constexpr int number = 123;
    constexpr float realNumber = 3.146;
    string text = "Hello World";
    printf("Number: %d\n", number);
    printf("Pi value: %.2f\n", realNumber);
    printf("Text: %s\n", text.c_str());
    return 0;
}
</code></pre>
<!-- /wp:code -->