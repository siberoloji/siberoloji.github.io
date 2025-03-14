---
title: AlmaLinux'ta Paralel SSH Nasıl Kullanılır
description: Bu kılavuzda, AlmaLinux'ta Paralel SSH'ı nasıl kuracağınızı, yapılandıracağınızı ve kullanacağınızı inceleyeceğiz.
date: 2024-12-09
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: AlmaLinux'ta Paralel SSH Nasıl Kullanılır
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 220
translationKey: how-to-use-parallel-ssh-on-almalinux-a-step-by-step-guide
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
url: /tr/parallel-ssh-almalinux
---
Birden fazla sunucuyu aynı anda yönetmek, özellikle tekrarlayan komutları yürütürken veya güncellemeleri dağıtırken zorlu bir görev olabilir. Paralel SSH (PSSH), birden fazla uzak sistemde aynı anda komut çalıştırmanızı sağlayarak bu süreci basitleştiren güçlü bir araçtır. Güvenli ve kurumsal düzeyde bir Linux dağıtımı olan AlmaLinux kullanıyorsanız, Paralel SSH kullanmayı öğrenmek verimliliğinizi ve üretkenliğinizi büyük ölçüde artırabilir.

Bu kılavuzda, Paralel SSH'nin ne olduğunu, faydalarını ve AlmaLinux'a nasıl etkili bir şekilde kurulup kullanılacağını inceleyeceğiz.

---

### Paralel SSH Nedir?

Paralel SSH, kullanıcıların komutları yürütmesine, dosyaları kopyalamasına ve birden fazla sunucuyu aynı anda yönetmesine olanak tanıyan bir komut satırı aracıdır. Aşağıdakiler gibi ek yardımcı programları içeren PSSH paketinin bir parçasıdır:

- `pssh`: Birden fazla sunucuda paralel olarak komutları çalıştırın.
- `pscp`: Dosyaları birden fazla sunucuya kopyalayın. - `pslurp`: Birden fazla sunucudan dosya alın.
- `pnuke`: Birden fazla sunucudaki işlemleri sonlandırın.

---

### Paralel SSH Kullanmanın Avantajları

PSSH özellikle şu senaryolarda faydalıdır:

1. **Sistem Yönetimi**: Birden fazla sunucuda yönetim görevlerini otomatikleştirin.
2. **DevOps**: Uygulamalar veya güncellemeler için dağıtım süreçlerini kolaylaştırın.
3. **Küme Yönetimi**: Yüksek performanslı bilgi işlem (HPC) kümelerini yönetin.
4. **Tutarlılık**: Aynı komutun veya betiğin tüm sunucularda düzgün şekilde çalıştığından emin olun.

---

### Önkoşullar

Paralel SSH'ye dalmadan önce aşağıdakilerden emin olun:

1. AlmaLinux kurulu ve güncellenmiş:

```bash
sudo dnf update
```

2. Tüm hedef sunuculara SSH erişiminiz var.
3. Sorunsuz bağlantı için parolasız SSH kimlik doğrulaması ayarlandı.

---

### AlmaLinux'ta Paralel SSH Kullanımına İlişkin Adım Adım Kılavuz

---

### 1. **Paralel SSH Kurulumu**

Paralel SSH, varsayılan AlmaLinux depolarında yer almaz, ancak Python'un paket yöneticisi `pip` kullanarak kurabilirsiniz.

#### Adım 1: Python ve Pip'i yükleyin

1. Python'un yüklendiğinden emin olun:

```bash
sudo dnf install python3 python3-pip
```

2. Kurulumu doğrulayın:

```bash
python3 --version
pip3 --version
```

#### Adım 2: PSSH'yi yükleyin

1. `pip` aracılığıyla Parallel SSH'yi yükleyin:

```bash
pip3 install parallel-ssh
```

2. Kurulumu doğrulayın:

```bash
pssh --version
```

---

### 2. **Şifresiz SSH Kimlik Doğrulamasını Ayarlayın**

Şifresiz SSH kimlik doğrulaması, PSSH'nin sorunsuz çalışması için çok önemlidir.

1. **Bir SSH anahtar çifti oluşturun**:

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

2. **Her hedef sunucuya genel anahtarı kopyalayın**:

```bash
ssh-copy-id user@remote-server
```

`user@remote-server` ifadesini her sunucu için uygun kullanıcı adı ve ana bilgisayar adı/IP ile değiştirin.

3. Bağlantıyı test edin:

```bash
ssh user@remote-server
```

Oturum açmak için parola gerekmediğinden emin olun.

---

### 3. **Bir Hosts Dosyası Oluştur**

Paralel SSH, hosts dosyasında sağlanan hedef sunucuların bir listesini gerektirir.

1. **Hosts dosyasını oluştur**:

```bash
nano ~/hosts.txt
```

2. **Sunucu ayrıntılarını ekle**:
Aşağıdaki biçimde her satıra bir sunucu ekleyin:

```bash
user@server1
user@server2
user@server3
```

Dosyayı kaydedin ve çıkın.

---

### 4. **PSSH Kullanarak Komut Çalıştır**

Hosts dosyası hazır olduğunda, PSSH'yi kullanarak birden fazla sunucuda komut çalıştırmaya başlayabilirsiniz.

#### Örnek 1: Basit Bir Komut Çalıştırın

`uptime` komutunu tüm sunucularda çalıştırın:

```bash
pssh -h ~/hosts.txt -i "uptime"
```

