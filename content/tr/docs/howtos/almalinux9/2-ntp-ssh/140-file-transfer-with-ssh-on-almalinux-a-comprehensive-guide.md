---
title: AlmaLinux'ta SSH ile Dosya Transferinizi Kolaylaştırın
description: Bu kılavuz, AlmaLinux'ta dosya transferleri için SSH'nin nasıl kullanılacağını, kurulumunu, komutlarını ve en iyi uygulamaları ayrıntılı olarak açıklayacaktır.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: SSH ile Dosya Transferi
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 140
translationKey: file-transfer-with-ssh-on-almalinux-a-comprehensive-guide
keywords:
  - AlmaLinux

featured_image: /images/almalinux.webp
url: /tr/file-transfer-ssh-almalinux
---
Dosyaları sistemler arasında güvenli bir şekilde aktarmak geliştiriciler, sistem yöneticileri ve BT profesyonelleri için kritik bir görevdir. SSH (Güvenli Kabuk), SCP (Güvenli Kopyalama Protokolü) ve SFTP (SSH Dosya Aktarım Protokolü) gibi protokolleri kullanarak dosyaları aktarmak için güvenli ve etkili bir yol sağlar. Bu kılavuz, AlmaLinux'ta dosya aktarımları için SSH'nin nasıl kullanılacağını, kurulumu, komutları ve en iyi uygulamaları ayrıntılı olarak açıklayacaktır.

---

### **1. SSH Nedir ve Dosya Aktarımını Nasıl Kolaylaştırır?**

SSH, güvenli olmayan bir ağ üzerinden iletişimi güvence altına alan bir kriptografik protokoldür. SSH, birincil olarak uzak sistem erişimi için kullanılmasının yanı sıra, dosya aktarımlarını şu şekilde destekler:

- **SCP (Güvenli Kopyalama Protokolü):** Dosyaları sistemler arasında güvenli bir şekilde aktarmanın basit bir yolu.
- **SFTP (SSH Dosya Aktarım Protokolü):** SSH'ye yerleştirilmiş daha fazla özellik içeren bir dosya aktarım protokolü.

Her iki yöntem de aktarım sırasında verileri şifreleyerek gizliliği ve bütünlüğü garanti eder.

---

### **2. SSH Dosya Transferleri için Önkoşullar**

Dosyaları transfer etmeden önce:

1. Uzak AlmaLinux sisteminde **OpenSSH Server**'ın kurulu ve çalışır durumda olduğundan emin olun:

```bash
sudo dnf install openssh-server -y
sudo systemctl start sshd
sudo systemctl enable sshd
```

2. SSH istemcisi yerel sisteme kurulu olmalıdır (çoğu Linux dağıtımı bunu varsayılan olarak içerir).
3. Sistemlerde SSH için ağ bağlantısı ve güvenlik duvarı erişimi olmalıdır (varsayılan bağlantı noktası: 22).

---

### **3. Dosya Transferleri için SCP Kullanımı**

#### **SCP Nedir?**

SCP, yerel ve uzak sistemler arasında güvenli dosya kopyalamaya izin veren bir komut satırı aracıdır. Hem verileri hem de kimlik doğrulamasını şifrelemek için SSH protokolünü kullanır.

#### **Temel SCP Sözdizimi**

SCP komutunun temel yapısı şöyledir:

```bash
scp [seçenekler] kaynak hedef
```

#### **SCP Komutlarına Örnekler**

1. **Bir Dosyayı Yerelden Uzaktakine Kopyala:**

```bash
scp file.txt username@remote-ip:/remote/path/
```

- `file.txt`: Aktarılacak yerel dosya.
- `username`: Uzak sistemdeki SSH kullanıcısı.
- `remote-ip`: Uzak sistemin IP adresi veya ana bilgisayar adı.
- `/remote/path/`: Uzak sistemdeki hedef dizin.

2. **Uzaktaki Bir Dosyayı Yerel'e Kopyala:**

```bash
scp username@remote-ip:/remote/path/file.txt /local/path/
```

3. **Bir Dizini Yinelemeli Olarak Kopyala:**
Dizinleri kopyalamak için `-r` bayrağını kullanın:

```bash
scp -r /local/directory username@remote-ip:/remote/path/
```

4. **Özel Bir SSH Bağlantı Noktası Kullanma:**
Uzak sistem standart dışı bir SSH bağlantı noktası kullanıyorsa (örneğin, 2222):

```bash
scp -P 2222 file.txt username@remote-ip:/remote/path/
```

---

### **4. Dosya Transferleri için SFTP Kullanımı**

#### **SFTP Nedir?**

SFTP, FTP'ye benzer ancak SSH ile şifrelenmiş güvenli bir dosya transfer yöntemi sağlar. Uzak dizinlere göz atmanıza, transferleri sürdürmenize ve dosya izinlerini değiştirmenize olanak tanır.

