---
title: AlmaLinux Cockpit ile Web Yönetim Konsolu Kullanma
description: Bu yazımızda AlmaLinux'taki Web Yönetici Konsolu'nun kullanımını kolaylaştırıyoruz.
date: 2024-12-04
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Web Yönetim Konsolu Kullanma
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 80
translationKey: how-to-use-web-admin-console-on-almalinux
keywords:
  - AlmaLinux
  - Web Admin Console

featured_image: /images/almalinux.webp
url: /tr/web-admin-console-almalinux
---
Topluluk odaklı bir Linux dağıtımı olan AlmaLinux, istikrarlı ve güvenli bir işletim sistemi arayan kullanıcılar için popüler bir seçim haline geldi. Red Hat Enterprise Linux (RHEL) ile uyumluluğu onu kurumsal ortamlar için ideal hale getiriyor. AlmaLinux sunucularını yönetmeyi kolaylaştıran araçlardan biri de **Web Admin Console**'dur. Bu tarayıcı tabanlı arayüz, yöneticilerin yalnızca komut satırına güvenmek zorunda kalmadan sistem ayarlarını yönetmelerine, performansı izlemelerine ve hizmetleri yapılandırmalarına olanak tanır.

Bu makalede, AlmaLinux'ta Web Admin Console'u kurma ve kullanma sürecinde size yol göstereceğiz ve sunucu yönetim görevlerini kolaylıkla kolaylaştırmanıza yardımcı olacağız.

---

### Web Yönetici Konsolu Nedir?

Genellikle **Cockpit** tarafından desteklenen Web Yönetici Konsolu, sunucu yönetimi için hafif ve kullanıcı dostu bir web tabanlı arayüzdür. Cockpit, aşağıdaki gibi görevleri gerçekleştirebileceğiniz sezgisel bir pano sağlar:

- Sistem günlüklerini ve kaynak kullanımını görüntüleme.
- Kullanıcı hesaplarını ve izinlerini yönetme.
- Ağ ayarlarını yapılandırma.
- Yazılım paketlerini yükleme ve güncelleme.
- Hizmetleri izleme ve başlatma/durdurma.

Özellikle grafiksel bir arayüz tercih eden veya sunucuları yönetmek için hızlı, uzaktan erişime ihtiyaç duyan sistem yöneticileri için faydalıdır.

---

### AlmaLinux'ta Web Yönetici Konsolu Neden Kullanılır?

AlmaLinux sağlam ve güvenilir olsa da, komut satırı merkezli yapısı yeni başlayanlar için göz korkutucu olabilir. Web Yönetici Konsolu bu boşluğu kapatarak şunları sunar:

1. **Kullanım Kolaylığı**: Temel sistem işlemlerini yönetmek için dik bir öğrenme eğrisi yoktur. 2. **Verimlilik**: Gerçek zamanlı izleme ve hızlı sistem ayarlamaları için merkezi arayüz.
3. **Uzaktan Yönetim**: Sunucunuza tarayıcısı olan herhangi bir cihazdan erişin.
4. **Güvenlik**: Güvenli iletişimler için HTTPS'yi destekler.

---

### AlmaLinux'ta Web Yönetici Konsolunu Kurma ve Kullanma Adım Adım Kılavuzu

#### 1. Adım: AlmaLinux Sisteminizin Güncel Olduğundan Emin Olun

Web Yönetici Konsolunu yüklemeden önce sisteminizin güncel olduğundan emin olun. Bir terminal açın ve aşağıdaki komutları çalıştırın:

```bash
sudo dnf update -y
```

Bu, yüklü tüm paketleri en son sürümlerine güncelleyecektir.

---

#### 2. Adım: AlmaLinux'a Cockpit'i yükleyin

AlmaLinux'taki Web Admin Console, AlmaLinux'un varsayılan depolarında bulunan Cockpit tarafından desteklenmektedir. Yüklemek için şu komutu kullanın:

```bash
sudo dnf install cockpit -y
```

Yükleme tamamlandıktan sonra Cockpit hizmetini başlatmanız ve etkinleştirmeniz gerekir:

```bash
sudo systemctl enable --now cockpit.socket
```

`--now` bayrağı, hizmetin etkinleştirildikten hemen sonra başlatılmasını sağlar.

---

#### 3. Adım: Güvenlik Duvarı Ayarlarını Yapılandırın

Web Admin Console'a uzaktan erişmek için uygun güvenlik duvarı kurallarının yerinde olduğundan emin olun. Varsayılan olarak Cockpit `9090` portunu dinler. Bu portta trafiğe izin vermeniz gerekir:

```bash
sudo firewall-cmd --permanent --add-service=cockpit
sudo firewall-cmd --reload
```

Bu, Web Admin Console'un ağınızdaki diğer cihazlardan erişilebilir olmasını sağlar.

---

#### 4. Adım: Web Admin Console'a Erişim

