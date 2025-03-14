---
title: "AlmaLinux'ta Hizmetler Nasıl Listelenir, Etkinleştirilir veya Devre Dışı Bırakılır"
description: Bu yazımızda AlmaLinux'ta hizmetlerin listelenmesi, etkinleştirilmesi ve devre dışı bırakılması konularını inceleyecegiz.
date: 2024-11-30
draft: false
tags:
  - AlmaLinux
  - systemd
categories:
  - Linux
  - Linux How-to
linkTitle: AlmaLinux Servisleri
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 50
translationKey: how-to-list-enable-or-disable-services-on-almalinux
keywords:
  - AlmaLinux
  - services on almalinux

featured_image: /images/almalinux.webp
url: /tr/list-enable-disable-services-almalinux
---
AlmaLinux çalıştıran bir sunucuyu yönetirken, sistem hizmetlerinin nasıl yönetileceğini anlamak çok önemlidir. Hizmetler, web sunucularından ve veritabanlarından ağ araçlarına kadar her şeyi çalıştıran sunucu işlevselliğinin omurgasıdır. RHEL tabanlı bir dağıtım olan AlmaLinux, bu hizmetleri yönetmek için **systemd** kullanır. Bu kılavuz, AlmaLinux'ta hizmetleri etkili bir şekilde listeleme, etkinleştirme, devre dışı bırakma ve yönetme konusunda size yol gösterir.

---

### AlmaLinux'taki Hizmetler Nelerdir?

AlmaLinux'taki bir hizmet, esasen belirli bir işlevi gerçekleştirmek için arka planda çalışan bir program veya işlemdir. Örneğin, Apache (`httpd`) web sayfalarına hizmet eder ve MySQL veya MariaDB veritabanlarını yönetir. Bu hizmetler, çoğu modern Linux dağıtımında varsayılan başlatma sistemi ve hizmet yöneticisi olan **systemd** kullanılarak kontrol edilebilir.

---

### Hizmetleri Yönetmek İçin Önkoşullar

AlmaLinux'ta hizmetleri yönetmeye başlamadan önce, aşağıdakilere sahip olduğunuzdan emin olun:

- **Terminale Erişim**: Sunucuya doğrudan erişim veya SSH erişiminiz olması gerekir.
- **Sudo Ayrıcalıkları**: Hizmetleri yönetmek için yönetimsel haklar gerekir.
- **Temel Komut Satırı Bilgisi**: Terminal ve genel komutlarla ilgili bilgi sahibi olmak faydalı olacaktır.

---

### 1. AlmaLinux'ta Hizmetleri Listeleme

Hizmetleri listelemek, başlangıçta hangilerinin etkin, etkin olmayan veya etkinleştirilmiş olduğunu görmenizi sağlar. Bunu yapmak için `systemctl` komutunu kullanın.

#### Tüm Hizmetleri Listele

Kullanılabilir tüm hizmetleri listelemek için şunu çalıştırın:

```bash
systemctl list-units --type=service
```

Bu, yüklenen tüm hizmet birimlerini, durumlarını ve diğer ayrıntıları görüntüler. Bakılacak temel sütunlar şunlardır:

- **LOAD**: Hizmetin düzgün yüklenip yüklenmediğini gösterir.
- **ACTIVE**: Hizmetin çalıştığını (aktif) veya durdurulduğunu (etkin değil) gösterir.
- **SUB**: Ayrıntılı durum sağlar (örneğin, çalışıyor, çıkıldı veya başarısız oldu).

#### Hizmetleri Duruma Göre Filtrele

Yalnızca etkin hizmetleri listelemek için:

```bash
systemctl list-units --type=service --state=active
```

Yalnızca başarısız hizmetleri listelemek için:

```bash
systemctl --failed
```

#### Belirli Hizmet Durumunu Görüntüle

Tek bir hizmetin durumunu kontrol etmek için şunu kullanın:

```bash
systemctl status [hizmet-adı]
```

Örneğin, Apache web sunucusunun durumunu kontrol etmek için:

```bash
systemctl status httpd
```

---

### 2. AlmaLinux'ta Hizmetler Nasıl Etkinleştirilir

Bir hizmeti etkinleştirmek, sistem önyüklendiğinde otomatik olarak başlamasını sağlar. Bu, web veya veritabanı sunucuları gibi düzenli olarak güvendiğiniz hizmetler için çok önemlidir.

#### Bir Hizmeti Etkinleştir

Önyükleme sırasında bir hizmeti etkinleştirmek için şunu kullanın:

```bash
sudo systemctl enable [hizmet-adı]
```

Örnek:

```bash
sudo systemctl enable httpd
```

#### Etkinleştirilmiş Hizmetleri Doğrula

Bir hizmetin etkinleştirildiğini doğrulamak için:

```bash
systemctl is-enabled [hizmet-adı]
```

#### Tüm Gerekli Bağımlılıkları Etkinleştir

Bir hizmeti etkinleştirirken, systemd bağımlılıklarını otomatik olarak işler. Ancak, gerekirse bağımlılıkları manuel olarak belirtebilirsiniz.

