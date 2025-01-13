---
draft: false

title:  'UEFI Kavramları Hakkında Detaylar'
date: '2016-10-08T01:40:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'detaylı UEFI kavramları hakkındaki yazıyı, bir kaç harf hatasını düzelterek burada yayınlamak istedik. Başvuru kaynağı niteliğinde bir çalışma olmuş. Sizlerin de Linux bilişim ile ilgili yazılarınız varsa, burada yayınlanmasını teklif edebilirsiniz.' 
 
url:  /tr/uefi-kavramlari-hakkinda-detaylar/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Temel Linux'
tags:
    - linux
    - uefi
---
Ubuntu Forum dan <a href="https://forum.ubuntu-tr.net/index.php?action=profile;u=31663" target="_blank" rel="noreferrer noopener">ThomasK1907</a> isimli kullanıcının hazırlamış olduğu detaylı UEFI kavramları hakkındaki yazıyı, bir kaç harf hatasını düzelterek burada yayınlamak istedik. Başvuru kaynağı niteliğinde bir çalışma olmuş. Sizlerin de Linux bilişim ile ilgili yazılarınız varsa, burada yayınlanmasını teklif edebilirsiniz.

Kaynak: <a href="https://wiki.ubuntu-tr.net/index.php?title=UEFI_ve_BIOS_hakk%C4%B1nda_detayl%C4%B1_bilgiler" target="_blank" rel="noreferrer noopener">Ubuntu Wiki</a>

## Sleep, hibernate, hybrid sleep
* 
* **Sleep** (Uyku = Stand By = Suspend = Suspend to RAM) ile işletim sistemi tüm uygulamaları durdurur (pause) ve sistmein az enerji harcamasını sağlar. Sistem kapanmaz, bu sebeple saniyeler içerisinde açılarak devam edebilir.

* **Hibernate** (Hazırda beklet = Suspend to Disk), sleep ile aynı mantıktadır. Fakat sistemi tamamen kapatabilmek için RAM'deki bilgileri sabit diskte saklar, yeniden açılması zaman almaktadır.

