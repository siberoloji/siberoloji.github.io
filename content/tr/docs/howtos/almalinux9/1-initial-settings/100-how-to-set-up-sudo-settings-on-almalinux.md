---
title: AlmaLinux Sudo Ayarları
description: Bu kılavuz AlmaLinux'ta sudo ayarlarının kurulumu ve değiştirilmesi hakkında detaylı bir açıklama sunmaktadır.
date: 2024-12-05
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Sudo Ayarları
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 100
translationKey: how-to-set-up-sudo-settings-on-almalinux
keywords:
  - AlmaLinux
  - Sudo Settings

featured_image: /images/almalinux.webp
url: /tr/set-sudo-settings-almalinux
---
 
AlmaLinux, güvenilir ve güvenli bir işletim sistemi arayan kuruluşlar ve geliştiriciler için hızla popüler bir seçim haline geldi. Birçok Linux dağıtımı gibi AlmaLinux da yönetim görevlerini güvenli bir şekilde yönetmek için **sudo**'ya güvenir. Sudo'yu düzgün bir şekilde yapılandırarak kullanıcı ayrıcalıklarını kontrol edebilir ve sistemin korunmasını sağlayabilirsiniz. Bu kılavuz, AlmaLinux'ta sudo ayarlarını kurma ve yönetme hakkında bilmeniz gereken her şeyi size anlatacaktır.

---

### Sudo Nedir ve Neden Önemlidir?

"Superuser do"nun kısaltması olan Sudo, kullanıcıların süper kullanıcı (kök) ayrıcalıklarıyla komutları yürütmesine olanak tanıyan bir komut satırı yardımcı programıdır. Güvenlik riskleri oluşturabilen kök kullanıcı olarak oturum açmak yerine, sudo belirli görevler için belirtilen kullanıcılara veya gruplara geçici olarak yükseltilmiş izinler verir. Başlıca avantajları şunlardır:

- **Gelişmiş Güvenlik:** Yetkisiz kullanıcıların sistemin tam kontrolünü ele geçirmesini önler.
- **Daha İyi Denetim:** Hangi kullanıcıların yönetim komutlarını yürüttüğünü izler.
- **Granüler Kontrol:** Kullanıcılar için ihtiyaca göre ince ayarlı izinler sağlar.

AlmaLinux ile sudo ayarlarını yapılandırmak, özellikle çok kullanıcılı ortamlarda sisteminizin güvenli ve yönetilebilir kalmasını sağlar.

---

### Önkoşullar

Sudo yapılandırmasına dalmadan önce, aşağıdakilerden emin olun:

1. **AlmaLinux Kurulu:** Makinenizde veya sunucunuzda AlmaLinux kurulu olmalıdır.

2. **Kök Erişimli Kullanıcı Hesabı:** Sudo'yu yapılandırmak için doğrudan kök erişimi veya sudo ayrıcalıklarına sahip bir kullanıcı gerekir.

3. **Terminal Erişimi:** Linux komut satırına aşinalık faydalıdır.

---

### 1. Adım: Kök Kullanıcı Olarak Oturum Açın veya Mevcut Bir Sudo Kullanıcısını Kullanın

Sudo'yu kurmaya başlamak için kök erişiminiz olması gerekir. Kök kullanıcı olarak oturum açabilir veya halihazırda sudo ayrıcalıklarına sahip bir kullanıcı hesabına geçebilirsiniz.

#### Örnek: Root olarak oturum açma

```bash
ssh root@your-server-ip
```

#### Root Kullanıcısına Geçiş

Normal kullanıcı olarak oturum açtıysanız:

```bash
su -
```

---

### 2. Adım: Sudo Paketini Yükleyin

Çoğu durumda, sudo AlmaLinux'a önceden yüklenmiştir. Ancak, eksikse, aşağıdaki komutu kullanarak yükleyebilirsiniz:

```bash
dnf install sudo -y
```

Sudo'nun yüklendiğini doğrulamak için:

```bash
sudo --version
```

Sudo sürümünün görüntülendiğini görmelisiniz.

---

### 3. Adım: Sudo Grubuna Bir Kullanıcı Ekleyin

Bir kullanıcıya sudo ayrıcalıkları vermek için, onu sudo grubuna ekleyin. Varsayılan olarak, AlmaLinux sudo izinlerini yönetmek için **wheel grubunu** kullanır.

#### Wheel Grubuna Bir Kullanıcı Ekleme

`username` ifadesini gerçek kullanıcı hesap adıyla değiştirin:

```bash
usermod -aG wheel username
```

Kullanıcının grup üyeliğini şu şekilde doğrulayabilirsiniz:

```bash
groups username
```

Çıktı, kullanıcının sudo ayrıcalıklarına sahip olduğunu belirten `wheel` ifadesini içermelidir.

---

### 4. Adım: Sudo Erişimini Test Et

