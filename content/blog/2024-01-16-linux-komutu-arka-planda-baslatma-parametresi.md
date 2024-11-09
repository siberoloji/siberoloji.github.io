---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "1"
categories:
- Temel Linux
classicmag_header_overlay:
- global-layout
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-01-16T14:20:11Z"
excerpt: 'Linux komut satırında çalışırken bir komut giriş yaptığınızda, o komut işlemi
  bitene kadar başka bir komut daha girmek isterseniz beklemeniz gerekir. '
guid: https://www.siberoloji.com/?p=665
id: 665
image: /assets/images/2024/01/linuxbgfgcommands.png
tags:
- linux
- linux nasıl
- temel linux
title: Linux komutu arka planda başlatma &amp; parametresi
url: /tr/linux-komutu-arka-planda-baslatma-parametresi/
---

  Linux komut satırında çalışırken bir komut giriş yaptığınızda, o komut işlemi bitene kadar başka bir komut daha girmek isterseniz beklemeniz gerekir. Bunu çözmek için yeni pencereler, yeni bağlantılar yapabilirsiniz ancak bir çözüm daha var. 
 

  Vereceğiniz komutu en başta, arka planda başlatabilirsiniz. Örneğin uzun sürecek bir kopyalama işlemini arka planda başlatıp diğer işlerle ilgilenmek isterseniz komutun sonuna &amp; işareti koymanız yeterli olacaktır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">linux@rpi4:~ $ sudo apt update &amp;
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
</code></pre>
<!-- /wp:code -->

  Yukarıda gördüğünüz gibi <code>sudo apt update &amp;</code> komutu ile güncelleme işlemini arka planda başlattık. Bu durumda sistem bize arka planda başlayan işin iş numarasını <code>[1]</code> olarak gösterdi. Arka planda birden fazla iş yapılıyorsa bunların listesini <code>jobs</code> komutuyla görebiliriz. fg 1 komutuyla da arka plandaki bir işlemi ön plana geri getirebiliriz. Tam tersini yapmak istersek, çalışan bir işi arka plan <kbd>Ctrl+z</kbd> tuşları yardımıyla gönderebiliriz.
 

  Burada vurgulanması gereken en önemli kolaylık, komutu &amp; işaretiyle verir vermez komut satırının bizim kullanımımıza geri gelmesidir.
 