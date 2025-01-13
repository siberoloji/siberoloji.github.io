---
draft: false

title:  'Raspberry Pi 4 ile NAS Sunucusu Nasıl Oluşturulur'
date: '2024-10-15T16:53:41+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/raspberry-pi-4-ile-nas-sunucusu-nasil-olusturulur/
 
featured_image: /images/raspberrypi.webp
categories:
    - 'Raspberry Pi'
---
Günümüzün dijital dünyasında, merkezi depolama çözümlerine olan ihtiyaç artıyor. Medya dosyalarını, yedeklemeleri veya belgeleri depolamak isteyip istemediğinize bakılmaksızın, bir Ağ Bağlantılı Depolama (NAS) sunucusu, yerel bir ağdaki veya hatta uzaktan cihazlar arasında dosyalara erişmek için kullanışlı bir yol sunar. Ticari NAS cihazları mevcut olsa da pahalı olabilirler. Neyse ki, bir Raspberry Pi 4 ile kendi bütçe dostu NAS sunucunuzu oluşturabilirsiniz.

Bu detaylı kılavuzda, Raspberry Pi 4 kullanarak bir NAS sunucusu kurma sürecini adım adım anlatacağız. Sonunda, evinizdeki veya ofisinizdeki çeşitli cihazlardan erişilebilen tam işlevli bir NAS'a sahip olacaksınız.

NAS Sunucusu Nedir?

Ağ Bağlantılı Depolama (NAS) sunucusu, cihazlar arasında merkezi veri depolama ve dosya paylaşımı sağlayan, bir ağa bağlı özel bir cihazdır. Bir NAS ile birden fazla kullanıcı ağ üzerinden sorunsuz bir şekilde verilere erişebilir ve bunları paylaşabilir. NAS sunucuları genellikle şunlar için kullanılır:
* **Medya akışı** (film, müzik, fotoğraf)

* Bilgisayarlar ve mobil cihazlar için **yedekleme depolaması**

* Ev veya ofis ağı içinde **dosya paylaşımı**

* Dünyanın her yerinden dosyalara **uzaktan erişim**
Raspberry Pi 4 ile NAS sunucusu oluşturmak uygun maliyetli, enerji açısından verimli ve özelleştirilebilir olduğundan kişisel kullanım veya küçük ölçekli iş ortamları için idealdir.

Neden Raspberry Pi 4?

Raspberry Pi 4, önceki modellere kıyasla geliştirilmiş donanımı nedeniyle bir NAS sunucusu için mükemmel bir adaydır. Temel özellikleri şunlardır:
* **Dört çekirdekli 64-bit işlemci** : Ağ trafiğini yönetme ve dosya yönetimi için daha iyi performans sağlar.

* **8 GB'a Kadar RAM** : Birden fazla kullanıcıyı ve dosya işlemlerini yönetmek için yeterli bellek.

* **Gigabit Ethernet portu** : Yerel ağınız üzerinden hızlı ve kararlı dosya aktarımı sağlar.

* **USB 3.0 bağlantı noktaları** : Sabit diskler veya SSD'ler gibi harici depolama aygıtlarını bağlamak ve yüksek hızlı veri erişimi sağlamak için gereklidir.
Raspberry Pi 4 ayrıca düşük güçte çalışıyor, bu da 7/24 çevrimiçi kalması gereken bir NAS sunucusu için ideal.

İhtiyacınız Olanlar

Başlamadan önce aşağıdaki bileşenlerin hazır olduğundan emin olun:
* **Raspberry Pi 4** (Daha iyi performans için 4GB veya 8GB modeli önerilir)

* Raspberry Pi'nin işletim sistemi için **MicroSD kart (16 GB veya üzeri)**

* **Harici USB sabit disk veya SSD** (dosyalarınızı depolamak için)

* **USB 3.0 destekli hub** (isteğe bağlı ancak birden fazla sabit disk kullanılıyorsa önerilir)

* **Raspberry Pi 4 güç kaynağı** (resmi veya yüksek kaliteli üçüncü taraf)

* Pi'yi yönlendiricinize bağlamak için **Ethernet kablosu**