* **Hybrid Sleep** (Suspend to both) modunda kullanıcı oturumu kapatılır (logout). Sadece işletim sistemi ve servisleri hazırda bekletilir (hibernate). Windows, 8 ve sonrası sürümlerde "shut down" işlemi ile "Hybrid Sleep" uygulamaktadır. Gerçek bir sistem kapanması için "yeniden başlat" işlemi yapılmalıdır. Windows ayalarında "fast startup" (ya da fast boot) isimli bu özellik devre dışı bırakılabilir.
Bazı işletim sistemlerinde "Hybrit Sleep" aynı işlevi yapmamaktadır. Bazı sistemlerde şu yapılıyor: Sistemdeki tüm uygulamalar durduruluyor (sleep'te olduğu gibi). RAM bellekteki veriler Hibernate'deki gibi HDD'de saklanıyor. RAM'deki veriler silinmiyor, aynen bırakılıyor. Yani sleep moduna fazladan RAM'deki veriler HDD'de de saklanmış oluyor. Bu şekilde; makine aksi bir durumda kapanır ise en kötü ihtimalle hibernate tarzı bir açılış yapıyor. Eğer sistem kapatılmamış ise, sleep gibi hızlı açılıyor.
* 
* **Connected Standby (ya da InstantGo)** mobil cihazlarda görülen bir yöntemdir, masaüstlerine çok sonradan gelmiştir. Sleep ile aynı mantıktadır. Tek farkı, ek olarak; isteyen uygulamalar internet ağını kullanacak kod bloklarını sürekli arka planda çalıştırabilirler.
## Özet açılış(boot) süreci
* 
* BIOS süreci (eski süreç)
`BIOS ----(HDD)----> MBR ----> Bootloader ----> OS`
* 
* UEFI sonrası yeni süreç:
`UEFI ----(HDD)----> Bootloader ----> OS`
* 
* UEFI sonrası, BIOS uyumlu kurulmuş bir disk üzerinde işletim sistemini başlatma:
`UEFI ----(HDD)----> MBR ----> Bootloader ----> OS`

## Uyku ve diğer kapanma metodları sonrası boot süreçleri nasıl değişiyor?

Uyku'ya alınan cihazın açılması Firmware'den (aygıt yazılımı) itibaren olmuyor. Sistem hiç kapanmamış olduğu için direk olarak işletim sistemi devam ediyor. Hibernate işleminde işletim sistemi normal kapanma metodunu uyguluyor. Açılışta da normal açılma süreci işleniyor. İşletim sistemleri otomatik olarak son durumunu algılayıp, Hibernate edilmiş ise dosyadan RAM'e aktarım yapıp devam ediyor. Eğer Hibernate edilmemiş ise; normal olarak açılıyor. Boot sürecinde bir değişiklik söz konusu değil.

## MacOS boot işlemi

Apple, EFI'yi ilk kullanan şirketlerden biri. 2005 yılında, Apple Intel işlemcilere geçiş yaptığında klasik BIOS yerine EFI kullanmayı tercih etmişti. Yıllar sonra, UEFI spesifikasyonu sayesinde tüm PC'lerde UEFI kullanılmaya başlandı ve bu bir standart haline geldi. Mac'lerde şu an Apple'ın kendine göre uyarladığı bir EFI bulunmakta. Mac'lerdeki firmware tıpkı normal PC'lerde olduğu gibi UEFI ve Legacy modda işletim sistemi boot edebilir. Ancak Apple'ın yaptığı düzenlemeler olmadan MacOS önyüklenemez.

## CSM (Compatibility Support Module)

UEFI'nin 'BIOS compatibility mode'una verilen özel isim. UEFI devre dışı bırakılamaz. UEFI MBR-tarzı bölümlü sabit disklerden işletim sistemi açabilir. Bu da UEFI'nin geriye uyumlu çalıştığı anlamına gelir. Fakat CSM, her UEFI'de olmak zorunda değildir.

## BIOS
* 
* Bir aygıt yazılımıdır (firmware).

* BIOS ana kartın üstündedir.

* Makine başlatıldığında hangi aygıttan (CD, DVD, HDD, USB gibi) boot edileceğini belirler.

* HDD ile başlatılırsa; HDD'nin ilk sektörünü okur. Burada okuduğu kısmı çalıştırır (execute). Çalıştırılan bu bölge MBR (Master Boot Record) olarak adlandırılır.
## MBR

MBR (Master Boot Record), sabit diskin ilk sektörüdür. İki kısımdan oluşur:

**1.** Master Boot Code: Çalıştırılabilir (execute) olan kısım. **2.** Master Partition Table: HDD için bölümlerin haritası. En çok 4 bölüm tutabilir. Bu sebeple 4 bölümden (birincil bölüm veya primary partition) fazlaya ayırmak gerekirse, diskin "genişletilmiş bölüm (extensable partititon)" özelliğinden yararlanılır. Genişletilmiş bölüm en fazla 1 adet olabilir. Fakat altında sınırsız bölüm barındırabilir. Altında olan her bölüme "mantıksal bölüm (logical partititon)" denir.

## Bootloader (önyükleyici)
* 
* MBR tarafından çalıştırılabilen bir sistemdir. Bu sistem ile işletim sistemleri baslatılır.

* Her işletim sisteminin bootloader dosyalarını bir yerde saklaması gereklidir ki MBR o dizini okusun ve çalıştırsın.

* Önyükleyici dosyaları Ubuntu'da varsayılan olarak `/boot/grub` dizinindedir. Bu dizinin Ubuntu'da, başlatılacak işletim sistemi ile aynı bölümde olma şartı yoktur. Örnegin `/boot/grub` , `/dev/sda9`'da iken, Ubuntu'nun tüm dosyaları `/dev/sda5`'te olabilir. Eğer bölümleri ayırırsak, Ubuntu'yu sildiğimizde <a href="https://wiki.ubuntu-tr.net/index.php?title=GRUB">GRUB</a> sistemi de silinmeyeceği için HDD'de kurulu diğer işletim sistemleri hala başlatılabilir olacaktır. Fakat Grub, Ubuntu ile aynı disk bölümünde olursa, Ubuntu bölüm silindiğinde (ya da formatlandığında), Grup başlamayacağı için HDD'de kurulu diğer işletim sistemleri de başlamayacaktır.

* Windows'un ön yükleyicisi (bootloader'i) "**Windows Boot Manager (BOOTMGR**)" olarak isimlendirilmektedir. Dosyaları; "System Reserved" isimli disk bölümünde durmaktadır.

