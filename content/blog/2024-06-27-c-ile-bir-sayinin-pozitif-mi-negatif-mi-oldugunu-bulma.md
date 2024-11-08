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
date: "2024-06-27T23:18:46Z"
excerpt: Bu örneğimizde, klavyeden girilen sayının pozitif, negatif veya sıfır mı
  olduğunu if- else if kullanımı ile kontrol ediyoruz.
guid: https://www.siberoloji.com/?p=1229
id: 1229
image: /assets/images/2024/06/cpp.png
tags:
- c++
title: C++ ile bir sayının pozitif mi negatif mi olduğunu bulma
url: /tr/c-ile-bir-sayinin-pozitif-mi-negatif-mi-oldugunu-bulma/
---

  Bu örneğimizde, klavyeden girilen sayının pozitif, negatif veya sıfır mı olduğunu if- else if kullanımı ile kontrol ediyoruz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">#include &lt;iostream&gt;
using namespace std;

int main() {
    int number;
    cout &lt;&lt; "Please enter a number: ";
    cin &gt;&gt; number;

    if (number &gt; 0) {
        cout &lt;&lt; "Number is positive";
    } else if (number &lt; 0) {
        cout &lt;&lt; "Number is negative";
    } else {
        cout &lt;&lt; "Number is zero";
    }

    return 0;
}</code></pre>
<!-- /wp:code -->