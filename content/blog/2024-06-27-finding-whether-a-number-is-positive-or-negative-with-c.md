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
date: "2024-06-27T23:24:08Z"
excerpt: In this example, we check whether the number entered from the keyboard is
  positive, negative or zero by using if-else if.
guid: https://www.siberoloji.com/?p=1231
id: 1231
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
title: Finding whether a number is positive or negative with C++
url: /finding-whether-a-number-is-positive-or-negative-with-c/
---

  In this example, we check whether the number entered from the keyboard is positive, negative or zero by using if-else if. 
 

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