* Herhangi bir işletim sistemi HDD'ye kurulduğunda, MBR dizini üzerinde değişiklik yapar. Bu değişiklikler:
**1.** MBR içine hangi bölümün master boot (active) olduğu yazılır. Yani; hangi bölümdeki ön yükleyicinin (bootloader) başlatılacağının adresidir. (her disk bölümü altında bir bootloader olabilir, ama sadece 1 tanesi başlayacaktır). İşletim sistemi kurulumunda yeni bir önyükleyici kurulmayacak ise bu işlemin yapılmasına gerek yoktur.**2.** GRUB normal koşullarda MBR alanına kurulur. Fakat MBR alanı çok küçük olduğundan, Grub kendini 2 parçaya böler. Bir kısmı MBR içinde, ikinci kısmı farklı bir (boot bayrağının olduğu) disk bölümünde saklanır. 2-stage bootloader kavramı burada ortaya çıkmıştır. Normal koşullarda MBR'nin içindeki çalıştırıcı (executor), <a href="http://tr.wikipedia.org/wiki/ext4">ext4</a> dosya sistemini okuyamaz. Ubuntu'da Grub dosyaları ext bölümünde bulunur. MBR'nin Grub'u çalıştırması için ext dosya sistemini tanıması lazım. İşte bu ext-tanıma kısmı modülü 1'inci stage bootloader kısmı ile çözülmüş oluyor.
* 
* Windows, her kurulumdan sonra sürekli MBR'yi kendi ön yükleyicisine (bootloader) yönlendirir. Windows'un ön yükleyicisi diğer işletim sistemlerini zaten tanımaz. Bu sebeple her Windows kurulumu sonrası, Linux ve diğer işletim sistemler ile Grub'u tekrar kurmak gerekmektedir.
## fixmbr

Windows'un bir komut satırı uygulaması. Bu komut ile MBR tamamen sıfırdan değiştirilmektedir. `fixmbr` komutu sonrası Windows kendi ön yükleyicisine yönlendirme yapacak şekilde MBR'yi yeniden yazmaktadır.

## ntldr

Windows NT için ön yükleyicidir (bootloader). Günümüzde tamamen yeniden tasarlandığı için artık kullanılmamaktadır. Yeni tasarım Windows Boot Manager (BOOTMGR) üzerinedir. BOOTMGR başladığında eski bir Windows sürümü seçilirse, BOOTMGR, ntldr'yi başlatmaktadır.

## GRUB vs GRUB2

<a href="https://wiki.ubuntu-tr.net/index.php?title=GRUB">GRUB</a> (GRand Unified Bootloader) önyükleme yazılımı, ikinci sürümde neredeyse sıfırdan tasarlandı. Bu yüzden çoğu yerde farklı yazılım gibi algılanmaktadır. Oysa Grub2, Grub'un güncel sürümüdür. Grub'un eski sürümüne "GRUB Legacy" adı da verilir. "Grub legacy" sadece BIOS uyumlu bölümlendirmeleri destekler.

## SYSLINUX

<a href="http://tr.wikipedia.org/wiki/NTFS">NTFS</a> veya <a href="http://tr.wikipedia.org/wiki/NTFS">FAT32</a> dosya sistemlerine kurulu Linux dağıtımını başlatmak için gerekli bir önyükleyici (bootloader) çeşididir.

