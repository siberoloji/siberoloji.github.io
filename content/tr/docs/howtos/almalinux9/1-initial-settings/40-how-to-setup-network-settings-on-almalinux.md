---
title: AlmaLinux'ta Ağ Ayarları Nasıl Yapılır
description: Bu kılavuz AlmaLinux'ta ağ ayarlarının kurulumu ve değiştirilmesi hakkında detaylı bir açıklama sunmaktadır.
date: 2024-11-30
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Ağ Ayarları
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 40
translationKey: how-to-setup-network-settings-on-almalinux
keywords:
  - AlmaLinux
  - network settings on AlmaLinux
featured_image: /images/almalinux.webp
url: /tr/setup-network-settings-almalinux
---
CentOS'a popüler bir açık kaynaklı alternatif olan AlmaLinux, sunucu ortamlarında istikrarı, güvenilirliği ve esnekliğiyle yaygın olarak tanınır. Sistem yöneticileri, cihazlar arasında sorunsuz iletişimi sağlamak ve ağ performansını optimize etmek için ağ ayarlarını verimli bir şekilde yönetmelidir. Bu kılavuz, AlmaLinux'ta ağ ayarlarını kurma ve değiştirme konusunda ayrıntılı bir açıklama sunar.

---

#### **AlmaLinux'ta Ağ Yapılandırmasına Giriş**

Ağ, ister internet erişimi, ister dosya paylaşımı veya uzaktan yönetim için olsun, dış dünyaya bağlanmaya ihtiyaç duyan herhangi bir sistemin omurgasıdır. AlmaLinux, birçok Linux dağıtımı gibi, varsayılan ağ yapılandırma aracı olarak `NetworkManager` kullanır. Ayrıca, yöneticiler `nmcli` gibi CLI araçlarını kullanabilir veya daha ayrıntılı kontrol için yapılandırma dosyalarını doğrudan değiştirebilir.

Bu kılavuzun sonunda şunları nasıl yapacağınızı öğrenmiş olacaksınız:

- Bir ağ arayüzünü yapılandırma.
- Statik IP adresleri ayarlama.
- DNS ayarlarını değiştirme.
- Ağ bağlamayı veya köprülemeyi etkinleştirme. - Yaygın ağ sorunlarını giderin.

---

### **Adım 1: Ağ Yapılandırmasını Kontrol Etme**

Değişiklik yapmadan önce, geçerli ağ ayarlarını değerlendirmek önemlidir. Bunu komut satırı veya GUI araçlarını kullanarak yapabilirsiniz.

#### **Komut Satırı Yöntemi:**

1. Bir terminal oturumu açın.
2. Etkin ağ arayüzlerini kontrol etmek için `ip` komutunu kullanın:

```bash
ip addr show
```

3. `NetworkManager` tarafından yönetilen tüm bağlantılar hakkında ayrıntılı bilgi almak için şunu kullanın:

```bash
nmcli connection show
```

#### **GUI Yöntemi:**

GNOME masaüstü ortamınız yüklüyse, bağlantıları görüntülemek ve yönetmek için **Ayarlar > Ağ**'a gidin.

---

### **Adım 2: Ağ Arayüzlerini Yapılandırma**

Ağ arayüzleri dinamik olarak (DHCP kullanılarak) veya statik olarak ayarlanabilir. Her ikisinin de nasıl gerçekleştirileceği aşağıda açıklanmıştır.

#### **DHCP'yi (Dinamik Ana Bilgisayar Yapılandırma Protokolü) Yapılandırma:**

1. `ip addr` komutunu kullanarak ağ arayüzünü (örn. `eth0`, `ens33`) tanımlayın.

2. Arayüzü DHCP kullanacak şekilde ayarlamak için `nmcli` kullanın:

```bash
nmcli con mod "Connection Name" ipv4.method auto
nmcli con up "Connection Name"
```

`"Connection Name"` ifadesini gerçek bağlantı adıyla değiştirin.

#### **Statik IP Adresi Ayarlama:**

1. Bağlantıyı değiştirmek için `nmcli` kullanın:

```bash
nmcli con mod "Connection Name" ipv4.addresses 192.168.1.100/24
nmcli con mod "Connection Name" ipv4.gateway 192.168.1.1
nmcli con mod "Connection Name" ipv4.dns "8.8.8.8,8.8.4.4"
nmcli con mod "Connection Name" ipv4.method manual
```

2. Bağlantıyı tekrar çevrimiçi hale getirin:

```bash
nmcli con up "Connection Name"
```

#### **Yapılandırma Dosyaları Üzerinden Manuel Yapılandırma:**

Alternatif olarak, yapılandırma dosyalarını düzenleyerek doğrudan ağ ayarlarını yapılandırabilirsiniz `/etc/sysconfig/network-scripts/`. Her arayüzün `ifcfg-<interface>` adlı karşılık gelen bir dosyası vardır. Örneğin:

```bash
sudo nano /etc/sysconfig/network-scripts/ifcfg-ens33
```

Tipik bir statik IP yapılandırması şu şekilde görünebilir:

```bash
BOOTPROTO=none
ONBOOT=yes
IPADDR=192.168.1.100
PREFIX=24
GATEWAY=192.168.1.1
DNS1=8.8.8.8
DNS2=8.8.4.4
DEVICE=ens33
```

Değişiklikleri kaydettikten sonra ağ hizmetini yeniden başlatın:

```bash
sudo systemctl restart network
```

---

### **Adım 3: DNS Ayarlarını Yönetme**

DNS (Alan Adı Sistemi), alan adlarını IP adreslerine çözümlemek için gereklidir. AlmaLinux'ta DNS'i yapılandırmak için:

#### **`nmcli` yoluyla:**

```bash
nmcli con mod "Connection Name" ipv4.dns "8.8.8.8,8.8.4.4"
nmcli con up "Connection Name"
```

#### **Manuel Yapılandırma:**

`/etc/resolv.conf` dosyasını düzenleyin (ancak bu genellikle `NetworkManager` tarafından dinamik olarak yönetilir):

```bash
sudo nano /etc/resolv.conf
```

Tercih ettiğiniz DNS sunucularını ekleyin:

```plaintext
nameserver 8.8.8.8
nameserver 8.8.4.4
```

Değişiklikleri kalıcı hale getirmek için `NetworkManager` tarafından dinamik güncellemeleri devre dışı bırakın:

```bash
sudo nano /etc/NetworkManager/NetworkManager.conf
```

Aşağıdaki satırı ekleyin veya değiştirin:

```plaintext
dns=none
```

Hizmeti yeniden başlatın:

```bash
sudo systemctl restart NetworkManager
```

---

### **Adım 4: Gelişmiş Ağ Yapılandırmaları**

#### **Ağ Bağlantısı:**

Ağ bağlantısı, yedekliliği ve verimi artırmak için birden fazla ağ arayüzünü bir araya getirir.

1. Gerekli araçları yükleyin:

```bash
sudo yum install teamd
```

2. Yeni bir bağlı bağlantı oluşturun:

```bash
nmcli con add type bond ifname bond0 mode active-backup
```

3. Bağımlı arayüzler ekleyin:

```bash
nmcli con add type ethernet slave-type bond ifname ens33 master bond0
nmcli con add type ethernet slave-type bond ifname ens34 master bond0
```

4. Bağ arayüzünü bir IP ile yapılandırın:

```bash
nmcli con mod bond0 ipv4.addresses 192.168.1.100/24 ​​ipv4.method manual
nmcli con up bond0
```

#### **Köprüleme Arayüzleri:**

Köprüleme, sanallaştırmada genellikle VM'lere izin vermek için kullanılır ağa erişmek için.

1. Bir köprü arayüzü oluşturun:

```bash
nmcli con add type bridge ifname br0
```

2. Köprüye bir slave arayüzü ekleyin:

```bash
nmcli con add type ethernet slave-type bridge ifname ens33 master br0
```

3. Köprü için IP ayarlayın:

```bash
nmcli con mod br0 ipv4.addresses 192.168.1.200/24 ​​ipv4.method manual
nmcli con up br0
```

---

### **Adım 5: Yaygın Sorunları Giderme**

#### **1. Bağlantı Çalışmıyor:**

- Ağ hizmetinin çalıştığından emin olun:

```bash
sudo systemctl status NetworkManager
```

- Gerekirse ağ hizmetini yeniden başlatın:

```bash
sudo systemctl restart NetworkManager
```

#### **2. IP Çakışmaları:**

- `arp-scan` kullanarak ağda yinelenen IP adreslerini kontrol edin:

```bash
sudo yum install arp-scan
sudo arp-scan --localnet
```

#### **3. DNS Çözümlemesi Başarısız:**

- `/etc/resolv.conf` içeriğini doğrulayın.
- `ping` kullanarak DNS sunucularının erişilebilir olduğundan emin olun:

```bash
ping 8.8.8.8
```

#### **4. Arayüz Açılmıyor:**

- Arayüzün etkinleştirildiğini doğrulayın:

```bash
nmcli device status
```

- Arayüzü çevrimiçi hale getirin:

```bash
nmcli con up "Connection Name"
```

---

### **Sonuç**

AlmaLinux'ta ağ ayarlarını kurmak ve düzenlemek, temel ve gelişmiş ağ yapılandırma tekniklerinin iyi anlaşılmasını gerektirir. Basit bir DHCP bağlantısı yapılandırmak veya yedeklilik için ağ bağlamayı uygulamak olsun, AlmaLinux ihtiyaçlarınızı karşılamak için sağlam ve esnek bir araç seti sunar. `nmcli`'de ustalaşarak, yapılandırma dosyalarını anlayarak ve sorun giderme stratejilerini kullanarak AlmaLinux ortamınızda optimum ağ performansını sağlayabilirsiniz.

Önemli değişiklikler yapmadan önce ağ kurulumunuzu belgelemeyi ve yapılandırma dosyalarını yedeklemeyi unutmayın, böylece kesinti veya yanlış yapılandırmalardan kaçınabilirsiniz.
