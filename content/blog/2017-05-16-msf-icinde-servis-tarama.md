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
date: "2017-05-16T12:54:00Z"
excerpt: Metasploit Framework içerisinde, belirli Portlarda çalışan servisleri bulmak
  ve bunların versiyon numaralarını tespit etmek için bir takım modüller bulunur.nmapile
  yapılan servis taraması gibi bir takım bilgi toplama faaliyetlerinde bunları kullanabilirsiniz.
guid: https://www.siberoloji.com/?p=1155
id: 1155
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde Servis Tarama
url: /tr/msf-icinde-servis-tarama/
---

  Metasploit Framework içerisinde, belirli Portlarda çalışan servisleri bulmak ve bunların versiyon numaralarını tespit etmek için bir takım modüller bulunur.&nbsp;<code>nmap</code>&nbsp;ile yapılan servis taraması gibi bir takım bilgi toplama faaliyetlerinde bunları kullanabilirsiniz. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="ssh-servisi">SSH Servisi 
<!-- /wp:heading -->

  Aşağıdaki örnekte, önceden bir tarama yaptığımız ve iki farklı IP adresinde&nbsp;<code>ssh</code>&nbsp;servisinin çalıştığı bulunmuştur. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  services -p 22 -c name,port,proto

Services
***========*** 

host            name  port  proto
----            ----  ----  -----
172.16.194.163  ssh   22    tcp
172.16.194.172  ssh   22    tcp
</code></pre>
<!-- /wp:code -->

  Şimdi bu servislerin hangi sürüm SSH çalıştırdıklarını keşfedelim. Bunun için&nbsp;<code>auxiliary/scanner/ssh/ssh_version</code>&nbsp;isimli modülü kullanacağız. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use auxiliary/scanner/ssh/ssh_version

msf  auxiliary***(*** ssh_version***)***  ***&gt;***  set RHOSTS 172.16.194.163 172.16.194.172
RHOSTS ***=&gt;***  172.16.194.163 172.16.194.172

msf  auxiliary***(*** ssh_version***)***  ***&gt;***  show options

Module options ***(*** auxiliary/scanner/ssh/ssh_version***)*** :

   Name     Current Setting                Required  Description
   ----     ---------------                --------  -----------
   RHOSTS   172.16.194.163 172.16.194.172  yes       The target address range or CIDR identifier
   RPORT    22                             yes       The target port
   THREADS  1                              yes       The number of concurrent threads
   TIMEOUT  30                             yes       Timeout ***for *** the SSH probe


msf  auxiliary***(*** ssh_version***)***  ***&gt;***  run

***[*** ******* ***]***  172.16.194.163:22, SSH server version: SSH-2.0-OpenSSH_5.3p1 Debian-3ubuntu7
***[*** ******* ***]***  Scanned 1 of 2 hosts ***(*** 050% complete***)*** 
***[*** ******* ***]***  172.16.194.172:22, SSH server version: SSH-2.0-OpenSSH_4.7p1 Debian-8ubuntu1
***[*** ******* ***]***  Scanned 2 of 2 hosts ***(*** 100% complete***)*** 
***[*** ******* ***]***  Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Sonuç çıktısında görebileceğiniz gibi SSH sürüm numaraları tespit edilmiştir. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="ftp-servisi">FTP Servisi 
<!-- /wp:heading -->

  Yanlış yapılandırılmış FTP servislerinin zayıf yanları kullanılarak sisteme erişim sağlanabilir. Herhangi bir IP adresinde 21 numaralı Portun açık olduğunu görürseniz, orada çalışan FTP servisinin&nbsp;***Anonymous*** &nbsp;girişe izin verip vermediğini kontrol etmeniz faydalı olacaktır. Aşağıdaki örnekte,&nbsp;<code>ftp_version</code>&nbsp;modülü kullanılmaktadır. Tek bir IP adresi taranacağından,&nbsp;<code>THREADS</code>&nbsp;değişkeni 1 olarak ayarlanmıştır. 
 

  Öncelikle,&nbsp;<code>services</code>&nbsp;tablomuzdaki ilgilerden 21 Numaralı portun açık olduğu IP adreslerini listeleyelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  services -p 21 -c name,proto

Services
***========*** 

host            name  proto
----            ----  -----
172.16.194.172  ftp   tcp
</code></pre>
<!-- /wp:code -->

  Ardından,&nbsp;<code>auxiliary/scanner/ftp/ftp_version</code>&nbsp;modülünü kullanalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use auxiliary/scanner/ftp/ftp_version 

msf  auxiliary***(*** ftp_version***)***  ***&gt;***  set RHOSTS 172.16.194.172
RHOSTS ***=&gt;***  172.16.194.172

msf  auxiliary***(*** anonymous***)***  ***&gt;***  show options
Module options ***(*** auxiliary/scanner/ftp/anonymous***)*** :

   Name     Current Setting      Required  Description
   ----     ---------------      --------  -----------
   FTPPASS  mozilla@example.com  no        The password ***for *** the specified username
   FTPUSER  anonymous            no        The username to authenticate as
   RHOSTS   172.16.194.172       yes       The target address range or CIDR identifier
   RPORT    21                   yes       The target port
   THREADS  1                    yes       The number of concurrent threads

msf  auxiliary***(*** anonymous***)***  ***&gt;***  run

***[*** ******* ***]***  172.16.194.172:21 Anonymous READ ***(*** 220 ***(*** vsFTPd 2.3.4***))*** 
***[*** ******* ***]***  Scanned 1 of 1 hosts ***(*** 100% complete***)*** 
***[*** ******* ***]***  Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Görüldüğü gibi, çok kısa zamanda SSH ve FTP servisleri hakkında bilgiler topladık. Metasploit Framework içerisinde bunlara benzer oldukça fazla keşif modülü bulunmaktadır. Vakit ayırıp listeyi incelemenizde fayda var. Yaklaşık sayıyı aşağıdaki çıktıda görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use auxiliary/scanner/
Display all 485 possibilities? ***(*** y or n***)*** </code></pre>
<!-- /wp:code -->