## LILO (LInux LOader)

Bir BIOS uyumlu önyükleyici çeşididir. Daha sonra UEFI'ler için ELILO isminde bir türevi çıkarılmıştır.

## OS-Loader

Bootloader yani önyükleyici, ismi gereği genel bir terimdir. MBR'nin içindeki sisteme de, MBR'nin başlattığı sisteme de aslında bootloader denilebilir. Çünkü sistemi boot/load ediyorlar. Bu sebeple bazı insanlar, günümüzdeki sistemlere "2 stage bootloader" olarak varsayıyor. 1'inci stage: MBR ön yükleyicisinin çalıştırıcısı (execution). 2'inci stage ise: GRUB, BOOTMGR gibi yazılımların çalıştırıcısıdır. Dolayısı ile bir makalede; MBR'ye bootloader yazınca, 2'inci aşamaya OS-Loader diyen kaynaklar olabiliyor.

## UEFI (EFI)

UEFI (Unified Extensible Firmware Interface) ya da eski adıyla EFI, yeni gelen bir sistemdir. BIOS'a alternatif bir aygıt yazılımıdır (firmware). UEFI her konuda çok daha gelişmiştir diyebiliriz. Sadece süreç olarak bakıldığında; MBR gereksinimi ortadan kalkmıştır. Sürecin işleyişi konusunda bilgi almak için yukarıdaki "Özet boot süreci" başlığına bakabilirsiniz. Bazı UEFI ara yüzlerinde "BIOS" kelimesi görülebilmektedir. Bunun sebebi BIOS tabanlı sistemler üzerinde ekstra modül olarak UEFI kullanılmasıdır.

## UEFI boot manager

Bağlı olan tüm diskler içindeki tüm başlatılabilir sistemlerin (işletim sistemi, bootloader, MBR) listesini tutar ve bunlara ekleme/çıkarma/değişiklik yapılmasını sağlar. Kısmen Grub'un görevini görmektedir diyebiliriz. Listenin veritabanı ana kartın içindedir. Bu listedeki öncelik sırasına göre, ana kartı üzerinde olan UEFI ilgili sistemi başlatacaktır. Bu liste dışarıdan düzenlenebilmektedir. Örneğin Linux'ta "efibootmgr" uygulaması bunu yapıyor. Her işletim sistemi, kurulumunda bu listeye ekler ya da siler ya da düzenler. Aynı şekilde ana karttaki UEFI yazılımı grafik arayüzü ile son kullanıcı manuel olarak da ekleme/silme/değiştirme yapabilir. Listenin içinde BIOS-uyumlu bölümlerde olabilir. Çünkü UEFI, geriye uyumlu, yani BIOS uyumludur.

Aşağıda, örnek bir **efibootmgr** komut satırı çıktısı verilmiş ve açıklaması yapılmıştır.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">BootCurrent: 0002
Timeout: 3 seconds
BootOrder: 0003,0002,0000,0004</pre>
<!-- /wp:preformatted -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Boot0000* CD/DVD Drive  BIOS(3,0,00)</pre>
<!-- /wp:preformatted -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Boot0001* Hard Drive    HD(2,0,00)</pre>
<!-- /wp:preformatted -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Boot0002* Fedora        HD(1,800,61800,6d98f360-cb3e-4727-8fed-5ce0c040365d)File(\EFI\fedora\grubx64.efi)</pre>
<!-- /wp:preformatted -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Boot0003* opensuse      HD(1,800,61800,6d98f360-cb3e-4727-8fed-5ce0c040365d)File(\EFI\opensuse\grubx64.efi)
Boot0004* Hard Drive    BIOS(2,0,00)P0: ST1500DM003-9YN16G</pre>
<!-- /wp:preformatted -->
**Açıklamalar:**

(1) Boot deneme sırasını temsil eder.