Açıklama:

- `-h`: Hosts dosyasını belirtir.
- `-i`: Sonuçları etkileşimli olarak çıktı olarak verir.

#### Örnek 2: Root Olarak Bir Komut Çalıştırın

Komut `sudo` gerektiriyorsa, etkileşimli parola istemlerini etkinleştirmek için `-A` seçeneğini kullanın:

```bash
pssh -h ~/hosts.txt -A -i "sudo apt update"
```

#### Örnek 3: Özel Bir SSH Anahtarı Kullanın

`-x` seçeneğiyle özel bir SSH anahtarı belirtin:

```bash
pssh -h ~/hosts.txt -x "-i /path/to/private-key" -i "uptime"
```

---

### 5. **PSSH Kullanarak Dosyaları Aktarın**

Paralel SCP (PSCP), dosyaları aynı anda birden fazla sunucuya kopyalamanıza olanak tanır.

#### Örnek: Bir Dosyayı Tüm Sunuculara Kopyala

```bash
pscp -h ~/hosts.txt local-file /remote/destination/path
```

Açıklama:

- `local-file`: Yerel makinenizdeki dosyanın yolu.
- `/remote/destination/path`: Uzak sunuculardaki hedef yolu.

#### Örnek: Tüm Sunuculardan Dosyaları Al

Dosyaları indirmek için `pslurp` kullanın:

```bash
pslurp -h ~/hosts.txt /remote/source/path local-destination/
```

---

### 6. **Gelişmiş Seçenekler ve Kullanım Örnekleri**

#### Komutları Zaman Aşımıyla Çalıştır

Uzun süre çalışan komutları sonlandırmak için bir zaman aşımı ayarlayın:

```bash
pssh -h ~/hosts.txt -t 30 -i "ping -c 4 google.com"
```

#### Paralel Yürütme Sınırı

Eş zamanlı bağlantı sayısını sınırlayın:

```bash
pssh -h ~/hosts.txt -p 5 -i "uptime"
```

Bu örnek aynı anda yalnızca beş sunucuyu işler.

#### Log Komut Çıktısı

Her sunucunun çıktısını bir günlük dosyasına kaydedin:

```bash
pssh -h ~/hosts.txt -o /path/to/logs "df -h"
```

---

### 7. **Paralel SSH Kullanımı İçin En İyi Uygulamalar**

PSSH'nin etkinliğini en üst düzeye çıkarmak için:

1. **Açıklayıcı ana bilgisayar dosyaları kullanın**: Farklı sunucu grupları için ayrı ana bilgisayar dosyaları tutun.
2. **Komutları test edin**: Komutları tüm sistemlerde yürütmeden önce tek bir sunucuda çalıştırın.
3. **Çıktıyı izleyin**: Hataları ayıklamak için günlük özelliğini kullanın.
4. **Çalışma süresini sağlayın**: Komutları çalıştırmadan önce tüm hedef sunucuların çevrimiçi olduğundan emin olun.

---

### 8. **Genel Sorunları Giderme**

#### Sorun 1: "İzin Reddedildi"

- **Neden**: SSH anahtarları doğru şekilde ayarlanmamış.
- **Çözüm**: Parolasız SSH kimlik doğrulamasını yeniden yapılandırın.

#### Sorun 2: "Komut Bulunamadı"

- **Neden**: Hedef sunucularda gerekli komut veya yazılım bulunmuyor.
- **Çözüm**: Komutun tüm sunucularda mevcut olduğundan emin olun.

#### Sorun 3: "Bağlantı Reddedildi"

- **Neden**: Güvenlik duvarı veya ağ sorunları.
- **Çözüm**: SSH erişimini doğrulayın ve `sshd` hizmetinin çalıştığından emin olun:

```bash
sudo systemctl status sshd
```

---

### Paralel SSH'nin Gerçek Dünya Uygulamaları

1. **Sistem Güncellemeleri**:

- Bir kümedeki tüm sunucuları aynı anda güncelleyin.

2. **Uygulama Dağıtımı**:

- Birden fazla sunucuya kod dağıtın veya hizmetleri yeniden başlatın.

3. **Veri Toplama**:

- Dağıtılmış sistemlerden günlükleri veya performans ölçümlerini alın.

4. **Test Ortamları**:

- Yapılandırma değişikliklerini birden fazla test sunucusuna uygulayın.

---

### Sonuç

Paralel SSH, birden fazla sunucuyu verimli bir şekilde yönetmek için vazgeçilmez bir araçtır. PSSH, sistemler arasında komut yürütmeyi, dosya transferlerini ve işlem yönetimini aynı anda etkinleştirerek karmaşık yönetim görevlerini basitleştirir. AlmaLinux kullanıcıları, özellikle sistem yöneticileri ve DevOps profesyonelleri, PSSH'yi iş akışlarına dahil ederek büyük fayda sağlayabilirler.

Bu kılavuzla, AlmaLinux'ta Parallel SSH'yi kurmak, yapılandırmak ve kullanmak için donanımlısınız. Sunucuları güncelliyor, uygulamaları dağıtıyor veya kümeleri yönetiyor olun, PSSH operasyonlarınızı kolaylaştırmak için güçlü ve ölçeklenebilir bir çözüm sunar.

Parallel SSH kullandıysanız veya ek ipuçlarınız varsa, bunları aşağıdaki yorumlarda paylaşmaktan çekinmeyin. İyi otomasyonlar!
