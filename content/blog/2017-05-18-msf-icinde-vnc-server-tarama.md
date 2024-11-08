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
date: "2017-05-18T13:04:00Z"
excerpt: Bazen sistem yöneticileri, kurdukları servislerin güvenlik ayarlarını yapmayı
  eksik bırakırlar. Klasik yapılan hatalardan bir tanesi de ağda çalışan servislerin guest olarak
  tabir edilen kullanıcılara kapatılmamasıdır. VNC Server, bir bilgisayara uzaktan
  bağlanılmasını sağlayan servistir.
guid: https://www.siberoloji.com/?p=1165
id: 1165
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF İçinde VNC Server Tarama
url: /tr/msf-icinde-vnc-server-tarama/
---

  Bazen sistem yöneticileri, kurdukları servislerin güvenlik ayarlarını yapmayı eksik bırakırlar. Klasik yapılan hatalardan bir tanesi de ağda çalışan servislerin&nbsp;<code>guest</code>&nbsp;olarak tabir edilen kullanıcılara kapatılmamasıdır. VNC Server, bir bilgisayara uzaktan bağlanılmasını sağlayan servistir. 
 

  Aşağıdaki örnekte, belli bir IP aralığında çalışan ve parolasız erişime izin verilen VNC Server olup olmadığını arayan modül kullanılmıştır. Bu modüle Metasploit Framework içinde&nbsp;<strong>VNC Authentication None Scanner</strong>&nbsp;adı verilmektedir. 
 

  Sistem yöneticisi iseniz, servislerinizi yapılandırırken, bu tür açıkları sürekli arayan birileri olduğunu aklınızdan çıkartmamalısınız. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf auxiliary<strong>(</strong>vnc_none_auth<strong>)</strong> <strong>&gt;</strong> use auxiliary/scanner/vnc/vnc_none_auth
msf auxiliary<strong>(</strong>vnc_none_auth<strong>)</strong> <strong>&gt;</strong> show options

Module options:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOSTS                    yes       The target address range or CIDR identifier
   RPORT    5900             yes       The target port
   THREADS  1                yes       The number of concurrent threads

msf auxiliary<strong>(</strong>vnc_none_auth<strong>)</strong> <strong>&gt;</strong> set RHOSTS 192.168.1.0/24
RHOSTS <strong>=&gt;</strong> 192.168.1.0/24
msf auxiliary<strong>(</strong>vnc_none_auth<strong>)</strong> <strong>&gt;</strong> set THREADS 50
THREADS <strong>=&gt;</strong> 50
msf auxiliary<strong>(</strong>vnc_none_auth<strong>)</strong> <strong>&gt;</strong> run

<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.121:5900, VNC server protocol version : RFB 003.008
<strong>[</strong><strong>*</strong><strong>]</strong> 192.168.1.121:5900, VNC server security types supported : None, free access!
<strong>[</strong><strong>*</strong><strong>]</strong> Auxiliary module execution completed
</code></pre>
<!-- /wp:code -->

  Çıktıda görüldüğü gibi,&nbsp;<code>192.168.1.121:5900</code>&nbsp;adresinde VNC Server, parolasız olarak bağlanmaya izin vermektedir. 
 