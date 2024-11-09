---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Temel Linux
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2017-06-20T14:05:00Z"
excerpt: Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz uname komutunu açıklayacağız.
  Bu komut sayesinde kullandığınız sistemin kernel bilgisini ve işlemci bilgilerini
  elde edebilirsiniz.
guid: https://www.siberoloji.com/?p=1225
id: 1225
image: /assets/images/2024/06/cyber5.jpg
tags:
- linux nasıl
- uname
title: Linux İçin uname Komutu
url: /tr/linux-icin-uname-komutu/
---

  Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz uname komutunu açıklayacağız. Bu komut sayesinde kullandığınız sistemin kernel bilgisini ve işlemci bilgilerini elde edebilirsiniz. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="uname">uname 
<!-- /wp:heading -->

  <code>uname</code>&nbsp;komutu sisteminiz hakkında kullanabileceğiniz komutlardan bir tanesidir. Öncelikle, yardım bilgilerini görüntüleyelim ve seçenekleri görelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">uname --help

Usage: uname ***[*** OPTION]...
Print certain system information.  With no OPTION, same as -s.

  -a, --all                print all information, ***in *** the following order,
                             except omit -p and -i ***if *** unknown:
  -s, --kernel-name        print the kernel name
  -n, --nodename           print the network node hostname
  -r, --kernel-release     print the kernel release
  -v, --kernel-version     print the kernel version
  -m, --machine            print the machine hardware name
  -p, --processor          print the processor type ***(*** non-portable***)*** 
  -i, --hardware-platform  print the hardware platform ***(*** non-portable***)*** 
  -o, --operating-system   print the operating system
      --help     display this help and exit
      --version  output version information and exit
</code></pre>
<!-- /wp:code -->

  <code>uname</code>&nbsp;komutunu, hiçbir seçenek olmadan verirseniz,&nbsp;<code>-s</code>&nbsp;seçeneği varsayılan olarak kullanılır. 
 

 
<h2 class="wp-block-heading" id="uname--a"><code>uname -a</code>
<!-- /wp:heading -->

  Yazdırılabilecek tüm bilgi ekrana yazdırılır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">uname -a
Linux umut-X550JX 4.8.0-42-generic <em>#45~16.04.1-Ubuntu SMP Thu Mar 9 14:10:58 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux</em>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="uname--s"><code>uname -s</code>
<!-- /wp:heading -->

  Kullanımda bulunan kernel adını ekrana yazdırır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">uname -s
Linux
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="uname--n"><code>uname -n</code>
<!-- /wp:heading -->

  Bilgisayarınızın, ağ içinde kullanılan host adını gösterir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">uname -n
umut-X550JX
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="uname--r"><code>uname -r</code>
<!-- /wp:heading -->

  Kullandımda olan Kernel ana dağıtım bilgisini gösterir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">uname -r
4.8.0-42-generic
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="uname--v"><code>uname -v</code>
<!-- /wp:heading -->

  Kullanımda olan Kernel sürümünün dağıtıma özel sürüm bilgisini, yayınlandığı tarihle birlikte gösterir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">uname -v
<em>#45~16.04.1-Ubuntu SMP Thu Mar 9 14:10:58 UTC 2017</em>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="uname--m"><code>uname -m</code>
<!-- /wp:heading -->

  Kullandığınız bilgisayarın donanım adını gösterir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">uname -m
x86_64
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="uname--p"><code>uname -p</code>
<!-- /wp:heading -->

  Kullanılan işlemcinin Mimari bilgisini gösterir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">uname -p
x86_64
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="uname--i"><code>uname -i</code>
<!-- /wp:heading -->

  Kullanılan bilgisayarın donanım platform bilgisini gösterir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">uname -i
x86_64
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="uname--o"><code>uname -o</code>
<!-- /wp:heading -->

  İşletim sisteminin ne olduğunu gösterir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">uname -o
GNU/Linux
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="faydalı-kullanım">Faydalı Kullanım
<!-- /wp:heading -->

  Bu komutun çıktılarını, değişken olarak atayarak, yazacağınız komut veya Bash script dosyalarında kullanabilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get install linux-headers-$(uname -r)
***[*** sudo***]***  password ***for *** umut: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
linux-headers-4.8.0-42-generic is already the newest version ***(*** 4.8.0-42.45~16.04.1***)*** .
</code></pre>
<!-- /wp:code -->

  Gördüğünüz gibi&nbsp;<code>uname -r</code>&nbsp;komutu hangi değeri alıyorsa, o kernel sürümüne ait headers dosyalarını sisteme yükleme komutunu vermiş olduk. Bu şekilde değişken atamalı kullanım, yazacağınız komutların farklı bilgisayarlarda kullanımını kolaylaştırır. 
 