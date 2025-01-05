---
draft: false

title:  'Alias komutu ile kısayol tanımlama'
date: '2024-01-16T21:44:57+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Linux komut satırında çok sık kullandığınız ve yazması uzun olan komutlar için kısaltma tanımlayabilirsiniz. Tanımladığınız kısaltma sayesinde uzun komutları kısaltmış olursunuz ve zaman kazanırsınız.' 
 
url:  /tr/alias-komutu-ile-kisayol-tanimlama/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
burst_total_pageviews_count:
    - '5'
featured_image: /images/bash-aliases-cli.png
categories:
    - 'Temel Linux'
tags:
    - alias
    - linux
    - 'linux nasıl'
    - yazılım
---


Linux komut satırında çok sık kullandığınız ve yazması uzun olan komutlar için kısaltma tanımlayabilirsiniz. Tanımladığınız kısaltma sayesinde uzun komutları kısaltmış olursunuz ve zaman kazanırsınız. Bu yazımızda, alias komutunun kullanımı ve kısaltma oluşturma açıklanacaktır.


```bash
alias uptodate='sudo apt update &amp;&amp; sudo apt upgrade'```



Yukarıda verilen `uptodate` komutu sayesinde uzun bir komut, uptodate kısaltması haline dönüştürülmüştür. Bu örnekleri çoğalmamız mümkün. Örneğin, sistemimizde çalışan servisleri görüntülemek için `systemctl` komutunu kısaltalım.


```bash
alias active_services='systemctl --type=service --state=running'```



Bu komutları ve benzerlerini kalıcı hale getirmeniz gerekir. Sisteminiz yeniden başladığında da alias kısaltmalarını kullanmak istiyorsanız home klasöründe `.bash_aliases` isimli bir dosya oluşturmalısınız. Bu dosya içerisine her satıra bir komut gelecek şekilde istediğiniz kısaltmaları ekleyebilirsiniz. Oluşturduğumuz dosyanın ekran görüntüsü aşağıdadır.


```bash
nano .bash_aliases
```


<!-- wp:image {"id":677,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/wp-content/uploads/2024/01/nano-editor-bash-aliases.png" alt="" class="wp-image-677" /><figcaption class="wp-element-caption">nano editor .bash_aliases</figcaption></figure>
<!-- /wp:image -->


Dosyayı <kbd>Ctrl+o</kbd> tuşları ile kaydedip, <kbd>Ctrl+x</kbd> tuşuyla çıkış yapabiliriz. Son olarak dosyanın sisteme yeniden yüklenmesi gerektiğinden aşağıdaki komut ile bash yazılımını tekrar başlatalım. Artık `active` yazıp `Tab` tuşuna bastığınızda otomatik tamamlanacak ve kısaltma çalışacaktır.


```bash
linux@rpi4:~ $ source .bashrc
linux@rpi4:~ $ active_services
```



Bu sayede komut satırında çalışma hızınız oldukça artacaktır.
