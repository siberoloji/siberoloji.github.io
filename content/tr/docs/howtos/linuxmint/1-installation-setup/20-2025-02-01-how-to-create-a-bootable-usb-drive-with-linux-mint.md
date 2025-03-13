---
draft: false
title: Linux Mint ile Önyüklenebilir USB Sürücü Nasıl Oluşturulur
linkTitle: Önyüklenebilir bir USB oluşturun
translationKey: how-to-create-a-bootable-usb-drive-with-linux-mint
description: Linux Mint ile önyüklenebilir bir USB sürücüsü oluşturmak, yalnızca birkaç araç ve ayrıntılara dikkat gerektiren basit bir işlemdir.
url: /tr/how-to-create-a-bootable-usb-drive-with-linux-mint
weight: 20
date: 2025-02-01
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - bootable usb
  - Linux Mint
featured_image: /images/linuxmint1.webp
---
Linux Mint ile önyüklenebilir bir USB sürücü oluşturmak, Linux Mint'i bir bilgisayara denemek veya yüklemek isteyen herkes için olmazsa olmaz bir beceridir. Başka bir işletim sisteminden geçiş yapıyor, Linux Mint'i birden fazla makineye kuruyor veya bir kurtarma aracı oluşturuyor olun, önyüklenebilir bir USB sürücü en kullanışlı ve güvenilir yöntemdir. Bu kılavuz, Linux Mint'te kolayca bulunabilen araçları kullanarak sizi adım adım süreçte yönlendirecektir.

## Neden Önyüklenebilir Bir USB Sürücü Kullanmalısınız?

Önyüklenebilir USB sürücüler çeşitli avantajlar sunar:

1. **Taşınabilirlik:** İşletim sisteminizi istediğiniz yere götürebilir ve farklı bilgisayarlarda kullanabilirsiniz.
2. **Hız:** USB sürücüler, CD veya DVD'lere kıyasla daha hızlı okuma/yazma hızları sunar.
3. **Kullanışlılık:** Farklı dağıtımlar veya sürümler için oluşturulması, değiştirilmesi ve yeniden kullanılması kolaydır.
4. **Kurtarma:** Mevcut kurulumlarda sorun giderme ve onarım için kullanışlıdır.

## Önkoşullar

Başlamadan önce şunlara ihtiyacınız olacak:

- En az **4 GB** depolama alanına sahip bir **USB flash sürücü** (8 GB veya daha fazlası önerilir).
- Bir **Linux Mint ISO** dosyası (resmi web sitesinden indirilir).
- Linux Mint çalıştıran bir bilgisayar.

İşlem mevcut tüm içeriği sileceğinden, USB sürücüdeki tüm önemli verileri yedeklediğinizden emin olun.

## Adım 1: Linux Mint ISO Dosyasını İndirin

1. **Resmi Linux Mint Web Sitesini Ziyaret Edin:**

