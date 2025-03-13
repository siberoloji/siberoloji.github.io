---
draft: false
title: "Linux Mint ISO Dosyaları Nasıl İndirilir ve Linux Mint'te Bütünlükleri Nasıl Doğrulanır"
linkTitle: ISO Dosyalarını İndirin
translationKey: how-to-download-linux-mint-iso-files-and-verify-their-integrity-on-linux-mint
description: Bu yazımızda Linux Mint ISO dosyalarını indirme ve bütünlüklerini doğrulama kısımlarını anlatacağız.
url: /tr/how-to-download-linux-mint-iso-files-and-verify-their-integrity-on-linux-mint
weight: 10
date: 2025-02-01
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - how-to guides
  - download Linux Mint ISO files
featured_image: /images/linuxmint1.webp
---
Linux Mint, kullanıcı dostu arayüzü ve sağlam performansıyla bilinen en popüler Linux dağıtımlarından biridir. İster Linux Mint'i ilk kez kurmak isteyen yeni bir kullanıcı olun, ister yükseltmeyi veya önyüklenebilir bir USB oluşturmayı planlayan deneyimli bir kullanıcı olun, ISO dosyasını indirmek ve bütünlüğünü doğrulamak çok önemlidir. Bu kılavuz, güvenli ve sorunsuz bir kurulum deneyimi sağlamak için sizi adım adım süreçte yönlendirecektir.

## ISO Bütünlüğünü Doğrulamanın Önemi

İndirme ve doğrulama sürecine dalmadan önce, ISO dosyasının bütünlüğünü doğrulamanın neden kritik olduğunu anlamak önemlidir:

1. **Güvenlik:** ISO'yu doğrulamak, dosyanın kurcalanmadığından emin olmanızı sağlar ve bu da güvenlik açıklarını önlemeye yardımcı olur.
2. **Veri Bütünlüğü:** Dosyanın doğru bir şekilde indirildiğini ve ağ sorunları nedeniyle bozulmadığını doğrular.
3. **Gerçeklik:** ISO'nun Linux Mint'ten resmi bir sürüm olduğunu, değiştirilmiş veya kötü amaçlı bir sürüm olmadığını garanti eder.

## Adım 1: Linux Mint ISO Dosyasını İndirme

### 1. Resmi Linux Mint Web Sitesini ziyaret edin

