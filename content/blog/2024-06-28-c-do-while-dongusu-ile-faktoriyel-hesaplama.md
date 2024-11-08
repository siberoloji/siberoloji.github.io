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
date: "2024-06-28T23:19:21Z"
excerpt: Bu örneğimizde, do while döngüsünü kullanarak faktöriyel hesaplaması nasıl
  yapılır konusunu gösteriyoruz.
guid: https://www.siberoloji.com/?p=1297
id: 1297
image: /assets/images/2024/06/cpp.png
tags:
- c++
- do while
title: C++ do-while döngüsü ile faktöriyel hesaplama
url: /tr/c-do-while-dongusu-ile-faktoriyel-hesaplama/
---

  Bu örneğimizde, do while döngüsünü kullanarak faktöriyel hesaplaması nasıl yapılır konusunu gösteriyoruz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
using namespace std;

int calculateFactorial(int number) {
    int result = 1;
    for (int i = 1; i &lt;= number; i++) {
        result *= i;
    }
    return result;
}

int main() {
    int inputNumber;
    char exitKey;
    
    do {
        cout &lt;&lt; "Enter a number between 1 and 10: ";
        cin &gt;&gt; inputNumber;
        
        if (inputNumber &lt; 1) {
            cout &lt;&lt; "Number must be greater than 0.\n";
        } else if (inputNumber &gt; 10) {
            cout &lt;&lt; "Number must be less than or equal to 10.\n";
        } else {
            int factorial = calculateFactorial(inputNumber);
            cout &lt;&lt; "Result: " &lt;&lt; factorial &lt;&lt; endl;
        }
        
        cout &lt;&lt; "Press 'h' to exit, any other key to continue: ";
        cin &gt;&gt; exitKey;
    } while (exitKey != 'h');
    
    return 0;
}</code></pre>
<!-- /wp:code -->