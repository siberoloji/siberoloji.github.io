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
date: "2024-06-27T23:58:54Z"
excerpt: In this article, we show an example of combining 2 string variables.
guid: https://www.siberoloji.com/?p=1239
id: 1239
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
- string concatenation
title: C++ 2 string variable concatenation
url: /c-2-string-variable-concatenation/
---

  In this article, we show an example of combining 2 string variables. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
#include &lt;string&gt;

int main() {
    std::string firstString = "prs";
    std::string secondString = "def";
    std::string result;
    result = firstString + secondString;
    std::cout &lt;&lt; result &lt;&lt; std::endl;
    return 0;
}</code></pre>
<!-- /wp:code -->