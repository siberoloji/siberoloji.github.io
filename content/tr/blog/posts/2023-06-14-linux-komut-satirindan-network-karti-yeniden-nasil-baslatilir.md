---
draft: false

title:  'Linux komut satırından network kartı yeniden nasıl başlatılır?'
date: '2023-06-14T17:12:55+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Aşağıda açıkladığımız komutlar sayesinde ağ kartınızı kapatıp açabilirsiniz.' 
 
url:  /tr/linux-komut-satirindan-network-karti-yeniden-nasil-baslatilir/
burst_total_pageviews_count:
    - '5'
featured_image: /images/bash-1.jpeg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'komut satırı'
    - 'linux komut'
    - 'linux nasıl'
---


Linux işletim sisteminizde bir bağlantı problemi olduğunda veya IP ayarlarını değiştirdiğinizde ağ kartınızı tekrar başlatmanız gerekebilir. Bunu yapmak için bilgisayar veya sunucunuzu tekrar başlatmanıza gerek yoktur. Aşağıda açıkladığımız komutlar sayesinde ağ kartınızı kapatıp açabilirsiniz.



**UYARI: Bu yöntem, bilgisayarınıza doğrudan erişiminiz varsa kullanılır. Sunucunuza SSH vb yöntemle uzaktan bağlıysanız, ağ kartınız devre dışı kalacağı için erişiminiz kaybedersiniz. UYARI!!!**



## Ağ kartını durdurmak için


```bash
# nmcli networking off```



## Ağ kartını başlatmak için


```bash
# nmcli networking on
```



Sunucunuza doğrudan erişimiz yoksa kapat / aç yöntemi yerine "yeniden başlat" yöntemini deneyebilirsiniz.



## Ağ kartını Yeniden Başlatmak için


```bash
# systemctl restart NetworkManager```



## Ağ kartını durumunu kontrol etmek için


```bash
# systemctl status NetworkManager```



Yukarıda listelenen komutlar hemen hemen tüm Linux sistemlerinde çalışır. Sisteminizde farklı bir ağ yöneticisi bulunuyorsa, man sayfalarına bakabilirsiniz.
