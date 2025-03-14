---
title: AlmaLinux'ta SSH-Agent Nasıl Kullanılır
description: Bu kılavuz, AlmaLinux'ta SSH-Agent'ı kullanma, yapılandırma ve kullanma konusunda size yol gösterecektir.
date: 2024-12-09
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: SSH-Agent AlmaLinux'ta Nasıl Kullanılır
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 180
translationKey: how-to-use-ssh-agent-on-almalinux9
keywords:
  - AlmaLinux
  - SSH-Agent
featured_image: /images/almalinux.webp
url: /tr/how-to-use-ssh-agent-on-almalinux9
---
SSH-Agent, SSH anahtarlarınızı etkili bir şekilde yöneterek uzak sistemlere güvenli erişimi kolaylaştıran güçlü bir araçtır. Kararlılık ve kurumsal hazırlığa odaklanan popüler bir CentOS alternatifi olan AlmaLinux kullanıyorsanız, SSH-Agent'ı kurmak ve kullanmak iş akışınızı önemli ölçüde iyileştirebilir. Bu kılavuzda, AlmaLinux'ta SSH-Agent'ı kurma, yapılandırma ve kullanma adımlarında size yol göstereceğiz.

---

#### SSH-Agent Nedir?

SSH-Agent, özel SSH anahtarlarınızı bellekte tutan bir arka plan programıdır, böylece uzak sunuculara bağlanırken parolanızı tekrar tekrar girmenize gerek kalmaz. Bu yardımcı program, sistem yöneticileri, geliştiriciler ve günlük olarak birden fazla SSH bağlantısını yöneten herkes için özellikle faydalıdır.

Bazı önemli avantajlar şunlardır:

- **Kolaylık**: Güvenliği tehlikeye atmadan kimlik doğrulamayı otomatikleştirir.
- **Güvenlik**: Özel anahtarları diskte açığa çıkarmak yerine bellekte şifrelenmiş halde tutar. - **Verimlilik**: Özellikle otomasyon araçları kullanırken veya birden fazla sunucuyu yönetirken iş akışlarını hızlandırır.

---

#### AlmaLinux'ta SSH-Agent'ı Kullanmaya Yönelik Adım Adım Kılavuz

Aşağıda, kurulumunuzun güvenli ve verimli olduğundan emin olarak AlmaLinux'ta SSH-Agent'ı kurma ve kullanma sürecinde size rehberlik edeceğiz.

---

### 1. **SSH'yi Kurun ve Bağımlılıkları Kontrol Edin**

Çoğu AlmaLinux kurulumu SSH önceden kurulu olarak gelir. Ancak, varlığını doğrulamak ve gerekirse güncellemek iyi bir uygulamadır.

1. **SSH'nin kurulu olup olmadığını kontrol edin**:

```bash
ssh -V
```

Bu komut, kurulu OpenSSH sürümünü döndürmelidir. Aksi takdirde, SSH paketini yükleyin:

```bash
sudo dnf install openssh-clients
```

2. **AlmaLinux'un güncel olduğundan emin olun**:
Düzenli güncellemeler güvenliği ve uyumluluğu garanti eder.

```bash
sudo dnf update
```

---

### 2. **Bir SSH Anahtarı Oluşturun (Eğer Yoksa)**

SSH-Agent'ı kullanmadan önce, özel-genel bir anahtar çiftine ihtiyacınız olacak. Zaten bir tane varsa, bu adımı atlayabilirsiniz.

1. **Yeni bir SSH anahtar çifti oluşturun**:

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Bu komut, 4096 bitlik bir RSA anahtarı oluşturur. Tanımlama için `"your_email@example.com"` yerine e-posta adresinizi koyabilirsiniz.

2. **İstemleri izleyin**:

