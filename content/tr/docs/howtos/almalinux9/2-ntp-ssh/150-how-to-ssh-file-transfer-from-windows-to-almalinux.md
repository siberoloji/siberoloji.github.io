---
title: Windows'dan AlmaLinux'a SSH Dosya Transferi Nasıl Yapılır
description: Bu kılavuz, Windows'tan AlmaLinux'a SSH dosya aktarımı için çeşitli yöntemleri ele almaktadır.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Windows'dan AlmaLinux'a SSH Dosya Transferi Nasıl Yapılır
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 150
translationKey: how-to-ssh-file-transfer-from-windows-to-almalinux
keywords:
  - AlmaLinux
  - SSH
featured_image: /images/almalinux.webp
url: /tr/ssh-file-transfer-windows-almalinux
---
Bir Windows makinesi ile bir AlmaLinux sunucusu arasında dosyaları güvenli bir şekilde aktarmak SSH (Güvenli Kabuk) kullanılarak gerçekleştirilebilir. SSH, veri bütünlüğünü ve güvenliğini sağlamak için şifreli bir bağlantı sağlar. Windows kullanıcıları, dosya transferlerini gerçekleştirmek için **WinSCP**, **PuTTY** veya yerel PowerShell komutları gibi araçları kullanabilir. Bu kılavuz, Windows'tan AlmaLinux'a SSH dosya transferi için çeşitli yöntemleri ele almaktadır.

---

### 1. Önkoşullar

Dosya transferlerini başlatmadan önce:

1. **AlmaLinux Sunucusu:**

- SSH sunucusunun (`sshd`) kurulu ve çalışır durumda olduğundan emin olun:

```bash
sudo dnf install openssh-server -y
sudo systemctl start sshd
sudo systemctl enable sshd
```

- SSH'nin erişilebilir olduğunu doğrulayın:

```bash
ssh username@server-ip
```

2. **Windows Sistemi:**

- **WinSCP** veya **PuTTY** (ikisi de ücretsiz) gibi SSH dosya transferleri için bir araç yükleyin.
- AlmaLinux sunucusunun IP adresinin veya ana bilgisayar adının Windows'tan erişilebilir olduğundan emin olun.

3. **Ağ Yapılandırması:**

- AlmaLinux sunucusu güvenlik duvarında 22 numaralı portu (varsayılan SSH portu) açın:

```bash
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

---

### 2. Yöntem 1: WinSCP Kullanımı

#### 1. Adım: WinSCP'yi Yükleyin

1. **WinSCP'yi** [resmi web sitesinden](https://winscp.net/) indirin.
2. Windows sisteminize yükleyin.

#### 2. Adım: AlmaLinux'a Bağlanın

1. WinSCP'yi açın ve yeni bir oturum oluşturun:

- **Dosya Protokolü:** SFTP (veya SCP).
- **Ana Bilgisayar Adı:** AlmaLinux sunucusunun IP adresi veya ana bilgisayar adı.
- **Bağlantı Noktası Numarası:** 22 (varsayılan SSH portu). - **Kullanıcı Adı:** AlmaLinux kullanıcı adınız.
- **Şifre:** Şifreniz veya SSH anahtarınız (yapılandırılmışsa).

2. Bağlantıyı kurmak için **Oturum Aç**'a tıklayın.

#### 3. Adım: Dosyaları Aktar

- **Dosyaları Yükle:** Dosyaları sol panelden (Windows) sağ panele (AlmaLinux) sürükleyip bırakın.
- **Dosyaları İndir:** Dosyaları AlmaLinux panelinden yerel Windows dizininize sürükleyin.
- **İzinleri Değiştir:** İzinleri değiştirmek için sunucudaki bir dosyaya sağ tıklayın.

#### Ek Özellikler

- Toplu dosya aktarımları için dizinleri senkronize edin.
- Hızlı erişim için kaydedilmiş oturumları yapılandırın.

---

### 3. Yöntem 2: PuTTY (PSCP) Kullanımı

PuTTY'nin SCP istemcisi (`pscp`) komut satırı dosya aktarımlarını etkinleştirir.

#### Adım 1: PuTTY Araçlarını İndirin

1. PuTTY'yi [resmi siteden](https://www.putty.org/) indirin.
2. Kolay komut satırı erişimi için **pscp.exe** dosyasının sisteminizin PATH ortam değişkenine eklendiğinden emin olun.

#### Adım 2: Dosyaları Aktarmak İçin PSCP Kullanın

1. Windows Komut İstemi'ni veya PowerShell'i açın.
2. Bir dosyayı Windows'tan AlmaLinux'a kopyalamak için:

```bash
pscp C:\path\to\file.txt username@server-ip:/remote/directory/
```

3. Bir dosyayı AlmaLinux'tan Windows'a kopyalamak için:

```bash
pscp username@server-ip:/remote/directory/file.txt C:\local\path\
```

#### Avantajlar

- Tek dosyalı aktarımlar için hafif ve hızlı.
- Otomasyon için betiklerle iyi bütünleşir.

---

### 4. Yöntem 3: Yerel PowerShell SCP

Windows 10 ve sonraki sürümler, SCP komutlarının doğrudan PowerShell'de kullanılmasına izin veren bir OpenSSH istemcisi içerir.

#### Adım 1: OpenSSH İstemci Kurulumunu Doğrulayın

1. PowerShell'i açın ve çalıştırın:

```bash
ssh
```

SSH komutları kullanılamıyorsa, OpenSSH istemcisini yükleyin:

- **Ayarlar > Uygulamalar > İsteğe Bağlı Özellikler**'e gidin.
- **OpenSSH İstemcisi**'ni arayın ve yükleyin.

#### Adım 2: Dosya Aktarımları için SCP Kullanın

1. AlmaLinux'a bir dosya yüklemek için:

```bash
scp C:\path\to\file.txt username@server-ip:/remote/directory/
```

2. AlmaLinux'tan bir dosya indirmek için:

```bash
scp username@server-ip:/remote/directory/file.txt C:\local\path\
```

#### Avantajlar

- Ek yazılım gerekmez. - Unix tabanlı sistemlerin kullanıcıları için bilindik sözdizimi.

---

### 5. Yöntem 4: FileZilla Kullanımı

**FileZilla**, SSH dosya transferlerini destekleyen grafiksel bir SFTP istemcisidir.

### 1. Adım: FileZilla'yı yükleyin**

1. FileZilla'yı [resmi web sitesinden](https://filezilla-project.org/) indirin.
2. Windows sisteminize yükleyin.

### 2. Adım: Bağlantıyı Yapılandırın**

1. FileZilla'yı açın ve **Dosya > Site Yöneticisi**'ne gidin.
2. Aşağıdaki ayrıntılarla yeni bir site oluşturun:

- **Protokol:** SFTP - SSH Dosya Transfer Protokolü.
- **Ana Bilgisayar:** AlmaLinux sunucusunun IP adresi.
- **Bağlantı Noktası:** 22.
- **Oturum Açma Türü:** Normal veya Anahtar Dosyası.
- **Kullanıcı:** AlmaLinux kullanıcı adı. - **Parola:** Özel SSH anahtarınızın parolası veya yolu.

3. AlmaLinux sunucunuza erişmek için **Bağlan**'a tıklayın.

### 3. Adım: Dosyaları Aktar

- Windows ve AlmaLinux arasında dosya aktarmak için sürükle ve bırak arayüzünü kullanın.
- FileZilla aktarım kuyruğunda aktarım ilerlemesini izleyin.

---

### **6. Güvenli Dosya Aktarımları için En İyi Uygulamalar**

1. **Güçlü Parolalar Kullanın:** Tüm hesapların karmaşık, benzersiz parolalar kullandığından emin olun.
2. **SSH Anahtar Kimlik Doğrulamasını Etkinleştirin:** Gelişmiş güvenlik için parola tabanlı kimlik doğrulamayı SSH anahtarlarıyla değiştirin.
3. **SSH Erişimini Sınırlayın:** SSH erişimini belirli IP adresleriyle sınırlayın.

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent
sudo firewall-cmd --reload
```

4. **Varsayılan SSH Portunu Değiştirin:** Standart olmayan bir port kullanarak kaba kuvvet saldırılarına maruz kalmayı azaltın.

---

### **7. Yaygın Sorunları Giderme**

1. **Bağlantı Zaman Aşımı:**

- `ping server-ip` ile ağ bağlantısını doğrulayın.
- Sunucu güvenlik duvarında 22 numaralı portun açık olduğundan emin olun.

2. **Kimlik Doğrulama Hataları:**

- Doğru kullanıcı adı ve parolanın kullanıldığından emin olun.
- Anahtarlar kullanılıyorsa, anahtar çiftinin eşleştiğini ve izinlerin düzgün şekilde ayarlandığını doğrulayın.

3. **Aktarım Kesintileri:**

- Büyük dosyalar için aktarımları otomatik olarak sürdürmek üzere `rsync` kullanın:

```bash
rsync -avz -e ssh C:\path\to\file.txt username@server-ip:/remote/directory/
```

---

### **Sonuç**

SSH kullanarak Windows ve AlmaLinux arasında dosya aktarımı yapmak güvenli ve verimli iletişimi garanti eder. WinSCP, PuTTY, FileZilla veya yerel SCP komutları gibi araçlarla iş akışınıza en uygun yöntemi seçebilirsiniz. Bu kılavuzda özetlenen adımları ve en iyi uygulamaları izleyerek güvenli dosya aktarımlarını güvenle gerçekleştirebileceksiniz.