* **İlk kurulum için klavye, fare ve monitör** (başsız yapılandırma kullanılıyorsa isteğe bağlı)

* **Raspberry Pi OS** (Debian tabanlı, daha önce Raspbian olarak biliniyordu)
Şimdi NAS sunucunuzu oluşturmak için adım adım sürece geçelim.

Adım 1: Raspberry Pi 4'ü Kurun
#### 1.1 Raspberry Pi İşletim Sistemini Kurun
* En son **Raspberry Pi işletim sistemini** resmi Raspberry Pi web sitesinden indirin.

* İşletim sistemi imajını MicroSD kartınıza yazmak için **Raspberry Pi Imager** veya **Balena Etcher** gibi yazılımları kullanın .

* MicroSD kartı Raspberry Pi 4'ünüze takın ve açın. Klavye, fare ve monitör kullanıyorsanız, standart kurulumla devam edin. Başsız (çevre birimleri olmadan) kurulum yapıyorsanız, SD kartı takmadan önce SD kartın önyükleme bölümünde adlandırılmış boş bir dosya oluşturarak **SSH erişimini etkinleştirebilirsiniz.**`ssh`

#### 1.2 Güncelleme ve Yükseltme

Raspberry Pi OS yüklendikten ve çalışmaya başladıktan sonra sisteminizi güncellemeniz önemlidir. Bir terminal penceresi açın ve aşağıdaki komutları girin:
```bash
sudo apt update
sudo apt upgrade```

Bu, en son yazılım güncellemelerine ve güvenlik yamalarına sahip olmanızı sağlar.

Adım 2: Dosya Paylaşımı için Samba'yı Kurun ve Yapılandırın

**Farklı cihazlarda dosya paylaşımını etkinleştirmek için Samba'yı** kullanacağız . Samba, Linux ve Windows cihazları arasında dosya ve yazıcı paylaşımına izin veren popüler bir yazılım paketidir.
#### 2.1 Samba'yı yükleyin

Samba'yı yüklemek için aşağıdaki komutu çalıştırın:
```bash
sudo apt install samba samba-common-bin
```
#### 2.2 Dosya Depolama için Bir Dizin Oluşturma

Paylaşılan dosyalarınızı depolayacağınız bir klasör oluşturun. Örneğin, dizinde şu şekilde adlandırılan bir klasör `shared`oluşturalım `/home/pi`:
```bash
mkdir /home/pi/shared
```
#### 2.3 Samba'yı yapılandırın

Sonra, dosya paylaşımı için ayarları belirtmek üzere Samba'nın yapılandırma dosyasını düzenlememiz gerekiyor. Yapılandırma dosyasını bir metin düzenleyici kullanarak açın:
```bash
sudo nano /etc/samba/smb.conf```

Dosyanın en altına gidin ve aşağıdaki yapılandırmayı ekleyin:
```bash
[Shared]
   comment = Shared Folder
   path = /home/pi/shared
   browseable = yes
   writeable = yes
   only guest = no
   create mask = 0777
   directory mask = 0777
   public = no```

Bu yapılandırma, ağ üzerinden erişilebilen paylaşılan bir klasör oluşturacaktır. İzinler, klasöre okuma ve yazma erişimi sağlar.
#### 2.4 Samba Kullanıcısı Oluşturma

NAS sunucunuzu güvence altına almak için, paylaşılan dosyalara erişebilen bir Samba kullanıcısı oluşturun. Bir kullanıcı eklemek için aşağıdaki komutu kullanın ( `pi`gerekirse kullanıcı adınızla değiştirin):
```bash
sudo smbpasswd -a pi```

Kullanıcı için bir parola ayarlamanız istenecektir. İşlem tamamlandıktan sonra, değişiklikleri uygulamak için Samba hizmetini yeniden başlatın:
```bash
sudo systemctl restart smbd
```

Adım 3: Harici Sabit Sürücüyü Bağlayın

Bir NAS sunucusu genellikle dosyaları depolamak için harici bir sabit sürücüye güvenir. Harici sürücünüzü Raspberry Pi 4'e bağlayalım.
#### 3.1 Harici Sürücüyü Tanımlayın

