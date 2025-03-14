---
title: AlmaLinux'ta NTP İstemcisi Nasıl Yapılandırılır
description: Bu kılavuz AlmaLinux'ta bir NTP istemcisini adım adım yapılandırma konusunda size yol gösterecektir.
date: 2024-12-08
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: NTP İstemcisi Nasıl Yapılandırılır
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 120
translationKey: how-to-configure-an-ntp-client-on-almalinux-a-step-by-step-guide
keywords:
  - AlmaLinux
  - NTP Client on AlmaLinux
featured_image: /images/almalinux.webp
url: /tr/configure-ntp-client-almalinux
---
Modern bilgi işlem ortamlarında, hassas sistem zamanını korumak kritik öneme sahiptir. Güvenlik protokollerinden günlük doğruluğuna kadar, sisteminizin her yönü doğru senkronizasyona bağlıdır. Bu kılavuzda, AlmaLinux'ta bir **NTP (Ağ Zaman Protokolü) istemcisi** yapılandırma sürecini ele alacağız ve sisteminizin güvenilir bir zaman sunucusuyla senkronize olduğundan emin olacağız.

---

### **NTP nedir?**

NTP, bilgisayarların saatlerini bir atom saati veya bir stratum-1 NTP sunucusu gibi bir referans zaman kaynağına senkronize etmek için kullanılan bir protokoldür. AlmaLinux sisteminizi bir NTP istemcisi olarak yapılandırmak, belirtilen bir NTP sunucusuna sorgu göndererek doğru zamanı korumasını sağlar.

---

### **Önkoşullar**

Yapılandırma sürecine dalmadan önce, aşağıdakilerden emin olun:

1. **AlmaLinux kurulu** ve güncel.
2. Sistemde **sudo ayrıcalıklarına** sahip olmalısınız. 3. Sunucunuzun **NTP sunucusuna** ağ erişimi var, bu genel bir sunucu veya yerel ağınızdaki bir sunucu olabilir.

---

### **1. Adım: Sisteminizi Güncelleyin**

Tüm yüklü paketlerin güncel olduğundan emin olmak için AlmaLinux sisteminizi güncelleyerek başlayın:

```bash
sudo dnf update -y
```

---

### **2. Adım: Chrony'yi Yükleyin**

AlmaLinux, varsayılan NTP uygulaması olarak Chrony'yi kullanır. Chrony verimli, hızlıdır ve özellikle aralıklı bağlantıları olan sistemler için uygundur.

Chrony'yi yüklemek için şunu çalıştırın:

```bash
sudo dnf install chrony -y
```

Sürümü kontrol ederek kurulumu doğrulayın:

```bash
chronyd -v
```

---

### **Adım 3: Chrony'yi NTP İstemcisi Olarak Yapılandırın**

Chrony'nin ana yapılandırma dosyası `/etc/chrony.conf` konumunda bulunur. Bu dosyayı tercih ettiğiniz metin düzenleyicisiyle açın:

```bash
sudo nano /etc/chrony.conf
```

#### Önemli Yapılandırmalar

1. **NTP Sunucularını Belirleyin**
Varsayılan olarak, Chrony genel NTP havuz sunucularını içerir. İstediğiniz NTP sunucularını değiştirin veya ekleyin:

```bash
server 0.pool.ntp.org iburst
server 1.pool.ntp.org iburst
server 2.pool.ntp.org iburst
server 3.pool.ntp.org iburst
```

`iburst` seçeneği daha hızlı ilk senkronizasyon sağlar.

2. **Saat Dilimini Ayarla (İsteğe bağlı)**
Sistem saat diliminizin doğru olduğundan emin olun:

```bash
timedatectl set-timezone <your-time-zone>
```

`<your-time-zone>` ifadesini `America/New_York` gibi bölgenizle değiştirin.

3. **İsteğe bağlı: Yerel Sunucu Ekle**
Ağınızda bir NTP sunucunuz varsa, havuz sunucularını sunucunuzun IP'siyle değiştirin:

```bash
server 192.168.1.100 iburst
```

4. **Diğer Faydalı Parametreler**

- **Titremeyi en aza indirme:** Varyasyonları azaltmak için anket aralıklarını ayarlayın:

