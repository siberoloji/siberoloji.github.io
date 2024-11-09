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
date: "2017-05-11T02:13:00Z"
excerpt: Metasploit Framework’ü etkin ve tam kapasiteli kullanabilmek için ihtiyaç
  duyabileceğiniz temel bilgilere ve komutlara birlikte bakalım istedim. Acele edip
  hızlı gitmektense, önce işimizi kolaylaştıracak temel bilgileri görelim.
guid: https://www.siberoloji.com/?p=1133
id: 1133
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
- siber güvenlik
title: Metasploit Framework Tanıyalım
url: /tr/metasploit-framework-taniyalim/
---

  Metasploit Framework’ü etkin ve tam kapasiteli kullanabilmek için ihtiyaç duyabileceğiniz temel bilgilere ve komutlara birlikte bakalım istedim. Acele edip hızlı gitmektense, önce işimizi kolaylaştıracak temel bilgileri görelim. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="mimari-ve-kütüphaneler">Mimari ve Kütüphaneler 
<!-- /wp:heading -->

<!-- wp:image {"id":1014,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/assets/images/2024/06/msfarch.png" alt="" class="wp-image-1014" /></figure>
<!-- /wp:image -->

  Metasploit, kısaca yukarıda gördüğünüz mimari diyagramında gösterilen elemanlardan oluşmaktadır. Bu temel elemanları kısaca tanıyalım 
 

 
<h2 class="wp-block-heading" id="rex">Rex
<!-- /wp:heading -->

  Metasploit için en temel başlangıç kütüphanesidir. Soket, protokol, SSL, SMB, HTTP, XOR, Base64, Unicode işlemlerinin yapıldığı merkezdir. 
 

 
<h2 class="wp-block-heading" id="msfcore">Msf::Core
<!-- /wp:heading -->

  Rex kütüphanesi üzerine bina edilen Core katmanı, dışarıdan modül ve eklentilerin de eklenmesini sağlayan ayarların yönetildiği kısımdır. Temel API sağlar. Çerçeve dediğimiz Framework burasıdır. 
 

 
<h2 class="wp-block-heading" id="msfbase">Msf::Base
<!-- /wp:heading -->

  Bu katman, temel API lerin daha da basitleştirildiği kısımdır. 
 

 
<h2 class="wp-block-heading" id="msfgui">Msf::GUI
<!-- /wp:heading -->

  Kullanıcının gördüğü kısımdır. Arayüz ve komutların girişinin yapıldığı kısımlar burada bulunur. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="dosya-sistemi">Dosya sistemi 
<!-- /wp:heading -->

<!-- wp:image {"id":1015,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://www.siberoloji.com/assets/images/2024/06/msffile.png" alt="" class="wp-image-1015" /></figure>
<!-- /wp:image -->

  MSF dosya sistemi, kullanıcının işini kolaylaştıracak şekilde oluşturulmuştur ve klasörler anlamlıdır. Bir programı kullanacaksanız, dosya sistemini ve hangi klasörde neyin bulunduğunu bilmek başlangıç için çok önemlidir. Linux işletim sisteminize Metasploit Framework yazılımını, dağıtımınızın yazılım merkezi aracılığı ile yüklemiş iseniz gerekli klasörleri&nbsp;<code>/usr/share</code>&nbsp;içerisinde bulabilirsin. Debian paketi olarak indirip yüklediyseniz&nbsp;<code>/opt/metasploit-framework/</code>&nbsp;klasörü içerisinde bulabilirsiniz. 
 

  Bazı ana klasörlerin hangi bilgileri ihtiva ettiğine bakalım. 
 

<!-- wp:list -->
 <!-- wp:list-item -->
- <code>data</code>: Metasploit tarafından kullanılan ve değiştirilebilir dosyalar bu klasördedir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>documentation</code>: MSF hakkında yardım ve açıklama dokümanları bulunur 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>external</code>: Kaynak kodlar ve 3. taraf kütüphaneleri bu klasördedir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>lib</code>: MSF kullandığı ana kütüphaneler bulunur. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>modules</code>: MSF yüklendiğinde indeksinde bulunan modüller bu klasördedir. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>plugins</code>: Program başlarken yüklenecek eklentiler buradadır. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>scripts</code>: Meterpreter ve diğer script kodları bulunur. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- <code>tools</code>: Çeşitli komut satırı araçları bulunur. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="modüller-ve-yerleri">Modüller ve Yerleri 
<!-- /wp:heading -->

 
<h2 class="wp-block-heading" id="modüller">Modüller
<!-- /wp:heading -->

  Metasploit Framework, modüllerden oluşturulmuştur. Bu modüller kısaca nelerdir? 
 

  ***Payload*** : Karşı sistemde çalışmak üzere tasarlanan script kodlarına Payload adı verilmektedir. 
 

  ***Exploits*** : Payload kullanan modüllere exploit adı verilmektedir. 
 

  ***Auxiliary*** : Payload kullanmayan modüllere Auxiliary modülleri adı verilir. 
 

  ***Encoders*** : Payload scriptlerinin karşı tarafa gitmesini, ulaştırılmasını sağlayan modüllerdir. 
 

  ***Nops*** : Payload scriptlerinin sürekli ve sağlıklı çalışmasını sağlayan modüllerdir. 
 

 
<h2 class="wp-block-heading" id="modüller-nerededir">Modüller Nerededir?
<!-- /wp:heading -->

  Temel modüller ve kullanıcı modülleri olarak ikiye ayırabileceğimiz modüllerin hangi klasörde bulunduğuna bakalım. 
 


<h3 class="wp-block-heading" id="temel-modüller">Temel Modüller
<!-- /wp:heading -->

  MSF her yüklendiğinde kurulup hazır hale gelen modüller, yukarıda belirttiğimiz&nbsp;<code>/usr/share/metasploit-framework/modules/</code>&nbsp;klasöründe veya&nbsp;<code>/opt/metasploit-framework/modules/</code>&nbsp;içerisinde bulunurlar. Windows kullanıcıları da Program Files klasörü içerisine bakabilirler. 
 


<h3 class="wp-block-heading" id="kullanıcı-modülleri">Kullanıcı Modülleri
<!-- /wp:heading -->

  Metasploit’in kullanıcıya tanıdığı en büyük imkan, kendi modülünü çerçeveye dahil edebilmesidir. Bir script yazdınız veya indirdiniz kullanmak istiyorsunuz. Bu kodlara kullanıcı modülleri denir ve kullanıcının ev klasörünün içerisinde başında nokta olan gizli bir klasörde tutulurlar. Tam olarak adresi&nbsp;<code>~/.msf4/modules/</code>&nbsp;bu şekildedir.&nbsp;<code>~</code>&nbsp;Ev klasörü anlamına gelmektedir. Klasörü dosya yöneticisinde görmek için “Gizli Dosyaları Göster” seçeneğini aktif hale getirebilirsiniz. 
 


<h3 class="wp-block-heading" id="kullanıcı-modüllerini-sisteme-tanıtma">Kullanıcı modüllerini sisteme tanıtma
<!-- /wp:heading -->

  MSF, kullanıcıya başlarken veya başladıktan sonra kendi ilave modüllerini yükleme imkanı sunar. Bunun başlarken ve başladıktan sonra nasıl yapıldığını görelim. 
 

  Aşağıda anlatılan iki yöntemde de komutlara vereceğiniz klasör adreslerinin içerisinde, msf isimlendirme konvansiyonuna uygun klasörler bulunmalıdır. Örneğin,&nbsp;<code>~/.msf4/modules/</code>&nbsp;klasöründen bir exploit yüklemek isterseniz, o exploitin&nbsp;<code>~/.msf4/modules/exploit/</code>&nbsp;klasöründe bulunuyor olması gerekir. 
 

  Tam olarak klasörlerin isimlerini ve isimlendirme şablonunun programınızın kurulu olduğu klasör içerisinden öğrenebilirsiniz. Benim bilgisayarım için örnek çıktı aşağıdaki klasör yapısındadır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">umut@umut-X550JX /opt/metasploit-framework/embedded/framework/modules $ ls -l
total 24
drwxr-xr-x 20 root root 4096 May 10 14:46 auxiliary
drwxr-xr-x 11 root root 4096 May 10 14:46 encoders
drwxr-xr-x 19 root root 4096 May 10 14:46 exploits
drwxr-xr-x 10 root root 4096 May 10 14:46 nops
drwxr-xr-x  5 root root 4096 May 10 14:46 payloads
drwxr-xr-x 12 root root 4096 May 10 14:46 post
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading" id="başlarken-kullanıcı-modüllerini-yükleme">Başlarken kullanıcı modüllerini yükleme 
<!-- /wp:heading -->

  Yukarıda belirttiğimiz gibi kullanıcı modülleri&nbsp;<code>~/.msf4/modules/</code>&nbsp;klasöründeydi. Bu klasörü&nbsp;<code>msfconsole</code>&nbsp;komutuna söylediğimizde, ilave modüllerde yüklenir ve sistem öyle başlar. Bunu aşağıdaki komutta görüldüğü gibi&nbsp;<code>-m</code>&nbsp;parametresi ile yapabiliriz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">umut@umut-X550JX ~ $ msfconsole -m ~/.msf4/modules/
Found a database at /home/umut/.msf4/db, checking to see ***if *** it is started
Starting database at /home/umut/.msf4/db...success
%%%%%%%%%%%%%%%%%%%%%%%%%%% Hacked: All the things %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                        Press SPACE BAR to ***continue*** 



       ***=[***  metasploit v4.14.17-dev-                        ***]*** 
+ -- --***=[***  1648 exploits - 946 auxiliary - 291 post        ***]*** 
+ -- --***=[***  486 payloads - 40 encoders - 9 nops             ***]*** 
+ -- --***=[***  Free Metasploit Pro trial: <a href="http://r-7.co/trymsp">http://r-7.co/trymsp</a> ***]*** 

msf ***&gt;***  
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading" id="başladıktan-sonra-modül-tanıtma">Başladıktan sonra modül tanıtma 
<!-- /wp:heading -->

  MSF programını&nbsp;<code>msfconsole</code>&nbsp;komutuyla başlattınız ve bir takım işlemleriniz devam ediyor. Sisteme yeni bir modül tanıtmak için, programı kapatmanıza gerek yok.&nbsp;<code>loadpath</code>&nbsp;komutuyla modülün olduğu yolu tarif ettiğinizde, yükleme gerçekleşecektir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  loadpath /home/umut/.msf4/modules
Loaded 0 modules:
msf ***&gt;***  </code></pre>
<!-- /wp:code -->

  Video Anlatım 
 

<!-- wp:embed {"url":"https://youtu.be/5B8EftRWxGY","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://youtu.be/5B8EftRWxGY
</div></figure>
<!-- /wp:embed -->