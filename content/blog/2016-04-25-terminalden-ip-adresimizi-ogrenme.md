---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Linux Nasıl Yapılır
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-04-25T17:23:00Z"
excerpt: 'terminalde çalışırken (bash, SSH vb.) ISP tarafından Modeminize atanan herkese
  açık (public) IP adresini öğrenmeniz gerekebilir. Bu IP adresine, bir programda
  kullanmak veya ayarlama yapmak için ihtiyaç duyabilirsiniz. Yazımızda, komut satırından
  IP adresimizi nasıl öğrenebileceğimizi göreceğiz. '
guid: https://www.siberoloji.com/?p=1077
id: 1077
image: /assets/images/2024/06/linux2.png
tags:
- linux nasıl
title: Terminalden IP Adresimizi öğrenme
url: /tr/terminalden-ip-adresimizi-ogrenme/
---

  Bazen, terminalde çalışırken (bash, SSH vb.) ISP tarafından Modeminize atanan herkese açık (public) IP adresini öğrenmeniz gerekebilir. Bu IP adresine, bir programda kullanmak veya ayarlama yapmak için ihtiyaç duyabilirsiniz. Yazımızda, komut satırından IP adresimizi nasıl öğrenebileceğimizi göreceğiz. Dikkat: Modem ile bilgisayarınız arasındaki dahili ağınızdaki IP adresinizden bahsetmiyoruz. Onu ifconfig komutu ile öğrenebilirsiniz.</p>
 

  Komut satırından IP adresini öğrenmek için bir çok yöntem bulunuyor sırayla görelim.</p>
 

<!-- wp:group {"layout":{"type":"constrained"}} -->
<div class="wp-block-group"><!-- wp:group {"layout":{"type":"constrained"}} -->
<div class="wp-block-group"><!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">dig +short <a href="http://myip.opendns.com/">myip.opendns.com</a> @<a href="http://resolver1.opendns.com/">resolver1.opendns.com</a></code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">dig TXT +short <a href="http://o-o.myaddr.l.google.com/">o-o.myaddr.l.google.com</a> @<a href="http://ns1.google.com/">ns1.google.com</a></code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">host <a href="http://myip.opendns.com/">myip.opendns.com</a> <a href="http://resolver1.opendns.com/">resolver1.opendns.com</a></code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">dig TXT +short <a href="http://o-o.myaddr.l.google.com/">o-o.myaddr.l.google.com</a> @<a href="http://ns1.google.com/">ns1.google.com</a> | awk -F'"' '{ print $2}'</code></pre>
<!-- /wp:code --></div>
<!-- /wp:group --></div>
<!-- /wp:group -->

  Bu yöntemde IP adresiniz bir shell değişkeni içerisine kayıt edilir. Daha sonra ihtiyaç duyduğunuzda kullanabilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">myip="$(dig +short <a href="http://myip.opendns.com/">myip.opendns.com</a> @<a href="http://resolver1.opendns.com/">resolver1.opendns.com</a>)"
echo "Açık IP adresim: ${myip}"</code></pre>
<!-- /wp:code -->

  3.Taraf sitelerin yardımıyla da öğrenmeniz mümkün. Aşağıdaki komutlardan herhangi biri işinize yarayacaktır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">curl <a href="http://icanhazip.com/">icanhazip.com</a>
curl <a href="http://ipecho.net/plain">ipecho.net/plain</a>
curl ifconfig.co</code></pre>
<!-- /wp:code -->