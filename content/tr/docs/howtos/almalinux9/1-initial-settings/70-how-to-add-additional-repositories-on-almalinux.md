---
title: AlmaLinux İlave Paket Depoları Ekleme
description: Bu yazımızda AlmaLinux'ta depoları ekleme, yapılandırma ve yönetme konularını inceleyecegiz.
date: 2024-11-30
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: İlave Paket Depoları Ekleme
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 70
translationKey: how-to-add-additional-repositories-on-almalinux
keywords:
  - AlmaLinux
  - Repositories on AlmaLinux

featured_image: /images/almalinux.webp
url: /tr/add-additional-repositories-almalinux
---
AlmaLinux, CentOS'un CentOS Stream'e geçişinden sonra bıraktığı boşluğu doldurmak için tasarlanmış popüler bir açık kaynaklı Linux dağıtımıdır. Sağlam, kurumsal düzeydeki kararlılığı onu sunucular ve üretim ortamları için favori yapar. Ancak, temel depolar her yazılım paketini veya ihtiyaç duyduğunuz belirli uygulamaların en son sürümlerini içermeyebilir.

Bunu ele almak için AlmaLinux, daha geniş bir yazılım yelpazesine erişim sağlayabilen ek depolar eklemenize olanak tanır. Bu makale, AlmaLinux'ta depoları ekleme, yapılandırma ve yönetme adımlarında size yol gösterir.

---

### **Linux'ta Depolar Nelerdir?**

Depolar, yazılım paketlerinin depolandığı ve yönetildiği depolama konumlarıdır. AlmaLinux, bu depolarla etkileşim kurmak için YUM ve DNF paket yöneticilerini kullanır ve kullanıcıların yazılımları zahmetsizce aramasını, yüklemesini, güncellemesini ve yönetmesini sağlar.

Üç ana depo türü vardır:

1. **Temel Depolar**: AlmaLinux tarafından resmi olarak sağlanır ve çekirdek paketleri içerir.
2. **Üçüncü Taraf Depoları**: Harici topluluklar veya kuruluşlar tarafından sürdürülür ve özel yazılımlar sunar.
3. **Özel Depolar**: Kullanıcılar veya kuruluşlar tarafından tescilli veya dahili olarak geliştirilen paketleri barındırmak için oluşturulur.

Ek depolar eklemek şunlar için yararlı olabilir:

- Yazılımın daha yeni sürümlerine erişim.
- Temel depolarda bulunmayan uygulamaları yükleme.
- Üçüncü taraf veya tescilli araçlara erişim.

---

### **Depo Eklemeden Önce Hazırlık**

Depo yönetimine dalmadan önce şu hazırlık adımlarını izleyin:

#### 1. **Sistem Güncellemelerini Sağlayın**

Uyumluluk sorunlarını en aza indirmek için sisteminizi güncelleyin:

```bash
sudo dnf update -y
```

#### 2. **AlmaLinux Sürümünü Doğrulayın**

Depo yapılandırmalarıyla uyumluluğu sağlamak için AlmaLinux sürümünüzü kontrol edin:

```bash
cat /etc/os-release
```

#### 3. **Temel Araçları Yükleyin**

`dnf-plugins-core` gibi araçların yüklü olduğundan emin olun:

```bash
sudo dnf install dnf-plugins-core -y
```

---

### **AlmaLinux'a Ek Depolar Ekleme**

#### **1. Resmi Depoları Etkinleştirme**

AlmaLinux, varsayılan olarak devre dışı bırakılabilen yerleşik depolarla birlikte gelir. Aşağıdaki komutu kullanarak bunları etkinleştirebilirsiniz:

```bash
sudo dnf config-manager --set-enabled <depo-adı>
```

Örneğin, `PowerTools` deposunu etkinleştirmek için:

```bash
sudo dnf config-manager --set-enabled powertools
```

Deponun etkin olup olmadığını doğrulamak için:

```bash
sudo dnf repolist enabled
```

---

#### **2. EPEL Deposu Ekleme**

Ekstra Paketler Enterprise Linux (EPEL) deposu AlmaLinux için ek yazılım paketleri sağlar. EPEL eklemek için:

```bash
sudo dnf install epel-release -y
```

Eklemeyi doğrulayın:

```bash
sudo dnf repolist
```

Artık EPEL deposundan yazılım yükleyebilirsiniz.

---

#### **3. RPM Fusion Deposu Ekleme**

Multimedya ve ücretsiz olmayan paketler için RPM Fusion popüler bir seçimdir.

##### Ücretsiz deponun eklenmesi

