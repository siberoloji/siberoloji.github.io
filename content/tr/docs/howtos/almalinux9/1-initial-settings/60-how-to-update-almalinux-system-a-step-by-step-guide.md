---
title: "AlmaLinux Sistemi Nasıl Güncellenir: Adım Adım Kılavuz"
description: Bu yazıda AlmaLinux sisteminizi güncellemek için adım adım kılavuz bulunmaktadır.
date: 2024-11-30
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: AlmaLinux Güncelleme Kılavuzu
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 60
translationKey: how-to-update-almalinux-system
keywords:
  - AlmaLinux
  - Update AlmaLinux

featured_image: /images/almalinux.webp
url: /tr/update-almalinux-system-step-step-guide
---
AlmaLinux, uzun vadeli destek ve güvenilirlik sunmak için oluşturulmuş popüler bir açık kaynaklı Linux dağıtımıdır ve bu da onu sunucular ve geliştirme ortamları için mükemmel bir seçim haline getirir. AlmaLinux sisteminizi güncel tutmak, güvenliği, işlevselliği ve en son özelliklere erişimi sağlamak için önemlidir. Bu kılavuzda, AlmaLinux sisteminizi etkili bir şekilde güncellemek için atmanız gereken adımlarda size yol göstereceğiz.

---

#### AlmaLinux'u Güncel Tutmanın Neden Önemli Olduğu

Adımlara dalmadan önce, güncellemelerin neden kritik olduğunu anlamakta fayda var:

1. **Güvenlik**: Düzenli güncellemeler, saldırganlar tarafından istismar edilebilecek güvenlik açıklarını kapatır.
2. **Performans Geliştirmeleri**: Güncellemeler genellikle daha iyi performans için iyileştirmeler içerir.
3. **Yeni Özellikler**: Sisteminizi güncellemek, en son özellikleri ve yazılım geliştirmelerini kullandığınızdan emin olmanızı sağlar.
4. **Hata Düzeltmeleri**: Güncellemeler bilinen sorunları çözerek genel sistem kararlılığını artırır.

Artık "neden"i ele aldığımıza göre, "nasıl"a geçelim.

---

### Güncellemeye Hazırlık

AlmaLinux sisteminizi güncellemeden önce, sorunsuz bir süreç sağlamak için aşağıdaki hazırlık adımlarını izleyin:

#### 1. **Mevcut Sistem Bilgilerini Kontrol Edin**

Devam etmeden önce, mevcut sistem sürümünüzü doğrulamak iyi bir uygulamadır. Aşağıdaki komutu kullanın:

```bash
cat /etc/os-release
```

Bu komut, AlmaLinux sürümünüz hakkında ayrıntılı bilgi görüntüler. Bunu referans olarak not edin.

#### 2. **Verilerinizi Yedekleyin**

Güncellemeler genellikle güvenli olsa da, özellikle kritik sistemler için her zaman veri kaybı riski vardır. Verilerinizi güvence altına almak için `rsync` veya üçüncü taraf bir yedekleme çözümü kullanın.

Örnek:

```bash
rsync -avz /important/data /backup/location
```

#### 3. **Kök Erişimini Sağlayın**

Sistem güncellemelerini gerçekleştirmek için kök ayrıcalıklarına veya `sudo` erişimi olan bir kullanıcıya ihtiyacınız olacak. Erişimi şu komutu çalıştırarak doğrulayın:

```bash
sudo whoami
```

Çıktı "kök" ise, hazırsınız demektir.

---

### AlmaLinux'u Güncellemek İçin Adım Adım Kılavuz

#### Adım 1: **Paket Yöneticisi Depolarını Güncelleyin**

İlk adım depo meta verilerini yenilemektir. Bu, AlmaLinux depolarından en son paket bilgilerine sahip olmanızı sağlar.

Aşağıdaki komutu çalıştırın:

```bash
sudo dnf makecache
```

Bu komut en son depo meta verilerini indirecek ve yerel bir önbelleğe kaydedecek ve paket bilgilerinin güncel olduğundan emin olacaktır.

---

#### 2. Adım: **Kullanılabilir Güncellemeleri Kontrol Et**

Ardından, şu komutu kullanarak kullanılabilir güncellemeleri kontrol edin:

```bash
sudo dnf check-update
```

Bu komut, paket adı, sürüm ve depo kaynağı gibi ayrıntıları göstererek kullanılabilir güncellemeleri olan tüm paketleri listeler.

---

#### 3. Adım: **Güncellemeleri Yükle**

Kullanılabilir güncellemeleri inceledikten sonra yüklemeye devam edin. Tüm paketleri güncellemek için şu komutu kullanın:

```bash
sudo dnf update -y
```

`-y` bayrağı güncellemelerin kurulumunu otomatik olarak onaylar ve sizi manuel istemlerden kurtarır. Güncellenecek paket sayısına bağlı olarak bu işlem biraz zaman alabilir.

---

#### 4. Adım: **Sistemi Yükseltin**

Büyük sürüm yükseltmeleri de dahil olmak üzere daha kapsamlı güncellemeler için `dnf upgrade` komutunu kullanın:

```bash
sudo dnf upgrade --refresh
```

Bu komut, sisteminizin tamamen güncel olduğundan ve `update` tarafından kapsanmayan ek iyileştirmeler içerdiğinden emin olmanızı sağlar.

---

#### 5. Adım: **Kullanılmayan Paketleri Temizleyin**

Güncellemeler sırasında eski veya gereksiz paketler birikerek disk alanı kaplayabilir. Bunları şu şekilde temizleyin:

```bash
sudo dnf autoremove
```

Bu komut, kullanılmayan bağımlılıkları ve eski paketleri kaldırarak sisteminizi düzenli tutar.

---

#### 6. Adım: **Gerekirse Yeniden Başlatın**

Bazı güncellemeler, özellikle çekirdek veya sistem kitaplıklarıyla ilgili olanlar, etkili olması için yeniden başlatma gerektirir. Yeniden başlatmanın gerekip gerekmediğini şu şekilde kontrol edin:

```bash
sudo needs-restarting
```

Gerekiyorsa, sisteminizi şu şekilde yeniden başlatın:

```bash
sudo reboot
```

---

### AlmaLinux Güncellemelerini Otomatikleştirme

Manuel güncellemeler sıkıcı geliyorsa, paket güncellemelerini ve bildirimlerini işleyen bir araç olan DNF Automatic ile işlemi otomatikleştirmeyi düşünün.

#### Adım 1: **DNF Automatic'i yükleyin**

Aracı şu şekilde çalıştırarak yükleyin:

```bash
sudo dnf install -y dnf-automatic
```

#### Adım 2: **DNF Automatic'i yapılandırın**

Yüklemeden sonra, yapılandırma dosyasını düzenleyin:

```bash
sudo nano /etc/dnf/automatic.conf
```

Otomatik güncellemeleri etkinleştirmek için ayarları değiştirin. Önemli bölümler şunlardır:

- Eylemleri tanımlamak için `[komutlar]` (örneğin, indirme, yükleme).
- Güncelleme günlükleri için e-posta bildirimlerini yapılandırmak için `[emitters]`.

#### Adım 3: **Hizmeti Etkinleştirin ve Başlatın**

DNF Otomatik hizmetini etkinleştirin ve başlatın:

```bash
sudo systemctl enable --now dnf-automatic
```

Bu, hizmetin önyüklemede otomatik olarak başlamasını ve güncellemeleri işlemesini sağlar.

---

### Yaygın Güncelleme Sorunlarını Giderme

Güncellemeler genellikle basit olsa da sorunlar ortaya çıkabilir. İşte bazı yaygın sorunları çözmenin yolu:

#### 1. **Ağ Bağlantı Hataları**

Sisteminizin kararlı bir internet bağlantısına sahip olduğundan emin olun. Bağlantıyı şu şekilde test edin:

```bash
ping -c 4 google.com
```

Bağlantı yoksa, ağ ayarlarınızı kontrol edin veya sağlayıcınızla iletişime geçin.

#### 2. **Depo Hataları**

Depo hataları oluşursa, önbelleği temizleyin ve yeniden deneyin:

```bash
sudo dnf clean all
sudo dnf makecache
```

#### 3. **Bozuk Bağımlılıklar**

Bağımlılık sorunlarını şu şekilde çözün:

```bash
sudo dnf --best --allowerasing install <package-name>
```

Bu komut, çakışmaları çözerken paketleri yükler.

---

### Sonuç

AlmaLinux sisteminizi güncel tutmak, güvenlik, istikrar ve performans açısından hayati önem taşır. Bu kılavuzda özetlenen adımları izleyerek, olası riskleri en aza indirirken sorunsuz bir güncelleme süreci sağlayabilirsiniz. İster manuel güncellemeleri ister DNF Automatic gibi otomatik araçları tercih edin, güncellemelerin üstünde kalmak sistem yöneticileri ve kullanıcılar için basit ancak önemli bir görevdir.

Bu ipuçlarını elinizde bulundurduğunuzda, AlmaLinux sisteminizi güvenle korumaya hazırsınız.
