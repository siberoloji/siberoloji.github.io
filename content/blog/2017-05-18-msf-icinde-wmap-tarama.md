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

  WMAP, kullanıcılara geniş imkanlar sağlayan bir web uygulama zafiyet tarama aracıdır. Orijinal olarak&nbsp;<strong>sqlmap</strong>&nbsp;programından türemiştir. Bu yazıda, Metasploit içerisine entegre edilen WMAP kullanımını göreceğiz.</p>
 

 
<h2 class="wp-block-heading" id="wmap-yükleme">wmap Yükleme</h2>
<!-- /wp:heading -->

  Öncelikle&nbsp;<code>workspace -a wmap</code>&nbsp;komutuyla yeni bir veri tabanı oluşturalım. Ardından&nbsp;<code>load wmap</code>&nbsp;komutuyla eklentiyi yükleyelim.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> workspace -a wmap
<strong>[</strong><strong>*</strong><strong>]</strong> Added workspace: wmap
msf <strong>&gt;</strong> workspace 
  default
  metas3
<strong>*</strong> wmap
msf <strong>&gt;</strong> load wmap

.-.-.-..-.-.-..---..---.
| | | <strong>||</strong> | | <strong>||</strong> | <strong>||</strong> |-'
`-----'`-'-'-'`-^-'`-'
[WMAP 1.5.1] ===  et [  ] <a href="http://metasploit.com/">metasploit.com</a> 2012
[*] Successfully loaded plugin: wmap
</code></pre>
<!-- /wp:code -->

  <code>help</code>&nbsp;komutuyla, wmap eklentisinin sağladığı komutları görüntüleyelim.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong>  help

wmap Commands
<strong>=============</strong>

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

 
<h2 class="wp-block-heading" id="wmap_sites-ayarlama">wmap_sites Ayarlama</h2>
<!-- /wp:heading -->

  Web uygulama taramasına başlamadan önce, hedef URL adresini&nbsp;<code>-a</code>&nbsp;parametresiyle&nbsp;<code>wmap_sites</code>&nbsp;tablosuna eklememiz gerekiyor. Ardından&nbsp;<code>wmap_sites -l</code>&nbsp;komutunu verirseniz, kayıtlı URL adreslerini görebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> wmap_sites -h
<strong>[</strong><strong>*</strong><strong>]</strong>  Usage: wmap_targets <strong>[</strong>options]
	-h        Display this help text
	-a <strong>[</strong>url]  Add site <strong>(</strong>vhost,url<strong>)</strong>
	-l        List all available sites
	-s <strong>[</strong>id<strong>]</strong>   Display site structure <strong>(</strong>vhost,url|ids<strong>)</strong> <strong>(</strong>level<strong>)</strong>

	
msf <strong>&gt;</strong> wmap_sites -a <a href="http://172.16.194.172/">http://172.16.194.172</a>
<strong>[</strong><strong>*</strong><strong>]</strong> Site created.
msf <strong>&gt;</strong> wmap_sites -l
<strong>[</strong><strong>*</strong><strong>]</strong> Available sites
<strong>===============</strong>

     Id  Host            Vhost           Port  Proto  <em># Pages  # Forms</em>
     --  ----            -----           ----  -----  -------  -------
     0   172.16.194.172  172.16.194.172  80    http   0        0
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="wmap_targets-ayarlama">wmap_targets Ayarlama</h2>
<!-- /wp:heading -->

  <code>wmap_sites</code>&nbsp;tabloları, kayıt tutan bir tablodur. İleride kullanabileceğiniz adresleri listeler. Taramanın gerçekleştirileceği adresi&nbsp;<code>wmap_targets</code>&nbsp;tablosuna&nbsp;<code>-t</code>&nbsp;parametresiyle ayarlamamız gerekiyor.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> wmap_targets -h
<strong>[</strong><strong>*</strong><strong>]</strong> Usage: wmap_targets <strong>[</strong>options]
	-h 		Display this help text
	-t <strong>[</strong>urls]	Define target sites <strong>(</strong>vhost1,url[space]vhost2,url<strong>)</strong> 
	-d <strong>[</strong>ids]	Define target sites <strong>(</strong>id1, id2, id3 ...<strong>)</strong>
	-c 		Clean target sites list
	-l  		List all target sites


msf <strong>&gt;</strong> wmap_targets -t <a href="http://172.16.194.172/mutillidae/index.php">http://172.16.194.172/mutillidae/index.php</a>
</code></pre>
<!-- /wp:code -->

  Modüllerde, yaptığımız değişken ayarlarını nasıl&nbsp;<code>show options</code>&nbsp;ile kontrol ediyorsak, aynen bu şekilde&nbsp;<code>wmap_targets -l</code>&nbsp;komutu ile taranacak hedeflerin listesini kontrol edebiliriz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> wmap_targets -l
<strong>[</strong><strong>*</strong><strong>]</strong> Defined targets
<strong>===============</strong>

     Id  Vhost           Host            Port  SSL    Path
     --  -----           ----            ----  ---    ----
     0   172.16.194.172  172.16.194.172  80    false	/mutillidae/index.php
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="wmap_run-çalıştırma">wmap_run Çalıştırma</h2>
<!-- /wp:heading -->

  <code>wmap_run -e</code>&nbsp;komutu, eklentiyi çalıştıracak ve taramayı başlatacaktır. Yardım için&nbsp;<code>-h</code>&nbsp;parametresini kullanabilirsiniz.&nbsp;<code>wmap_run -e</code>&nbsp;komutunun hangi modülleri kullanacağını görmek için&nbsp;<code>-t</code>&nbsp;parametresi kullanılabilir.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> wmap_run -h
<strong>[</strong><strong>*</strong><strong>]</strong> Usage: wmap_run <strong>[</strong>options]
	-h                        Display this help text
	-t                        Show all enabled modules
	-m <strong>[</strong>regex]                Launch only modules that name match provided regex.
	-p <strong>[</strong>regex]                Only test path defined by regex.
	-e <strong>[</strong>/path/to/profile]     Launch profile modules against all matched targets.
	                          <strong>(</strong>No profile file runs all enabled modules.<strong>)</strong>

msf <strong>&gt;</strong> wmap_run -t

<strong>[</strong><strong>*</strong><strong>]</strong> Testing target:
<strong>[</strong><strong>*</strong><strong>]</strong> 	Site: 192.168.1.100 <strong>(</strong>192.168.1.100<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> 	Port: 80 SSL: false
<strong>[</strong><strong>*</strong><strong>]</strong> <strong>============================================================</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Testing started. 2012-01-16 15:46:42 -0500
<strong>[</strong><strong>*</strong><strong>]</strong> 
<strong>=[</strong> SSL testing <strong>]=</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> <strong>============================================================</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Target is not SSL. SSL modules disabled.
<strong>[</strong><strong>*</strong><strong>]</strong> 
<strong>=[</strong> Web Server testing <strong>]=</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> <strong>============================================================</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Loaded auxiliary/admin/http/contentkeeper_fileaccess ...
<strong>[</strong><strong>*</strong><strong>]</strong> Loaded auxiliary/admin/http/tomcat_administration ...
<strong>[</strong><strong>*</strong><strong>]</strong> Loaded auxiliary/admin/http/tomcat_utf8_traversal ...
<strong>[</strong><strong>*</strong><strong>]</strong> Loaded auxiliary/admin/http/trendmicro_dlp_traversal ...
..snip...

msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Taramayı başlatmak için&nbsp;<code>wmap_run -e</code>&nbsp;komutunu kullandığınızda tarama başlayacaktır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> wmap_run -e
<strong>[</strong><strong>*</strong><strong>]</strong> Using ALL wmap enabled modules.
<strong>[</strong>-] NO WMAP NODES DEFINED. Executing local modules
<strong>[</strong><strong>*</strong><strong>]</strong> Testing target:
<strong>[</strong><strong>*</strong><strong>]</strong> 	Site: 172.16.194.172 <strong>(</strong>172.16.194.172<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> 	Port: 80 SSL: false
<strong>============================================================</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Testing started. 2012-06-27 09:29:13 -0400
<strong>[</strong><strong>*</strong><strong>]</strong> 
<strong>=[</strong> SSL testing <strong>]=</strong>
<strong>============================================================</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Target is not SSL. SSL modules disabled.
<strong>[</strong><strong>*</strong><strong>]</strong> 
<strong>=[</strong> Web Server testing <strong>]=</strong>
<strong>============================================================</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Module auxiliary/scanner/http/http_version

<strong>[</strong><strong>*</strong><strong>]</strong> 172.16.194.172:80 Apache/2.2.8 <strong>(</strong>Ubuntu<strong>)</strong> DAV/2 <strong>(</strong> Powered by PHP/5.2.4-2ubuntu5.10 <strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Module auxiliary/scanner/http/open_proxy
<strong>[</strong><strong>*</strong><strong>]</strong> Module auxiliary/scanner/http/robots_txt


..snip...
..snip...
..snip...


<strong>[</strong><strong>*</strong><strong>]</strong> Module auxiliary/scanner/http/soap_xml
<strong>[</strong><strong>*</strong><strong>]</strong> Path: /
<strong>[</strong><strong>*</strong><strong>]</strong> Server 172.16.194.172:80 returned HTTP 404 <strong>for</strong> /.  Use a different one.
<strong>[</strong><strong>*</strong><strong>]</strong> Module auxiliary/scanner/http/trace_axd
<strong>[</strong><strong>*</strong><strong>]</strong> Path: /
<strong>[</strong><strong>*</strong><strong>]</strong> Module auxiliary/scanner/http/verb_auth_bypass
<strong>[</strong><strong>*</strong><strong>]</strong> 
<strong>=[</strong> Unique Query testing <strong>]=</strong>
<strong>============================================================</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Module auxiliary/scanner/http/blind_sql_query
<strong>[</strong><strong>*</strong><strong>]</strong> Module auxiliary/scanner/http/error_sql_injection
<strong>[</strong><strong>*</strong><strong>]</strong> Module auxiliary/scanner/http/http_traversal
<strong>[</strong><strong>*</strong><strong>]</strong> Module auxiliary/scanner/http/rails_mass_assignment
<strong>[</strong><strong>*</strong><strong>]</strong> Module exploit/multi/http/lcms_php_exec
<strong>[</strong><strong>*</strong><strong>]</strong> 
<strong>=[</strong> Query testing <strong>]=</strong>
<strong>============================================================</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> 
<strong>=[</strong> General testing <strong>]=</strong>
<strong>============================================================</strong>
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Launch completed <strong>in </strong>212.01512002944946 seconds.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
<strong>[</strong><strong>*</strong><strong>]</strong> Done.
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="sonuçları-görüntüleme">Sonuçları Görüntüleme</h2>
<!-- /wp:heading -->

  Tarama tamamlandığında, bulunan zafiyetleri görmek için&nbsp;<code>wmap_vulns -l</code>&nbsp;komutunu verebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> wmap_vulns -l
<strong>[</strong><strong>*</strong><strong>]</strong> + <strong>[</strong>172.16.194.172] <strong>(</strong>172.16.194.172<strong>)</strong>: scraper /
<strong>[</strong><strong>*</strong><strong>]</strong> 	scraper Scraper
<strong>[</strong><strong>*</strong><strong>]</strong> 	GET Metasploitable2 - Linux
<strong>[</strong><strong>*</strong><strong>]</strong> + <strong>[</strong>172.16.194.172] <strong>(</strong>172.16.194.172<strong>)</strong>: directory /dav/
<strong>[</strong><strong>*</strong><strong>]</strong> 	directory Directory found.
<strong>[</strong><strong>*</strong><strong>]</strong> 	GET Res code: 200
<strong>[</strong><strong>*</strong><strong>]</strong> + <strong>[</strong>172.16.194.172] <strong>(</strong>172.16.194.172<strong>)</strong>: directory /cgi-bin/
<strong>[</strong><strong>*</strong><strong>]</strong> 	directory Directoy found.
<strong>[</strong><strong>*</strong><strong>]</strong> 	GET Res code: 403

...snip...

msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  <code>vulns</code>&nbsp;komutu, bulunan zafiyetlerin detaylarını gösterecektir.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> vulns
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-01-16 20:58:49 UTC Vuln: host<strong>=</strong>172.16.2.207 port<strong>=</strong>80 proto<strong>=</strong>tcp name<strong>=</strong>auxiliary/scanner/http/options refs<strong>=</strong>CVE-2005-3398,CVE-2005-3498,OSVDB-877,BID-11604,BID-9506,BID-9561

msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Örnek çıktıda görüldüğü gibi&nbsp;<code>refs=CVE-2005-3398,CVE-2005-3498,OSVDB-877,BID-11604,BID-9506,BID-9561</code>&nbsp;bölümünde bulunan zafiyetin referans ismi rapor edilmektedir. Bu noktadan sonra detaylı bilgi toplama ve bu zafiyet hakkında araştırma yapmamız gerekmektedir.</p>
 