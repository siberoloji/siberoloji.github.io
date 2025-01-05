---
draft: false

title:  'MacOS touchbar hatası nasıl çözülür?'
date: '2024-06-22T13:32:24+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Macbook Pro modellerinde bulunan touchbar çok iyi bir kullanım kolaylığı sağlıyor. Bazı dokunmatik çubukların olması gerekenden farklı çalıştığını veya hiç yanıt vermediğini fark edebilirsiniz. Bu problemin çözümü için bir tavsiye hazırladık.' 
 
url:  /tr/macos-touchbar-hatasi-nasil-cozulur/ 
featured_image: /images/macos-touchbar-controls.jpeg
categories:
    - MAC/iOS
tags:
    - touchbar
---


Macbook Pro modellerinde bulunan touchbar çok iyi bir kullanım kolaylığı sağlıyor. Bazı dokunmatik çubukların olması gerekenden farklı çalıştığını veya hiç yanıt vermediğini fark edebilirsiniz. Bu problemin çözümü için bir tavsiye hazırladık. Dokunmatik çubuğunuz yanıt vermemeye başladığında bu komutları denemelisiniz. Terminal uygulamasını açın. (Command+Space tuşları ile Spotlight'ı açıp "Terminal" uygulamasını aratabilirsiniz.) Aşağıdaki komutlar yardımı ile Touchbar sunucuyu durdurun ve yeniden başlatın.


<!-- wp:image {"id":931,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://www.siberoloji.com/wp-content/uploads/2024/06/Screenshot-2024-06-22-at-13.12.28-1024x234.png" alt="" class="wp-image-931"/></figure>
<!-- /wp:image -->

```bash
sudo pkill TouchBarServer
sudo killall ControlStrip
```



Touchbar'ın yeniden başladığını ve sorunun çok büyük ihtimalle çözüldüğünü göreceksiniz. Bu işlem sorununuzu çözmezse, donanımsal bir problemini olabilir. Bu durumda bir yetkili servise başvurmanızı öneriyoruz.
