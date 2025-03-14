---
title: AlmaLinux'ta SSHFS Nasıl Kullanılır
description: Bu kılavuzda, AlmaLinux'ta SSHFS'ı nasıl kuracağınızı, yapılandıracağınızı ve kullanacağınızı inceleyeceğiz.
date: 2024-12-09
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Secure Shell Filesystem (SSHFS)
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 200
translationKey: how-to-use-sshfs-on-almalinux9
keywords:
  - AlmaLinux
  - SSHFS
featured_image: /images/almalinux.webp
url: /tr/sshfs-almalinux
---
Güvenli Kabuk Dosya Sistemi (SSHFS), kullanıcıların uzak dosya sistemlerini bir SSH bağlantısı üzerinden güvenli bir şekilde bağlamasını ve bunlarla etkileşim kurmasını sağlayan güçlü bir yardımcı programdır. SSHFS ile uzak bir dosya sistemini yerel bir sistemmiş gibi ele alabilir ve uzak sunuculardaki dosyalara ve dizinlere sorunsuz erişim sağlayabilirsiniz. Bu işlevsellik özellikle sistem yöneticileri, geliştiriciler ve dağıtılmış sistemlerle çalışan herkes için faydalıdır.

Bu kılavuzda, kurumsal ortamlar için oluşturulmuş kararlı ve güvenli bir Linux dağıtımı olan AlmaLinux'ta SSHFS'yi kurma, yapılandırma ve kullanma adımlarında size yol göstereceğiz.

---

### SSHFS Nedir?

SSHFS, uzak dosya sistemlerini bağlamak için SSH protokolünü kullanan bir FUSE (Kullanıcı Alanında Dosya Sistemi) uygulamasıdır. Uzak bir sunucudaki dosyalarla etkileşim kurmanın güvenli ve kullanışlı bir yolunu sağlar ve bu da onu şu gibi görevler için harika bir araç haline getirir:

- **Dosya Yönetimi**: SCP veya FTP transferlerine ihtiyaç duymadan uzak dosya erişimini basitleştirin. 
- **İş birliği**: Dizinleri gerçek zamanlı olarak sistemler arasında paylaşın.
- **Geliştirme**: Dosyaları doğrudan uzak sunucularda düzenleyin ve test edin.

---

### Neden SSHFS Kullanmalısınız?

SSHFS çeşitli avantajlar sunar:

- **Kullanım Kolaylığı**: Minimum kurulum ve SSH'nin ötesinde ek sunucu tarafı yazılımına gerek yoktur.
- **Güvenlik**: SSH'nin sağlam şifrelemesi üzerine kurulmuştur.
- **Kolaylık**: Uzak kaynaklar için yerel benzeri bir dosya sistemi arayüzü sağlar.
- **Taşınabilirlik**: Çeşitli Linux dağıtımlarında ve diğer işletim sistemlerinde çalışır.

---

### AlmaLinux'ta SSHFS Kullanmaya Yönelik Adım Adım Kılavuz

#### Önkoşullar

Başlamadan önce:

1. AlmaLinux'un kurulu ve güncel olduğundan emin olun:

```bash
sudo dnf update
```

2. Uzak bir sunucuya SSH erişiminiz olsun. 3. Gerekli bağımlılıkları yükleyin (aşağıda açıklanmıştır).

---

### 1. **AlmaLinux'a SSHFS yükleyin**

SSHFS, varsayılan AlmaLinux depolarında bulunan `fuse-sshfs` paketinin bir parçasıdır.

1. **SSHFS paketini yükleyin**:

```bash
sudo dnf install fuse-sshfs
```

2. **Kurulumu doğrulayın**:
Yüklü sürümü kontrol edin:

```bash
sshfs --version
```

Bu komut, SSHFS'nin kullanıma hazır olduğunu doğrulayarak yüklü sürümü döndürmelidir.

---

### 2. **Uzak Dosya Sistemi için Bir Bağlama Noktası Oluşturun**

Bağlama noktası, uzak dosya sisteminin görüneceği yerel bir dizindir.

1. **Bir dizin oluşturun**:
Bağlama noktası için bir konum seçin. Örneğin:

```bash
mkdir ~/remote-files
```

Bu dizin, uzak dosya sistemi için erişim noktası görevi görecektir.

---

### 3. **Uzak Dosya Sistemini Bağlayın**

SSHFS yüklendikten sonra, basit bir komut kullanarak uzak dosya sistemini bağlayabilirsiniz.

#### Temel Bağlama Komutu

1. Aşağıdaki sözdizimini kullanın:

```bash
sshfs user@remote-server:/remote/directory ~/remote-files
```

Şunu değiştirin:

- `user`'ı SSH kullanıcı adınızla.
- `remote-server`'ı sunucunun ana bilgisayar adı veya IP adresiyle.
- `/remote/directory`'yi bağlamak istediğiniz dizinin yoluyla. - Yerel bağlama noktanızla `~/remote-files`.