- [https://www.linuxmint.com/download.php](https://www.linuxmint.com/download.php) adresine gidin.
- Tercih ettiğiniz sürümü seçin (Cinnamon, MATE veya Xfce).
- Daha hızlı indirmeler için ISO dosyasını yakındaki bir aynadan veya torrent üzerinden indirin.

2. **ISO Dosyasını Doğrulayın:**

- Orijinal olduğundan ve bozulmadığından emin olmak için SHA256 toplam kontrolleri ve GPG imzaları kullanarak ISO dosyasının bütünlüğünü doğrulamak çok önemlidir. (Ayrıntılı talimatlar için [Linux Mint ISO dosyalarını doğrulama](/how-to-download-linux-mint-iso-files-and-verify-their-integrity-on-linux-mint/) kılavuzumuza bakın.)

## 2. Adım: USB Oluşturma Aracını Yükleyin

Linux Mint, önyüklenebilir bir USB oluşturma sürecini basitleştiren **USB Image Writer** adlı yerleşik bir araçla birlikte gelir. Alternatif olarak, **[balenaEtcher](/balena-etcher-tool-creating-bootable-usb/)** veya **UNetbootin** gibi üçüncü taraf araçları kullanabilirsiniz.

### Seçenek 1: USB Image Writer'ı Kullanma (Önerilir)

1. **USB Image Writer'ı açın:**

- Mint menüsüne gidin.
- "USB Image Writer"ı arayın ve uygulamayı başlatın.

2. **USB Sürücüyü takın:**

- USB sürücünüzü kullanılabilir bir USB portuna takın.

3. **ISO Dosyasını seçin:**

- USB Image Writer'da "Görüntü Seç" düğmesine tıklayın.
- İndirdiğiniz Linux Mint ISO dosyasına gidin ve seçin.

4. **Hedef USB Sürücüyü seçin:**

- Diğer sürücüleri yanlışlıkla silmemek için doğru USB sürücüsünün seçildiğinden emin olun.

5. **ISO'yu USB'ye yazın:**

- "Yaz" düğmesine tıklayın.
- İstenirse parolanızı girin.
- İşlemin tamamlanmasını bekleyin. Bu birkaç dakika sürebilir.

### Seçenek 2: balenaEtcher Kullanımı

Eğer platformlar arası bir araç tercih ediyorsanız:

1. **BalenaEtcher'ı yükleyin:**

- [https://www.balena.io/etcher/](https://www.balena.io/etcher/) adresinden indirin.
- Paket yöneticinizi veya sağlanan AppImage'ı kullanarak yükleyin.

2. **Önyüklenebilir USB'yi oluşturun:**

- Etcher'ı açın.
- "Dosyadan flaşla"ya tıklayın ve Linux Mint ISO'yu seçin.
- USB sürücünüzü seçin.
- "Flaşla!"ya tıklayın ve işlemin bitmesini bekleyin.

## Adım 3: USB Sürücüsünden Önyükleme

Önyüklenebilir USB'yi oluşturduktan sonra, onu test etme zamanı:

1. **Bilgisayarınızı Yeniden Başlatın:**

- USB sürücüsünü takılı bırakın.
- Sistemi yeniden başlatın.

2. **Önyükleme Menüsüne Erişim:**

- Başlatma sırasında, önyükleme menüsüne erişmek için tuşa basın (genellikle bilgisayarınızın üreticisine bağlı olarak **F12**, **Esc**, **F2** veya **Del**).

3. **USB Sürücüsünü Seçin:**

- Listeden USB sürücünüzü seçmek için ok tuşlarını kullanın.
- Önyükleme yapmak için **Enter** tuşuna basın.

4. **Linux Mint'i Deneyin veya Kurun:**

- Linux Mint önyükleme menüsünü göreceksiniz.
- Yüklemeden denemek için "Linux Mint'i Başlat"ı seçin veya yüklemeye devam etmek için "Linux Mint'i Yükle"yi seçin.

## Yaygın Sorunları Giderme

### 1. USB Sürücü Tanınmıyor

- **USB Bağlantı Noktalarını Kontrol Edin:** Farklı bir bağlantı noktası, tercihen bir USB 2.0 bağlantı noktası deneyin.
- **Önyüklenebilir USB'yi Yeniden Oluşturun:** ISO doğru yazılmamış olabilir. - **BIOS Ayarları:** BIOS/UEFI ayarlarınızda USB önyüklemesinin etkinleştirildiğinden emin olun.

### 2. Önyükleme Menüsüne Erişilemiyor

- **Farklı Anahtar:** Doğru önyükleme anahtarı için bilgisayarınızın kılavuzuna bakın.
- **Hızlı Önyükleme/Güvenli Önyükleme:** Sorun yaratıyorlarsa bu özellikleri BIOS/UEFI'de devre dışı bırakın.

### 3. "Eksik İşletim Sistemi" Hatası

- **USB'yi Yeniden Biçimlendir:** USB sürücüsünü FAT32 kullanarak biçimlendirin ve önyüklenebilir USB'yi yeniden oluşturun.
- **ISO'yu Yeniden İndir:** ISO bozulmuş olabilir.

## Ek İpuçları

- **Kalıcı Depolama:** Oturumlar arasında veri kaydetmek istiyorsanız, **UNetbootin** veya **mkusb** gibi araçları kullanarak kalıcı bir canlı USB oluşturmayı düşünün.
- **Yüksek Kaliteli USB Sürücüler Kullanın:** Ucuz, düşük kaliteli sürücüler önyükleme işlemi sırasında hatalara neden olabilir. - **Yazılımı Güncel Tutun:** Uyumluluk sorunlarından kaçınmak için USB oluşturma araçlarınızın güncel olduğundan emin olun.

## Sonuç

Linux Mint ile önyüklenebilir bir USB sürücüsü oluşturmak, yalnızca birkaç araç ve ayrıntılara dikkat gerektiren basit bir işlemdir. İster yeni başlayan ister deneyimli bir kullanıcı olun, bu kılavuz sorunsuz ve başarılı bir kurulum sağlamak için gereken tüm adımları sağlar. Bu talimatları izleyerek, Linux Mint'i herhangi bir uyumlu sisteme verimli ve güvenli bir şekilde kurmaya veya test etmeye hazır olacaksınız.
