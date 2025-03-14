---
title: AlmaLinux'ta SELinux Nasıl Kurulur ve Kullanılır
description: Bu kılavuz, sisteminizi etkili bir şekilde güvence altına almak için AlmaLinux'ta SELinux'u kurma, yapılandırma ve kullanma sürecinde size yol gösterir.
date: 2024-11-30
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: AlmaLinux'ta SELinux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 30
translationKey: how-to-set-up-and-use-selinux-on-almalinux
keywords:
  - AlmaLinux
  - SELinux on AlmaLinux
featured_image: /images/almalinux.webp
url: /tr/set-selinux-almalinux
---
Güvenlik Geliştirilmiş Linux (SELinux), Linux çekirdeğinde uygulanan zorunlu bir erişim denetimi (MAC) güvenlik mekanizmasıdır. İşlemlerin ve kullanıcıların sistem kaynaklarıyla nasıl etkileşime girdiğini düzenleyen erişim politikalarını uygulayarak ek bir güvenlik katmanı sağlar. CentOS'a sağlam, açık kaynaklı bir alternatif olan AlmaLinux, varsayılan olarak SELinux etkin olarak gelir, ancak yapılandırmasını ve yönetimini anlamak sisteminizin güvenliğini optimize etmek için çok önemlidir.

Bu kılavuz, sisteminizi etkili bir şekilde güvence altına almak için AlmaLinux'ta SELinux'u kurma, yapılandırma ve kullanma sürecinde size yol gösterir.

---

### **SELinux Nedir ve Neden Önemlidir?**

SELinux, işlemlerin bir sistemde gerçekleştirebileceği eylemleri kısıtlayarak güvenliği artırır. Geleneksel takdir yetkisine bağlı erişim denetimi (DAC) sistemlerinin aksine, SELinux, istismar edilen güvenlik açıklarından kaynaklanan olası hasarı sınırlayan katı politikalar uygular. Örneğin, bir web sunucusu tehlikeye atılırsa, SELinux hassas dosyalara erişmesini veya sistemde yetkisiz değişiklikler yapmasını önleyebilir.

**SELinux'un Temel Özellikleri:**

1. **Zorunlu Erişim Kontrolü (MAC):** Sıkı politikalar erişim haklarını belirler.
2. **Sınırlı İşlemler:** İşlemler gereken en az ayrıcalıkla çalışır.
3. **Günlük Kaydı ve Denetim:** Yetkisiz erişim girişimlerini izler.

---

### **Adım 1: SELinux Durumunu Kontrol Etme**

SELinux'u yapılandırmadan önce, `sestatus` komutunu kullanarak geçerli durumunu belirleyin:

```bash
sestatus
```

Çıktı şunları gösterecektir:

- **SELinux durumu:** Etkin veya devre dışı.
- **Geçerli mod:** Zorlayıcı, izin verici veya devre dışı.
- **Politika:** Kullanımda olan etkin SELinux politikası.

---

### **Adım 2: SELinux Modlarını Anlayın**

SELinux üç modda çalışır:

1. **Uygulama:** SELinux politikalarını tamamen uygular. Yetkisiz eylemler engellenir ve kaydedilir.
2. **İzin Verici:** SELinux politikaları uygulanmaz ancak ihlaller kaydedilir. Test için idealdir.
3. **Devre Dışı:** SELinux tamamen kapatılır.

Mevcut modu kontrol etmek için:

```bash
getenforce
```

Modlar arasında geçici olarak geçiş yapmak için:

- İzin verici olarak ayarlayın:

```bash
sudo setenforce 0
```

- Zorlayıcı olarak ayarlayın:

```bash
sudo setenforce 1
```

---

### **Adım 3: SELinux'u Etkinleştirin veya Devre Dışı Bırakın**

SELinux, devre dışı bırakmak için özel bir nedeniniz olmadığı sürece her zaman etkinleştirilmelidir. SELinux ayarlarını kalıcı olarak yapılandırmak için `/etc/selinux/config` dosyasını düzenleyin:

```bash
sudo nano /etc/selinux/config
```

`SELINUX` yönergesini gerektiği gibi değiştirin:

```plaintext
SELINUX=enforcing # SELinux politikalarını uygular
SELINUX=permissive # Uygulama olmadan ihlalleri günlüğe kaydeder
SELINUX=disabled # SELinux'u kapatır
```

Dosyayı kaydedin ve değişiklikleri uygulamak için sistemi yeniden başlatın:

```bash
sudo reboot
```

---

### **Adım 4: SELinux Politika Türleri**

SELinux, çeşitli hizmetler ve işlemler için erişim kurallarını tanımlamak üzere politikalar kullanır. En yaygın politika türleri şunlardır:

- **Hedeflenen:** Yalnızca belirli işlemler sınırlandırılır. Bu, AlmaLinux'taki varsayılan politikadır.
- **MLS (Çok Düzeyli Güvenlik):** Genellikle son derece hassas ortamlarda kullanılan daha karmaşık bir politikadır.

Etkin politikayı görüntülemek için:

```bash
sestatus
```

---

### **Adım 5: Dosya ve Dizin Bağlamlarını Yönetin**

