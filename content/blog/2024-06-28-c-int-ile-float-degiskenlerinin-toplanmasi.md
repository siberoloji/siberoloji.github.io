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
date: "2024-06-28T16:03:59Z"
guid: https://www.siberoloji.com/?p=1250
id: 1250
image: /assets/images/2024/06/cpp.png
tags:
- c++
title: C++ int ile float değişkenlerinin toplanması
url: /tr/c-int-ile-float-degiskenlerinin-toplanmasi/
---

<!-- wp:paragraph -->
<p>Bu örneğimizde int ve float türünde 2 değişkenin toplamını bulmayı gösteriyoruz.</p>
  

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