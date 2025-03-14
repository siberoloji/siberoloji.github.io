---
title: AlmaLinux'ta Güvenlik Duvarı, Portlar ve Bölgeler Nasıl Kurulur
description: AlmaLinux'ta güvenlik duvarını nasıl yapılandıracağınızı öğrenin. Bu kapsamlı kılavuzla portları açın, bölgeleri yönetin ve gelişmiş güvenlik duvarı kurallarını uygulayın.
date: 2024-11-29
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Güvenlik Duvarı, Portlar ve Bölgeler
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 20
keywords:
  - AlmaLinux
  - firewalld
translationKey: how-to-set-up-firewalld-ports-and-zones-on-almalinux
featured_image: /images/almalinux.webp
url: /tr/set-firewalld-ports-zones-almalinux
---
AlmaLinux dahil olmak üzere herhangi bir Linux sistemini güvence altına almak için düzgün yapılandırılmış bir güvenlik duvarı olmazsa olmazdır. Güvenlik duvarları, sisteminize giden ve sisteminizden giden trafiği kontrol ederek yalnızca yetkili iletişimlere izin verilmesini sağlar. AlmaLinux, güvenlik duvarı ayarlarını yönetmek için güçlü ve esnek **firewalld** hizmetinden yararlanır. Bu kılavuz, AlmaLinux'ta güvenlik duvarlarını, bağlantı noktalarını ve bölgeleri ayrıntılı örneklerle kurma ve yönetme konusunda size yol gösterecektir.

---

## **1. Firewalld'ye giriş**

Firewalld, AlmaLinux'taki varsayılan güvenlik duvarı yönetim aracıdır. Kuralları gruplamak ve ağ arayüzlerini yönetmek için **bölgeler** kavramını kullanır ve karmaşık güvenlik duvarı ayarlarını yapılandırmayı kolaylaştırır. İşte kısa bir döküm:

- **Bölgeler** ağ bağlantıları için güven düzeylerini tanımlar (ör. genel, özel, güvenilir).

- **Bağlantı noktaları** belirli hizmetlere veya uygulamalara göre izin verilen trafiği kontrol eder.

- **Zengin Kurallar** IP beyaz listeleme veya zamana dayalı erişim gibi gelişmiş yapılandırmaları etkinleştirir.

Devam etmeden önce, AlmaLinux sisteminizde firewalld'nin kurulu ve çalışır durumda olduğundan emin olun.

---

## **2. Firewalld'yi Kurma ve Başlatma**

Firewalld genellikle AlmaLinux'a önceden kurulur. Değilse, aşağıdaki komutları kullanarak kurabilirsiniz:

```bash

sudo dnf install firewalld

```

Kurulumdan sonra, önyükleme sırasında çalıştığından emin olmak için firewalld hizmetini başlatın ve etkinleştirin:

```bash

sudo systemctl start fired

sudo systemctl enable fired

```

Durumunu doğrulamak için şunu kullanın:

```bash

sudo systemctl status fired

```

---

## **3. Firewalld'deki Bölgeleri Anlama**

Firewalld bölgeleri, ağ arayüzlerine atanan güven düzeylerini temsil eder. Yaygın bölgeler şunlardır:

- **Genel:** Minimum güven; genellikle genel ağlar için kullanılır.

- **Özel:** Kişisel veya özel ağlar için güvenilir bölge.

- **Güvenilir:** Son derece güvenilir bölge; tüm bağlantılara izin verir.

Kullanılabilir tüm bölgeleri görüntülemek için şunu çalıştırın:

```bash

sudo firewall-cmd --get-zones

```

Etkin ağ arayüzünüzün geçerli bölgesini kontrol etmek için:

```bash

sudo firewall-cmd --get-active-zones

```

### **Bir Arayüze Bölge Atama**

Bir ağ arayüzüne belirli bir bölge atamak için (örneğin, `eth0`):

```bash

sudo firewall-cmd --zone=public --change-interface=eth0 --permanent

sudo firewall-cmd --reload

```

`--permanent` bayrağı, değişikliğin yeniden başlatmalardan sonra da devam etmesini sağlar.

---

## **4. Bağlantı Noktalarını Açma ve Yönetme**

Bir güvenlik duvarı, **bağlantı noktalarını** kullanarak hizmetlere erişimi kontrol eder. Örneğin, SSH 22 numaralı bağlantı noktasını kullanırken, HTTP ve HTTPS sırasıyla 80 ve 443 numaralı bağlantı noktalarını kullanır.

### **Bir Port Açma**

HTTP (port 80) gibi belirli bir portu açmak için:

```bash

sudo firewall-cmd --zone=public --add-port=80/tcp --permanent

```

Değişikliği uygulamak için güvenlik duvarını yeniden yükleyin:

```bash

sudo firewall-cmd --reload

```

### **Açık Portları Listeleme**

Belirli bir bölgedeki tüm açık portları görüntülemek için:

```bash

sudo firewall-cmd --zone=public --list-ports

```

### **Bir Portu Kapatma**

