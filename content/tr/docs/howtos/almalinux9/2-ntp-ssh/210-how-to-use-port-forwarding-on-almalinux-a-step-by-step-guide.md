---
title: AlmaLinux'ta Port Yönlendirme Nasıl Kullanılır
description: Bu kılavuzda, AlmaLinux'ta Port Yönlendirme'yi nasıl kuracağınızı, yapılandıracağınızı ve kullanacağınızı inceleyeceğiz.
date: 2024-12-09
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Port Yönlendirme AlmaLinux'ta Nasıl Kullanılır
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 210
translationKey: how-to-use-port-forwarding-on-almalinux9
keywords:
  - AlmaLinux
  - Port Forwarding
featured_image: /images/almalinux.webp
url: /tr/port-forwarding-almalinux
---
Port yönlendirme, ağ trafiğini bir porttan veya adresten diğerine yönlendiren temel bir ağ tekniğidir. Kullanıcıların harici bir ağdan özel bir ağdaki hizmetlere erişmesine olanak tanır, bağlantıyı geliştirir ve güvenli uzaktan erişimi mümkün kılar. AlmaLinux kullanıcıları için port yönlendirmeyi anlamak ve uygulamak, uzak bir sunucuya erişim, bir web uygulamasını çalıştırma veya dosyaları güvenli bir şekilde aktarma gibi görevleri kolaylaştırabilir.

Bu kılavuzda, port yönlendirme kavramını, kullanım durumlarını ve AlmaLinux'ta nasıl yapılandırılacağını inceleyeceğiz.

---

### Port Yönlendirme Nedir?

Port yönlendirme, belirli bir porttaki gelen trafiği başka bir porta veya IP adresine yönlendirir. Bu teknik genellikle şunlar için kullanılır:

- **Hizmetleri açığa çıkarma**: Dahili bir hizmeti internetten erişilebilir hale getirme.
- **Güvenliği artırma**: Belirli IP'lere veya rotalara erişimi kısıtlama.
- **NAT ortamlarını destekleme**: Harici kullanıcıların bir yönlendiricinin arkasındaki dahili sunuculara erişmesine izin verme.

---

### Port Yönlendirme Türleri

1. **Yerel Port Yönlendirme**: Trafiği yerel bir porttan uzak bir sunucuya yönlendirir.
2. **Uzak Port Yönlendirme**: Trafiği uzak bir sunucudan yerel bir makineye yönlendirir.
3. **Dinamik Port Yönlendirme**: Aracı bir sunucu üzerinden esnek yönlendirme için bir SOCKS proxy'si oluşturur.

---

### AlmaLinux'ta Port Yönlendirme için Önkoşullar

Port yönlendirmeyi yapılandırmadan önce şunlardan emin olun:

1. **Yönetici ayrıcalıkları**: Kök veya `sudo` erişimine ihtiyacınız olacak.
2. **SSH yüklü**: SSH üzerinden güvenli port yönlendirme için.
3. **Güvenlik duvarı yapılandırması**: AlmaLinux varsayılan olarak `firewalld` kullanır, bu nedenle onu yönetmek için erişiminiz olduğundan emin olun.

---

### 1. **Yerel Bağlantı Noktası Yönlendirme**

Yerel bağlantı noktası yönlendirme, trafiği yerel makinenizden uzak bir sunucuya yönlendirir. Bu, bir SSH tüneli aracılığıyla uzak bir sunucudaki hizmetlere erişmek için yararlıdır.

#### Örnek Kullanım Durumu: Uzak Bir Web Sunucusuna Yerel Olarak Erişim

1. **SSH komutunu çalıştırın**:

```bash
ssh -L 8080:remote-server:80 user@remote-server
```

Açıklama:

- `-L`: Yerel bağlantı noktası yönlendirmeyi belirtir.
- `8080`: Makinenizdeki yerel bağlantı noktası.
- `remote-server`: Hedef sunucunun ana bilgisayar adı veya IP adresi.
- `80`: Uzak bağlantı noktası (örn. HTTP).
- `user`: SSH kullanıcı adı.

2. **Hizmete erişin**:
Bir web tarayıcısı açın ve `http://localhost:8080` adresine gidin. Trafik, 80 numaralı bağlantı noktasındaki uzak sunucuya yönlendirilecektir.

---

### 2. **Uzak Bağlantı Noktası Yönlendirme**

Uzak bağlantı noktası yönlendirme, uzak bir sunucunun yerel hizmetlerinize erişmesine olanak tanır. Bu, yerel bir uygulamayı harici bir ağa açmanız gerektiğinde yararlıdır.

#### Örnek Kullanım Durumu: Yerel Bir Web Sunucusunu Uzak Bir Kullanıcıya Açma

1. **SSH komutunu çalıştırın**:

```bash
ssh -R 9090:localhost:3000 user@remote-server
```

Açıklama:

- `-R`: Uzak bağlantı noktası yönlendirmeyi belirtir.
- `9090`: Uzak sunucunun bağlantı noktası. - `localhost:3000`: Açığa çıkarmak istediğiniz yerel hizmet (örneğin, 3000 numaralı bağlantı noktasındaki bir web sunucusu).
- `user`: SSH kullanıcı adı.

2. **Hizmete erişim**:
Uzak sunucudaki kullanıcılar `http://remote-server:9090` adresine giderek hizmete erişebilir.

---

### 3. **Dinamik Bağlantı Noktası Yönlendirme**

