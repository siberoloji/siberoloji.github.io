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
cmplz_hide_cookiebanner:
- ""
date: "2024-06-27T23:37:05Z"
excerpt: Bu örneğimizde, uzunluğu 50 karakter olarak belirlenmiş 2 adet char değişkenini,
  strcat metodu ile birleştirmeyi görebilirsiniz.
guid: https://www.siberoloji.com/?p=1233
id: 1233
image: /assets/images/2024/06/cpp.png
tags:
- c++
- strcat
title: C++ char tipinde 2 değişkeni birleştirme
url: /tr/c-char-tipinde-2-degiskeni-birlestirme/
---

  Bu örneğimizde, uzunluğu 50 karakter olarak belirlenmiş 2 adet char değişkenini, strcat metodu ile birleştirmeyi görebilirsiniz.</p>
 

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