SELinux, erişimi kontrol etmek için dosyalara ve dizinlere güvenlik bağlamları atar. Bağlamlar dört nitelikten oluşur:

1. **Kullanıcı:** SELinux kullanıcısı (örn. `system_u`, `unconfined_u`).
2. **Rol:** Kullanıcının veya işlemin rolünü tanımlar.
3. **Tür:** Bir kaynağa nasıl erişileceğini belirler (örn. web sunucusu dosyaları için `httpd_sys_content_t`).
4. **Seviye:** MLS politikalarında kullanılır.

Bir dosyanın bağlamını kontrol etmek için:

```bash
ls -Z /path/to/file
```

#### **SELinux Bağlamlarını Değiştirme:**

Bir dosya veya dizinin bağlamını değiştirmek için `chcon` komutunu kullanın:

```bash
sudo chcon -t type /path/to/file
```

Örneğin, `httpd_sys_content_t` türünü bir web dizinine atamak için:

```bash
sudo chcon -R -t httpd_sys_content_t /var/www/html
```

---

### **Adım 6: SELinux Boolean'larını Kullanma**

SELinux Boolean'ları, politikanın kendisini değiştirmeden belirli politika kurallarını açmanıza veya kapatmanıza olanak tanır. Bu, yöneticilere özellikleri dinamik olarak etkinleştirme veya devre dışı bırakma esnekliği sağlar.

#### **Boolean'ları Görüntüleme:**

Tüm SELinux Boolean'larını listelemek için:

```bash
getsebool -a
```

#### **Boolean'ları Değiştirme:**

Bir Boolean'ı geçici olarak etkinleştirmek veya devre dışı bırakmak için:

```bash
sudo setsebool boolean_name on
sudo setsebool boolean_name off
```

Değişiklikleri yeniden başlatmalar boyunca kalıcı hale getirmek için:

```bash
sudo setsebool -P boolean_name on
```

Örnek: HTTPD'nin bir veritabanına bağlanmasına izin verme:

```bash
sudo setsebool -P httpd_can_network_connect_db on
```

---

### **Adım 7: SELinux Sorunlarını Giderme**

SELinux, tüm ihlalleri `/var/log/audit/audit.log` dosyası. Bu günlükler sorunları teşhis etmek ve çözmek için paha biçilmezdir.

#### **`ausearch` ile Günlükleri Analiz Etme:**

`ausearch` aracı günlük analizini basitleştirir:

```bash
sudo ausearch -m avc -ts recent
```

#### **`sealert` Kullanımı:**

`setroubleshoot-server` paketinin bir parçası olan `sealert` aracı, SELinux redleri için ayrıntılı açıklamalar ve çözümler sağlar:

```bash
sudo yum install setroubleshoot-server
sudo sealert -a /var/log/audit/audit.log
```

---

### **Adım 8: Varsayılan Bağlamları Geri Yükleme**

Bir dosya veya dizinin yanlış bir bağlamı varsa, SELinux erişimi reddedebilir. Varsayılan bağlamı `restorecon` komutuyla geri yükleyin:

```bash
sudo restorecon -R /path/to/directory
```

---

### **Adım 9: Ortak Hizmetler için SELinux**

#### **1. Apache (HTTPD):**

- Web içeriğinin doğru türde olduğundan emin olun:

```bash
sudo chcon -R -t httpd_sys_content_t /var/www/html
```

- HTTPD'nin standart olmayan bağlantı noktalarını dinlemesine izin verin:

```bash
sudo semanage port -a -t http_port_t -p tcp 8080
```

#### **2. SSH:**

- SSH erişimini SELinux rollerini kullanan belirli kullanıcılarla sınırlayın. - SSH'nin özel portları kullanmasına izin ver:

```bash
sudo semanage port -a -t ssh_port_t -p tcp 2222
```

#### **3. NFS:**

- Paylaşılan dizinler için uygun SELinux türünü (`nfs_t`) kullanın:

```bash
sudo chcon -R -t nfs_t /shared/directory
```

---

### **Adım 10: SELinux'u Geçici Olarak Devre Dışı Bırakma**

Nadir durumlarda, sorun giderme için SELinux'u geçici olarak devre dışı bırakmanız gerekebilir:

```bash
sudo setenforce 0
```

Sorun çözüldükten sonra zorlama moduna geri döndürmeyi unutmayın:

```bash
sudo setenforce 1
```

---

### **Sonuç**

SELinux, AlmaLinux sisteminizi güvence altına almak için güçlü bir araçtır, ancak politikaları ve yönetim teknikleri hakkında iyi bir anlayış gerektirir. SELinux'u düzgün bir şekilde etkinleştirerek ve yapılandırarak sunucunuzun güvenlik duruşunu önemli ölçüde iyileştirebilirsiniz. Bu kılavuzu, SELinux'u ortamınızda etkili bir şekilde uygulamak için bir başlangıç ​​noktası olarak kullanın ve gelişen güvenlik gereksinimlerine uyum sağlamak için SELinux politikalarınızı düzenli olarak denetlemeyi ve incelemeyi unutmayın.
