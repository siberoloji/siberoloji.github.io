---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "38"
categories:
- MAC/iOS
date: "2023-06-14T20:46:32Z"
excerpt: Bir işletim sisteminde bulunan hosts dosyası, alan adlarını Ip adreslerine
  çevirmeye yarar. Kullanıcılar hosts dosyalarına veriler girerek DNS sunucusundan
  gelecek cevaplar yerine kendi tanımladıkları IP adreslerine gidebilirler.
guid: https://www.siberoloji.com/?p=404
id: 404
image: /assets/images/2023/06/terminal-hosts-file-1.png
tags:
- hosts dosyası
- macos
title: MacOS İşletim Sisteminde hosts dosyası yeri nerede?
url: /tr/macos-isletim-sisteminde-hosts-dosyasi-yeri-nerede/
---

  Bir işletim sisteminde bulunan <em>hosts</em> dosyası, alan adlarını Ip&nbsp;adreslerine çevirmeye yarar. Kullanıcılar hosts dosyalarına veriler girerek DNS sunucusundan gelecek cevaplar yerine kendi tanımladıkları IP adreslerine gidebilirler. 
 

  Mac kullanıcıları bu dosyayı <em>/private/etc/hosts</em> klasöründe bulabilirler. root yetkileri olan bir kullanıcı iseniz istediğiniz text editöründe bu dosyayı düzenleyebilirsiniz. 
 

 
 ## Hosts dosyasında değişiklik nasıl yapılır?</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Hosts dosyasını açalım</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Command+Spacebar</strong> tuşları yardımıyla Spotlight ı açalım. Arama kutusuna "Terminal" yazarak terminal uygulamasını açalım. 
 

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Komut satırından nano editör ile <em>hosts</em> dosyasını açalım. Komutu girdiğinizde parolanızı soracaktır.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo nano /private/etc/hosts</code></pre>
<!-- /wp:code -->

  Açılan dosya görünümü aşağıdadır. 
 

<!-- wp:image {"id":406,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/assets/images/2023/06/terminal-hosts-file-1.png" alt="" class="wp-image-406" /></figure>
<!-- /wp:image -->

  Bu dosyanın en altına istediğiniz ilaveleri yaparak kaydedebilirsiniz. Örneğin, evinizde bulunan sunucunuzun sabit IP adresi 192.168.1.20 ise ve web tarayıcınıza sürekli bu adresi yazmaktansa benimsunucum.com yazdığınızda bu IP adresine gitmesini istediğinizi varsayalım.  
 

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Bu durumda <em>hosts</em> dosyasına aşağıdaki satırı eklemelisiniz. </li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  192.168.1.20 benimsunucum.com 
 

  Ctrl+O ile kaydedip Ctrl+X ile nano editörden çıkabilirsiniz. 
 

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Flush DNS Cache</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  Yaptığınız değişikliklerin etkili olabilmesi için bilgisayarınızda tutulan DNS geçici kayıtlarını temizlemelisiniz. Bunun için aşağıdaki komutlar yeterli olacaktır. 
 

<!-- wp:heading {"level":3} -->
 ### macOS Monterey, Big Sur</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### <strong>macOS Catalina, Mojave, High Sierra, Sierra, Mountain Lion, Lion</strong></h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo killall -HUP mDNSResponder</code></pre>
<!-- /wp:code -->

 
 ## Sonuç</h2>
<!-- /wp:heading -->

  Bu yazımızda, hosts dosyasını düzenleyerek DNS sunucudan gelen sonuçlar yerine kendi IP adres tanımlamamızı yapmış olduk. Bu sayede, public IP adresimiz olmasa bile kendi ev sunucumuzu sistemimizde IP adresi yerine hostname girerek kullanabileceğimizi açıkladık. 
 