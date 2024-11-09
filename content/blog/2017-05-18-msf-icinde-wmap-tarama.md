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
date: "2017-05-18T13:06:00Z"
excerpt: WMAP, kullanıcılara geniş imkanlar sağlayan bir web uygulama zafiyet tarama
  aracıdır. Orijinal olarak sqlmap programından türemiştir. Bu yazıda, Metasploit
  içerisine entegre edilen WMAP kullanımını göreceğiz.
guid: https://www.siberoloji.com/?p=1167
id: 1167
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde WMAP Tarama
url: /tr/msf-icinde-wmap-tarama/
---

  WMAP, kullanıcılara geniş imkanlar sağlayan bir web uygulama zafiyet tarama aracıdır. Orijinal olarak&nbsp;***sqlmap*** &nbsp;programından türemiştir. Bu yazıda, Metasploit içerisine entegre edilen WMAP kullanımını göreceğiz.
 

 
<h2 class="wp-block-heading" id="wmap-yükleme">wmap Yükleme
<!-- /wp:heading -->

  Öncelikle&nbsp;<code>workspace -a wmap</code>&nbsp;komutuyla yeni bir veri tabanı oluşturalım. Ardından&nbsp;<code>load wmap</code>&nbsp;komutuyla eklentiyi yükleyelim.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  workspace -a wmap
***[*** ******* ***]***  Added workspace: wmap
msf ***&gt;***  workspace 
  default
  metas3
*******  wmap
msf ***&gt;***  load wmap

