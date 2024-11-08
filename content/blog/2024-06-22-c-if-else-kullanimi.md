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
date: "2024-06-22T23:37:00Z"
excerpt: 'Bu yazımızda, C++ if else kullanımını inceleyebilirsiniz. '
guid: https://www.siberoloji.com/?p=911
id: 911
image: /assets/images/2024/06/cpp.png
tags:
- c++ if else
title: C++ if else kullanımı
url: /tr/c-if-else-kullanimi/
---

  Bu yazımızda, C++ if else kullanımını inceleyebilirsiniz.  
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;

using namespace std;

int main() {
/* if else statement */
    int a;
    cout &lt;&lt; "Enter a positive integer number: ";
    cin &gt;&gt; a;
    if (a &lt; 20) {
        cout &lt;&lt; "a is less than 20\n";
    } else {
        cout &lt;&lt; "a is not less than 20\n";
    }
    return 0;
}</code></pre>
<!-- /wp:code -->