```bash
sudo dnf install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm
```

##### Ücretsiz olmayan deponun eklenmesi

```bash
sudo dnf install https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm
```

Kurulumdan sonra, RPM Fusion'ın eklendiğini doğrulayın:

```bash
sudo dnf repolist
```

---

#### **4. Özel Depo Ekleme**

Manuel olarak bir depo eklemek için özel bir `.repo` dosyası oluşturabilirsiniz.

1. **`/etc/yum.repos.d/` dizininde bir `.repo` dosyası oluşturun:**

```bash
sudo nano /etc/yum.repos.d/custom.repo
```

2. **Depo ayrıntılarını ekleyin:**
Örneğin:

```ini
[custom-repo]
name=Custom Repository
baseurl=http://example.com/repo/
enabled=1
gpgcheck=1
gpgkey=http://example.com/repo/RPM-GPG-KEY
```

3. **Dosyayı kaydedin ve depo listesini güncelleyin:**

```bash
sudo dnf makecache
```

4. **Depoyu test edin:**
Özel depo:

```bash
sudo dnf install <paket-adı>
```

---

#### **5. Üçüncü Taraf Depoları Ekleme**

Remi veya MySQL depoları gibi üçüncü taraf depoları genellikle popüler yazılımların daha yeni sürümlerini sağlar.

##### Remi deposunu ekleyin

1. Depoyu yükleyin:

```bash
sudo dnf install https://rpms.remirepo.net/enterprise/remi-release-$(rpm -E %rhel).rpm
```

2. Belirli bir depo dalını etkinleştirin (örneğin, PHP 8.2):

```bash
sudo dnf module enable php:remi-8.2
```

3. Paketi yükleyin:

```bash
sudo dnf install php
```

---

### **Depoları Yönetme**

#### **1. Depoları Listeleme**

Etkinleştirilmiş tüm depoları görüntüle:

```bash
sudo dnf repolist enabled
```

Etkinleştirilmiş ve devre dışı bırakılmış tüm depoları görüntüle:

```bash
sudo dnf repolist all
```

#### **2. Depoları Etkinleştirme/Devre Dışı Bırakma**

Bir depoyu etkinleştir:

```bash
sudo dnf config-manager --set-enabled <depo-adı>
```

Bir depoyu devre dışı bırak:

```bash
sudo dnf config-manager --set-disabled <depo-adı>
```

#### **3. Bir Depoyu Kaldırma**

Bir depoyu kaldırmak için, `.repo` dosyasını silin:

```bash
sudo rm /etc/yum.repos.d/<depo-adı>.repo
```

Ardından önbelleği temizleyin:

```bash
sudo dnf clean all
```

---

### **Depo Yönetimi İçin En İyi Uygulamalar**

1. **Güvenilir Kaynakları Kullanın**: Güvenlik risklerinden kaçınmak için yalnızca güvenilir kaynaklardan depolar ekleyin.

2. **GPG Anahtarlarını Doğrulayın**: Paketlerin bütünlüğünü sağlamak için her zaman GPG anahtarlarını doğrulayın.

3. **Depo Çakışmalarından Kaçının**: Aynı paketleri sağlayan birden fazla depo çakışmalara neden olabilir. Gerekirse öncelik ayarlarını kullanın.

4. **Düzenli Güncellemeler**: Uyumluluk sorunlarından kaçınmak için depolarınızı güncel tutun.
5. **Yedekleme Yapılandırmaları**: Değişiklik yapmadan önce `.repo` dosyalarını yedekleyin.

---

### **Sonuç**

AlmaLinux'a ek depolar eklemek, çok sayıda yazılımın kilidini açar ve sisteminizi belirli ihtiyaçları karşılayacak şekilde uyarlayabilmenizi sağlar. Bu kılavuzda özetlenen adımları izleyerek, sistem kararlılığı ve güvenliği için en iyi uygulamalara bağlı kalırken depoları kolayca ekleyebilir, yönetebilir ve koruyabilirsiniz.

EPEL ve RPM Fusion gibi güvenilir üçüncü taraf kaynaklardan paketler yüklüyor veya dahili kullanım için özel depolar kuruyor olun, AlmaLinux sisteminizi geliştirmek için ihtiyaç duyduğunuz esnekliği sağlar.

Bugün kurulumunuza doğru depoları entegre ederek AlmaLinux'un potansiyelini keşfedin!

---

*AlmaLinux'a depo ekleme konusunda favori bir deponuz veya deneyiminiz var mı? Düşüncelerinizi aşağıdaki yorumlarda paylaşın!*