(2) Buradaki BIOS kelimesi, eski BIOS uyumlu açılışı temsil eder.

(3) HDD'yi aç diyor. Özellikle disk bölümü belirtmemiş. Bu durumda UEFI native mod'da HDD'yi açar. GPT bölümlü olan bu HDD içerisinde, UEFI disk bölümünü bulur. "Fallback path mode (ya da fallback mode)" denir buna, yani; native uefi mode (Bios değil) fakat HDD karar veriyor hangi disk bölümünün açılacağına. Detaylar için ESP ile ilgili başlıklarına bakınız.

(4) uefi native mode disk bölümü belirtilmiş. ".efi" uzantısı UEFI aygıt yazılımının çalıştırılabilir bootloader dosyası uzantısıdır.

(5) HDD'yi aç der. Özellikle disk bölümü belirtmemiş. Fakat BIOS uyumlu olsun demiş. Bu durumda HDD içerisinden MBR'yi okur eskisi gibi. Yukarıdaki Boot0001'da, UEFI geri uyumlu modda olmadığı için GPT'yi okumuştu. Burada ise MBR okunacak.

## Secure boot
* 
* UEFI ile gelen bir özellik. Manuel olarak devre dışı bırakılabilmektedir. Açılacak olan işletim sisteminin ön yükleyicisinin anahtarı, UEFI içerisindeki anahtarlarla uyuşması gerekiyor.

* Bu sistemle rastgele bir kullanıcının USB'den istediği gibi işletim sistemini çalıştırması engellenmiş oluyor.

* Makine ile kurulu gelen işletim sistemlerinin anahtarı UEFI içerisine kaydedilmiş oluyor.

* Microsoft, Windows'un anahtarını bazı farklı işletim sistemleri firmalarına da veriyor, örneğin [[v:Fedora (işletim sistemi)|Fedora). Bu şekilde o makinede, güncel Fedora ISO'su ile direk işletim sistemi başlatılabiliyor oluyor.
## UEFI based botloaders

UEFI aygıt yazılımı, direk olarak önyükleyiciyi (bootloader) çalıştırır. BIOS tabanlı sistemlerde ise, MBR ön yükleyiciyi çalıştırırdı. UEFI çok daha gelişmiş oluğundan çalıştırdığı önyükleyici de daha gelişmiştir. Farklı executable dosyası çalıştırırlar. Bu sebeple ön yükleyiciler de kendilerini güncellemişlerdir. Eğer HDD içerisinde sadece UEFI'nin çalıştırabileceği bir önyükleyici var ise; aynı HDD BIOS'lu ana kartlarda işletilemeyecektir.

## Volume Boot Record (VBR ya da partition boot sector)

VBR; "volume boot sector", "partition boot record" ya da "partition boot sector" tanımlarıyla ifade edilebilir.

MBR çok ufak olduğundan, tüm detayları üzerinde tutmak mümkün değildir. Bu sebeple her mantıksal ve birincil bölümün başında VBR olur. VBR'ler de MBR'ler gibidir. Bölüm bilgilerini daha detaylı şekilde tutarlar.

## GPT (GUID Partition Table)
* 
* UEFI'nin tanıdığı, MBR'ye göre çok daha gelişmiş bir bölüm tutma şemasıdır.

* Eski Bios-mbr uyumlu bölümlendirmelere "msdos partition table" adı verilir.

* GPT bilgileri diskin en başındadır. GPT olan bir HDD'de MBR'de vardır. MBR bölümü her zaman bırakılır. Bu şekilde geriye uyumluluk sağlanmış olur.

