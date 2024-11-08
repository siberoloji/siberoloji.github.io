---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "5"
categories:
- Temel Linux
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-16T21:44:57Z"
excerpt: Linux komut satırında çok sık kullandığınız ve yazması uzun olan komutlar
  için kısaltma tanımlayabilirsiniz. Tanımladığınız kısaltma sayesinde uzun komutları
  kısaltmış olursunuz ve zaman kazanırsınız.
guid: https://www.siberoloji.com/?p=676
id: 676
image: /assets/images/2024/01/bash-aliases-cli.png
tags:
- alias
- linux
- linux nasıl
- yazılım
title: Alias komutu ile kısayol tanımlama
url: /tr/alias-komutu-ile-kisayol-tanimlama/
---

  Linux komut satırında çok sık kullandığınız ve yazması uzun olan komutlar için kısaltma tanımlayabilirsiniz. Tanımladığınız kısaltma sayesinde uzun komutları kısaltmış olursunuz ve zaman kazanırsınız. Bu yazımızda, alias komutunun kullanımı ve kısaltma oluşturma açıklanacaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">alias uptodate='sudo apt update &amp;&amp; sudo apt upgrade'</code></pre>
<!-- /wp:code -->

  Yukarıda verilen <code>uptodate</code> komutu sayesinde uzun bir komut, uptodate kısaltması haline dönüştürülmüştür. Bu örnekleri çoğalmamız mümkün. Örneğin, sistemimizde çalışan servisleri görüntülemek için <code>systemctl</code> komutunu kısaltalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">alias active_services='systemctl --type=service --state=running'</code></pre>
<!-- /wp:code -->

  Bu komutları ve benzerlerini kalıcı hale getirmeniz gerekir. Sisteminiz yeniden başladığında da alias kısaltmalarını kullanmak istiyorsanız home klasöründe <code>.bash_aliases</code> isimli bir dosya oluşturmalısınız. Bu dosya içerisine her satıra bir komut gelecek şekilde istediğiniz kısaltmaları ekleyebilirsiniz. Oluşturduğumuz dosyanın ekran görüntüsü aşağıdadır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">nano .bash_aliases</code></pre>
<!-- /wp:code -->

<!-- wp:image {"id":677,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/assets/images/2024/01/nano-editor-bash-aliases.png" alt="" class="wp-image-677" /><figcaption class="wp-element-caption">nano editor .bash_aliases</figcaption></figure>
<!-- /wp:image -->

  Dosyayı <kbd>Ctrl+o</kbd> tuşları ile kaydedip, <kbd>Ctrl+x</kbd> tuşuyla çıkış yapabiliriz. Son olarak dosyanın sisteme yeniden yüklenmesi gerektiğinden aşağıdaki komut ile bash yazılımını tekrar başlatalım. Artık <code>active</code> yazıp <code>Tab</code> tuşuna bastığınızda otomatik tamamlanacak ve kısaltma çalışacaktır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">linux@rpi4:~ $ source .bashrc
linux@rpi4:~ $ active_services</code></pre>
<!-- /wp:code -->

  Bu sayede komut satırında çalışma hızınız oldukça artacaktır. 
 