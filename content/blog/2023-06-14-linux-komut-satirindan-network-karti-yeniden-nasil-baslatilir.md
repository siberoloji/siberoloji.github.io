---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "5"
categories:
- Linux Nasıl Yapılır
date: "2023-06-14T17:12:55Z"
excerpt: Aşağıda açıkladığımız komutlar sayesinde ağ kartınızı kapatıp açabilirsiniz.
guid: https://www.siberoloji.com/?p=368
id: 368
image: /assets/images/2023/06/bash-1.jpeg
tags:
- komut satırı
- linux komut
- linux nasıl
title: Linux komut satırından network kartı yeniden nasıl başlatılır?
url: /tr/linux-komut-satirindan-network-karti-yeniden-nasil-baslatilir/
---

  Linux işletim sisteminizde bir bağlantı problemi olduğunda veya IP ayarlarını değiştirdiğinizde ağ kartınızı tekrar başlatmanız gerekebilir. Bunu yapmak için bilgisayar veya sunucunuzu tekrar başlatmanıza gerek yoktur. Aşağıda açıkladığımız komutlar sayesinde ağ kartınızı kapatıp açabilirsiniz. 
 

  ***UYARI: Bu yöntem, bilgisayarınıza doğrudan erişiminiz varsa kullanılır. Sunucunuza SSH vb yöntemle uzaktan bağlıysanız, ağ kartınız devre dışı kalacağı için erişiminiz kaybedersiniz. UYARI!!!***  
 

 
 ## Ağ kartını durdurmak için
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># nmcli networking off</code></pre>
<!-- /wp:code -->

 
 ## Ağ kartını başlatmak için
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># nmcli networking on</code></pre>
<!-- /wp:code -->

  Sunucunuza doğrudan erişimiz yoksa kapat / aç yöntemi yerine "yeniden başlat" yöntemini deneyebilirsiniz. 
 

 
 ## Ağ kartını Yeniden Başlatmak için
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># systemctl restart NetworkManager</code></pre>
<!-- /wp:code -->

 
 ## Ağ kartını durumunu kontrol etmek için
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"># systemctl status NetworkManager</code></pre>
<!-- /wp:code -->

  Yukarıda listelenen komutlar hemen hemen tüm Linux sistemlerinde çalışır. Sisteminizde farklı bir ağ yöneticisi bulunuyorsa, man sayfalarına bakabilirsiniz. 
 