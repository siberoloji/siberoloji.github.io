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
date: "2017-06-05T13:40:00Z"
excerpt: Hedef bilgisayarda meterpreter shell açtıktan sonra yapılacak işlemlerden
  birisi de bilgisayar bulunan dosyaları araştırmaktır. Firmalar, kullanıcılarını
  bilgilerinin güvenliğini sağlamaları konusunda eğitirler. Bu eğitim konularından
  birisi de hassas bilgileri paylaşımlı sunucularda değil de yerel bilgisayarlarda
  tutmaktır. İçerik araştırması da genelde bu tarz hassas bilgilerin olduğu dosya
  ve klasörleri keşfetmek için yapılır.
guid: https://www.siberoloji.com/?p=1199
id: 1199
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçerik Araştırması
url: /tr/msf-icerik-arastirmasi/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="i̇çerik-araştırması">İçerik Araştırması 
<!-- /wp:heading -->

  Hedef bilgisayarda meterpreter shell açtıktan sonra yapılacak işlemlerden birisi de bilgisayar bulunan dosyaları araştırmaktır. Firmalar, kullanıcılarını bilgilerinin güvenliğini sağlamaları konusunda eğitirler. Bu eğitim konularından birisi de hassas bilgileri paylaşımlı sunucularda değil de yerel bilgisayarlarda tutmaktır. İçerik araştırması da genelde bu tarz hassas bilgilerin olduğu dosya ve klasörleri keşfetmek için yapılır.
 

  Meterpreter oturumunun sunduğu&nbsp;<code>search</code>&nbsp;komutu ile ilgili birkaç örnek inceleyelim.
 

  <code>search -h</code>&nbsp;komutuyla search hakkında yardım bilgilerini görüntüleyebilirsiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  search -h
Usage: search ***[*** -d dir***]***  ***[*** -r recurse] -f pattern
Search ***for *** files.

OPTIONS:

    -d   The directory/drive to begin searching from. Leave empty to search all drives. ***(*** Default: ***)*** 
    -f   The file pattern glob to search ***for*** . ***(*** e.g. ******* secret******* .doc?***)*** 
    -h   Help Banner.
    -r   Recursivly search sub directories. ***(*** Default: true***)*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="açıklamalar">Açıklamalar
<!-- /wp:heading -->

  <code>-d</code>: Arama yapılacak klasörü belirtir. Boş bırakılırsa tüm klasörler aranır.
 

  <code>-f</code>: Belli bir dosya paterni belirtmek için kullanılır.
 

  <code>-h</code>: Yardımı görüntüler.
 

  <code>-r</code>: Arama, belirtilen klasör ve tüm alt klasörlerinde gerçekleştirilir. Varsayılan olarak zaten aktif durumdadır.
 

  Aşağıdaki örnek komut, tüm disk bölümlerinde, klasör ve alt klasörlerde&nbsp;<code>.jpg</code>&nbsp;uzantılı dosyaları arayacaktır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  search -f ******* .jpg
Found 418 results...
...snip...
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Blue hills.jpg ***(*** 28521 bytes***)*** 
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Sunset.jpg ***(*** 71189 bytes***)*** 
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Water lilies.jpg ***(*** 83794 bytes***)*** 
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Winter.jpg ***(*** 105542 bytes***)*** 
...snip...
</code></pre>
<!-- /wp:code -->

  <code>search</code>&nbsp;komutunda varsayılan olarak tüm klasörler aranmaktadır ancak bu işlem çok zaman alır. Ayrıca, hedef bilgisayar kullanıcısı bilgisayarının yavaşladığını fark edebilir. Bu nedenle,&nbsp;<code>-d</code>&nbsp;seçeneğini kullanarak arama yapılacak klasörü belirtmek hem zaman kazandırır hem de sistemin işlem yükünü hafifletir. Aşağıda buna bir örnek kullanımı görebilirsiniz. Komutu girerken klasör ayırıcı işaretini&nbsp;<code>\\</code>&nbsp;şeklinde girdiğimize dikkat edin.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  search -d c:\\documents\ and\ settings\\administrator\\desktop\\ -f ******* .pdf
Found 2 results...
    c:\documents and settings\administrator\desktop\operations_plan.pdf ***(*** 244066 bytes***)*** 
    c:\documents and settings\administrator\desktop\budget.pdf ***(*** 244066 bytes***)*** 
meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->