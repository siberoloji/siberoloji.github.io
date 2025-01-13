---
draft: false

title:  'MacOS İşletim Sisteminde hosts dosyası yeri nerede?'
date: '2023-06-14T20:46:32+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Bir işletim sisteminde bulunan hosts dosyası, alan adlarını Ip\_adreslerine çevirmeye yarar. Kullanıcılar hosts dosyalarına veriler girerek DNS sunucusundan gelecek cevaplar yerine kendi tanımladıkları IP adreslerine gidebilirler." 
 
url:  /tr/macos-isletim-sisteminde-hosts-dosyasi-yeri-nerede/
burst_total_pageviews_count:
    - '38'
featured_image: /images/terminal-hosts-file-1.png
categories:
    - MAC/iOS
tags:
    - 'hosts dosyası'
    - macos
---
Bir işletim sisteminde bulunan hosts dosyası, alan adlarını Ip adreslerine çevirmeye yarar. Kullanıcılar hosts dosyalarına veriler girerek DNS sunucusundan gelecek cevaplar yerine kendi tanımladıkları IP adreslerine gidebilirler.

Mac kullanıcıları bu dosyayı /private/etc/hosts klasöründe bulabilirler. root yetkileri olan bir kullanıcı iseniz istediğiniz text editöründe bu dosyayı düzenleyebilirsiniz.

## Hosts dosyasında değişiklik nasıl yapılır?
* 
* Hosts dosyasını açalım
**Command+Spacebar** tuşları yardımıyla Spotlight ı açalım. Arama kutusuna "Terminal" yazarak terminal uygulamasını açalım.
* 
* Komut satırından nano editör ile hosts dosyasını açalım. Komutu girdiğinizde parolanızı soracaktır.

```bash
sudo nano /private/etc/hosts
```

Açılan dosya görünümü aşağıdadır.
<!-- wp:image {"id":406,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/wp-content/uploads/2023/06/terminal-hosts-file-1.png" alt="" class="wp-image-406" /></figure>
<!-- /wp:image -->
Bu dosyanın en altına istediğiniz ilaveleri yaparak kaydedebilirsiniz. Örneğin, evinizde bulunan sunucunuzun sabit IP adresi 192.168.1.20 ise ve web tarayıcınıza sürekli bu adresi yazmaktansa benimsunucum.com yazdığınızda bu IP adresine gitmesini istediğinizi varsayalım. 
* 
* Bu durumda hosts dosyasına aşağıdaki satırı eklemelisiniz. 
192.168.1.20 benimsunucum.com

Ctrl+O ile kaydedip Ctrl+X ile nano editörden çıkabilirsiniz.
* 
* Flush DNS Cache
Yaptığınız değişikliklerin etkili olabilmesi için bilgisayarınızda tutulan DNS geçici kayıtlarını temizlemelisiniz. Bunun için aşağıdaki komutlar yeterli olacaktır.

macOS Monterey, Big Sur
```bash
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder```

**macOS Catalina, Mojave, High Sierra, Sierra, Mountain Lion, Lion**
```bash
sudo killall -HUP mDNSResponder```

## Sonuç

Bu yazımızda, hosts dosyasını düzenleyerek DNS sunucudan gelen sonuçlar yerine kendi IP adres tanımlamamızı yapmış olduk. Bu sayede, public IP adresimiz olmasa bile kendi ev sunucumuzu sistemimizde IP adresi yerine hostname girerek kullanabileceğimizi açıkladık.
