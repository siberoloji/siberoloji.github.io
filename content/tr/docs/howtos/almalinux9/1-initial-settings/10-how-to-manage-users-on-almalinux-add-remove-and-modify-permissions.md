---
title: "AlmaLinux'ta Kullanıcılar Nasıl Yönetilir, Eklenir, Kaldırılır ve Değiştirilir"
description: AlmaLinux'ta kullanıcı eklemeyi, kaldırmayı ve değiştirmeyi öğrenin. İzinler, kotalar ve kullanıcı yönetimi için ayrıntılı örnekler ve en iyi uygulamalar.
date: 2024-11-29
draft: false
tags:
  - AlmaLinux
  - adduser
  - chmod
categories:
  - Linux
  - Linux How-to
linkTitle: Kullanıcı Yönetimi
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 10
keywords:
  - Manage Users
featured_image: /images/almalinux.webp
url: /tr/manage-users-almalinux-add-remove-modify
translationKey: manage-users-almalinux-add-remove-modify
---
### **1. AlmaLinux'ta Kullanıcı Yönetimini Anlamak**

AlmaLinux'ta kullanıcı yönetimi, sisteme kimin erişebileceğini, ne yapabileceklerini ve kaynaklarını yönetmeyi içerir. Buna yeni kullanıcılar eklemek, parolalar ayarlamak, izinler atamak ve artık ihtiyaç duyulmadığında kullanıcıları kaldırmak dahildir. AlmaLinux, `adduser`, `usermod`, `passwd` ve `deluser` gibi Linux çekirdeğinin yerleşik kullanıcı yönetimi komutlarını kullanır.

---

### **2. Yeni Bir Kullanıcı Ekleme**

AlmaLinux, yeni bir kullanıcı oluşturmak için `useradd` komutunu sağlar. Bu komut, ana dizinini, varsayılan kabuğunu ve diğer seçenekleri belirterek bir kullanıcı eklemenize olanak tanır.

### **Yeni Bir Kullanıcı Ekleme Adımları:**

1. Terminalinizi açın ve kök kullanıcıya veya sudo ayrıcalıklarına sahip bir kullanıcıya geçin. 2. Bir kullanıcı eklemek için aşağıdaki komutu çalıştırın:

```bash
sudo useradd -m -s /bin/bash newusername

```

- `m`: Kullanıcı için bir ana dizin oluşturur.
- `s`: Kabuğu belirtir (varsayılan: `/bin/bash`).

3. Yeni kullanıcı için bir parola ayarlayın:

```bash
sudo passwd newusername

```

{{% alert title="Uyarı" color="uyarı" %}}
[Parolasız hesapların tehlikesi](/security-implications-passwordless-user-accounts-almalinux/) herkesin parola olmadan oturum açabilmesidir.
{{% /alert %}}

1. Kullanıcının oluşturulduğunu doğrulayın:

```bash
cat /etc/passwd | grep newusername

```

Bu, kullanıcı adı, ana dizin ve kabuk dahil olmak üzere yeni oluşturulan kullanıcının ayrıntılarını görüntüler.

---

### **3. Kullanıcı Ayrıntılarını Değiştirme**

Bazen, kabuk, kullanıcı adı veya grup gibi kullanıcı bilgilerini güncellemeniz gerekir. AlmaLinux bunun için `usermod` komutunu kullanır.

### **Bir Kullanıcının Kabuğunu Değiştirme**

Mevcut bir kullanıcının kabuğunu değiştirmek için:

```bash
sudo usermod -s /usr/bin/zsh newusername

```

Değişikliği doğrulayın:

```bash
cat /etc/passwd | grep newusername

```

### **Bir Kullanıcıyı Yeniden Adlandırma**

Bir kullanıcıyı yeniden adlandırmak için:

```bash
sudo usermod -l newusername oldusername

```

Ek olarak, ana dizinlerini yeniden adlandırın:

```bash
sudo mv /home/oldusername /home/newusername
sudo usermod -d /home/newusername newusername

```

### **Bir Kullanıcıyı Bir Gruba Ekleme**

Gruplar izinlerin daha iyi yönetilmesini sağlar. Mevcut bir gruba kullanıcı eklemek için:

```bash
sudo usermod -aG groupname newusername

```

Örneğin, `newusername` kullanıcısını `wheel` grubuna (sudo erişimi sağlayan) eklemek için:

```bash
sudo usermod -aG wheel newusername

```

---

### **4. Bir Kullanıcıyı Kaldırma**

Bir kullanıcıyı AlmaLinux'tan kaldırmak, hesabını ve isteğe bağlı olarak ana dizinini silmeyi içerir. Bu amaçla `userdel` komutunu kullanın.

### **Kullanıcıyı Kaldırma Adımları:**

1. Ana dizinini silmeden bir kullanıcıyı silmek için:

```bash
sudo userdel newusername

```

