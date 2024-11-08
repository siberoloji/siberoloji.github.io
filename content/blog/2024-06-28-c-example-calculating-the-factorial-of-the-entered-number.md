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
date: "2024-06-28T16:20:50Z"
excerpt: In this example, we show how to calculate the factorial of the entered number
  with the help of a function.
guid: https://www.siberoloji.com/?p=1256
id: 1256
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
title: C++ Example calculating the factorial of the entered number
url: /c-example-calculating-the-factorial-of-the-entered-number/
---

<!-- wp:paragraph -->
<p>In this example, we show how to calculate the factorial of the entered number with the help of a function.</p>
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">#include &lt;iostream&gt;
using namespace std;

int factorial(int num) {
    int result = 1;
    for (int i = 2; i &lt;= num; i++) {
        result *= i;
    }
    return result;
}

int main() {
    int number;
    cout &lt;&lt; "Enter a number: ";
    cin &gt;&gt; number;
    int factorialResult = factorial(number);
    cout &lt;&lt; "Factorial: " &lt;&lt; factorialResult &lt;&lt; endl;

    return 0;
}</code></pre>
<!-- /wp:code -->