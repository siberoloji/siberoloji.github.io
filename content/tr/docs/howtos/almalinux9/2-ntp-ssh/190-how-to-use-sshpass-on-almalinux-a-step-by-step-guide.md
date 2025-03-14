---
title: AlmaLinux'ta SSHPass Nasıl Kullanılır
description: Bu kılavuzda, AlmaLinux'ta SSHPass'ı nasıl kuracağınızı, yapılandıracağınızı ve kullanacağınızı inceleyeceğiz.
date: 2024-12-09
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: SSHPass
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 190
translationKey: how-to-use-sshpass-on-almalinux9
keywords:
  - AlmaLinux
  - SSHPass
featured_image: /images/almalinux.webp
url: /tr/sshpass-almalinux
---
SSH, Linux kullanıcıları için güvenli iletişimin temel taşıdır ve uzak sistemlere şifreli erişim sağlar. Ancak, otomatik komut dosyalarının manuel müdahale olmadan parola tabanlı SSH oturum açma işlemleri gerektirdiği senaryolar vardır. **SSHPass**, kullanıcıların parolaları doğrudan bir komut satırı arayüzü üzerinden geçirmelerine olanak tanıyan bu tür durumlar için tasarlanmış bir yardımcı programdır.

Bu kılavuzda, CentOS tabanlı sağlam bir kurumsal Linux dağıtımı olan AlmaLinux'ta SSHPass'ı nasıl kuracağınızı, yapılandıracağınızı ve kullanacağınızı inceleyeceğiz.

---

### SSHPass Nedir?

SSHPass, parola tabanlı SSH oturum açma işlemlerini komut satırından etkinleştiren ve parolayı manuel olarak girme gereksinimini ortadan kaldıran basit ve hafif bir araçtır. Bu yardımcı program özellikle şunlar için yararlıdır:

- **Otomasyon**: Kullanıcı girişi olmadan SSH veya SCP komutları gerektiren komut dosyalarını çalıştırma.
- **Eski sistemler**: Yalnızca parola kimlik doğrulamasını destekleyen sistemlerle arayüz oluşturma.

Ancak, **SSHPass dikkatli kullanılmalıdır**, çünkü parolaları betiklerde veya komutlarda saklamak güvenlik açıklarını ortaya çıkarabilir.

---

### Neden SSHPass Kullanmalısınız?

SSHPass şunlar için idealdir:

- **Tekrarlayan SSH görevlerini otomatikleştirme**: Her bağlantı için parolaları manuel olarak girmekten kaçının.
- **Eski kurulumlar**: Açık anahtar kimlik doğrulaması olmayan sunucularla çalışma.
- **Hızlı test**: Geçici kurulumları veya ortamları düzenleme.

Bununla birlikte, mümkün olan her yerde parola tabanlı yöntemler yerine **anahtar tabanlı kimlik doğrulamayı** önceliklendirmeniz her zaman önerilir.

---

### AlmaLinux'ta SSHPass Kullanmaya Yönelik Adım Adım Kılavuz

#### Önkoşullar

Başlamadan önce şunlardan emin olun:

1. AlmaLinux kurulu ve güncel.
2. Yönetici ayrıcalıklarına (`sudo` erişimi) sahip olmalısınız.
3. Hedef sisteme SSH erişiminiz olmalı.

---

### 1. **SSHPass'ı AlmaLinux'a Yükleme**

SSHPass, güvenlik kaygıları nedeniyle AlmaLinux'un varsayılan depolarına dahil edilmemiştir. Ancak alternatif depolarından veya kaynaktan derlenerek yüklenebilir.

#### Seçenek 1: EPEL Deposundan Yükle

1. **EPEL'i Etkinleştir** (Enterprise Linux için Ek Paketler):

```bash
sudo dnf install epel-release
```

2. **SSHPass'i Yükle**:

```bash
sudo dnf install sshpass
```

#### Seçenek 2: Kaynaktan Derle

Yapılandırılmış depolarınızda SSHPass yoksa:

1. **Derleme araçlarını yükle**:

```bash
sudo dnf groupinstall "Geliştirme Araçları"
sudo dnf install wget
```

2. **Kaynak kodunu indir**:

```bash
wget https://sourceforge.net/projects/sshpass/files/latest/download -O sshpass.tar.gz
```

3. **Arşivi çıkarın**:

```bash
tar -xvzf sshpass.tar.gz
cd sshpass-*
```

4. **SSHPass'ı derleyin ve yükleyin**:

```bash
./configure
make
sudo make install
```

Yüklemeyi şu komutu çalıştırarak doğrulayın:

```bash
sshpass -V
```

---

### 2. **SSHPass'ın Temel Kullanımı**

SSHPass, komutun bir parçası olarak parolanın iletilmesini gerektirir. Aşağıda yaygın kullanım örnekleri verilmiştir.

