---
draft: false

title:  'Linux ve systemd ile grafik arayüz ve konsol arayüz geçişi nasıl yapılır?'
date: '2024-01-24T22:59:29+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bu yazımızda, systemd yönetim sistemini kullanan Linux dağıtımında grafik ve konsol arasında geçişler ve varsayılan açılış hedefini nasıl ayarlayabileceğimizi göreceğiz.' 
 
url:  /tr/linux-ve-systemd-ile-grafik-arayuz-ve-konsol-arayuz-gecisi-nasil-yapilir/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
burst_total_pageviews_count:
    - '15'
featured_image: /images/bash-6.png
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - linux
    - 'linux nasıl'
---
Linux işletim sistemini başlattığınızda, sırasıyla gerçekleşen açılış işlemlerini kontrol eden sisteme "init sistem" adı verilir. Bir takım Linux dağıtımları SysV başlatıcı, bir kısım dağıtımlar ise systemd kullanırlar. Masaüstü bilgisayar kullanıyorsanız, başlangıç işlemleri tamamlandığında grafik arayüze ulaşmak istersiniz. Sunucu bilgisayarda ise masaüstü ihtiyacınız yoksa, grafik arayüze değil komut satırına ulaşmak istersiniz. Bu yazımızda, systemd yönetim sistemini kullanan Linux dağıtımında grafik ve konsol arasında geçişler ve varsayılan açılış hedefini nasıl ayarlayabileceğimizi göreceğiz.

Öncelikle, sistemimizde yüklü ve aktif olan hedef durumlarını görelim. Bunun için "systemctl list-units --type=target" komutunu kullanabilirsiniz.
```bash
linux@rpi4:~ $ systemctl list-units --type=target
  UNIT                   LOAD   ACTIVE SUB    DESCRIPTION                        
  basic.target           loaded active active Basic System
  cryptsetup.target      loaded active active Local Encrypted Volumes
  getty.target           loaded active active Login Prompts
  graphical.target       loaded active active Graphical Interface
  integritysetup.target  loaded active active Local Integrity Protected Volumes
  local-fs-pre.target    loaded active active Preparation for Local File Systems
  local-fs.target        loaded active active Local File Systems
  machines.target        loaded active active Containers
  multi-user.target      loaded active active Multi-User System
  network-online.target  loaded active active Network is Online
  network.target         loaded active active Network
  nfs-client.target      loaded active active NFS client services
  nss-user-lookup.target loaded active active User and Group Name Lookups
  paths.target           loaded active active Path Units
  remote-fs-pre.target   loaded active active Preparation for Remote File Systems
  remote-fs.target       loaded active active Remote File Systems
  rpc_pipefs.target      loaded active active rpc_pipefs.target
  slices.target          loaded active active Slice Units
  sockets.target         loaded active active Socket Units
  swap.target            loaded active active Swaps
  sysinit.target         loaded active active System Initialization
  time-set.target        loaded active active System Time Set
  timers.target          loaded active active Timer Units
  veritysetup.target     loaded active active Local Verity Protected Volumes

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.
24 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.
```

Yukarıda listelenen bir çok durum, aslında varılmak istenen nihai hedefin (grafik arayüz, konsol arayüzü vb. ) bir gerekliliğidir. Bizim şu an için ilgilendiğimiz durumlar, "graphical.target", "multi-user.target" olduğu için diğerlerini dikkate almıyoruz.

Öncelikle sistemimizde varsayılan olarak ayarlı açılış hedefini görelim. Bunun için "`systemctl get-default`" komutunu kullanıyoruz.
```bash
$ systemctl get-default 
graphical.target
```

Sistemimizde ayarlanmış varsayılan açılış hedefinin grafik arayüz "`graphical.target`" olduğunu görebilirsiniz. Buradan çıkaracağımız sonuç, sistemimiz başladığında bütün servisler sırasıyla çalıştırılacak ve grafik arayüz ile masaüstü yöneticisine ulaşacaksınız. 

Peki masaüstüne ihtiyacınız yoksa veya ihtiyacınız kalmadı ise durdurup sistem kaynak kullanımını azaltmak isteyebilirsiniz. Bu durumda grafik arayüzünü durdurup konsol dediğimiz, komut satırı olarak da tabir edilen, komutlarımızda "multi-user.target" şeklinde ifade edeceğimiz ekrana nasıl geçeceğiz.

## graphical.target tan multiuser-target a geçiş

Sistemimiz şu an graphical.target dediğimiz grafik arayüzde çalışıyor.  Burada yapılan işlem masaüstü ekranında Terminal penceresi açmak değildir. Masaüstü yöneticisini tamamen durdurmaktır. Dikkat etmelisiniz. Aşağıdaki komut sayesinde artık masaüstü yöneticisi ve grafik arayüz kullanan programlar tamamen durduruldu. Komut satırındasınız. 
```bash
sudo systemctl isolate multi-user.target
```

## multiuser-target tan graphical.target a geçiş

Grafik arayüzü tekrar başlatmak isterseniz aşağıdaki komutu kullanabilirsiniz. Bu komut sonucunda grafik arayüz ve masaüstü yöneticisi tekrar başlatılacaktır
```bash
sudo systemctl isolate graphical.target
```

## İlk açılış varsayılan hedef ayarı

Yukarıda verdiğimiz geçiş komutları, sistem açıldıktan sonra başlatma, sonlandırma ve geçiş işlemleri için kullanılmaktadır. Şimdi ise, sisteminiz ilk açıldığında hangi durumu hedef almasını istediğimizi ayarlayalım. Bunun için "systemctl set-default " komutunu kullanacağız.
```bash
sudo systemctl set-default multi-user.target
```
```bash
sudo systemctl set-default graphical.target```

Bu komutlar sayesinde istediğiniz zaman grafik arayüzü durdurarak kaynak kullanımını azaltabilir, ihtiyacınız olduğunda birbirleri arasında geçiş yapabilirsiniz.