.-.-.-..-.-.-..---..---.
| | | ***||***  | | ***||***  | ***||***  |-'
`-----'`-'-'-'`-^-'`-'
[WMAP 1.5.1] ===  et [  ] <a href="http://metasploit.com/">metasploit.com</a> 2012
[*] Successfully loaded plugin: wmap
</code></pre>
<!-- /wp:code -->

  <code>help</code>&nbsp;komutuyla, wmap eklentisinin sağladığı komutları görüntüleyelim.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***   help

wmap Commands
***=============*** 

    Command       Description
    -------       -----------
    wmap_modules  Manage wmap modules
    wmap_nodes    Manage nodes
    wmap_run      Test targets
    wmap_sites    Manage sites
    wmap_targets  Manage targets
    wmap_vulns    Display web vulns

...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="wmap_sites-ayarlama">wmap_sites Ayarlama
<!-- /wp:heading -->

  Web uygulama taramasına başlamadan önce, hedef URL adresini&nbsp;<code>-a</code>&nbsp;parametresiyle&nbsp;<code>wmap_sites</code>&nbsp;tablosuna eklememiz gerekiyor. Ardından&nbsp;<code>wmap_sites -l</code>&nbsp;komutunu verirseniz, kayıtlı URL adreslerini görebilirsiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  wmap_sites -h
***[*** ******* ***]***   Usage: wmap_targets ***[*** options]
	-h        Display this help text
	-a ***[*** url]  Add site ***(*** vhost,url***)*** 
	-l        List all available sites
	-s ***[*** id***]***    Display site structure ***(*** vhost,url|ids***)***  ***(*** level***)*** 

	
msf ***&gt;***  wmap_sites -a <a href="http://172.16.194.172/">http://172.16.194.172</a>
***[*** ******* ***]***  Site created.
msf ***&gt;***  wmap_sites -l
***[*** ******* ***]***  Available sites
***===============*** 

     Id  Host            Vhost           Port  Proto  <em># Pages  # Forms</em>
     --  ----            -----           ----  -----  -------  -------
     0   172.16.194.172  172.16.194.172  80    http   0        0
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="wmap_targets-ayarlama">wmap_targets Ayarlama
<!-- /wp:heading -->

  <code>wmap_sites</code>&nbsp;tabloları, kayıt tutan bir tablodur. İleride kullanabileceğiniz adresleri listeler. Taramanın gerçekleştirileceği adresi&nbsp;<code>wmap_targets</code>&nbsp;tablosuna&nbsp;<code>-t</code>&nbsp;parametresiyle ayarlamamız gerekiyor.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  wmap_targets -h
***[*** ******* ***]***  Usage: wmap_targets ***[*** options]
	-h 		Display this help text
	-t ***[*** urls]	Define target sites ***(*** vhost1,url[space]vhost2,url***)***  
	-d ***[*** ids]	Define target sites ***(*** id1, id2, id3 ...***)*** 
	-c 		Clean target sites list
	-l  		List all target sites


msf ***&gt;***  wmap_targets -t <a href="http://172.16.194.172/mutillidae/index.php">http://172.16.194.172/mutillidae/index.php</a>
</code></pre>
<!-- /wp:code -->

  Modüllerde, yaptığımız değişken ayarlarını nasıl&nbsp;<code>show options</code>&nbsp;ile kontrol ediyorsak, aynen bu şekilde&nbsp;<code>wmap_targets -l</code>&nbsp;komutu ile taranacak hedeflerin listesini kontrol edebiliriz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  wmap_targets -l
***[*** ******* ***]***  Defined targets
***===============*** 

     Id  Vhost           Host            Port  SSL    Path
     --  -----           ----            ----  ---    ----
     0   172.16.194.172  172.16.194.172  80    false	/mutillidae/index.php
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="wmap_run-çalıştırma">wmap_run Çalıştırma
<!-- /wp:heading -->

  <code>wmap_run -e</code>&nbsp;komutu, eklentiyi çalıştıracak ve taramayı başlatacaktır. Yardım için&nbsp;<code>-h</code>&nbsp;parametresini kullanabilirsiniz.&nbsp;<code>wmap_run -e</code>&nbsp;komutunun hangi modülleri kullanacağını görmek için&nbsp;<code>-t</code>&nbsp;parametresi kullanılabilir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  wmap_run -h
***[*** ******* ***]***  Usage: wmap_run ***[*** options]
	-h                        Display this help text
	-t                        Show all enabled modules
	-m ***[*** regex]                Launch only modules that name match provided regex.
	-p ***[*** regex]                Only test path defined by regex.
	-e ***[*** /path/to/profile]     Launch profile modules against all matched targets.
	                          ***(*** No profile file runs all enabled modules.***)*** 

msf ***&gt;***  wmap_run -t

***[*** ******* ***]***  Testing target:
***[*** ******* ***]***  	Site: 192.168.1.100 ***(*** 192.168.1.100***)*** 
***[*** ******* ***]***  	Port: 80 SSL: false
***[*** ******* ***]***  ***============================================================*** 
***[*** ******* ***]***  Testing started. 2012-01-16 15:46:42 -0500
***[*** ******* ***]***  
***=[***  SSL testing ***]=*** 
***[*** ******* ***]***  ***============================================================*** 
***[*** ******* ***]***  Target is not SSL. SSL modules disabled.
***[*** ******* ***]***  
***=[***  Web Server testing ***]=*** 
***[*** ******* ***]***  ***============================================================*** 
***[*** ******* ***]***  Loaded auxiliary/admin/http/contentkeeper_fileaccess ...
***[*** ******* ***]***  Loaded auxiliary/admin/http/tomcat_administration ...
***[*** ******* ***]***  Loaded auxiliary/admin/http/tomcat_utf8_traversal ...
***[*** ******* ***]***  Loaded auxiliary/admin/http/trendmicro_dlp_traversal ...
..snip...

msf ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Taramayı başlatmak için&nbsp;<code>wmap_run -e</code>&nbsp;komutunu kullandığınızda tarama başlayacaktır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  wmap_run -e
***[*** ******* ***]***  Using ALL wmap enabled modules.
***[*** -] NO WMAP NODES DEFINED. Executing local modules
***[*** ******* ***]***  Testing target:
***[*** ******* ***]***  	Site: 172.16.194.172 ***(*** 172.16.194.172***)*** 
***[*** ******* ***]***  	Port: 80 SSL: false
***============================================================*** 
***[*** ******* ***]***  Testing started. 2012-06-27 09:29:13 -0400
***[*** ******* ***]***  
***=[***  SSL testing ***]=*** 
***============================================================*** 
***[*** ******* ***]***  Target is not SSL. SSL modules disabled.
***[*** ******* ***]***  
***=[***  Web Server testing ***]=*** 
***============================================================*** 
***[*** ******* ***]***  Module auxiliary/scanner/http/http_version

***[*** ******* ***]***  172.16.194.172:80 Apache/2.2.8 ***(*** Ubuntu***)***  DAV/2 ***(***  Powered by PHP/5.2.4-2ubuntu5.10 ***)*** 
***[*** ******* ***]***  Module auxiliary/scanner/http/open_proxy
***[*** ******* ***]***  Module auxiliary/scanner/http/robots_txt


..snip...
..snip...
..snip...


***[*** ******* ***]***  Module auxiliary/scanner/http/soap_xml
***[*** ******* ***]***  Path: /
***[*** ******* ***]***  Server 172.16.194.172:80 returned HTTP 404 ***for***  /.  Use a different one.
***[*** ******* ***]***  Module auxiliary/scanner/http/trace_axd
***[*** ******* ***]***  Path: /
***[*** ******* ***]***  Module auxiliary/scanner/http/verb_auth_bypass
***[*** ******* ***]***  
***=[***  Unique Query testing ***]=*** 
***============================================================*** 
***[*** ******* ***]***  Module auxiliary/scanner/http/blind_sql_query
***[*** ******* ***]***  Module auxiliary/scanner/http/error_sql_injection
***[*** ******* ***]***  Module auxiliary/scanner/http/http_traversal
***[*** ******* ***]***  Module auxiliary/scanner/http/rails_mass_assignment
***[*** ******* ***]***  Module exploit/multi/http/lcms_php_exec
***[*** ******* ***]***  
***=[***  Query testing ***]=*** 
***============================================================*** 
***[*** ******* ***]***  
***=[***  General testing ***]=*** 
***============================================================*** 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Launch completed ***in *** 212.01512002944946 seconds.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
***[*** ******* ***]***  Done.
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="sonuçları-görüntüleme">Sonuçları Görüntüleme
<!-- /wp:heading -->

  Tarama tamamlandığında, bulunan zafiyetleri görmek için&nbsp;<code>wmap_vulns -l</code>&nbsp;komutunu verebilirsiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  wmap_vulns -l
***[*** ******* ***]***  + ***[*** 172.16.194.172] ***(*** 172.16.194.172***)*** : scraper /
***[*** ******* ***]***  	scraper Scraper
***[*** ******* ***]***  	GET Metasploitable2 - Linux
***[*** ******* ***]***  + ***[*** 172.16.194.172] ***(*** 172.16.194.172***)*** : directory /dav/
***[*** ******* ***]***  	directory Directory found.
***[*** ******* ***]***  	GET Res code: 200
***[*** ******* ***]***  + ***[*** 172.16.194.172] ***(*** 172.16.194.172***)*** : directory /cgi-bin/
***[*** ******* ***]***  	directory Directoy found.
***[*** ******* ***]***  	GET Res code: 403

...snip...

msf ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  <code>vulns</code>&nbsp;komutu, bulunan zafiyetlerin detaylarını gösterecektir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  vulns
***[*** ******* ***]***  Time: 2012-01-16 20:58:49 UTC Vuln: host***=*** 172.16.2.207 port***=*** 80 proto***=*** tcp name***=*** auxiliary/scanner/http/options refs***=*** CVE-2005-3398,CVE-2005-3498,OSVDB-877,BID-11604,BID-9506,BID-9561

msf ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Örnek çıktıda görüldüğü gibi&nbsp;<code>refs=CVE-2005-3398,CVE-2005-3498,OSVDB-877,BID-11604,BID-9506,BID-9561</code>&nbsp;bölümünde bulunan zafiyetin referans ismi rapor edilmektedir. Bu noktadan sonra detaylı bilgi toplama ve bu zafiyet hakkında araştırma yapmamız gerekmektedir.
 