2. Ana diziniyle birlikte bir kullanıcıyı silmek için:

```bash
sudo userdel -r newusername

```

3. Kullanıcının kaldırıldığını doğrulayın:

```bash
cat /etc/passwd | grep newusername

```

---

### **5. Kullanıcı İzinlerini Yönetme**

Linux'taki kullanıcı izinleri, üç varlık için **okuma (r)**, **yazma (w)** ve **yürütme (x)** olarak kategorilendirilen dosya izinleri kullanılarak yönetilir: **sahip**, **grup** ve **diğerleri**.

### **İzinleri Kontrol Etme**

Dosya izinlerini görüntülemek için `ls -l` komutunu kullanın:

```bash
ls -l dosya adı

```

Çıktı şu şekilde görünebilir:

```bash
-rw-r--r-- 1 sahip grubu 1234 28 Kas 10:00 dosya adı

```

- `rw-`: Sahip okuyabilir ve yazabilir.
- `r--`: Grup üyeleri yalnızca okuyabilir.
- `r--`: Diğerleri yalnızca okuyabilir.

### **İzinleri Değiştirme**

- Dosya izinlerini değiştirmek için `chmod` komutunu kullanın:

```bash
sudo chmod 750 dosya adı

```

- `750` izinleri şu şekilde ayarlar:
- Sahip: okuma, yazma, yürütme.
- Grup: okuma ve yürütme.
- Diğerleri: erişim yok.

- Dosya sahipliğini değiştirmek için `chown` kullanın:

```bash
sudo chown newusername:groupname filename

```

---

### **6. Gelişmiş Kullanıcı Yönetimi**

### **Kullanıcı Kotalarını Yönetme**

AlmaLinux, disk alanı kullanımını kısıtlamak için kullanıcı kotalarını destekler. Kotaları etkinleştirmek için:

- Kota paketini yükleyin:

```bash
sudo dnf install quota

```

- Bir dosya sisteminde kotaları etkinleştirmek için `/etc/fstab` dosyasını düzenleyin. Örneğin:

```bash
/dev/sda1 / ext4 defaults,usrquota,grpquota 0 1

```

- Dosya sistemini yeniden bağlayın:

```bash
sudo mount -o remount /

```

- Kota izlemeyi başlatın:

```bash
sudo quotacheck -cug /

```

- Bir kullanıcıya kota atayın:

```bash
sudo setquota -u newusername 50000 55000 0 0 /

```

Bu, kullanıcı için 50 MB'lık yumuşak bir sınır ve 55 MB'lık sabit bir sınır belirler.

---

### **7. Kullanıcı Yönetimi için Komut Dosyaları Oluşturma ve Kullanma**

Birden fazla kullanıcı eklemek gibi tekrarlayan görevler için komut dosyaları zamandan tasarruf sağlayabilir.

### **Birden Fazla Kullanıcı Eklemek İçin Örnek Komut Dosyası**

Bir komut dosyası dosyası oluşturun:

```bash
sudo nano add_users.sh

```

Aşağıdaki kodu ekleyin:

```bash
#!/bin/bash
while read username; do
sudo useradd -m -s /bin/bash "$username"
echo "Kullanıcı $username başarıyla eklendi!"
done < user_list.txt

```

Kaydedin ve çıkın, ardından komut dosyasını yürütülebilir hale getirin:

```bash
chmod +x add_users.sh

```

Kullanıcı adları listesini içeren bir dosyayla (`user_list.txt`) komut dosyasını çalıştırın.

---

### **8. Kullanıcı Yönetimi İçin En İyi Uygulamalar**

1. **Grupları Kullanın:** Daha iyi izin yönetimi için kullanıcıları gruplara atayın. 2. **Parola Politikalarını Uygulayın:** Güçlü parolaları uygulamak için `pam_pwquality` gibi araçları kullanın.
3. **Kullanıcı Hesaplarını Denetleyin:** Etkin olmayan veya gereksiz hesapları periyodik olarak kontrol edin.
4. **Yapılandırmaları Yedekleyin:** Büyük değişiklikler yapmadan önce `/etc/passwd` ve `/etc/shadow` gibi önemli dosyaları yedekleyin.

---

### **Sonuç**

AlmaLinux'ta kullanıcıları yönetmek, ilgili komutları ve kavramları anladığınızda basittir. Sağlanan adımları ve örnekleri izleyerek, kullanıcıları etkili bir şekilde ekleyebilir, değiştirebilir ve kaldırabilir, ayrıca izinleri ve kotaları yönetebilirsiniz. AlmaLinux'un esnekliği, yöneticilerin güvenli ve düzenli bir sistemi sürdürmek için ihtiyaç duydukları araçlara sahip olmalarını sağlar.

AlmaLinux'ta belirli bir kullanıcı yönetimi zorluğunuz var mı? Aşağıdaki yorumlarda bize bildirin!