Cockpit yüklenmiş ve güvenlik duvarı yapılandırılmışsa artık Web Admin Console'a erişebilirsiniz. Web tarayıcınızı açın ve şuraya gidin:

```text
https://<your-server-ip>:9090
```

Örneğin, sunucunuzun IP adresi `192.168.1.100` ise şunu yazın:

```text
https://192.168.1.100:9090
```

Konsola ilk kez eriştiğinizde, güvenilmeyen bir SSL sertifikası hakkında bir tarayıcı uyarısıyla karşılaşabilirsiniz. Cockpit kendi kendine imzalanmış bir sertifika kullandığı için bu normaldir. Uyarıyı kabul ederek devam edebilirsiniz.

---

#### Adım 5: Web Yönetim Konsoluna Giriş Yapın

Sunucunuzun kimlik bilgileriyle giriş yapmanız istenecektir. Yönetici ayrıcalıklarına sahip bir kullanıcının kullanıcı adını ve parolasını kullanın. AlmaLinux sunucunuz Active Directory veya diğer kimlik doğrulama mekanizmalarıyla entegreyse, bu kimlik bilgilerini de kullanabilirsiniz.

---

### Web Yönetim Konsolunda Gezinme: Temel Özellikler

Giriş yaptıktan sonra, sisteminizin genel görünümünü gösteren bir pano göreceksiniz. Aşağıda Web Yönetim Konsolunun bazı temel özellikleri verilmiştir:

#### 1. **Sistem Durumu**

- CPU, bellek ve disk kullanımını gerçek zamanlı olarak görüntüleyin.
- Sistem çalışma süresini ve çalışan işlemleri izleyin.

#### 2. **Hizmet Yönetimi**

- Hizmetleri doğrudan arayüzden başlatın, durdurun, etkinleştirin veya devre dışı bırakın.
- Sorun giderme için belirli hizmetlere ilişkin günlükleri görüntüleyin.

#### 3. **Ağ**

- IP adreslerini, rotaları ve DNS ayarlarını yapılandırın.
- Ağ arayüzlerini yönetin ve trafiği izleyin.

#### 4. **Kullanıcı Yönetimi**

- Kullanıcı hesapları ekleyin veya kaldırın.
- Kullanıcı rollerini değiştirin ve parolaları sıfırlayın.

#### 5. **Yazılım Yönetimi**

- Birkaç tıklamayla paketleri yükleyin veya kaldırın.
- Sistem yazılımını güncelleyin ve mevcut güncellemeleri kontrol edin.

#### 6. **Terminal Erişimi**

- Gelişmiş komut satırı işlemleri için yerleşik bir web terminaline erişin.

---

### Web Yönetici Konsolunu Etkili Şekilde Kullanma İpuçları

1. **Bağlantınızı Güvence Altına Alın**: Gelişmiş güvenlik için varsayılan kendi kendine imzalı sertifikayı güvenilir bir SSL sertifikasıyla değiştirin.
2. **İki Faktörlü Kimlik Doğrulamayı (2FA) Etkinleştirin**: Uygunsa, oturum açma sürecinize ekstra bir koruma katmanı ekleyin.
3. **Günlükleri Düzenli Olarak İzleyin**: Olası sorunların önüne geçmek için konsolun günlük tutma özelliğini kullanarak uyarı işaretlerini erken yakalayın.

4. **Erişimi Sınırlayın**: IP beyaz listelerini yapılandırarak veya bir VPN kurarak Web Yönetici Konsoluna erişimi kısıtlayın.

---

### Yaygın Sorunları Giderme

1. **Cockpit'e Erişilemiyor:**

- Hizmetin çalıştığını doğrulayın: `sudo systemctl status cockpit.socket`.
- `9090` portunun açık olduğundan emin olmak için güvenlik duvarı kurallarını kontrol edin.

2. **Tarayıcı Uyarıları:**

- Güvenli olmayan bağlantılarla ilgili uyarıları ortadan kaldırmak için geçerli bir SSL sertifikası içe aktarın.

3. **Performans Sorunları:**

- Sunucunuzun hem AlmaLinux'u hem de Cockpit'i verimli bir şekilde çalıştırmak için donanım gereksinimlerini karşıladığından emin olun.

---

### Conclusion

Cockpit tarafından desteklenen AlmaLinux'taki Web Admin Console, hem acemi hem de deneyimli yöneticiler için paha biçilmez bir araçtır. Grafiksel arayüzü sunucu yönetimini basitleştirir, sistem kaynaklarını, hizmetleri ve daha fazlasını izlemek ve yapılandırmak için merkezi bir platform sağlar. Bu kılavuzda özetlenen adımları izleyerek Web Admin Console'u güvenle kurabilir ve kullanabilir, idari görevlerinizi kolaylaştırabilir ve verimliliği artırabilirsiniz.
