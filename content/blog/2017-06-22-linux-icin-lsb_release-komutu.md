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
date: "2017-06-22T14:07:00Z"
excerpt: Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz lsb_release komutunu
  açıklayacağız. Bu komut sayesinde kullandığınız Linux dağıtımınıza özel bilgileri
  elde edebilirsiniz.
guid: https://www.siberoloji.com/?p=1227
id: 1227
image: /assets/images/2024/06/cyber7.jpg
tags:
- linux
- linux nasıl
- lsb_release
title: Linux İçin lsb_release Komutu
url: /tr/linux-icin-lsb_release-komutu/
---

  Bu yazıda, Linux İşletim sisteminizde kullanabileceğiniz&nbsp;<code>lsb_release</code>&nbsp;komutunu açıklayacağız. Bu komut sayesinde kullandığınız Linux dağıtımınıza özel bilgileri elde edebilirsiniz. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="lsb_relase">lsb_relase 
<!-- /wp:heading -->

  <code>lsb_relase</code>&nbsp;komutu sisteminiz hakkında kullanabileceğiniz komutlardan bir tanesidir. Bu komut,&nbsp;<code>lsb-core</code>&nbsp;olarak adlandırılan paketin bir parçasıdır.&nbsp;<code>lsb_release</code>&nbsp;komutunu verdiğinizde herhangi bir çıktı alamıyorsanız&nbsp;<code>sudo apt install lsb-core</code>&nbsp;komutuyla gerekli paketleri yükleyebilirsiniz. 
 

  Öncelikle, yardım bilgilerini görüntüleyelim ve seçenekleri görelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">lsb_release --help


Options:
  -h, --help         show this help message and exit
  -v, --version      show LSB modules this system supports
  -i, --id           show distributor ID
  -d, --description  show description of this distribution
  -r, --release      show release number of this distribution
  -c, --codename     show code name of this distribution
  -a, --all          show all of the above information
  -s, --short        show requested information ***in *** short format
</code></pre>
<!-- /wp:code -->

  <code>lsb_release</code>&nbsp;komutunu, hiçbir seçenek olmadan verirseniz,&nbsp;<code>-v</code>&nbsp;seçeneği varsayılan olarak kullanılır. 
 

 
<h2 class="wp-block-heading" id="lsb_release--v"><code>lsb_release -v</code>
<!-- /wp:heading -->

  Kullandığınız dağıtımın desteklediği, sisteminizde yüklü olan ilave LSB modüllerini listeler.&nbsp;<code>No LSB modules are available.</code>&nbsp;sonucu alıyorsanız,&nbsp;<code>sudo apt install lsb-core</code>&nbsp;komutunu vererek kurabileceğiniz LSB modüllerini görebilirsiniz. İhtiyacınız yoksa kurmanıza gerek yoktur. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">lsb_release -v
No LSB modules are available.
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="lsb_release--i"><code>lsb_release -i</code>
<!-- /wp:heading -->

  Linux dağıtımını sağlayan otoritenin ID kimlik bilgisini görüntüler. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">lsb_release -i
Distributor ID:	LinuxMint
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="lsb_release--d"><code>lsb_release -d</code>
<!-- /wp:heading -->

  Kullandığınız dağıtımın açıklamasını görüntüler. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">lsb_release -d
Description:	Linux Mint 18.1 Serena
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="lsb_release--r"><code>lsb_release -r</code>
<!-- /wp:heading -->

  Kullandığınız dağıtımın sürüm numarasını görüntüler. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">lsb_release -r
Release:	18.1
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="lsb_release--c"><code>lsb_release -c</code>
<!-- /wp:heading -->

  Kullandığınız dağıtımın kod adını görüntüler. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">lsb_release -c
Codename:	serena
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="lsb_release--a"><code>lsb_release -a</code>
<!-- /wp:heading -->

  Yukarıda açıklanan seçeneklerin tamamını bir seferde görüntüler. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">lsb_release -a
No LSB modules are available.
Distributor ID:	LinuxMint
Description:	Linux Mint 18.1 Serena
Release:	18.1
Codename:	serena
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="lsb_release--as"><code>lsb_release -as</code>
<!-- /wp:heading -->

  <code>-s</code>&nbsp;seçeneği yardımcı bir seçenektir. Kısa bilgi anlamına gelir. Görüntülenmek istenen bilginin, sol tarafındaki başlık adı olmadan sadece bilginin kendisini görüntülemeye yarar. Bash proglamada kullanımda oldukça faydalı olabilir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">lsb_release -as
No LSB modules are available.
LinuxMint
Linux Mint 18.1 Serena
18.1
serena</code></pre>
<!-- /wp:code -->