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
date: "2016-06-13T17:53:00Z"
excerpt: Bir Linux bilgisayarınız var ve onun ekranını başka bilgisayarlarla paylaşmak
  mı istiyorsunuz. Bunun için bilgisayarınıza masaüstü paylaşım sunucusu kurmanız
  gerekir. Bu yazıda, Linux Mint ve benzeri Ubuntu tabanlı dağıtımlarda VNC Server
  nasıl kurulur sorusuna bakacağız.
guid: https://www.siberoloji.com/?p=1091
id: 1091
image: /assets/images/2024/06/linux-howto.jpg
tags:
- linux nasıl
- vnc server
title: Linux için VNC Server Kurulum
url: /tr/linux-icin-vnc-server-kurulum/
---

  Bir Linux bilgisayarınız var ve onun ekranını başka bilgisayarlarla paylaşmak mı istiyorsunuz. Bunun için bilgisayarınıza masaüstü paylaşım sunucusu kurmanız gerekir. Bu yazıda, Linux Mint ve benzeri Ubuntu tabanlı dağıtımlarda VNC Server nasıl kurulur sorusuna bakacağız. 
 

<!-- wp:list -->
 <!-- wp:list-item -->
- Varsayılan VNC server olan Vino’yu kaldıralım: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get -y remove vino
</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- X11vnc Kuralım: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt-get -y install x11vnc
</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Parolamızı kaydedeceğimiz dosyayı oluşturalım: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo mkdir /etc/x11vnc
</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Şifrelenmiş şekilde tutulacak parolamızı oluşturup kaydedelim: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo x11vnc --storepasswd /etc/x11vnc/vncpwd
</code></pre>
<!-- /wp:code -->

  Bu adımda size yeni parolanızı sorulacaktır. Ekranda gösterien adımları uygulayın ve kaydedin. 
 

<!-- wp:list -->
 <!-- wp:list-item -->
- x11vnc Sunucu için systemd unit dosyasını oluşturalım. Bunun için aşağıdaki komutu kullanarak metin editörümüzle, service dosyasını açın. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo xed /lib/systemd/system/x11vnc.service
</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Aşağıdaki kodları dosyanın(x11vnc.service) içerisine buradan kopyalayıp yapıştırın ve kaydedin. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">***[*** Unit]
Description***=*** Start x11vnc at startup.
After***=*** multi-user.target
***[*** Service]
Type***=*** simple
ExecStart***=*** /usr/bin/x11vnc -auth guess -forever -noxdamage -repeat -rfbauth /etc/x11vnc/vncpwd -rfbport 5900 -shared
***[*** Install]
WantedBy***=*** multi-user.target
</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Systemd servislerini tekrar başlatın. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl daemon-reload
</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Bilgisayarın başlangıcında, VNC sunucunun otomatik başlamasını istiyorsak, aşağıdaki komut ile aktif hale getiriyoruz: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl enable x11vnc.service
</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Son adımda sunucuyu başlatalım: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo systemctl start x11vnc.service</code></pre>
<!-- /wp:code -->