Kullanıcı sudo grubuna eklendikten sonra, erişimini onaylamak önemlidir. Kullanıcıya geçin ve bir sudo komutu çalıştırın:

```bash
su - username
sudo whoami
```

Her şey doğru şekilde yapılandırıldıysa, çıktı şunu göstermelidir:

```bash
root
```

Bu, kullanıcının yükseltilmiş ayrıcalıklarla komutları yürütebileceğini gösterir.

---

### 5. Adım: Sudo İzinlerini Değiştirin

Daha ayrıntılı denetim için, **sudoers dosyasını** kullanarak sudo izinlerini özelleştirebilirsiniz. Bu dosya, hangi kullanıcıların veya grupların sudo'ya hangi koşullar altında erişebileceğini tanımlar.

#### Sudoers Dosyasını Güvenli Şekilde Düzenleme

Sudoers dosyasını düzenlemek için her zaman `visudo` komutunu kullanın. Bu komut, sözdizimi hatalarını kontrol ederek yanlışlıkla yanlış yapılandırmaları önler:

```bash
visudo
```

Sudoers dosyasını tercih ettiğiniz metin düzenleyicide göreceksiniz.

#### Özel İzinler Ekleme

Örneğin, bir kullanıcının parola girmeden tüm komutları çalıştırmasına izin vermek için aşağıdaki satırı ekleyin:

```plaintext
username ALL=(ALL) NOPASSWD: ALL
```

Alternatif olarak, bir kullanıcıyı belirli komutlarla sınırlamak için:

```plaintext
username ALL=(ALL) /path/to/command
```

---

### 6. Adım: Özel Yapılandırmalar için Drop-In Dosyaları Oluşturma

Ana sudoers dosyasını değiştirmek yerine, `/etc/sudoers.d/` dizininde özel yapılandırma dosyaları oluşturabilirsiniz. Bu yaklaşım, yapılandırmaların modüler kalmasına yardımcı olur ve çakışmaları önler.

#### Örnek: Özel Yapılandırma Oluşturma

1. `/etc/sudoers.d/` dizininde yeni bir dosya oluşturun:

```bash
sudo nano /etc/sudoers.d/username
```

2. Aşağıdakiler gibi istenen izinleri ekleyin:

```plaintext
username ALL=(ALL) NOPASSWD: /usr/bin/systemctl
```

3. Dosyayı kaydedin ve çıkın.

4. Yapılandırmayı doğrulayın:

```bash
sudo visudo -c
```

---

### 7. Adım: Sudo Yapılandırmasını Güvence Altına Alın

Sudo'nun güvenli kalmasını sağlamak için şu en iyi uygulamaları izleyin:

1. **Sudo Erişimini Sınırla:** Yalnızca güvenilir kullanıcılara ayrıcalıklar verin.
2. **Günlük Kaydını Etkinleştir:** Komut kullanımını izlemek için sudo günlüklerini kullanın. Günlükleri şu şekilde kontrol edin:

```bash
cat /var/log/secure | grep sudo
```

3. **Düzenli Denetimler:** sudoers dosyasını ve kullanıcı izinlerini düzenli olarak inceleyin.
4. **Varsayılanları Kullanın:** Başarısız girişimlerden sonra kullanıcıları kilitlemek gibi ek güvenlik için sudo varsayılanlarından yararlanın:

```plaintext
Varsayılanlar passwd_tries=3
```

---

### Yaygın Sorunları Giderme

#### 1. **Kullanıcı Sudoer Olarak Tanınmıyor**

- Kullanıcının tekerlek grubunun bir parçası olduğundan emin olun:

```bash
groups username
```

- sudo paketinin kurulu olduğunu doğrulayın.

#### 2. **Sudoers Dosyasındaki Sözdizimi Hataları**

- Hataları kontrol etmek için `visudo` komutunu kullanın:

```bash
sudo visudo -c
```

#### 3. **Komut Reddedildi**

- sudoers dosyasında kullanıcı için belirli komutların kısıtlanıp kısıtlanmadığını kontrol edin.

---

### Sonuç

AlmaLinux'ta sudo'yu kurmak ve yapılandırmak, sistem güvenliğini ve yönetim kontrolünü artıran basit bir işlemdir. Bu kılavuzu izleyerek, yalnızca yetkili kullanıcıların kritik komutlara erişebildiğinden, güvenli bir ortam sağladığından ve sisteminizin yönetimini kolaylaştırdığınızdan emin olabilirsiniz.

En iyi uygulamaları uygulayarak ve izinleri düzenli olarak inceleyerek, sudo'nun faydalarını en üst düzeye çıkarabilir ve AlmaLinux sisteminizin sorunsuz ve güvenli bir şekilde çalışmasını sağlayabilirsiniz.

Aşağıdaki yorumlarda sudo yapılandırmalarıyla ilgili deneyimlerinizi paylaşmaktan veya soru sormaktan çekinmeyin!
