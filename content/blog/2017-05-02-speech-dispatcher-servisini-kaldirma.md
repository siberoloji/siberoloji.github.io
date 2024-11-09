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
date: "2017-05-02T02:05:00Z"
excerpt: Linux sisteminizde yüklü olan ve kullanma ihtiyacı hissetmediğiniz gereksiz
  servisleri kaldırmak akıllıca bir yaklaşımdır. Ekran okuyucuyu kullanmıyorsanız
  bu yazıda anlatılanları kullanarak sisteminizden kaldırabilirsiniz.
guid: https://www.siberoloji.com/?p=1127
id: 1127
image: /assets/images/2024/06/cyber1.jpg
tags:
- linux nasıl
title: Speech Dispatcher Servisini Kaldırma
url: /tr/speech-dispatcher-servisini-kaldirma/
---

  Linux sisteminizde yüklü olan ve kullanma ihtiyacı hissetmediğiniz gereksiz servisleri kaldırmak akıllıca bir yaklaşımdır. Ekran okuyucuyu kullanmıyorsanız bu yazıda anlatılanları kullanarak sisteminizden kaldırabilirsiniz. 
 

  speech-dispatcher olarak geçen ekran okuyucu, görme problemi olanlar için geliştirlmiş bir ekran okuma yardımcısıdır. Sisteminizden kaldırmak için aşağıdaki komutları kullanabilirsiniz. Verilen başlıklardan istediğiniz birini seçip uygulamak yeterlidir. 
 

 
<h2 class="wp-block-heading" id="sadece-speech-dispatcher-kaldırma">Sadece speech-dispatcher kaldırma
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get remove speech-dispatcher
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="speech-dispatcher-ve-bağımlılıkları-kaldırma">speech-dispatcher ve bağımlılıkları kaldırma
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get remove --auto-remove speech-dispatcher
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="speech-dispacher-ve-ayarlarını-kaldırma">speech dispacher ve ayarlarını kaldırma
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get purge speech-dispatcher
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="speech-dispacther-ayarlarını-ve-bağımlılıklarını-kaldırma">speech-dispacther, ayarlarını ve bağımlılıklarını kaldırma
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get purge --auto-remove speech-dispatcher</code></pre>
<!-- /wp:code -->