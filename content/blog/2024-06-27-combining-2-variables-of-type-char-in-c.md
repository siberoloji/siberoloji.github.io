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
cmplz_hide_cookiebanner:
- ""
date: "2024-06-27T23:39:08Z"
excerpt: In this example, you can see how to combine 2 char variables with a length
  of 50 characters using the strcat method.
guid: https://www.siberoloji.com/?p=1235
id: 1235
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
- strcat
title: Combining 2 variables of type char in C++
url: /combining-2-variables-of-type-char-in-c/
---

  In this example, you can see how to combine 2 char variables with a length of 50 characters using the strcat method. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
#include &lt;cstring&gt;
using namespace std;

int main() {
    constexpr size_t bufferSize = 50;
    char firstString[bufferSize] = "abc";
    char secondString[bufferSize] = "def";

    cout &lt;&lt; "First string: " &lt;&lt; firstString &lt;&lt; '\n';
    cout &lt;&lt; "Second string: " &lt;&lt; secondString &lt;&lt; '\n';

    strcat(firstString, secondString);

    cout &lt;&lt; "Concatenated string: " &lt;&lt; firstString &lt;&lt; '\n';

    return 0;
}</code></pre>
<!-- /wp:code -->