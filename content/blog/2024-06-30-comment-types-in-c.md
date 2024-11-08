---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- C++ Fundamentals
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-06-30T23:57:38Z"
guid: https://www.siberoloji.com/?p=1405
id: 1405
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: Comment types in C++
url: /comment-types-in-c/
---

  We are demontrating single line and multi line comments in C++ 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;
// we will demonstrate the use of comments  in this program
int main() {
    // This is a single line comment
    cout &lt;&lt; "Hello, World!" &lt;&lt; endl; // This is also a single line comment
    /* This is a multi-line comment
    This is a multi-line comment
    This is a multi-line comment
    */
    return 0;
}</code></pre>
<!-- /wp:code -->

  In the above code, we have used single-line comments and multi-line comments.  
 

  Single-line comments start with // and end at the end of the line.  
 

  Multi-line comments start with /* and end with */.<br>Comments are ignored by the compiler and are used to make the code more readable and understandable.<br>Output:<br>Hello, World!<br>In the above code, we have used comments to explain the code. You can also use comments to disable a part of the code. 
 