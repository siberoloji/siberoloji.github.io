---
title: AlmaLinux'ta Chroot ile SFTP-only Nasıl Kurulur
description: Bu kılavuz, AlmaLinux'ta SFTP-only'in nasıl kurulacağını, kurulumunu, komutlarını ve en iyi uygulamaları ayrıntılı olarak açıklayacaktır.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Chroot ile SFTP-only Nasıl Kurulur
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 170
translationKey: how-to-set-up-sftp-only-with-chroot-on-almalinux
keywords:
  - AlmaLinux
  - Chroot on AlmaLinux

featured_image: /images/almalinux.webp
url: /tr/set-sftp-chroot-almalinux
---
**Güvenli Dosya Aktarım Protokolü (SFTP)**, şifreleme ve kimlik doğrulama için SSH'den yararlanarak dosyaları bir ağ üzerinden aktarmanın güvenli bir yoludur. Chroot ile **yalnızca SFTP ortamı** kurmak, kullanıcıları belirli dizinlerle sınırlayarak ve sunucunun hassas alanlarına erişmelerini önleyerek güvenliği artırır. Bu kılavuz, AlmaLinux'ta Chroot ile yalnızca SFTP erişimini yapılandırma konusunda size yol gösterecek ve güvenli ve izole bir dosya aktarım ortamı sağlayacaktır.

---

### **1. SFTP ve Chroot nedir?**

#### **SFTP**

SFTP, iletişimleri şifrelemek için SSH kullanan güvenli bir dosya aktarım protokolüdür. Verileri düz metin olarak aktaran FTP'nin aksine, SFTP aktarım sırasında dosyaların ve kimlik bilgilerinin korunmasını sağlar.

#### **Chroot**

"Kök değiştir" ifadesinin kısaltması olan Chroot, bir kullanıcıyı veya işlemi belirli bir dizine hapsederek bir "hapishane" ortamı yaratır. Bir kullanıcı oturum açtığında, yalnızca belirlenen dizinine ve alt dizinlerine erişebilir ve bu da onları sistemin geri kalanından etkili bir şekilde izole eder.

---

### **2. Önkoşullar**

SFTP'yi Chroot ile kurmadan önce, aşağıdakileri sağlayın:

1. **AlmaLinux Sunucusu:** Yönetici ayrıcalıklarına sahip çalışan bir örnek.
2. **OpenSSH Kurulu:** SSH sunucusunun kurulu ve çalışır durumda olduğunu doğrulayın:

```bash
sudo dnf install openssh-server -y
sudo systemctl start sshd
sudo systemctl enable sshd
```

3. **Kullanıcı Hesapları:** SFTP erişimi olacak kullanıcıları oluşturun veya tanımlayın.

---

### **3. Adım Adım Kurulum**

#### **Adım 1: SSH'yi Kurun ve Yapılandırın**

OpenSSH'nin kurulu ve güncel olduğundan emin olun:

```bash
sudo dnf update -y
sudo dnf install openssh-server -y
```

#### **Adım 2: SFTP Grubunu Oluşturun**

SFTP kullanıcıları için özel bir grup oluşturun:

```bash
sudo groupadd sftpusers
```

#### **Adım 3: Yalnızca SFTP Kullanıcıları Oluşturun**

Bir kullanıcı oluşturun ve onu SFTP grubuna atayın:

```bash
sudo useradd -m -s /sbin/nologin -G sftpusers sftpuser
```

- `-m`: Kullanıcı için bir ana dizin oluşturur. - `-s /sbin/nologin`: SSH kabuğuna erişimi engeller.
- `-G sftpusers`: Kullanıcıyı SFTP grubuna ekler.

Kullanıcı için bir parola belirleyin:

```bash
sudo passwd sftpuser
```

#### **4. Adım: SFTP için SSH Sunucusunu Yapılandırın**

SSH sunucusu yapılandırma dosyasını düzenleyin:

```bash
sudo nano /etc/ssh/sshd_config
```

Dosyanın sonuna aşağıdaki satırları ekleyin veya değiştirin:

```plaintext
# SFTP-only Configuration
Match Group sftpusers
ChrootDirectory %h
ForceCommand internal-sftp
AllowTcpForwarding no
X11Forwarding no
```

- `Match Group sftpusers`: Kuralları SFTP grubuna uygular. - `ChrootDirectory %h`: Kullanıcıları ana dizinleriyle sınırlar (`%h` kullanıcının ana dizinini temsil eder).
- `ForceCommand internal-sftp`: Kullanıcıları yalnızca SFTP erişimiyle sınırlar.
- `AllowTcpForwarding no` ve `X11Forwarding no`: Ek güvenlik için gereksiz özellikleri devre dışı bırakın.

Dosyayı kaydedin ve kapatın.