* GPT olarak tasarlanmış bir diski makineye taktığınızda BIOS ana kartlar ile buradaki işletim sistemlerini başlatamazsınız. Fakat burada yanlış anlaşılma olmasın: Sadece işletim sistemini boot edemezsiniz. Onun dışında, bir işletim sistemi yürütülür durumdayken, GPT bölünlenmiş HDD'yi bağlayıp (mount edip), hem Windows hem de diğer tüm işletim sistemleri ile okuyup yazabilirsiniz (ön tanımlı olarak işletim sistemi okuyamasa bile üçüncü parti uygulamalarla yapılabilir). Çünkü HDD'yi okuyan bir yazılımdır. BIOS değil. Yani işletim sistemi boot etmekle, HDD'yi sadece veri olarak kullanmak tamamen ayrı kavramlardır.
## Windows recovery partititon
* 
* Windows'un çökmesi halinde Windows'u yeniden kurmak için gerekli dosyaları ve yazılımı barındıran disk bölümüdür. Bu bölüm Windows yüklemesi sırasında otomatik oluşturulur.

* Bölüm winRE dosyalarını içeriyor. WinRE, Windows kurtarma işlemlerini yapan yazılımın adıdır.
## ESP (EFI System Partition ya da EFISYS)
* 
* Diskte varolan işletim sistemlerinin EFI dosyaları (bootloader'ları) + Bootloader için gerekli sistem sürücüleri (driver) dosyaları bu bölümdedir.

* FAT32 olmak zorundadır. FAT16 olması UEFI implementasyonunda yazmaktadır. Fakat Windows işletim sistemi fat16 olması durumunda sorun çıkardığı için, artık her yerde FAT32 kullanılmaktadır.

* Boyutu değişkendir. Örnek boyut: Ortalama 40 MB sadece Windows-10 ve Ubuntu yüklü bir makine için yeterlidir. Fakat ilerde yapılabilecek ek işletim sistemi kurulumlarının EFI dosyaları için bu bölümün boyutunu yüksek tutmakta yarar var.

* `\EFI` dizini altında her işletim sisteminin kendi ön yükleyicisi ayrı dizinlerde mevcuttur. `\EFI\BOOT` dizini HDD "fallback mode" ile yürütüldüğünde devreye girer. Yani; UEFI, hiçbir disk bölümünü belirtmeden HDD'yi açtığında (boot ettiğinde) UEFI, ESP bölümünü bulur. Daha sonra içerisinde `\EFI\BOOT\BOOTx64.EFI` (gibi ya da standart önceden belirlenmiş farklı önyükleyici adresleri) dosyasını çalıştırır. Yani işletim sistemlerinin ön yükleyicileri dışında genel bir UEFI arayüzü (bootloader'i) mevcuttur. Bu bootloader "default bootloader" olarak da adlandırılmaktadır. Bazı UEFI aygıt yazılımları bu bootloader'i bulamadığı zaman Windowsun ön tanımlı bootloader'ini da açmayı denemektedir: EFI/Microsoft/BOOT/bootmgfw.efi.

* `\EFI` dizini altında sürücüler ve işletim sistemi çekirdekleri de mevcuttur. EFI dosyası executable'ı olarak Linux çekirdeği çalıştırılabiliyor. Linux güncel sürümleri bunu desteklemektedir. Bu özellik; EFI Boot Stub (ya da EFI Stub) olarak isimlendiriliyor.

* `\EFI` dizini altında aynı zamanda sürücü (driver) dosyaları bulunmaktadır. Sürücüler: dosya dizinlerine erişim sürücüleri (ext, ntfs gibi), ağ kartlarının daha geniş özelliklerle kullanılabilmesini, önyükleyici sırasında takılan USB cihazların tanınması gibi işler için gerekli olabilmektedirler.
## MSR ("Microsoft System Reserved Partition" ya da "Sistem ayrıldı" bölümü)
* 
* Sadece GPT disklerde oluşan bir bölümdür.

* ESP'den sonra ve Windows kurulu bölümden önce olmak zorundadır.

* Windows sürümüne göre dosya sistemi biçimi NTFS ya da FAT32 olabilir.

* Boyutu Windows sürümü ve disk boyutuna göre değişebilir.

* bootmgr bu bölümde yüklüdür.
## RAID

Açık adı: Redundant Array of Inexpensive Disks ya da Redundant Array of Independent Disks.
* 
* Birden fazla diski tek bir disk gibi gösterme özelliğidir.