#### **Bir SFTP Oturumu Başlatma**

Uzak bir sisteme şu şekilde bağlanın:

```bash
sftp username@remote-ip
```

Bağlandıktan sonra, SFTP isteminde çeşitli komutları kullanabilirsiniz:

#### **Genel SFTP Komutları**

1. **Dosyaları Listele:**

```bash
ls
```

2. **Dizinlerde Gezinme:**

- Yerel dizini değiştir:

```bash
lcd /local/path/
```

- Uzak dizini değiştir:

```bash
cd /remote/path/
```

3. **Dosyaları Yükle:**

```bash
put localfile.txt /remote/path/
```

4. **Dosyaları İndir:**

```bash
get /remote/path/file.txt /local/path/
```

5. **Dizinleri İndir/Yükle:**
Dizinleri aktarmak için `-r` bayrağını `get` veya `put` ile kullanın.

6. **SFTP'den Çık:**

```bash
exit
```

---

### **5. SSH Anahtarlarıyla Dosya Transferlerini Otomatikleştirme**

Sık dosya transferleri için, SSH anahtarlarını kullanarak **şifresiz kimlik doğrulamayı** yapılandırabilirsiniz. Bu, her transfer için bir şifre girme gereksinimini ortadan kaldırır.

#### **Bir SSH Anahtar Çifti Oluştur**

Yerel sistemde bir anahtar çifti oluşturun:

```bash
ssh-keygen
```

Anahtar çiftini varsayılan konuma (`~/.ssh/id_rsa`) kaydedin.

#### **Genel Anahtarı Uzak Sisteme Kopyalayın**

Genel anahtarı uzak sisteme aktarın:

```bash
ssh-copy-id username@remote-ip
```

Artık parola girmeden SCP veya SFTP kullanabilirsiniz.

---

### **6. SSH Dosya Aktarımlarını Güvence Altına Alma**

Güvenli dosya aktarımlarını sağlamak için:

1. **Güçlü Parolalar veya SSH Anahtarları Kullanın:** Parolalar karmaşık olmalı ve SSH anahtarları tercih edilen bir alternatiftir.
2. **SSH Erişimini Kısıtlayın:** Güvenlik duvarı kurallarını kullanarak SSH'yi belirli IP adresleriyle sınırlayın.

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent
sudo firewall-cmd --reload
```

3. **Varsayılan SSH Portunu Değiştirin:** Otomatik saldırılara maruz kalmayı azaltmak için `/etc/ssh/sshd_config` içindeki SSH portunu değiştirin.

---

### **7. Gelişmiş SSH Dosya Aktarım Teknikleri**

1. **Aktarım Sırasında Dosyaları Sıkıştırın:**
Aktarım sırasında dosyaları sıkıştırmak için SCP ile `-C` bayrağını kullanın:

```bash
scp -C largefile.tar.gz username@remote-ip:/remote/path/
```

2. **Rsync ile Toplu Dosya Aktarımları:**
Gelişmiş senkronizasyon ve büyük dosya aktarımları için SSH üzerinden **rsync** kullanın:

```bash
rsync -avz -e "ssh -p 22" /local/path/ username@remote-ip:/remote/path/
```

3. **Aktarım Hızını Sınırlayın:**
Bant genişliğini kontrol etmek için SCP ile `-l` bayrağını kullanın:

```bash
scp -l 1000 file.txt username@remote-ip:/remote/path/
```

---

### **8. SSH Dosya Aktarımlarında Sorun Giderme**

1. **Kimlik Doğrulama Hataları:**

- Kullanıcı adını ve IP adresini doğrulayın.
- Anahtar tabanlı kimlik doğrulama kullanılıyorsa `ssh-add` kullanılarak SSH anahtarının eklendiğinden emin olun.

2. **Bağlantı Zaman Aşımı:**

- Bağlantıyı `ping` veya `telnet` ile test edin.
- Uzak sistemdeki güvenlik duvarı ayarlarını kontrol edin.

3. **İzin Sorunları:**
Kullanıcının hedef dizinde yazma izinlerine sahip olduğundan emin olun.

---

### **Sonuç**

AlmaLinux'ta SSH kullanarak yapılan dosya aktarımları güvenli, verimli ve çok yönlüdür. SCP'nin basitliğini veya SFTP'nin gelişmiş özelliklerini tercih ediyor olun, bu araçlarda ustalaşmak iş akışlarınızı önemli ölçüde hızlandırabilir. Bu kılavuzu izleyerek ve güvenlik en iyi uygulamalarını uygulayarak, sistemler arasında dosyaları güvenle ve kolayca aktarabilirsiniz.
