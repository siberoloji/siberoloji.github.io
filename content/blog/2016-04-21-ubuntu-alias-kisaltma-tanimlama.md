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
date: "2016-04-21T16:16:00Z"
excerpt: Bu yazımızda, Linux komut satırında sürekli kullandığımız uzun komutları,
  alias kullanarak kısaltmayı gösterdik. Ubuntu İşletim sistemi kullanarak göstermemize
  rağmen, diğer Linux dağıtımlarında da kullanılabilir.
guid: https://www.siberoloji.com/?p=1060
id: 1060
image: /assets/images/2024/06/linux-howto.jpg
tags:
- alias
- linux alias
title: Ubuntu Alias Kısaltma Tanımlama
url: /tr/ubuntu-alias-kisaltma-tanimlama/
---

  Bu yazımızda, Linux komut satırında sürekli kullandığımız uzun komutları, alias kullanarak kısaltmayı gösterdik. Ubuntu İşletim sistemi kullanarak göstermemize rağmen, diğer Linux dağıtımlarında da kullanılabilir. 
 

  Alias kullanımı, komut satırında yaptığınız işlemleri çok hızlı olarak hayata geçirmenize yardımcı olur. Bir kaç harfle tanımladığınız kısaltma, çok uzun bir komutu ekrana getirir ve derhal işleme koyar. 
 

  <strong>NOT</strong>:Kalıcı kullanım esnasında ilk defa oluşturulan bash_aliases dosyasını, daha sonra tekrar oluşturmaya gerek yoktur. Home klasöründe ve gizli halde bulunan bu dosyayı herhangi bir editör ile açarak düzenleyebilirsiniz. 
 

  Bu videoda kullanılan komutları aşağıdan kopyalayıp kullanabilirsiniz. 
 

<!-- wp:heading {"level":3} -->
 ### Alias geçici kullanım</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">alias lsa='ls -al'</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Alias kalıcı kullanım</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cd 
touch .bash_aliases 
nano .bash_aliases 
alias upd='sudo apt-get update; sudo apt-get -y upgrade' 
Ctrl-x ile çıkış 
Evet cevabı ile kayıt 
source .bashrc 
upd</code></pre>
<!-- /wp:code -->

  Nasıl yapıldığının anlatılmasını istediğiniz diğer konuları bize bildirebilirsiniz. 
 