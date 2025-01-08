---
draft: false

title:  'MSF İçinde WMAP Tarama'
date: '2017-05-18T13:06:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "WMAP, kullanıcılara geniş imkanlar sağlayan bir web uygulama zafiyet tarama aracıdır. Orijinal olarak\_sqlmap\_programından türemiştir. Bu yazıda, Metasploit içerisine entegre edilen WMAP kullanımını göreceğiz." 
 
url:  /tr/msf-icinde-wmap-tarama/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


WMAP, kullanıcılara geniş imkanlar sağlayan bir web uygulama zafiyet tarama aracıdır. Orijinal olarak **sqlmap** programından türemiştir. Bu yazıda, Metasploit içerisine entegre edilen WMAP kullanımını göreceğiz.



## wmap Yükleme



Öncelikle `workspace -a wmap` komutuyla yeni bir veri tabanı oluşturalım. Ardından `load wmap` komutuyla eklentiyi yükleyelim.


```bash
msf **>** workspace -a wmap
**[*********]** Added workspace: wmap
msf **>** workspace 
  default
  metas3
***** wmap
msf **>** load wmap

.-.-.-..-.-.-..---..---.
| | | **||** | | **||** | **||** |-'
`-----'`-'-'-'`-^-'`-'
[WMAP 1.5.1] ===  et [  ] <a href="http://metasploit.com/">metasploit.com</a> 2012
[*] Successfully loaded plugin: wmap
```



`help` komutuyla, wmap eklentisinin sağladığı komutları görüntüleyelim.


```bash
msf **>**  help

wmap Commands
**=============**

    Command       Description
    -------       -----------
    wmap_modules  Manage wmap modules
    wmap_nodes    Manage nodes
    wmap_run      Test targets
    wmap_sites    Manage sites
    wmap_targets  Manage targets
    wmap_vulns    Display web vulns

...snip...
```



## wmap_sites Ayarlama



Web uygulama taramasına başlamadan önce, hedef URL adresini `-a` parametresiyle `wmap_sites` tablosuna eklememiz gerekiyor. Ardından `wmap_sites -l` komutunu verirseniz, kayıtlı URL adreslerini görebilirsiniz.


```bash
msf **>** wmap_sites -h
**[*********]**  Usage: wmap_targets **[**options]
	-h        Display this help text
	-a **[**url]  Add site **(**vhost,url**)**
	-l        List all available sites
	-s **[**id**]**   Display site structure **(**vhost,url|ids**)** **(**level**)**

	
msf **>** wmap_sites -a <a href="http://172.16.194.172/">http://172.16.194.172</a>
**[*********]** Site created.
msf **>** wmap_sites -l
**[*********]** Available sites
**===============**

     Id  Host            Vhost           Port  Proto  # Pages  # Forms
     --  ----            -----           ----  -----  -------  -------
     0   172.16.194.172  172.16.194.172  80    http   0        0
```



## wmap_targets Ayarlama



`wmap_sites` tabloları, kayıt tutan bir tablodur. İleride kullanabileceğiniz adresleri listeler. Taramanın gerçekleştirileceği adresi `wmap_targets` tablosuna `-t` parametresiyle ayarlamamız gerekiyor.


```bash
msf **>** wmap_targets -h
**[*********]** Usage: wmap_targets **[**options]
	-h 		Display this help text
	-t **[**urls]	Define target sites **(**vhost1,url[space]vhost2,url**)** 
	-d **[**ids]	Define target sites **(**id1, id2, id3 ...**)**
	-c 		Clean target sites list
	-l  		List all target sites


msf **>** wmap_targets -t <a href="http://172.16.194.172/mutillidae/index.php">http://172.16.194.172/mutillidae/index.php</a>
```



Modüllerde, yaptığımız değişken ayarlarını nasıl `show options` ile kontrol ediyorsak, aynen bu şekilde `wmap_targets -l` komutu ile taranacak hedeflerin listesini kontrol edebiliriz.


```bash
msf **>** wmap_targets -l
**[*********]** Defined targets
**===============**

     Id  Vhost           Host            Port  SSL    Path
     --  -----           ----            ----  ---    ----
     0   172.16.194.172  172.16.194.172  80    false	/mutillidae/index.php
```



## wmap_run Çalıştırma



`wmap_run -e` komutu, eklentiyi çalıştıracak ve taramayı başlatacaktır. Yardım için `-h` parametresini kullanabilirsiniz. `wmap_run -e` komutunun hangi modülleri kullanacağını görmek için `-t` parametresi kullanılabilir.


```bash
msf **>** wmap_run -h
**[*********]** Usage: wmap_run **[**options]
	-h                        Display this help text
	-t                        Show all enabled modules
	-m **[**regex]                Launch only modules that name match provided regex.
	-p **[**regex]                Only test path defined by regex.
	-e **[**/path/to/profile]     Launch profile modules against all matched targets.
	                          **(**No profile file runs all enabled modules.**)**

