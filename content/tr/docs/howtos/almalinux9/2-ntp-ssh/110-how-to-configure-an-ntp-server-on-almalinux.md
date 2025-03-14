---
title: AlmaLinux'ta NTP Sunucusu Nasıl Yapılandırılır
description: Bu kılavuz AlmaLinux'ta bir NTP sunucusunu adım adım yapılandırma konusunda size yol gösterecektir.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: NTP Sunucusu Nasıl Yapılandırılır
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 110
translationKey: how-to-configure-an-ntp-server-on-almalinux
keywords:
  - AlmaLinux
  - NTP server on AlmaLinux
featured_image: /images/almalinux.webp
url: /tr/configure-ntp-server-almalinux
---
Sunucularda doğru zaman takibi, tutarlı günlük kaydı, güvenlik protokolleri ve sistem operasyonlarını sağlamak için çok önemlidir. Sağlam ve kurumsal düzeyde bir Linux dağıtımı olan AlmaLinux, varsayılan Ağ Zaman Protokolü (NTP) uygulaması olarak **Chrony**'ye güvenir. Bu kılavuz, AlmaLinux'ta bir NTP sunucusunu adım adım yapılandırma konusunda size yol gösterecektir.

---

### 1. **NTP Nedir ve Neden Önemlidir?**

**Ağ Zaman Protokolü (NTP)**, bir ağ üzerinden sistem saatlerini senkronize eder. Doğru zaman senkronizasyonu şunlar için önemlidir:

- Dağıtılmış sistemler arasında olayları koordine etme.
- Günlük zaman damgalarıyla ilgili sorunlardan kaçınma.
- Güvenli iletişim protokollerini sürdürme.

---

### 2. **Önkoşullar**

Başlamadan önce şunlardan emin olun:

1. **Sudo ayrıcalıklarına sahip yeni bir AlmaLinux kurulumu**.
2. **Güvenlik duvarı yapılandırması** etkin ve yönetilebilir. 3. **Chrony paketi** kurulur. Chrony, daha hızlı senkronizasyonu ve daha iyi doğruluğu nedeniyle aralıklı bağlantıları olan sistemler için idealdir.

---

### 3. **NTP Sunucusunu Yapılandırma Adımları**

#### **1. Adım: Sisteminizi Güncelleyin**

Tüm paketlerin güncel olduğundan emin olmak için sistemi güncelleyerek başlayın:

```bash
sudo dnf update -y
```

#### **2. Adım: Chrony'yi Yükleyin**

AlmaLinux için varsayılan NTP daemon'u olan Chrony'yi yükleyin:

```bash
sudo dnf install chrony -y
```

Kurulumu doğrulayın:

```bash
chronyd -v
```

#### **3. Adım: Chrony'yi Yapılandırın**

NTP sunucunuzu kurmak için Chrony yapılandırma dosyasını düzenleyin:

```bash
sudo nano /etc/chrony.conf
```

Aşağıdaki değişiklikleri yapın:

- Varsayılan NTP havuzunu yorum satırına alın `#` ekleyerek:

```bash
#pool 2.almalinux.pool.ntp.org iburst
```

- Konumunuzun yakınındaki özel NTP sunucularını ekleyin:

```bash
server 0.pool.ntp.org iburst
server 1.pool.ntp.org iburst
server 2.pool.ntp.org iburst
server 3.pool.ntp.org iburst
```

- Yerel ağınızdan gelen NTP isteklerine izin verin:

```bash
allow 192.168.1.0/24
```

- (İsteğe bağlı) Sunucunun geri dönüş kaynağı olarak hareket etmesini etkinleştirin:

```bash
local stratum 10
```

Dosyayı kaydedin ve çıkın.

#### **4. Adım: Chrony'yi Başlatın ve Etkinleştirin**

Chrony hizmetini başlatın ve önyüklemede başlamasını sağlayın:

```bash
sudo systemctl start chronyd
sudo systemctl enable chronyd
```

Hizmet durumunu kontrol edin:

```bash
sudo systemctl status chronyd
```

#### **5. Adım: Güvenlik Duvarı Ayarlarını Ayarlayın**

Güvenlik duvarı üzerinden NTP trafiğine izin vermek için 123/UDP portunu açın:

```bash
sudo firewall-cmd --permanent --add-service=ntp
sudo firewall-cmd --reload
```

#### **6. Adım: Yapılandırmayı Doğrulayın**

Sunucunuzun doğru şekilde yapılandırıldığından emin olmak için Chrony komutlarını kullanın:

1. Etkin zaman kaynaklarını görüntüleyin:

```bash
chronyc resources
```

2. Kontrol edin senkronizasyon durumu:

```bash
chronyc izleme
```

---

### 4. **NTP Sunucusunu Test Etme**

Diğer sistemlerin NTP sunucunuzla senkronize olabileceğini doğrulamak için:

1. Chrony yüklü bir istemci sistemi kurun. 2. İstemcinin `/etc/chrony.conf` dosyasını düzenleyin ve NTP sunucunuzun IP adresine yönlendirin:

```bash
server <NTP-server-IP>
```

3. Chrony hizmetini yeniden başlatın:

```bash
sudo systemctl restart chronyd
```

4. İstemcide zaman senkronizasyonunu doğrulayın:

```bash
chronyc resources
```

---

### 5. **Sorun Giderme İpuçları**

1. **Chrony başlamıyor:**
Ayrıntılar için günlükleri kontrol edin:

```bash
journalctl -xe | grep chronyd
```

2. **Güvenlik duvarı trafiği engelliyor:**
123/UDP portunun açık ve doğru şekilde yapılandırıldığından emin olun.

3. **İstemciler senkronize olmuyor:**
Sunucunun Chrony yapılandırmasındaki `allow` yönergesini doğrulayın ve ağ bağlantısını onaylayın.

---

### Sonuç

AlmaLinux'ta Chrony kullanarak bir NTP sunucusu yapılandırmak basittir. Bu adımlarla, ağınız genelinde hassas zaman senkronizasyonunu koruyabilir, sorunsuz işlemler ve gelişmiş güvenlik sağlayabilirsiniz. İster küçük bir ağ, ister bir kurumsal ortam çalıştırın, bu kurulum modern sistemler için gereken güvenilir zaman tutmayı sağlayacaktır.