- Anahtarı kaydetmek için bir dosya belirtin (veya varsayılan konum olan `~/.ssh/id_rsa` için Enter'a basın).
- İstendiğinde güçlü bir parola girin.

3. **Anahtarlarınızı kontrol edin**:
Anahtarların varsayılan dizinde olduğunu doğrulayın:

```bash
ls ~/.ssh
```

---

### 3. **SSH-Agent'a Anahtarları Başlatın ve Ekleyin**

Artık anahtarlarınız hazır olduğuna göre, SSH-Agent'ı başlatabilir ve anahtarlarınızı yükleyebilirsiniz.

1. **SSH-Agent'ı Başlatın**:
Çoğu durumda, SSH-Agent otomatik olarak başlatılır. Manuel olarak başlatmak için:

```bash
eval "$(ssh-agent -s)"
```

Bu komut, çalışan SSH-Agent'ın işlem kimliğini çıktı olarak verecektir.

2. **Özel anahtarınızı SSH-Agent'a ekleyin**:

```bash
ssh-add ~/.ssh/id_rsa
```

İstendiğinde parolanızı girin. SSH-Agent artık şifresi çözülmüş özel anahtarınızı bellekte saklayacaktır.

3. **Eklenen anahtarları doğrulayın**:
Anahtarlarınızın yüklendiğini doğrulamak için aşağıdaki komutu kullanın:

```bash
ssh-add -l
```

---

### 4. **Otomatik SSH-Agent Başlatmasını Yapılandır**

SSH-Agent'ı her seferinde manuel olarak başlatmaktan kaçınmak için, oturum açıldığında otomatik olarak başlatılacak şekilde yapılandırabilirsiniz.

1. **Kabuk yapılandırma dosyanızı değiştirin**:
Kabuğunuza (örneğin, Bash) bağlı olarak, ilgili yapılandırma dosyasını (`~/.bashrc`, `~/.zshrc`, vb.) düzenleyin:

```bash
nano ~/.bashrc
```

2. **Aşağıdaki satırları ekleyin**:

```bash
# Çalışmıyorsa SSH-Agent'ı başlatın
if [ -z "$SSH_AUTH_SOCK" ]; then
eval "$(ssh-agent -s)"
fi
```

3. **Kabuk yapılandırmasını yeniden yükleyin**:

```bash
source ~/.bashrc
```

Bu kurulum, SSH-Agent'ın manuel müdahale olmadan her zaman kullanılabilir olmasını sağlar.

---

### 5. **Uzak Bağlantılarla SSH-Agent'ı Kullanın**

SSH-Agent çalışırken, uzak sunuculara sorunsuz bir şekilde bağlanabilirsiniz.

1. **Ortak anahtarınızın uzak sunucuya eklendiğinden emin olun**:
Ortak anahtarınızı (`~/.ssh/id_rsa.pub`) uzak sunucuya kopyalayın:

```bash
ssh-copy-id user@remote-server
```

`user@remote-server`'ı uygun kullanıcı adı ve sunucu adresiyle değiştirin.

2. **Sunucuya bağlan**:

```bash
ssh user@remote-server
```

SSH-Agent, yüklenen anahtarları kullanarak kimlik doğrulamasını gerçekleştirir.

---

### 6. **Güvenlik En İyi Uygulamaları**

SSH-Agent kullanışlı olsa da, güvenli bir kurulumu sürdürmek çok önemlidir.

- **Güçlü parolalar kullanın**: Özel anahtarınızı her zaman bir parola ile koruyun.
- **Anahtar son kullanma tarihini ayarlayın**: Anahtarlarınız için bir zaman aşımı ayarlamak üzere `ssh-add -t` kullanın:

```bash
ssh-add -t 3600 ~/.ssh/id_rsa
```

Bu örnek, anahtarı bir saat sonra boşaltır.

- **Aracı yönlendirmeyi sınırla**: Anahtarlarınızı tehlikeye atılmış sunuculara ifşa edebileceğinden, kesinlikle gerekli olmadığı sürece aracı yönlendirmeyi (`-A` bayrağı) önleyin.

---

#### AlmaLinux'ta SSH-Agent Sorun Giderme

**Sorun 1: SSH-Agent çalışmıyor**

- Ajanın şu şekilde başlatıldığından emin olun:

```bash
eval "$(ssh-agent -s)"
```

**Sorun 2: Anahtarlar yeniden başlatmadan sonra kalıcı olmuyor**

- Doğru başlatma komutları için `~/.bashrc` veya eşdeğer yapılandırma dosyanızı kontrol edin.

**Sorun 3: İzin reddedildi hataları**

- `~/.ssh` dizininiz için doğru izinleri sağlayın:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
```

---

### Sonuç

SSH-Agent, SSH anahtarlarını verimli bir şekilde yönetmek için olmazsa olmaz bir yardımcı programdır ve AlmaLinux ile entegrasyonu basittir. Bu kılavuzdaki adımları izleyerek güvenli bağlantıları kolaylaştırabilir, kimlik doğrulamayı otomatikleştirebilir ve üretkenliğinizi artırabilirsiniz. İster sunucuları yönetiyor olun ister uygulamalar geliştiriyor olun, SSH-Agent AlmaLinux'ta güvenli ve sorunsuz bir deneyim sağlar.
