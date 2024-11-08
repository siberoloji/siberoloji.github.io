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
date: "2024-06-28T16:06:12Z"
guid: https://www.siberoloji.com/?p=1252
id: 1252
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
title: C++ adding int and float variables
url: /c-adding-int-and-float-variables/
---

  In this example, we show how to find the sum of 2 variables of type int and float. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;

int main() {
    int firstNumber = 11;
    float secondNumber = 12.8;
    float sum = firstNumber + secondNumber;

    std::cout &lt;&lt; "Sum: " &lt;&lt; sum &lt;&lt; std::endl;

    return 0;
}</code></pre>
<!-- /wp:code -->