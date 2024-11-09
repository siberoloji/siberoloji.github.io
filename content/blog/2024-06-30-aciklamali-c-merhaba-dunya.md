---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- C++ Temel Bilgiler
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-06-30T17:05:14Z"
guid: https://www.siberoloji.com/?p=1381
id: 1381
image: /assets/images/2024/06/cpp.png
tags:
- c++
title: Açıklamalı C++ Hello World
url: /tr/aciklamali-c-merhaba-dunya/
---

  Başlangıç ​​seviyesindekiler için en basit C++ programını anlatmaya çalıştık. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">#include &lt;iostream&gt;

int main() {
    std::cout &lt;&lt; "Hello, World!" &lt;&lt; std::endl;
    return 0;
}</code></pre>
<!-- /wp:code -->

  Verilen kod konsola “Hello World!” yazdıran basit bir C++ programıdır. 
 

  İlk satır,<code>#include &lt;iostream&gt;</code> iostream standart kütüphanesini içeren bir önişlemci yönergesidir. Bu kütüphane giriş/çıkış işlemlerine izin verir. 
 

  Bir sonraki kısım <code>main</code> fonksiyond<code>ur</code>. C++'da programın yürütülmesi<code>main</code> fonksiyonun çalışmasıyla başlar.<code>int main()</code>, <code>main</code> fonksiyonun bir tamsayı değeri döndüreceğini gösterir. 
 

  Fonksiyonun içindebulunan <code>std::cout &lt;&lt; "Hello, World!" &lt;&lt; std::endl;</code> ifadesi “Hello World!” dizesini ekrana yazdırmak için kullanılır. 
 

  Son olarak<code>main</code> fonksiyonu <code>return 0;</code> ile biter. Bu ifade programdan çıkıp işletim sistemine 0 durumunu geri döndürmesine neden olur. <code>main</code>, 0 değerinin döndürülmesi genellikle programın hatasız olarak başarılı bir şekilde çalıştığını gösterir. 
 