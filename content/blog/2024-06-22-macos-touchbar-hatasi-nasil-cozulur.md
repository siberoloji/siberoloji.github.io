---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- MAC/iOS
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
cmplz_hide_cookiebanner:
- ""
date: "2024-06-22T13:32:24Z"
excerpt: Macbook Pro modellerinde bulunan touchbar çok iyi bir kullanım kolaylığı
  sağlıyor. Bazı dokunmatik çubukların olması gerekenden farklı çalıştığını veya hiç
  yanıt vermediğini fark edebilirsiniz. Bu problemin çözümü için bir tavsiye hazırladık.
guid: https://www.siberoloji.com/?p=935
id: 935
image: /assets/images/2024/06/macos-touchbar-controls.jpeg
tags:
- touchbar
title: MacOS touchbar hatası nasıl çözülür?
url: /tr/macos-touchbar-hatasi-nasil-cozulur/
---

  Macbook Pro modellerinde bulunan touchbar çok iyi bir kullanım kolaylığı sağlıyor. Bazı dokunmatik çubukların olması gerekenden farklı çalıştığını veya hiç yanıt vermediğini fark edebilirsiniz. Bu problemin çözümü için bir tavsiye hazırladık. Dokunmatik çubuğunuz yanıt vermemeye başladığında bu komutları denemelisiniz.<br>Terminal uygulamasını açın. (Command+Space tuşları ile Spotlight'ı açıp "Terminal" uygulamasını aratabilirsiniz.)<br>Aşağıdaki komutlar yardımı ile Touchbar sunucuyu durdurun ve yeniden başlatın. 
 

<!-- wp:image {"id":931,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://www.siberoloji.com/assets/images/2024/06/Screenshot-2024-06-22-at-13.12.28-1024x234.png" alt="" class="wp-image-931"/></figure>
<!-- /wp:image -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo pkill TouchBarServer
sudo killall ControlStrip</code></pre>
<!-- /wp:code -->

  Touchbar'ın yeniden başladığını ve sorunun çok büyük ihtimalle çözüldüğünü göreceksiniz. Bu işlem sorununuzu çözmezse, donanımsal bir problemini olabilir. Bu durumda bir yetkili servise başvurmanızı öneriyoruz. 
 