2. **Örnek**:
Kullanıcı adınız `admin` ise, uzak sunucunun IP'si `192.168.1.10` ise ve `/var/www` bağlamak istiyorsanız, komut şu şekilde olacaktır:

```bash
sshfs admin@192.168.1.10:/var/www ~/remote-files
```

3. **Bağlantıyı doğrulayın**:
Komutu çalıştırdıktan sonra, yerel bağlama noktasının içeriğini listeleyin:

```bash
ls ~/remote-files
```

Uzak dizinin içeriğini görmelisiniz.

---

### 4. **Ek Seçeneklerle Bağlama**

SSHFS, bağlanan dosya sisteminin davranışını özelleştirmek için çeşitli seçenekleri destekler.

#### Örnek: Belirli İzinlerle Bağlama

Dosya ve dizin izinlerini belirtmek için şunu kullanın:

```bash
sshfs -o uid=$(id -u) -o gid=$(id -g) user@remote-server:/remote/directory ~/remote-files
```

#### Örnek: Önbelleğe Almayı Etkinleştir

Daha iyi performans için önbelleğe almayı şununla etkinleştirin:

```bash
sshfs -o cache=yes user@remote-server:/remote/directory ~/remote-files
```

#### Örnek: Belirli Bir SSH Anahtarı Kullan

SSH bağlantınız özel bir özel anahtar gerektiriyorsa:

```bash
sshfs -o IdentityFile=/path/to/private-key user@remote-server:/remote/directory ~/remote-files
```

---

### 5. **Dosya Sistemini Ayırın**

Uzak dosya sistemiyle çalışmayı bitirdiğinizde, bağlantıyı serbest bırakmak için onu ayırın.

1. **Dosya sistemini ayırın**:

```bash
fusermount -u ~/remote-files
```

2. **Ayırma işlemini doğrulayın**:
Boş olduğundan emin olmak için bağlama noktasını kontrol edin:

```bash
ls ~/remote-files
```

---

### 6. **fstab ile Bağlamayı Otomatikleştirin**

Sık kullanım için, yapılandırmayı `/etc/fstab`'a ekleyerek bağlama sürecini otomatikleştirebilirsiniz.

#### Adım 1: fstab Dosyasını Düzenleyin

1. Bir metin düzenleyicide `/etc/fstab`'ı açın:

```bash
sudo nano /etc/fstab
```

2. Aşağıdaki satırı ekleyin:

```bash
user@remote-server:/remote/directory ~/remote-files fuse.sshfs defaults 0 0
```

Kurulumunuz için parametreleri ayarlayın.

#### Adım 2: Yapılandırmayı Test Et

1. Zaten bağlanmışsa dosya sistemini ayırın:

```bash
fusermount -u ~/remote-files
```

2. `mount` kullanarak yeniden bağlayın:

```bash
sudo mount -a
```

---

### 7. **Genel Sorunları Giderme**

#### Sorun 1: "İzin Reddedildi"

- **Neden**: SSH anahtar kimlik doğrulaması veya parola sorunları.
- **Çözüm**: SSH kimlik bilgilerinizi ve sunucu izinlerinizi doğrulayın. Sunucuda parola kimlik doğrulamasının etkin olduğundan emin olun (`/etc/ssh/sshd_config` dosyasında `PasswordAuthentication yes`).

#### Sorun 2: "Taşıma Uç Noktası Bağlı Değil"

- **Neden**: Ağ kesintisi veya sunucu zaman aşımı. - **Çözüm**: Dosya sistemini kaldırın ve yeniden bağlayın:

```bash
fusermount -u ~/remote-files
sshfs user@remote-server:/remote/directory ~/remote-files
```

#### Sorun 3: "SSHFS Komutu Bulunamadı"

- **Neden**: SSHFS yüklü değil.
- **Çözüm**: SSHFS'yi yeniden yükleyin:

```bash
sudo dnf install fuse-sshfs
```

---

### AlmaLinux'ta SSHFS Kullanmanın Avantajları

1. **Güvenlik**: SSHFS, güvenli dosya transferlerini garanti ederek SSH'nin şifreleme ve kimlik doğrulama özelliklerini devralır.
2. **Erişim Kolaylığı**: SSH'nin ötesinde ek bir sunucu tarafı kurulumu gerekmez. 3. **Entegrasyon**: Diğer Linux araçları ve dosya yöneticileriyle sorunsuz bir şekilde çalışır.

---

### Sonuç

SSHFS, AlmaLinux'ta uzak dosya sistemlerine güvenli bir şekilde erişmek ve bunları yönetmek için mükemmel bir araçtır. Bu kılavuzu izleyerek, görevleriniz için SSHFS'yi etkili bir şekilde kurabilir, yapılandırabilir ve kullanabilirsiniz. Uzak sunucuları yönetiyor, ekiplerle işbirliği yapıyor veya geliştirme ortamınızı kolaylaştırıyor olun, SSHFS güvenilir ve güvenli bir çözüm sunar.

SSHFS ile ilgili herhangi bir ipucunuz veya deneyiminiz varsa, bunları aşağıdaki yorumlarda paylaşmaktan çekinmeyin. 