Dinamik bağlantı noktası yönlendirme, trafiği bir aracı sunucu üzerinden yönlendiren bir SOCKS proxy'si oluşturur. Bu, güvenli tarama veya ağ kısıtlamalarını aşmak için idealdir.

#### Örnek Kullanım Durumu: Bir SOCKS Proxy Oluşturma

1. **SSH komutunu çalıştırın**:

```bash
ssh -D 1080 user@remote-server
```

Açıklama:

- `-D`: Dinamik bağlantı noktası yönlendirmeyi belirtir. - `1080`: SOCKS proxy'si için yerel port.
- `user`: SSH kullanıcı adı.

2. **Tarayıcınızı veya uygulamanızı yapılandırın**:
SOCKS proxy'sini `localhost:1080` olarak ayarlayın.

---

### 4. **Firewalld ile Port Yönlendirme**

SSH kullanmıyorsanız veya kalıcı port yönlendirmeye ihtiyacınız varsa, bunu AlmaLinux'un `firewalld` ile yapılandırabilirsiniz.

#### Örnek: 8080 Portunu 80 Portuna Yönlendir

1. **`firewalld`de port yönlendirmeyi etkinleştir**:

```bash
sudo firewall-cmd --add-forward-port=port=8080:proto=tcp:toport=80
```

2. **Kuralı kalıcı yap**:

```bash
sudo firewall-cmd --runtime-to-permanent
```

3. **Yapılandırmayı doğrula**:

```bash
sudo firewall-cmd --list-forward-ports
```

---

### 5. **`iptables` ile Port Yönlendirme**

İleri düzey kullanıcılar için, `iptables` port yönlendirme kuralları üzerinde ayrıntılı denetim sağlar.

#### Örnek: 8080 Portundaki Trafiği 80'e Yönlendir

1. **Bir `iptables` kuralı ekleyin**:

```bash
sudo iptables -t nat -A PREROUTING -p tcp --dport 8080 -j REDIRECT --to-port 80
```

2. **Kuralı kaydedin**:
Kuralı yeniden başlatmalar boyunca kalıcı hale getirmek için `iptables-services` yükleyin:

```bash
sudo dnf install iptables-services
sudo service iptables save
```

---

### 6. **Port Yönlendirmeyi Test Etme**

Port yönlendirmeyi yapılandırdıktan sonra, beklendiği gibi çalıştığından emin olmak için kurulumu test edin.

1. **Açık portları kontrol edin**:
Dinleme portlarını doğrulamak için `netstat` veya `ss` kullanın:

```bash
ss -tuln
```

2. **Bağlantıyı test edin**:
İletilen portları test etmek için `telnet` veya `curl` kullanın:

```bash
curl http://localhost:8080
```

---

### Port Yönlendirme için Güvenlik Hususları

Port yönlendirme güçlü bir araç olsa da potansiyel riskleri de beraberinde getirir. Şu en iyi uygulamaları izleyin:

- **Erişimi kısıtlayın**: Yönlendirmeyi belirli IP adresleri veya aralıklarıyla sınırlayın.
- **Şifreleme kullanın**: Güvenli yönlendirme için her zaman SSH kullanın.
- **Kullanılmayan portları kapatın**: Saldırı yüzeylerini en aza indirmek için gereksiz portları düzenli olarak denetleyin ve kapatın. - **Trafiği izleyin**: İletilen trafiği izlemek için `tcpdump` veya `Wireshark` gibi izleme araçlarını kullanın.

---

### Yaygın Sorunları Giderme

#### Sorun 1: "İzin Reddedildi"

- Kullanıcının gerekli SSH izinlerine sahip olduğundan ve hedef portun uzak sunucuda açık olduğundan emin olun.

#### Sorun 2: Port Zaten Kullanımda

- Portu kullanarak çakışan hizmetleri kontrol edin:

```bash
sudo ss -tuln | grep 8080
```

- Çakışan hizmeti durdurun veya farklı bir port kullanın.

#### Sorun 3: Güvenlik Duvarı Trafiği Engelliyor

- Hem yerel hem de uzak sistemlerdeki güvenlik duvarı kurallarını doğrulayın:

```bash
sudo firewall-cmd --list-all
```

---

### Port Yönlendirmenin Gerçek Dünya Uygulamaları

1. **Web Geliştirme**:

- Web uygulamalarını yerel olarak test edin ve bunları uzaktan işbirlikçilere açın.

2. **Veritabanı Erişimi**:

- Genel internete açmadan uzak bir veritabanına güvenli bir şekilde bağlanın.

3. **Uzak Masaüstü**:

- SSH tünelleri aracılığıyla uzak bir masaüstü ortamına erişin.

4. **Oyun Sunucuları**:

- Oyun sunucularını bir NAT güvenlik duvarının arkasında barındırın ve bunlara dışarıdan erişin.

---

### Sonuç

Port yönlendirme, ağlar veya sunucularla çalışan herkes için paha biçilmez bir araçtır. İster geliştirme, sorun giderme veya uzak sistemleri yönetme için kullanın, AlmaLinux port yönlendirmeyi verimli bir şekilde yapılandırmak için esneklik ve araçlar sağlar.

Bu kılavuzu izleyerek, port yönlendirmeyi özel ihtiyaçlarınıza uyacak şekilde uygulayabilir ve güvence altına alabilirsiniz. Bu gönderiyi yararlı bulduysanız veya ek ipuçlarınız varsa, bunları aşağıdaki yorumlarda paylaşmaktan çekinmeyin. İyi ağ oluşturmalar!