#### Geçerli Önyükleme Hedefi için Bir Hizmeti Etkinleştir

Bir hizmeti özellikle geçerli çalışma düzeyi için etkinleştirmek için:

```bash
sudo systemctl enable [hizmet-adı] --now
```

---

### 3. AlmaLinux'ta Hizmetler Nasıl Devre Dışı Bırakılır

Bir hizmeti devre dışı bırakmak, önyükleme sırasında otomatik olarak başlamasını önler. Bu, artık ihtiyaç duymadığınız veya gereksiz yere çalışmasını durdurmak istemediğiniz hizmetler için yararlıdır.

#### Bir Hizmeti Devre Dışı Bırak

Bir hizmeti devre dışı bırakmak için:

```bash
sudo systemctl disable [service-name]
```

Örnek:

```bash
sudo systemctl disable httpd
```

#### Bir Hizmeti Aynı Anda Devre Dışı Bırakma ve Durdurma

Bir hizmeti devre dışı bırakmak ve hemen durdurmak için:

```bash
sudo systemctl disable [service-name] --now
```

#### Devre Dışı Bırakılan Hizmetleri Doğrulama

Hizmetin devre dışı bırakıldığından emin olmak için:

```bash
systemctl is-enabled [service-name]
```

Hizmet devre dışı bırakılmışsa, bu komut `disabled` değerini döndürür.

---

### 4. Hizmetleri Başlatma veya Durdurma

Hizmetleri etkinleştirmeye veya devre dışı bırakmaya ek olarak, bunları manuel olarak başlatmanız veya durdurmanız gerekebilir.

#### Bir Hizmeti Başlat

Bir hizmeti manuel olarak başlatmak için:

```bash
sudo systemctl start [hizmet-adı]
```

#### Bir Hizmeti Durdur

Çalışan bir hizmeti durdurmak için:

```bash
sudo systemctl stop [hizmet-adı]
```

#### Bir Hizmeti Yeniden Başlat

Bir hizmeti durduran ve sonra başlatan bir hizmeti yeniden başlatmak için:

```bash
sudo systemctl restart [hizmet-adı]
```

#### Bir Hizmeti Yeniden Yükle

Bir hizmet yeniden başlatmadan yeniden yüklemeyi destekliyorsa (örneğin, yapılandırma dosyalarını yeniden yükleme):

```bash
sudo systemctl reload [hizmet-adı]
```

---

### 5. Hizmetler İçin Günlükleri Kontrol Etme

Sistem günlükleri, başlatılamayan veya beklenmedik şekilde davranan hizmetlerin sorunlarını gidermeye yardımcı olabilir. `journalctl` komutu ayrıntılı günlükler sağlar.

#### Belirli Bir Hizmet İçin Günlükleri Görüntüle

Belirli bir hizmet için günlükleri görmek için:

```bash
sudo journalctl -u [hizmet-adı]
```

#### Son Günlükleri Görüntüle

Yalnızca en son günlükleri görmek için:

```bash
sudo journalctl -u [hizmet-adı] --since "1 saat önce"
```

---

### 6. Hizmetleri Maskeleme ve Maskelemeyi Kaldırma

Bir hizmeti maskelemek, manuel veya otomatik olarak başlatılmasını önler. Bu, asla çalışmaması gereken hizmetleri devre dışı bırakmak için yararlıdır.

#### Bir Hizmeti Maskeleyin

Bir hizmeti maskelemek için:

```bash
sudo systemctl mask [hizmet-adı]
```

#### Bir Hizmeti Maskelemeyi Kaldırın

Bir hizmeti maskelemeyi kaldırmak için:

```bash
sudo systemctl unmask [hizmet-adı]
```

---

### 7. Komutlar İçin Takma Adlar Kullanma

Kolaylık olması açısından, sık kullanılan komutlar için takma adlar oluşturabilirsiniz. Örneğin, `.bashrc` dosyanıza şunu ekleyin:

```bash
alias start-service='sudo systemctl start'
alias stop-service='sudo systemctl stop'
alias restart-service='sudo systemctl restart'
alias status-service='systemctl status'
```

Değişiklikleri uygulamak için kabuğu yeniden yükleyin:

```bash
source ~/.bashrc
```

---

### Sonuç

AlmaLinux'ta hizmetleri yönetmek **systemd** ile basittir. Hizmetleri listeliyor, etkinleştiriyor, devre dışı bırakıyor veya sorun gideriyor olun, bu komutlarda ustalaşmak sisteminizin verimli bir şekilde çalışmasını sağlar. Hizmetleri düzenli olarak denetleyerek yalnızca gerekli olanları etkinleştirmek performansı ve güvenliği artırabilir. Bu kılavuzu izleyerek AlmaLinux sisteminizde hizmetleri etkili bir şekilde nasıl yöneteceğinizi öğreneceksiniz.

Daha derinlemesine inceleme için resmi [AlmaLinux belgelerine](https://wiki.almalinux.org/) veya `systemctl` ve `journalctl` için `man` sayfalarına bakın.