```bash
maxpoll 10
minpoll 6
```

- **NTP kimlik doğrulamasını etkinleştirme** (güvenli ortamlar için):

```bash
keyfile /etc/chrony.keys
```

Kurulumunuz için anahtarları yapılandırın.

Kaydedin ve düzenleyiciden çıkın.

---

### **4. Adım: Chrony Hizmetini Başlatın ve Etkinleştirin**

Yapılandırmayı etkinleştirmek için Chrony hizmetini başlatın:

```bash
sudo systemctl start chronyd
```

Hizmetin önyüklemede başlamasını etkinleştirin:

```bash
sudo systemctl enable chronyd
```

Çalıştığından emin olmak için hizmet durumunu kontrol edin:

```bash
sudo systemctl status chronyd
```

---

### **5. Adım: NTP Senkronizasyonunu Test Edin**

İstemcinizin yapılandırılmış NTP sunucularıyla doğru şekilde senkronize olduğunu doğrulayın.

1. **Zaman Kaynaklarını Kontrol Et:**

```bash
chronyc kaynakları
```

Bu komut, NTP sunucularının ve senkronizasyon durumlarının bir listesini görüntüler:

```bash
MS Adı/IP adresi Stratum Poll Reach LastRx Son örnek
============================================================================================
^* 0.pool.ntp.org 2 6 37 8 -0,543ms +/- 1,234ms
```

- `^*` sunucunun geçerli senkronizasyon kaynağı olduğunu belirtir.
- `Reach` son yanıtların sayısını gösterir (377'ye kadar olan değerler kararlı iletişimi belirtir).

2. **Senkronizasyon İlerlemesini İzle:**

```bash
chronyc tracking
```

Bu, sunucunun katmanı, ofseti ve kayması dahil olmak üzere senkronizasyon hakkında ayrıntılı bilgi sağlar.

3. **Zamanı Manuel Olarak Senkronize Et:**
Hemen senkronizasyon gerekiyorsa:

```bash
sudo chronyc -a makestep
```

---

### **Adım 6: Güvenlik Duvarını Yapılandırın (Uygulanabilirse)**

Sunucunuz bir güvenlik duvarı çalıştırıyorsa, 123 (UDP) portu üzerinden NTP trafiğine izin verdiğinden emin olun:

```bash
sudo firewall-cmd --permanent --add-service=ntp
sudo firewall-cmd --reload
```

---

### **Adım 7: Önyüklemeyle Zaman Senkronizasyonunu Otomatikleştirin**

AlmaLinux istemcinizin önyüklemeden sonra zamanı otomatik olarak senkronize ettiğinden emin olun. Çalıştır:

```bash
sudo timedatectl set-ntp true
```

---

### **Genel Sorunları Giderme**

1. **Zaman Senkronizasyonu Yok:**

- NTP sunucusuna olan ağ bağlantısını kontrol edin.
- Doğru sunucu adresleri için `/etc/chrony.conf` dosyasını doğrulayın.

2. **Chrony Hizmeti Başlatılamıyor:**

- Hatalar için günlükleri inceleyin:

```bash
journalctl -xe | grep chronyd
```

3. **İstemci NTP Sunucusuna Ulaşamıyor:**

- Sunucu tarafındaki güvenlik duvarında 123/UDP portunun açık olduğundan emin olun.
- İstemcinin sunucuya `ping <sunucu-ip>` yoluyla erişimi olduğunu doğrulayın.

4. **Ofset Çok Yüksek:**

- Senkronizasyonu zorla:

```bash
sudo chronyc -a burst
```

---

### **Sonuç**

Chrony kullanarak AlmaLinux'ta bir NTP istemcisi yapılandırmak, sisteminizin doğru zaman senkronizasyonunu korumasını sağlar. Bu kılavuzu izleyerek, Chrony'yi yüklediniz, güvenilir NTP sunucuları kullanacak şekilde yapılandırdınız ve işlevselliğini doğruladınız. İster küçük bir ağda ister daha büyük bir altyapıda çalışın, hassas zaman takibi artık endişeleneceğiniz bir şey daha az!

Ek özelleştirme veya sorun giderme için [Chrony belgelerine](https://chrony.tuxfamily.org/documentation.html) bakın.
