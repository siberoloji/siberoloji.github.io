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
date: "2024-06-28T16:19:02Z"
excerpt: Bu örneğimizde, girilen sayının faktöriyelini bir fonksiyon yardımı ile hesaplamayı
  gösteriyoruz.
guid: https://www.siberoloji.com/?p=1254
id: 1254
image: /assets/images/2024/06/cpp.png
tags:
- c++
title: C++ Girilen sayının faktöriyelini hesaplayan örnek
url: /tr/c-girilen-sayinin-faktoriyelini-hesaplayan-ornek/
---

  Bu örneğimizde, girilen sayının faktöriyelini bir fonksiyon yardımı ile hesaplamayı gösteriyoruz.
 

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