- Web tarayıcınızı açın ve [https://www.linuxmint.com/download.php](https://www.linuxmint.com/download.php) adresine gidin.
- Tercih ettiğiniz sürümü seçin: **Cinnamon**, **MATE** veya **Xfce**. Her biri çeşitli kullanıcı tercihlerine hitap eden farklı masaüstü ortamları sunar.

### 2. Bir İndirme Aynası Seçin

- İstediğiniz sürümü tıklayın, bu sizi indirme aynalarının listesine götürecektir.
- Daha hızlı indirme hızları için coğrafi konumunuza yakın bir ayna seçin.
- Alternatif olarak, büyük dosyalar için genellikle daha hızlı ve daha güvenilir olan **Torrent** seçeneğini kullanabilirsiniz.

### 3. ISO Dosyasını Kaydedin

- Aynayı seçtikten sonra indirmeyi başlatmak için indirme bağlantısına tıklayın. - ISO dosyasını daha sonra kolayca erişebileceğiniz bir dizine, örneğin `İndirilenler` dizinine kaydedin.

## 2. Adım: Denetim Dosyalarını İndirin

ISO'nun bütünlüğünü doğrulamak için, karşılık gelen denetim dosyalarına ihtiyacınız olacak:

- **SHA256 Denetim Dosyası:** Bu dosya, veri bütünlüğünü doğrulamak için kullanılan karma değerini içerir.
- **GPG İmza Dosyası:** Denetim dosyasının gerçekliğini doğrulamak için kullanılır.

### 1. Denetim ve İmza Dosyalarını İndirin

- Aynı indirme sayfasında, `sha256sum.txt` ve `sha256sum.txt.gpg` etiketli bağlantıları arayın.
- Her iki dosyayı da indirin ve ISO dosyanızla aynı dizine yerleştirin.

## Adım 3: ISO Dosyasının Bütünlüğünü Doğrulama

### 1. Terminali açın

- Linux Mint'te terminali açmak için `Ctrl + Alt + T` tuşlarına basın.

### 2. İndirme Dizinine gidin

Dosyalarınız `Downloads` klasöründeyse:

```bash
cd ~/Downloads
```

### 3. SHA256 Kontrol Toplamını Doğrulayın

ISO'nun kontrol toplamını hesaplamak için aşağıdaki komutu çalıştırın:

```bash
sha256sum linuxmint-21.1-cinnamon-64bit.iso
```

`linuxmint-21.1-cinnamon-64bit.iso` ifadesini ISO'nuzun gerçek dosya adıyla değiştirin.

- Çıktı, uzun bir karakter dizisi (karma değer) olacaktır. - Bu değeri `sha256sum.txt` dosyasında listelenen değerle karşılaştırın:

```bash
cat sha256sum.txt
```

- Her iki değer de eşleşirse, ISO dosyası sağlam ve bozulmamış demektir.

### 4. GPG ile Doğrulamayı Doğrulayın

#### a. Linux Mint Genel Anahtarını İçeri Aktarın

Öncelikle, Linux Mint GPG anahtarını içeri aktarın:

```bash
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys A25BAE09EF0A2B526D6478F5F7D0A4C4B6EF6B31
```

#### b. Denetim Dosyasını Doğrulayın

Doğrulamayı doğrulamak için şu komutu çalıştırın:

```bash
gpg --verify sha256sum.txt.gpg sha256sum.txt
```

- Çıktıda `"Linux Mint ISO İmza Anahtarından İyi İmza" ifadesi yer alıyorsa, dosya doğru demektir. - "Güvenilmeyen imza" hakkında bir uyarı görünebilir, ancak anahtarı açıkça güvenilir olarak ayarlamadıysanız bu normaldir.

## Yaygın Sorunları Giderme

### 1. Eşleşmeyen Denetim Toplamları

Denetim toplamı eşleşmiyorsa:

- **ISO dosyasını yeniden indirin:** Ağ hataları veri bozulmasına neden olabilir.
- **Farklı bir yansıtma kullanın:** Yansıtma sunucusunda güncel olmayan veya bozuk bir dosya olabilir.
- **İndirme araçlarını doğrulayın:** Bir indirme yöneticisi kullanıyorsanız, doğru şekilde yapılandırıldığından emin olun.

### 2. GPG Doğrulama Hataları

GPG doğrulaması başarısız olursa:

- **Yazım hatalarını kontrol edin:** Komutlarda doğru dosya adlarını kullandığınızdan emin olun.
- **GPG anahtarlarını güncelleyin:** İmza anahtarı değişmiş olabilir. Anahtarı resmi Linux Mint web sitesinden doğrulayın.
- **İmza dosyalarını yeniden indirin:** İndirme sırasında bozulma doğrulama hatalarına neden olabilir.

## Güvenli İndirmeler İçin En İyi Uygulamalar

- **Her zaman resmi kaynaklardan indirin:** Üçüncü taraf sitelerden kaçının.
- **Hem sağlama toplamını hem de GPG imzasını doğrulayın:** Bu çift katman hem dosya bütünlüğünü hem de özgünlüğünü sağlar.
- **Sisteminizi güncel tutun:** Düzenli güncellemeler GPG gibi güvenlik araçlarını iyileştirir.
- **Güvenli bir ağ kullanın:** Büyük, kritik dosyaları indirirken genel Wi-Fi'den kaçının.

## Sonuç

Linux Mint ISO dosyalarını indirmek ve doğrulamak, güvenli ve güvenilir bir kurulum sağlamak için basit ancak gerekli bir işlemdir. Bu adımları izleyerek (resmi kaynaklardan indirme, SHA256 sağlama toplamlarını kontrol etme ve GPG imzalarını doğrulama) sisteminizi bozuk veya kötü amaçlı dosyalardan korursunuz. Bu doğrulama yöntemlerini düzenli olarak uygulamak güvenlik farkındalığınızı güçlendirir ve Linux Mint deneyiminizi hem güvenli hem de sorunsuz hale getirir.