#### **Adım 5: Kullanıcı Dizinlerinde İzinleri Ayarlayın**

Chroot ortamı için sahipliği ve izinleri ayarlayın:

```bash
sudo chown root:root /home/sftpuser
sudo chmod 755 /home/sftpuser
```

Dosya depolama için bir alt dizin oluşturun:

```bash
sudo mkdir /home/sftpuser/uploads
sudo chown sftpuser:sftpusers /home/sftpuser/uploads
```

Bu, kullanıcının yalnızca belirtilen `uploads` dizinine dosya yükleyebildiğinden emin olur.

#### **Adım 6: SSH Hizmetini Yeniden Başlatın**

SSH hizmetini yeniden başlatarak değişiklikleri uygulayın:

```bash
sudo systemctl restart sshd
```

---

### **4. Yapılandırmayı Test Etme**

1. **SFTP ile Bağlan:**
Bir istemci makinesinden, bir SFTP istemcisi kullanarak sunucuya bağlanın:

```bash
sftp sftpuser@server-ip
```

2. **Erişim Kısıtlamalarını Doğrulayın:**

- Kullanıcının yalnızca `uploads` dizinine erişebildiğinden ve Chroot ortamının dışına çıkamadığından emin olun.
- SSH kabuğuna erişim denemesi "izin reddedildi" hatasıyla sonuçlanmalıdır.

---

### **5. Gelişmiş Yapılandırmalar**

#### **1. Dosya Yükleme Boyutlarını Sınırla**

Yükleme boyutlarını sınırlamak için kullanıcının kabuk sınırlarını değiştirin:

```bash
sudo nano /etc/security/limits.conf
```

Aşağıdaki satırları ekleyin:

```plaintext
sftpuser hard fsize 10485760 # 10MB limit
```

#### **2. SFTP Oturumları için Günlük Kaydını Etkinleştir**

Kullanıcı etkinliklerini izlemek için günlük kaydını etkinleştirin:

1. SSH yapılandırma dosyasını aşağıdakileri içerecek şekilde düzenleyin:

```plaintext
Alt sistem sftp /usr/libexec/openssh/sftp-server -l BİLGİ
```

2. SSH'yi yeniden başlatın:

```bash
sudo systemctl restart sshd
```

Günlükler `/var/log/secure` dizininde mevcut olacaktır.

---

### **6. Yaygın Sorunları Giderme**

1. **SFTP Girişi Başarısız Oluyor:**

- Kullanıcının ana dizin sahipliğini doğrulayın:

```bash
sudo chown root:root /home/sftpuser
```

- `/etc/ssh/sshd_config` dosyasında yazım hatalarını kontrol edin.

2. **Dosya Yüklemeleri İçin İzin Reddedildi:**
`uploads` dizininin kullanıcı tarafından yazılabilir olduğundan emin olun:

```bash
sudo chmod 755 /home/sftpuser/uploads
sudo chown sftpuser:sftpusers /home/sftpuser/uploads
```

3. **ChrootDirectory Hatası:**
Chroot dizin izinlerinin SSH gereksinimlerini karşıladığını doğrulayın:

```bash
sudo chmod 755 /home/sftpuser
sudo chown root:root /home/sftpuser
```

---

### **7. Güvenlik En İyi Uygulamaları**

1. **Kullanıcı Erişimini Kısıtla:**
Kullanıcıların belirlenen dizinlerle sınırlı olduğundan ve asgari izinlere sahip olduğundan emin olun. 2. **İki Faktörlü Kimlik Doğrulamayı (2FA) Etkinleştirin:**
SFTP kullanıcıları için 2FA'yı etkinleştirerek ekstra bir güvenlik katmanı ekleyin.
3. **Günlükleri Düzenli Olarak İzleyin:**
Şüpheli etkinlikler için `/var/log/secure` dosyasını inceleyin.
4. **Standart Olmayan Bir SSH Bağlantı Noktası Kullanın:**
Otomatik saldırıları azaltmak için `/etc/ssh/sshd_config` dosyasındaki varsayılan SSH bağlantı noktasını değiştirin:

```plaintext
Bağlantı Noktası 2222
```

---

### **Sonuç**

AlmaLinux'ta Chroot ile yalnızca SFTP erişimini yapılandırmak, sunucunuzu güvence altına almanın ve kullanıcıların yalnızca belirlenen dizinlerine erişebilmelerini sağlamanın güçlü bir yoludur. Bu kılavuzu izleyerek, güvenliğe ve kullanılabilirliğe öncelik veren sağlam bir dosya aktarım ortamı kurabilirsiniz. Gelişmiş yapılandırmaları uygulamak ve güvenlik en iyi uygulamalarına uymak, sunucunuzun korumasını daha da artıracaktır.