* RAID kendi içerisinde birçok özelliği vardır: RAID0, RAID1 gibi... Bunlardan sadece bir tanesi seçilmek zorundadır.

* RAID0: 2 diskimiz var. 2 disk tek bir disk gibi gösteriliyor. 2 tarafta da farklı bilgiler tutuluyor. Performans artışı sağlıyor. Çünkü bazı durumlarda iki diskten ayrı ayrı dosyaları aynı anda okuyabiliyor. Tek diskte olsaydık aynı anda bir dosya okuyabilecektir.

* RAID1: 2 diskimiz var. 2 disk tek bir disk gibi gösteriliyor. 2 tarafta da aynı datalar tutuluyor. Bu şekilde birine bir zarar geldiğinde diğerine devam edilebiliyor. Performans açısından kötü.

* Sadece donanımsal ya da sadece yazılımsal çözümlerle sağlanmaktadırlar.
## Flag (bayrak)

GPT ve MBR, her disk bölümü için bir bayrak bulundururlar. Bayrakların birer anlamı vardır:
* 
* Boot: tüm HDD'de sadece bir bölümde bu set edilebilir. İlk o bölümün boot edileceği anlamına gelir. MBR sistemlerde çalıştırılacak ön yükleyicinin olduğu bölüm iken, GPT sitemlerde EFI kurulu bölüme atanmalıdır.

* Diag: O bölümün diagnostics/recovery amaçlı kullanıldığını belirtir.

* Hidden: Microsoft otomatik bağlamak (mount) istenmediği bölümlere bu bayrağı atıyor.

* RAID: Raid teknoloji için kullanılan bir bölüm olduğunu gösterir.

* Msftres: Sadece GPT'de disklerin içindeki bölümlerde mevcuttur. Bölümün "Microsoft Reserved partition" olduğunu gösterir.

* msftdata: Microsoft kendi oluşturduğu dizinlere bunu atıyor. Bazı Linux sistemleri de kendi dizinlerine bu bayrağı attığı görülüyor.

* swap: HDD üzerinde kurulu tüm Linux sistemler bu bölümü swap (takas) alanı olarak kullanabileceklerini belirtir.

* BIOS_GRUB: GPT kurulu bir HDD'de, sadece "grub legacy"'nin kurulu olduğu bir bölüm var ise, o bölüme bu bayrak atanır.

* legacy_boot: GPT yapılı disklerde, SYSLINUX önyükleyicisinin bulunduğu bölüme atanmaktadır.
## Partititon name, partititon label
* 
* Name, GPT alanında olan bir etikettir.

* Label ise disk bölümünün içinde olan bir etikettir.
## GParted

<a href="https://wiki.ubuntu-tr.net/index.php?title=GParted">GParted</a>, Linux üzerinde çalışan, GUI içeren bir disk yönetim aracıdır. GParted'in <a href="https://wiki.ubuntu-tr.net/index.php?title=Canl%C4%B1_sistem">canlı CD/USB</a> sürümü, bilgisayardaki işletim sisteminden bağımsız olarak her sistemde kullanılabilir.

## GParted anahtar ikonu
* 
* Her disk bölümünün yanında bu ikon olabilir. Bu icon o disk bölümünün bağlanmış (mount edilmiş) olduğu ve bu sebeple üzerinde işlem yapılmasına izin vermeyeceği anlamına gelir.

* Anahtar işaretli bir bölüm üzerinde işlem yapmak için o bölüm önce ayrılmalıdır (unmount). Eğer ilgili bölüm, çalıştırılan işletim sistemi dosyalarını içerir ise ayrılamaz. Böyle bir durumda ilgili bölüm ancak <a href="http://tr.wikipedia.org/wiki/canl%C4%B1_sistem">canlı CD</a> üzerinden ya da aynı HDD üzerinde farklı bir bölümdeki işletim sistemi çalıştırılarak yapılabilir.

