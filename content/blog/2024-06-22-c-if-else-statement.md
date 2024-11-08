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
date: "2024-06-22T23:39:06Z"
excerpt: In this article, you can examine the use of C++ if else statement.
guid: https://www.siberoloji.com/?p=959
id: 959
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
- c++ if else statement
title: C++ if else statement
url: /c-if-else-statement/
---

  In this article, you can examine the use of C++ if else statement. 
 

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