Daha önce açılmış bir portu kaldırmak için:

```bash

sudo firewall-cmd --zone=public --remove-port=80/tcp --permanent

sudo firewall-cmd --reload

```

---

## **5. Hizmetleri Etkinleştirme ve Devre Dışı Bırakma**

Portları manuel olarak açmak yerine, hizmetlere adlarına göre izin verebilirsiniz. Örneğin, SSH'yi etkinleştirmek için:

```bash

sudo firewall-cmd --zone=public --add-service=ssh --permanent

sudo firewall-cmd --reload

```

Bir bölge için etkinleştirilmiş hizmetleri görüntülemek için:

```bash

sudo firewall-cmd --zone=public --list-services

```

Bir hizmeti devre dışı bırakmak için:

```bash

sudo firewall-cmd --zone=public --remove-service=ssh --permanent

sudo firewall-cmd --reload

```

---

## **6. Zengin Kurallarla Gelişmiş Yapılandırmalar**

Zengin kurallar, trafik üzerinde ayrıntılı denetim sağlayarak IP beyaz listeleme, günlük kaydı veya zaman tabanlı kurallar gibi gelişmiş yapılandırmalara izin verir.

### **Örnek 1: Belirli Bir IP'den Gelen Trafiğe İzin Ver**

Yalnızca belirli bir IP adresinden gelen trafiğe izin vermek için:

```bash

sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.100" accept' --permanent

sudo firewall-cmd --reload

```

### **Örnek 2: Bırakılan Paketleri Kaydetme**

Hata ayıklama için güvenlik duvarı tarafından bırakılan paketleri kaydetmek için:

```bash

sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" log prefix="Güvenlik Duvarı:" level="info" drop' --permanent

sudo firewall-cmd --reload

```

---

## **7. GUI'de Firewalld Kullanımı (İsteğe bağlı)**

Grafiksel bir arayüz tercih edenler için, Firewalld bir GUI aracı sağlar. Şunu kullanarak yükleyin:

```bash

sudo dnf install firewall-config

```

GUI aracını başlatın:

```bash

firewall-config

```

GUI, bölgeleri, bağlantı noktalarını ve hizmetleri görsel olarak yönetmenizi sağlar.

---

## **8. Güvenlik Duvarı Yapılandırmalarını Yedekleme ve Geri Yükleme**

Sistem sorunları durumunda yeniden yapılandırmayı önlemek için güvenlik duvarı ayarlarınızı yedeklemek iyi bir uygulamadır.

### **Yedekleme**

```bash

sudo firewall-cmd --runtime-to-permanent

tar -czf firewall-backup.tar.gz /etc/firewalld

```

### **Geri Yükleme**

```bash

tar -xzf firewall-backup.tar.gz -C /

sudo systemctl restart firewalld

```

---

## **9. Güvenlik Duvarlarını Test Etme ve Sorun Giderme**

### **Açık Bağlantı Noktalarını Test Etme**

Açık bağlantı noktalarını doğrulamak için `telnet` veya `nmap` gibi araçları kullanabilirsiniz:

```bash

nmap -p 80 localhost

```

### **Günlükleri Kontrol Etme**

Güvenlik duvarı günlükleri sorun gidermede yardımcı olur. Bunları kullanarak kontrol edin:

```bash

sudo journalctl -xe | grep firewalld

```

---

## **10. AlmaLinux'ta Güvenlik Duvarı Yönetimi İçin En İyi Uygulamalar**

1. **Açık Bağlantı Noktalarını En Aza İndirin:** Uygulamalarınız için yalnızca gerekli bağlantı noktalarını açın.

2. **Uygun Bölgeleri Kullanın:** Bölgelere güven düzeyine göre arayüzler atayın.

3. **Günlük Kaydını Etkinleştirin:** Yetkisiz erişim girişimlerini gidermek ve izlemek için günlük kaydını kullanın.

4. **Komut Dosyalarıyla Otomatikleştirin:** Tekrarlayan görevler için güvenlik duvarı kurallarını yönetmek üzere komut dosyaları oluşturun.

5. **Ayarları Düzenli Olarak Denetleyin:** Güvenlik duvarı kurallarını ve yapılandırmalarını periyodik olarak inceleyin.

---

## **Sonuç**

AlmaLinux'ta güvenlik duvarını, bağlantı noktalarını ve bölgeleri yapılandırmak, güvenli bir sistemi sürdürmek için çok önemlidir. Firewalld'nin esnekliği ve bölge tabanlı yaklaşımı, ister tek bir sunucuyu ister karmaşık bir ağı yönetiyor olun, süreci basitleştirir. Bu kılavuzu izleyerek, AlmaLinux sisteminizin güvenli ve işlevsel kalmasını sağlayarak güvenlik duvarını etkili bir şekilde kurabilir ve kullanabilirsiniz.

AlmaLinux'ta güvenlik duvarlarını yönetmek için herhangi bir sorunuz veya ipucunuz var mı? Aşağıdaki yorumlarda paylaşın!
