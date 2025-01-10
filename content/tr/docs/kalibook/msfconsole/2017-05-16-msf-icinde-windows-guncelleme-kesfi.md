---
draft: false

title:  'MSF İçinde Windows Güncelleme Keşfi'
date: '2017-05-16T13:01:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Metasploit Framework içerisinden bir Windows işletim sistemine Meterpreter shell açtığınızda, işletim sisteminin hangi güncellemeleri ve yamaları yaptığını, hangilerini yapmadığını keşfetmek isteyebilirsiniz.' 
 
url:  /tr/msf-icinde-windows-guncelleme-kesfi/
 
featured_image: /images/metasploit.jpg
categories:
    - 'Metasploit Framework'
tags:
    - cybersecurity
    - 'metasploit framework'
---


Metasploit Framework içerisinden bir Windows işletim sistemine Meterpreter shell açtığınızda, işletim sisteminin hangi güncellemeleri ve yamaları yaptığını, hangilerini yapmadığını keşfetmek isteyebilirsiniz.



Bunun için kullanılan `post/windows/gather/enum_patches` modülünün kullanımına ait bir örneği aşağıda bulabilirsiniz. Modül, isminden de anlaşılacağı gibi bir **post exploitation** modülüdür ve öncelikle hedef bilgisayarda bir `meterpreter` açık olmalıdır.



Aşağıdaki çıktıda, `use` komutu ile modül yüklenmiş ve seçenekleri görüntülenmiştir.


```bash
msf exploit(handler) > use post/windows/gather/enum_patches
msf post(enum_patches) > show options

Module options (post/windows/gather/enum_patches):

   Name       Current Setting       Required  Description
   ----       ---------------       --------  -----------
   KB         KB2871997, KB2928120  yes       A comma separated list of KB patches to search for
   **MSFLOCALS  true                  yes       Search for **missing patchs for **which there is a MSF local module
   SESSION                          yes       The session to run this module on.
```



Modül hakkında detaylı bilgileri `show advanced` komutuyla inceleyebilirsiniz.


```bash
msf post(enum_patches) > show advanced

Module advanced options (post/windows/gather/enum_patches):

   Name           : VERBOSE
   Current Setting: true
   Description    : Enable detailed status messages

   Name           : WORKSPACE
   Current Setting: 
   Description    : Specify the workspace for **this module
```



Bir `exploit` kullanarak Windows işletim sistemin Meterpreter shell açtıktan sonra oturumu arka plana gönderin ve `use` komutuyla `enum_patches` modülünü yükleyin. Aşağıdaki `show options` komutundaki çıktıda bulunan `SESSION` değişkeni, arka plana gönderdiğimiz meterpreter shell in oturum numarası olmalıdır. Arka plandaki oturumları `sessions -l` komutu ile görebilirsiniz. Gerekli kontrolleri yaptıktan sonra `run` komutunu verdiğinizde Windows bilgisayarın hangi güncellemeleri yapıp yapmadığını görebilirsiniz.


```bash
msf post(enum_patches) > show options

Module options (post/windows/gather/enum_patches):

   Name       Current Setting       Required  Description
   ----       ---------------       --------  -----------
   KB         KB2871997, KB2928120  yes       A comma separated list of KB patches to search for
   **MSFLOCALS  true                  yes       Search for **missing patchs for **which there is a MSF local module
   SESSION    1                     yes       The session to run this module on.

msf post(enum_patches) > run

> KB2871997 applied
**[**+] KB2928120 is missing
**[**+] KB977165 - Possibly vulnerable to MS10-015 kitrap0d **if **Windows 2K SP4 - Windows 7 (x86)
> KB2305420 applied
**[**+] KB2592799 - Possibly vulnerable to MS11-080 afdjoinleaf **if **XP SP2/SP3 Win 2k3 SP2
**[**+] KB2778930 - Possibly vulnerable to MS13-005 hwnd_broadcast, elevates from Low to Medium integrity
**[**+] KB2850851 - Possibly vulnerable to MS13-053 schlamperei **if **x86 Win7 SP0/SP1
**[**+] KB2870008 - Possibly vulnerable to MS13-081 track_popup_menu **if **x86 Windows 7 SP0/SP1
> Post module execution completed
```



Yukarıda görüldüğü gibi başında [+] işareti bulunan güncellemelerin sistemde yapılmadığı rapor edilmektedir.
