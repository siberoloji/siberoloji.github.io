---
title: AlmaLinux'ta SSH Sunucusu için Parola Kimlik Doğrulaması Nasıl Kurulur
description: Bu kılavuz, AlmaLinux'taki SSH sunucunuz için parola doğrulamasının nasıl ayarlanacağını gösterecektir.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: SSH Sunucusu için Parola Kimlik Doğrulaması Nasıl Kurulur
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 130
translationKey: how-to-set-up-password-authentication-for-ssh-server-on-almalinux
keywords:
  - AlmaLinux
  - password authentication
featured_image: /images/almalinux.webp
url: /tr/set-password-authentication-ssh-server-almalinux
---
SSH (Güvenli Kabuk), uzak sunuculara güvenli bir şekilde erişmek ve onları yönetmek için temel bir araçtır. Gelişmiş güvenlik için genel anahtar kimlik doğrulaması önerilirken, **parola kimlik doğrulaması** özellikle daha küçük dağıtımlar veya test ortamları için SSH erişimi için basit ve yaygın olarak kullanılan bir yöntemdir. Bu kılavuz, AlmaLinux'taki SSH sunucunuz için parola kimlik doğrulamasını nasıl ayarlayacağınızı gösterecektir.

---

### **1. SSH'de Parola Kimlik Doğrulaması Nedir?**

Parola kimlik doğrulaması, kullanıcıların bir kullanıcı adı ve parola girerek bir SSH sunucusuna erişmesini sağlar. Anahtar tabanlı kimlik doğrulamasından daha basittir ancak düzgün şekilde yapılandırılmazsa daha az güvenli olabilir. Parola politikalarınızı güçlendirmek ve diğer güvenlik önlemlerini etkinleştirmek riskleri azaltabilir.

---

### **2. Önkoşullar**

Parola kimlik doğrulamasını ayarlamadan önce:

1. **AlmaLinux**'un kurulu ve güncel olduğundan emin olun.
2. Yönetici erişimine sahip olun (root veya `sudo` ayrıcalıklarına sahip bir kullanıcı). 3. SSH sunucunuzun varsayılan portuna (22) veya kullanılan özel porta erişimi açın.

---

### **3. Adım Adım Parola Kimlik Doğrulamasını Etkinleştirme Kılavuzu**

#### **Adım 1: OpenSSH Sunucusunu Yükleyin**

SSH henüz yüklü değilse, paket yöneticisini kullanarak yükleyebilirsiniz:

```bash
sudo dnf install openssh-server -y
```

SSH hizmetini başlatın ve etkinleştirin:

```bash
sudo systemctl start sshd
sudo systemctl enable sshd
```

Çalıştığından emin olmak için SSH hizmetinin durumunu kontrol edin:

```bash
sudo systemctl status sshd
```

#### **Adım 2: SSH'yi Parola Kimlik Doğrulamasına İzin Verecek Şekilde Yapılandırın**

SSH sunucusu yapılandırma dosyası `/etc/ssh/sshd_config` konumunda bulunur. Parola doğrulamasını etkinleştirmek için bu dosyayı düzenleyin:

```bash
sudo nano /etc/ssh/sshd_config
```

Dosyada aşağıdaki satırları arayın:

```plaintext
#PasswordAuthentication yes
```

Satırın yorumunu kaldırın ve şunu yazdığından emin olun:

```plaintext
PasswordAuthentication yes
```

Ayrıca, çakışmaları önlemek için `ChallengeResponseAuthentication` öğesinin `no` olarak ayarlandığından emin olun:

```plaintext
ChallengeResponseAuthentication no
```

`PermitRootLogin` ayarı mevcutsa, güvenlik nedeniyle kök oturum açmayı devre dışı bırakmanız önerilir:

```plaintext
PermitRootLogin no
```

Dosyayı kaydedin ve kapatın.

#### **Adım 3: SSH Hizmetini Yeniden Başlatın**

Yapılandırma dosyasını değiştirdikten sonra, değişiklikleri uygulamak için SSH hizmetini yeniden başlatın:

```bash
sudo systemctl restart sshd
```

---

### **4. Parola Kimlik Doğrulamasını Doğrulama**

#### **Adım 1: SSH Oturum Açmayı Test Etme**

Uzak bir sistemden, SSH kullanarak sunucunuza oturum açmayı deneyin:

```bash
ssh username@server-ip
```

İstendiğinde parolanızı girin. Yapılandırma doğruysa, oturum açabilmeniz gerekir.

#### **Adım 2: Oturum Açma Sorunlarını Ayıklama**

Oturum açma başarısız olursa:

1. Kullanıcı adı ve parolanın doğru olduğunu onaylayın. 2. Sunucudaki SSH günlüklerinde hata olup olmadığını kontrol edin:

```bash
sudo journalctl -u sshd
```

3. 22 numaralı bağlantı noktasının (veya özel bağlantı noktanızın) açık olduğundan emin olmak için güvenlik duvarı ayarlarını doğrulayın.

---

### **5. Parola Kimlik Doğrulamasını Güvence Altına Alma**

Parola kimlik doğrulaması kullanışlı olsa da, anahtar tabanlı kimlik doğrulamasından doğası gereği daha az güvenlidir. Güvenliğini artırmak için şu en iyi uygulamaları izleyin:

#### **1. Güçlü Parolalar Kullanın**

Kullanıcıları harfleri, sayıları ve özel karakterleri birleştiren güçlü parolalar belirlemeye teşvik edin. Bir parola kalite denetleyicisi yüklemeyi düşünün:

```bash
sudo dnf install cracklib-dicts
```

#### **2. Giriş Denemelerini Sınırla**

Tekrarlanan başarısız giriş denemelerini engellemek için **Fail2Ban** gibi araçları yükleyin ve yapılandırın:

```bash
sudo dnf install fail2ban -y
```

`/etc/fail2ban/jail.local` dizininde temel bir SSH filtresi yapılandırın:

```plaintext
[sshd]
enabled = true
maxretry = 5
bantime = 3600
```

Fail2Ban hizmetini yeniden başlatın:

```bash
sudo systemctl restart fail2ban
```

#### **3. Varsayılan SSH Portunu Değiştirin**

SSH için standart olmayan bir port kullanmak otomatik saldırıları azaltabilir:

1. SSH yapılandırma dosyasını düzenleyin:

```bash
sudo nano /etc/ssh/sshd_config
```

2. Portu değiştirin:

```plaintext
Port 2222
```

3. Güvenlik duvarını yeni porta izin verecek şekilde güncelleyin:

```bash
sudo firewall-cmd --permanent --add-port=2222/tcp
sudo firewall-cmd --reload
```

#### **4. Yalnızca Belirli IP'lerden Erişime İzin Ver**

Güvenlik duvarı kurallarını kullanarak bilinen IP aralıklarıyla SSH erişimini sınırlayın:

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent
sudo firewall-cmd --reload
```

#### **5. İki Faktörlü Kimlik Doğrulamayı Etkinleştir (İsteğe Bağlı)**

Ek güvenlik için Google Authenticator gibi bir araç kullanarak iki faktörlü kimlik doğrulamayı (2FA) yapılandırın:

```bash
sudo dnf install google-authenticator -y
```

---

### **6. Yaygın Sorunları Giderme**

1. **SSH Hizmeti Çalışmıyor:**
Hizmet durumunu kontrol edin:

```bash
sudo systemctl status sshd
```

2. **Kimlik Doğrulama Başarısız:**
`/etc/ssh/sshd_config` içindeki ayarları doğrulayın ve yazım yanlışı olmadığından emin olun.

3. **Güvenlik Duvarı SSH'yi Engelliyor:**
Güvenlik duvarının SSH trafiğine izin verdiğinden emin olun:

```bash
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

4. **Bağlantı Zaman Aşımı:**
`ping` veya `telnet` kullanarak sunucuya olan ağ bağlantısını test edin.

---

### **Sonuç**

AlmaLinux'ta bir SSH sunucusu için parola kimlik doğrulaması ayarlamak basittir ve güvenli uzaktan erişim için basit bir yöntem sağlar. Kullanışlı olsa da, oturum açma girişimlerini sınırlama, güçlü parolalar kullanma ve mümkün olduğunda iki faktörlü kimlik doğrulamayı etkinleştirme gibi güçlü güvenlik önlemleriyle eşleştirmek önemlidir. Bu kılavuzda özetlenen adımları ve en iyi uygulamaları izleyerek SSH sunucunuzu güvenle yapılandırabilir ve güvence altına alabilirsiniz.