msf **>** wmap_run -t

**[*********]** Testing target:
**[*********]** 	Site: 192.168.1.100 **(**192.168.1.100**)**
**[*********]** 	Port: 80 SSL: false
**[*********]** **============================================================**
**[*********]** Testing started. 2012-01-16 15:46:42 -0500
**[*********]** 
**=[** SSL testing **]=**
**[*********]** **============================================================**
**[*********]** Target is not SSL. SSL modules disabled.
**[*********]** 
**=[** Web Server testing **]=**
**[*********]** **============================================================**
**[*********]** Loaded auxiliary/admin/http/contentkeeper_fileaccess ...
**[*********]** Loaded auxiliary/admin/http/tomcat_administration ...
**[*********]** Loaded auxiliary/admin/http/tomcat_utf8_traversal ...
**[*********]** Loaded auxiliary/admin/http/trendmicro_dlp_traversal ...
..snip...

msf **>**
```



Taramayı başlatmak için `wmap_run -e` komutunu kullandığınızda tarama başlayacaktır.


```bash
msf **>** wmap_run -e
**[*********]** Using ALL wmap enabled modules.
**[**-] NO WMAP NODES DEFINED. Executing local modules
**[*********]** Testing target:
**[*********]** 	Site: 172.16.194.172 **(**172.16.194.172**)**
**[*********]** 	Port: 80 SSL: false
**============================================================**
**[*********]** Testing started. 2012-06-27 09:29:13 -0400
**[*********]** 
**=[** SSL testing **]=**
**============================================================**
**[*********]** Target is not SSL. SSL modules disabled.
**[*********]** 
**=[** Web Server testing **]=**
**============================================================**
**[*********]** Module auxiliary/scanner/http/http_version

**[*********]** 172.16.194.172:80 Apache/2.2.8 **(**Ubuntu**)** DAV/2 **(** Powered by PHP/5.2.4-2ubuntu5.10 **)**
**[*********]** Module auxiliary/scanner/http/open_proxy
**[*********]** Module auxiliary/scanner/http/robots_txt


..snip...
..snip...
..snip...


**[*********]** Module auxiliary/scanner/http/soap_xml
**[*********]** Path: /
**[*********]** Server 172.16.194.172:80 returned HTTP 404 **for** /.  Use a different one.
**[*********]** Module auxiliary/scanner/http/trace_axd
**[*********]** Path: /
**[*********]** Module auxiliary/scanner/http/verb_auth_bypass
**[*********]** 
**=[** Unique Query testing **]=**
**============================================================**
**[*********]** Module auxiliary/scanner/http/blind_sql_query
**[*********]** Module auxiliary/scanner/http/error_sql_injection
**[*********]** Module auxiliary/scanner/http/http_traversal
**[*********]** Module auxiliary/scanner/http/rails_mass_assignment
**[*********]** Module exploit/multi/http/lcms_php_exec
**[*********]** 
**=[** Query testing **]=**
**============================================================**
**[*********]** 
**=[** General testing **]=**
**============================================================**
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Launch completed **in **212.01512002944946 seconds.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
**[*********]** Done.
```



## Sonuçları Görüntüleme



Tarama tamamlandığında, bulunan zafiyetleri görmek için `wmap_vulns -l` komutunu verebilirsiniz.


```bash
msf **>** wmap_vulns -l
**[*********]** + **[**172.16.194.172] **(**172.16.194.172**)**: scraper /
**[*********]** 	scraper Scraper
**[*********]** 	GET Metasploitable2 - Linux
**[*********]** + **[**172.16.194.172] **(**172.16.194.172**)**: directory /dav/
**[*********]** 	directory Directory found.
**[*********]** 	GET Res code: 200
**[*********]** + **[**172.16.194.172] **(**172.16.194.172**)**: directory /cgi-bin/
**[*********]** 	directory Directoy found.
**[*********]** 	GET Res code: 403

...snip...

msf **>**
```



`vulns` komutu, bulunan zafiyetlerin detaylarını gösterecektir.


```bash
msf **>** vulns
**[*********]** Time: 2012-01-16 20:58:49 UTC Vuln: host**=**172.16.2.207 port**=**80 proto**=**tcp name**=**auxiliary/scanner/http/options refs**=**CVE-2005-3398,CVE-2005-3498,OSVDB-877,BID-11604,BID-9506,BID-9561

msf **>**
```



Örnek çıktıda görüldüğü gibi `refs=CVE-2005-3398,CVE-2005-3498,OSVDB-877,BID-11604,BID-9506,BID-9561` bölümünde bulunan zafiyetin referans ismi rapor edilmektedir. Bu noktadan sonra detaylı bilgi toplama ve bu zafiyet hakkında araştırma yapmamız gerekmektedir.
