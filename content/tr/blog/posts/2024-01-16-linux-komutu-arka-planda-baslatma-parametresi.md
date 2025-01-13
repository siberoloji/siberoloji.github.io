---
draft: false

title:  'Linux komutu arka planda başlatma &amp; parametresi'
date: '2024-01-16T14:20:11+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Linux komut satırında çalışırken bir komut giriş yaptığınızda, o komut işlemi bitene kadar başka bir komut daha girmek isterseniz beklemeniz gerekir. ' 
 
url:  /tr/linux-komutu-arka-planda-baslatma-parametresi/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
burst_total_pageviews_count:
    - '1'
featured_image: /images/linuxbgfgcommands.png
categories:
    - 'Temel Linux'
tags:
    - linux
    - 'linux nasıl'
    - 'temel linux'
---
Linux komut satırında çalışırken bir komut giriş yaptığınızda, o komut işlemi bitene kadar başka bir komut daha girmek isterseniz beklemeniz gerekir. Bunu çözmek için yeni pencereler, yeni bağlantılar yapabilirsiniz ancak bir çözüm daha var. 

Vereceğiniz komutu en başta, arka planda başlatabilirsiniz. Örneğin uzun sürecek bir kopyalama işlemini arka planda başlatıp diğer işlerle ilgilenmek isterseniz komutun sonuna &amp; işareti koymanız yeterli olacaktır.
```bash
linux@rpi4:~ $ sudo apt update &amp;
[1] 7336
linux@rpi4:~ $ jobs
[1]+  Stopped                 sudo apt update
linux@rpi4:~ $ fg 1
sudo apt update
[sudo] password for linux: 
Hit:1 http://deb.debian.org/debian bookworm InRelease
Hit:2 http://archive.raspberrypi.com/debian bookworm InRelease
Hit:3 http://deb.debian.org/debian-security bookworm-security InRelease
Hit:4 http://deb.debian.org/debian bookworm-updates InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
linux@rpi4:~ $ 
```

Yukarıda gördüğünüz gibi `sudo apt update &amp;` komutu ile güncelleme işlemini arka planda başlattık. Bu durumda sistem bize arka planda başlayan işin iş numarasını `[1]` olarak gösterdi. Arka planda birden fazla iş yapılıyorsa bunların listesini `jobs` komutuyla görebiliriz. fg 1 komutuyla da arka plandaki bir işlemi ön plana geri getirebiliriz. Tam tersini yapmak istersek, çalışan bir işi arka plan <kbd>Ctrl+z</kbd> tuşları yardımıyla gönderebiliriz.

Burada vurgulanması gereken en önemli kolaylık, komutu &amp; işaretiyle verir vermez komut satırının bizim kullanımımıza geri gelmesidir.
