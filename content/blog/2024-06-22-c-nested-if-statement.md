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
date: "2024-06-22T23:33:59Z"
guid: https://www.siberoloji.com/?p=956
id: 956
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
- nested if
title: C++ Nested if statement
url: /c-nested-if-statement/
---

  In this article, we share an example showing C++ nested if statement. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;

using namespace std;

int main() {
/* nested if else statement */
    int a;
    cout &lt;&lt; "Enter a positive integer number: ";
    cin &gt;&gt; a;
    if (a &lt; 20) {
        cout &lt;&lt; "a is less than 20\n";
        if (a &lt; 10)
            cout &lt;&lt; "a is less than 10\n";
        else
            cout &lt;&lt; "a is not less than 10\n";
    } else {
        if (a == 20) {
            cout &lt;&lt; "a is equal to 20\n";
        } else
            cout &lt;&lt; "a is greater than 20\n";
    }
    return 0;
}</code></pre>
<!-- /wp:code -->