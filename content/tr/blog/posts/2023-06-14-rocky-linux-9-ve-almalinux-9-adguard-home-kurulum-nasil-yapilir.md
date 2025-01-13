---
draft: false

title:  'Rocky Linux 9 ve AlmaLinux 9 AdGuard Home Kurulum Nasıl Yapılır?'
date: '2023-06-14T19:07:07+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'AdGuard Home, ağınıza gelen trafikte bulunan reklam ve takipçi kodları engellemeyi hedefleyen açık kaynak kodlu DNS sunucu yazılımıdır. ' 
 
url:  /tr/rocky-linux-9-ve-almalinux-9-adguard-home-kurulum-nasil-yapilir/
burst_total_pageviews_count:
    - '2'
featured_image: /images/adguard.webp
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - adguard
    - dns
    - 'linux nasıl'
---
AdGuard Home, ağınıza gelen trafikte bulunan reklam ve takipçi kodları engellemeyi hedefleyen açık kaynak kodlu DNS sunucu yazılımıdır. Ev veya küçük ofisinizde bulunan bir sunucuya kurarak tüm ağınızda reklam engelleme yapabilirsiniz.

Bu yazımızda, Rocky Linux 9 ve AlmaLinux 9 sürümünü kullanan sunucumuza Adguard Home kurulumunu paylaşacağız. 

Aşağıdaki adımları komut satırınızda sırayla uygulamalısınız.
* 
* Sistem paketlerini güncelleyelim.

```bash
sudo dnf clean all &amp;&amp; sudo dnf update
sudo dnf groupinstall "Development Tools"```
* 
* AdGuard paketlerini GitHub üzerinden indirip kuralım

```bash
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
```
* 
* Firewall için gerekli izinleri açalım.

```bash
sudo firewall-cmd --add-service={dns,http,https} --permanent
sudo firewall-cmd --add-port=3000/tcp --permanent
sudo firewall-cmd --reload
```

Adguard uygulası sunucuya kuruldu. Son ayarları yapmak ve kullanıcı oluşturmak için http://localhost:3000 veya http://sunucuipadresi:3000 adresini web tarayıcıda ziyaret etmelisiniz.

Son olarak kurulum yaptığınız sunucunun IP adresini, Router cihazınızın içinde bulunan DNS IP adresleri bölümüne girebilirsiniz. Bu sayede tüm trafiği size ait bir DNS sunucu üzerinden filtrelenerek içeri girecektir.
