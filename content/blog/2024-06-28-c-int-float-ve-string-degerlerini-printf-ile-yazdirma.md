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
date: "2024-06-28T01:17:31Z"
excerpt: Bu kod, int ve float değişkenlerinin sabit, metin değişkenin sabit olmadığı
  bir main işlevi tanımlar.  number, realNumber ve text değerlerini yazdırır ve ardından
  0 değerini döndürür.
guid: https://www.siberoloji.com/?p=1242
id: 1242
image: /assets/images/2024/06/cpp.png
tags:
- c_str()
- c++
- printf
title: C++ int, float ve string değerlerini printf ile yazdırma
url: /tr/c-int-float-ve-string-degerlerini-printf-ile-yazdirma/
---

  Bu kod, int ve float değişkenlerinin sabit, metin değişkenin sabit olmadığı bir main işlevi tanımlar. number, realNumber ve text değerlerini yazdırır ve ardından 0 değerini döndürür. 
 

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