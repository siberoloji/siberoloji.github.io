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
date: "2017-06-14T13:50:00Z"
excerpt: Önceki script düzenleme yazımızda, meterpreter oturumunda kullanılan script
  dosyasının genel mimari yapısını açıklamaya çalışmıştık. Bu yazımızda, sürekli kullanılan
  ve işimize yarayacak API çağrı kodlarını tek tek görelim ve ne işe yaradığını açıklayalım.
guid: https://www.siberoloji.com/?p=1209
id: 1209
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Meterpreter Script API Çağrıları
url: /tr/msf-meterpreter-script-api-cagrilari/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="kullanışlı-api-çağrıları">Kullanışlı API Çağrıları 
<!-- /wp:heading -->

  Önceki script düzenleme yazımızda, meterpreter oturumunda kullanılan script dosyasının genel mimari yapısını açıklamaya çalışmıştık. Bu yazımızda, sürekli kullanılan ve işimize yarayacak API çağrı kodlarını tek tek görelim ve ne işe yaradığını açıklayalım. 
 

  Bu çağrıları kendi dosyanızı oluşturarak deneyebileceğiniz gibi Meterpreter oturumu içerisinden&nbsp;<code>irb</code>&nbsp;komutuyla Ruby girişimcisini kullanarak direk hedef sistemde de çalıştırabilirsiniz.&nbsp;<code>irb</code>&nbsp;girişimcisini, meterpreter oturumu açık durumdayken, aşağıdaki örnekte olduğu gibi başlatabilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> irb
<strong>[</strong><strong>*</strong><strong>]</strong> Starting IRB shell
<strong>[</strong><strong>*</strong><strong>]</strong> The 'client' variable holds the meterpreter client

<strong>&gt;&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="clientsysconfigsysinfo">client.sys.config.sysinfo</h2>
<!-- /wp:heading -->

  Bu komut, sistem hakkında bir takım bilgileri öğrenmemizi sağlar. Aşağıda,&nbsp;<code>client.sys.config.sysinfo</code>&nbsp;API çağrısının bir kaç örneğini görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><strong>&gt;&gt;</strong> client.sys.config.sysinfo
<strong>=&gt;</strong> <strong>{</strong>"OS"<strong>=&gt;</strong>"Windows XP (Build 2600, Service Pack 3).", "Computer"<strong>=&gt;</strong>"WINXPVM01"<strong>}</strong>
<strong>&gt;&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Komut çıktısında görüldüğü gibi, ekrana getirilen bilginin aslında farklı alt sınıfları bulunmaktadır. Örneğin, “OS” ve “Computer” bu çağrının alt sınıfıdır. İstersek, sadece bu sınıf bilgilerini de öğrenebiliriz. Bunun için çağrı komutu aşağıdaki gibi kullanılabilir. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><strong>&gt;&gt;</strong> client.sys.config.sysinfo.class
<strong>=&gt;</strong> Hash
<strong>&gt;&gt;</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><strong>&gt;&gt;</strong> client.sys.config.sysinfo['OS'<strong>]</strong>
<strong>=&gt;</strong> "Windows XP (Build 2600, Service Pack 3)."
<strong>&gt;&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="clientsysconfiggetuid">client.sys.config.getuid</h2>
<!-- /wp:heading -->

  Bu çağrı kullanıcı bilgilerini elde etmek için kullanılır. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><strong>&gt;&gt;</strong> client.sys.config.getuid
<strong>=&gt;</strong> "WINXPVM01\labuser"
<strong>&gt;&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="clientsysprocessgetpid">client.sys.process.getpid</h2>
<!-- /wp:heading -->

  Bu çağrı sayesinde, Meterpreter oturumunun hangi program içine gömülü olarak çalıştığını öğrenebiliriz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><strong>&gt;&gt;</strong> client.sys.process.getpid
<strong>=&gt;</strong> 684

<em>## client.net.config.interfaces</em>

Bu çağrı ile hedef sistemin ağ kartları ve arayüzleri hakkında bilgi elde edebilirsiniz.

```sh
<strong>&gt;&gt;</strong> client.net.config.interfaces
<strong>=&gt;</strong> <strong>[</strong><em>#, #]</em>
<strong>&gt;&gt;</strong> client.net.config.interfaces.class
<strong>=&gt;</strong> Array
</code></pre>
<!-- /wp:code -->

  Gördüğünüz gibi, API çağrısı array tipi bir değişken kullanmaktadır. Bu değişken tipini aşağıdaki gibi döngüde kullanarak sonuçları görebiliriz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"> <strong>&gt;&gt;</strong> interfaces <strong>=</strong> client.net.config.interfaces
 <strong>=&gt;</strong> <strong>[</strong><em>#, #]</em>
 <strong>&gt;&gt;</strong> interfaces.each <strong>do</strong> |i|
 ?&gt; puts i.pretty
 <strong>&gt;&gt;</strong> end
 MS TCP Loopback interface
 Hardware MAC: 00:00:00:00:00:00
 IP Address  : 127.0.0.1
 Netmask     : 255.0.0.0
 
 AMD PCNET Family PCI Ethernet Adapter - Packet Scheduler Miniport
 Hardware MAC: 00:0c:29:dc:aa:e4
 IP Address  : 192.168.1.104
 Netmask     : 255.255.255.0</code></pre>
<!-- /wp:code -->