Öncelikle harici sabit diskinizi Raspberry Pi 4'ün USB 3.0 portlarından birine takın. Sürücünün adını bulmak için şu komutu çalıştırın:
```bash
sudo fdisk -l
```

Listede harici sabit sürücünüzü arayın (genellikle bir adı `/dev/sda1`veya benzeri bir adı vardır).
#### 3.2 Sürücüyü Bağlayın

Sürücü için bir bağlama noktası oluşturun:
```bash
sudo mkdir /mnt/external
```

Sürücüyü şu dizine bağlayın:
```bash
sudo mount /dev/sda1 /mnt/external
```

Bağlantıyı kalıcı hale getirmek için (yani önyüklemede otomatik olarak bağlanmak için), sürücüyü dosyaya eklemeniz gerekir `/etc/fstab`. Dosyayı açın:
```bash
sudo nano /etc/fstab
```

En alta şu satırı ekleyin:
```bash
/dev/sda1 /mnt/external auto defaults 0 0```

Kaydedin ve çıkın. Artık harici sürücünüz başlangıçta otomatik olarak bağlanacaktır.

Adım 4: Diğer Aygıtlardan NAS'a Erişimi Yapılandırın
#### 4.1 Windows'tan NAS'a Erişim

Windows bilgisayarınızda **Dosya Gezgini'ni** açın ve adres çubuğuna Raspberry Pi'nin IP adresini şu şekilde yazın:
```bash
\\192.168.X.XXX```

Samba kullanıcı adınızı ve parolanızı girmeniz istenecektir. Kimlik doğrulamasından sonra, paylaşılan klasöre erişebileceksiniz.
#### 4.2 macOS'tan NAS'a erişim

macOS aygıtında **Finder'ı** açın , tuşuna basın `Cmd + K`ve Raspberry Pi'nin IP adresini şu şekilde girin:
```bash
smb://192.168.X.XXX```

Samba kimlik bilgileriniz istenecek ve kimliğiniz doğrulandıktan sonra paylaşılan klasöre erişebileceksiniz.

Adım 5: İsteğe bağlı – Uzaktan Erişimi Ayarlayın

NAS sunucunuza evinizin veya ofisinizin ağı dışından uzaktan erişmek istiyorsanız, **OpenVPN** veya **WireGuard** aracılığıyla uzaktan erişim ayarlayabilirsiniz . Ayrıca, **dinamik DNS (DDNS),** periyodik olarak değişirse NAS sunucunuzun IP adresini yönetmenize yardımcı olabilir.

Adım 6: NAS Kurulumunuzu Optimize Edin

Temel kurulum tamamlanmış olsa da yapabileceğiniz birkaç iyileştirme ve optimizasyon var:
* **Daha fazla depolama alanı ekleyin** : Depolama kapasitenizi genişletmek için ek harici sürücüler bağlayın. Yedeklilik için bir RAID yapılandırması bile ayarlayabilirsiniz.

* **Otomatik yedeklemeler** : NAS'ınıza yedeklemeleri otomatikleştirmek için **rsync** gibi yazılımları kullanın .

* **Medya akışı : Raspberry Pi'nize ****Plex** veya **Emby** gibi medya sunucusu yazılımları yükleyerek videoları ve müzikleri cihazlarınıza aktarın.
Sonuç

Raspberry Pi 4 ile bir NAS sunucusu oluşturmak, dosyaları eviniz veya ofis ağınız genelinde depolamak ve paylaşmak için kişisel bir bulut oluşturmanın uygun maliyetli ve güçlü bir yoludur. Samba ile Windows, macOS veya Linux cihazlarından dosyalara kolayca erişebilir ve bu da onu depolama ihtiyaçlarınız için esnek bir çözüm haline getirir.

Bu kılavuzu takip ederek, ek depolama, otomatik yedeklemeler veya medya akışı yetenekleriyle daha da özelleştirilebilen tam işlevli bir NAS sunucusuna sahip olacaksınız. Kişisel kullanım veya küçük bir işletme için olsun, bir Raspberry Pi 4 NAS sunucusu uygun bir fiyata performans, ölçeklenebilirlik ve kolaylık sunar.
