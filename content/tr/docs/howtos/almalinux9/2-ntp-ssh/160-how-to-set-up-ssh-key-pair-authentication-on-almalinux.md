---
title: SSH Anahtar Çifti Kimlik Doğrulaması AlmaLinux'ta Ayarlama
description: Bu kılavuz, AlmaLinux'taki SSH sunucunuzda SSH anahtar çifti kimlik doğrulamasının nasıl ayarlanacağını gösterir.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: SSH Anahtar Çifti Kimlik Doğrulaması AlmaLinux'ta Ayarlama
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 160
translationKey: how-to-set-up-ssh-key-pair-authentication-on-almalinux
keywords:
  - AlmaLinux

featured_image: /images/almalinux.webp
url: /tr/set-ssh-key-pair-authentication-almalinux
---
Güvenli Kabuk (SSH), güvenli uzak sunucu yönetimi için vazgeçilmez bir araçtır. Parola tabanlı kimlik doğrulama basit olsa da, içsel güvenlik açıkları vardır. **SSH anahtar çifti kimlik doğrulaması** daha güvenli ve kullanışlı bir alternatif sunar. Bu kılavuz, AlmaLinux'ta SSH anahtar çifti kimlik doğrulamasını ayarlama, sunucunuzun güvenliğini artırma ve oturum açma işleminizi basitleştirme konusunda size yol gösterecektir.

---

### **1. SSH Anahtar Çifti Kimlik Doğrulaması Nedir?**

SSH anahtar çifti kimlik doğrulaması, geleneksel parola tabanlı oturum açmayı kriptografik anahtarlarla değiştirir. İki anahtar içerir:

- **Genel Anahtar:** Sunucuda saklanır ve başkalarıyla paylaşılır.
- **Özel Anahtar:** İstemci sisteminde güvenli bir şekilde saklanır. Bu anahtarı asla paylaşmayın.

İstemci kimliğini özel anahtarı kullanarak kanıtlar ve sunucu bunu saklanan genel anahtara göre doğrular. Bu yöntem şunları sunar:

- Parolalara kıyasla daha güçlü güvenlik.
- Kaba kuvvet saldırılarına karşı direnç.
- Parola oturum açma işlemlerini tamamen devre dışı bırakma yeteneği.

---

### **2. Önkoşullar**

SSH anahtar kimlik doğrulamasını yapılandırmadan önce:

1. SSH etkinleştirilmiş çalışan bir AlmaLinux sunucusu.
2. Sunucuya yönetici erişimi (root veya sudo kullanıcısı).
3. İstemci sistemine yüklenmiş SSH (Linux, macOS veya OpenSSH veya PuTTY gibi araçlara sahip Windows).

---

### **3. SSH Anahtar Çifti Kimlik Doğrulamasını Ayarlamak İçin Adım Adım Kılavuz**

#### **1. Adım: Bir SSH Anahtar Çifti Oluşturun**

Yerel makinenizde, aşağıdaki komutu kullanarak bir SSH anahtar çifti oluşturun:

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

- `-t rsa`: RSA algoritmasını belirtir. - `-b 4096`: Gelişmiş güvenlik için 4096 bitlik bir anahtar üretir.
- `-C "your_email@example.com"`: Anahtara bir yorum ekler (isteğe bağlı).

İstemleri izleyin:

1. Anahtar çiftini kaydetmek için bir dosya belirtin (varsayılan: `~/.ssh/id_rsa`).
2. (İsteğe bağlı) Ek güvenlik için bir parola belirleyin. Atlamak için Enter'a basın.

Bu iki dosya oluşturur:

- **Özel Anahtar:** `~/.ssh/id_rsa` (bunu güvenli tutun).
- **Genel Anahtar:** `~/.ssh/id_rsa.pub` (paylaşılabilir).

#### **Adım 2: Genel Anahtarı AlmaLinux Sunucusuna Kopyalayın**

Genel anahtarı sunucuya aktarmak için şunu kullanın:

```bash
ssh-copy-id username@server-ip
```

Şunu değiştirin:

- `username`'i AlmaLinux kullanıcı adınızla.
- `server-ip`'i sunucunuzun IP adresiyle.

Bu komut:

1. Genel anahtarı sunucudaki `~/.ssh/authorized_keys` dosyasına ekler.
2. `.ssh` dizini ve `authorized_keys` dosyası için doğru izinleri ayarlar.

Alternatif olarak, anahtarı elle kopyalayın:

1. Genel anahtarı görüntüleyin:

```bash
cat ~/.ssh/id_rsa.pub
```

2. Sunucuda, `~/.ssh/authorized_keys` dosyasına yapıştırın:

```bash
echo "your-public-key-content" >> ~/.ssh/authorized_keys
```

#### **Adım 3: Sunucuda İzinleri Yapılandırın**

`.ssh` dizini ve `authorized_keys` dosyası için doğru izinleri sağlayın:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

#### **Adım 4: Anahtar Tabanlı Kimlik Doğrulamayı Test Edin**

Yerel makinenizden sunucuya bağlanın kullanarak:

```bash
ssh username@server-ip
```

Doğru şekilde yapılandırılırsa, sizden parola istenmeyecektir. Anahtar oluşturma sırasında bir parola ifadesi ayarlanmışsa, bunu girmeniz istenecektir.

---

### **4. SSH Anahtarlarıyla Güvenliği Geliştirme**

#### **1. Parola Kimlik Doğrulamasını Devre Dışı Bırakın**

Anahtar tabanlı kimlik doğrulama çalıştığında, kaba kuvvet saldırılarını önlemek için parola girişini devre dışı bırakın:

1. Sunucudaki SSH yapılandırma dosyasını açın:

```bash
sudo nano /etc/ssh/sshd_config
```

2. Aşağıdaki seçenekleri bulun ve ayarlayın:

```bash
PasswordAuthentication no
ChallengeResponseAuthentication no
```

3. SSH hizmetini yeniden başlatın:

```bash
sudo systemctl restart sshd
```

#### **2. Anahtar Yönetimi için SSH Aracısını Kullanın**

Parolanızı tekrar tekrar girmekten kaçınmak için SSH aracısını kullanın:

```bash
ssh-add ~/.ssh/id_rsa
```

Aracı özel anahtarı bellekte saklar ve oturumunuz sırasında sorunsuz bağlantılara izin verir.

#### **3. Belirli IP'lere Erişimi Kısıtlayın**

Güvenlik duvarını kullanarak güvenilir IP'lere SSH erişimini kısıtlayın:

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent
sudo firewall-cmd --reload
```

#### **4. İki Faktörlü Kimlik Doğrulamayı Yapılandırın (İsteğe Bağlı)**

Ek güvenlik için SSH anahtar tabanlı oturum açma ile iki faktörlü kimlik doğrulamayı (2FA) ayarlayın.

---

### **5. Yaygın Sorunları Giderme**

1. **Anahtar Tabanlı Kimlik Doğrulama Başarısız Oluyor:**

- Genel anahtarın `~/.ssh/authorized_keys` dizinine doğru şekilde eklendiğini doğrulayın.
- `.ssh` dizini ve `authorized_keys` dosyasındaki izinleri kontrol edin.

2. **Bağlantı Reddedildi:**

- SSH hizmetinin çalıştığından emin olun:

```bash
sudo systemctl status sshd
```

- SSH'ye izin vermek için güvenlik duvarı kurallarını kontrol edin.

3. **Parola Sorunları:**

- Parolayı önbelleğe almak için SSH aracısını kullanın:

```bash
ssh-add
```

4. **Hata Ayıklama:**
Ayrıntılı çıktı için `-v` seçeneğini kullanın:

```bash
ssh -v username@server-ip
```

---

### **6. SSH Anahtar Kimlik Doğrulamasının Avantajları**

1. **Gelişmiş Güvenlik:** Parolalardan daha güçlüdür ve kaba kuvvet saldırılarına karşı dayanıklıdır.
2. **Kolaylık:** Kurulduktan sonra oturum açma hızlı ve sorunsuzdur.
3. **Ölçeklenebilirlik:** Merkezi anahtarlarla birden fazla sunucuyu yönetmek için idealdir.

---

### **Sonuç**

SSH anahtar çifti kimlik doğrulaması, AlmaLinux'ta sunucu yöneten herkes için olmazsa olmazdır. Sadece güvenliği artırmakla kalmaz, aynı zamanda oturum açma sürecini basitleştirerek zamandan ve emekten tasarruf sağlar. Bu kılavuzu izleyerek, parola tabanlı kimlik doğrulamasından daha güvenli ve verimli bir SSH anahtar tabanlı kuruluma güvenle geçiş yapabilirsiniz.

Ek yapılandırmalar veya sorun giderme konusunda yardıma ihtiyacınız olursa bana bildirin!