#### Örnek 1: Temel SSH Bağlantısı

Uzak bir sunucuya parola kullanarak bağlanmak için:

```bash
sshpass -p 'your_password' ssh user@remote-server
```

Şunu değiştirin:

- `your_password` uzak sunucunun parolasıyla.
- `user@remote-server` uygun kullanıcı adı ve ana bilgisayar adı/IP ile.

#### Örnek 2: Dosya Aktarımı için SCP Kullanımı

SSHPass, SCP üzerinden dosya aktarımlarını basitleştirir:

```bash
sshpass -p 'your_password' scp local_file user@remote-server:/remote/directory/
```

#### Örnek 3: Bir Dosyadan Parolaları Okuma

Gelişmiş güvenlik için, komut satırına doğrudan parola yazmaktan kaçının. Parolayı bir dosyada saklayın:

1. Parolayı içeren bir dosya oluşturun:

```bash
echo "your_password" > password.txt
```

2. Parolayı okumak için SSHPass'i kullanın:

```bash
sshpass -f password.txt ssh user@remote-server
```

Parola dosyasının güvenli olduğundan emin olun:

```bash
chmod 600 password.txt
```

---

### 3. **SSHPass ile SSH Görevlerini Otomatikleştirme**

SSHPass, özellikle betiklerdeki görevleri otomatikleştirmek için kullanışlıdır. İşte bir örnek:

#### Örnek: Uzaktan Komutları Otomatikleştirin

Uzak bir sunucuda komutları yürütmek için bir betik oluşturun:

```bash
#!/bin/bash

PASSWORD="şifreniz"
REMOTE_USER="kullanıcı"
REMOTE_SERVER="uzak-sunucu"
COMMAND="ls -la"

sshpass -p "$PASSWORD" ssh "$REMOTE_USER@$REMOTE_SERVER" "$COMMAND"
```

Betiği kaydedin ve yürütün:

```bash
bash automate_ssh.sh
```

---

### 4. **Güvenlik Hususları**

SSHPass kullanışlı olsa da, beraberinde getirdiği güvenlik riskleri vardır. Riskleri azaltmak için şu en iyi uygulamaları izleyin:

- **Şifreleri sabit kodlamaktan kaçının**: Ortam değişkenleri veya güvenli depolama çözümleri kullanın. - **İzinleri sınırla**: Hassas veriler içeren betiklere veya dosyalara erişimi kısıtlayın.
- **Anahtar tabanlı kimlik doğrulamayı kullanın**: Mümkün olduğunda, daha güvenli ve ölçeklenebilir bir çözüm için SSH anahtar çiftlerine geçin.
- **Şifre dosyalarını güvenli hale getirin**: Şifre dosyalarını korumak için kısıtlayıcı izinler (`chmod 600`) kullanın.

---

### 5. **SSHPass Sorun Giderme**

#### Sorun 1: "İzin reddedildi"

- Uzak sunucunun şifre kimlik doğrulamasına izin verdiğinden emin olun. Gerekirse SSH sunucusu yapılandırmasını (`/etc/ssh/sshd_config`) düzenleyin:

```bash
PasswordAuthentication yes
```

SSH hizmetini yeniden başlatın:

```bash
sudo systemctl restart sshd
```

#### Sorun 2: SSHPass bulunamadı

- SSHPass'in doğru şekilde yüklendiğini doğrulayın. Gerekirse kaynaktan yeniden yükleyin veya derleyin.

#### Sorun 3: Güvenlik uyarıları

- SSHPass, güvenli olmayan parola kullanımıyla ilgili uyarıları tetikleyebilir. Güvenlik uygulamaları izlenirse bunlar göz ardı edilebilir.

---

### SSHPass'a Alternatif Araçlar

Daha güvenli veya özellik açısından zengin alternatifler için:

- **Bekleyin**: Komut satırı programlarıyla etkileşimleri otomatikleştirir.
- **Ansible**: Yapılandırma yönetimini ve SSH görevlerini ölçekte otomatikleştirir.
- **Anahtar Zinciri**: SSH anahtarlarını güvenli bir şekilde yönetir.

---

### Sonuç

SSHPass, otomasyon görevleri veya eski sistemler gibi parola tabanlı SSH erişiminin kaçınılmaz olduğu senaryolar için çok yönlü bir araçtır. Bu kılavuzla, güvenlik en iyi uygulamalarına uyarak AlmaLinux'a SSHPass'ı güvenle yükleyebilir ve kullanabilirsiniz.

SSHPass kolaylık sağlarken, sistemlerinizi ve verilerinizi uzun vadede korumak için her zaman SSH anahtarları gibi daha güvenli kimlik doğrulama yöntemlerine geçiş yapmayı hedefleyin.

Aşağıdaki yorumlarda kullanım durumlarınızı veya ek ipuçlarınızı paylaşmaktan çekinmeyin!
