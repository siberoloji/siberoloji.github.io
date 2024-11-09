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
date: "2024-06-22T14:08:08Z"
excerpt: You can see the usage of cascade if-else statement example below.
guid: https://www.siberoloji.com/?p=945
id: 945
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
title: C++ Cascade if else statement
url: /c-cascade-if-else-statement/
---

  You can see the usage of cascade if-else statement example below.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;

using namespace std;

int main() {
/* cascade if else statement */
    int a;
    cout &lt;&lt; "Enter a positive integer number: ";
    cin &gt;&gt; a;
    if (a &lt; 20) {
        cout &lt;&lt; "a is less than 20\n";
    } else if (a == 20) {
        cout &lt;&lt; "a is equal to 20\n";
    } else {
        cout &lt;&lt; "a is greater than 20\n";
    }
    return 0;
}</code></pre>
<!-- /wp:code -->