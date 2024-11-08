---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- C++ Kod Örnekleri
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-06-27T23:56:31Z"
excerpt: Bu yazımızda, 2 adet string değişkeni birleştirme örneğini gösteriyoruz.
guid: https://www.siberoloji.com/?p=1237
id: 1237
image: /assets/images/2024/06/cpp.png
tags:
- c++
- string birleştirme
title: C++ 2 string değişkeni birleştirme
url: /tr/c-2-string-degiskeni-birlestirme/
---

  Bu yazımızda, 2 adet string değişkeni birleştirme örneğini gösteriyoruz. 
 

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