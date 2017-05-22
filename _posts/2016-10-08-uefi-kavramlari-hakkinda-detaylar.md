---
layout: post
title: UEFI Kavramları Hakkında Detaylar
date: 2016-10-08 17:44:08.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
tags:
- uefi
- uefi boot
author: siberoloji
---
<p>Ubuntu Forum dan <a href="https://forum.ubuntu-tr.net/index.php?action=profile;u=31663" target="_blank">ThomasK1907</a> isimli kullanıcının hazırlamış olduğu detaylı UEFI kavramları hakkındaki yazıyı, bir kaç harf hatasını düzelterek burada yayınlamak istedik. Başvuru kaynağı niteliğinde bir çalışma olmuş. Sizlerin de Linux bilişim ile ilgili yazılarınız varsa, burada yayınlanmasını teklif edebilirsiniz.</p>
<p>Kaynak: <a href="https://wiki.ubuntu-tr.net/index.php?title=UEFI_ve_BIOS_hakk%C4%B1nda_detayl%C4%B1_bilgiler" target="_blank">Ubuntu Wiki</a></p>
<h2><span id="Sleep.2C_hibernate.2C_hybrid_sleep" class="mw-headline">Sleep, hibernate, hybrid sleep</span></h2>
<ul>
<li><b>Sleep</b> (Uyku = Stand By = Suspend = Suspend to RAM) ile işletim sistemi tüm uygulamaları durdurur (pause) ve sistmein az enerji harcamasını sağlar. Sistem kapanmaz, bu sebeple saniyeler içerisinde açılarak devam edebilir.</li>
</ul>
<ul>
<li><b>Hibernate</b> (Hazırda beklet = Suspend to Disk), sleep ile aynı mantıktadır. Fakat sistemi tamamen kapatabilmek için RAM'deki bilgileri sabit diskte saklar, yeniden açılması zaman almaktadır.</li>
</ul>
<ul>
<li><b>Hybrid Sleep</b> (Suspend to both) modunda kullanıcı oturumu kapatılır (logout). Sadece işletim sistemi ve servisleri hazırda bekletilir (hibernate). Windows, 8 ve sonrası sürümlerde "shut down" işlemi ile "Hybrid Sleep" uygulamaktadır. Gerçek bir sistem kapanması için "yeniden başlat" işlemi yapılmalıdır. Windows ayalarında "fast startup" (ya da fast boot) isimli bu özellik devre dışı bırakılabilir.</li>
</ul>
<dl>
<dd>Bazı işletim sistemlerinde "Hybrit Sleep" aynı işlevi yapmamaktadır. Bazı sistemlerde şu yapılıyor: Sistemdeki tüm uygulamalar durduruluyor (sleep'te olduğu gibi). RAM bellekteki veriler Hibernate'deki gibi HDD'de saklanıyor. RAM'deki veriler silinmiyor, aynen bırakılıyor. Yani sleep moduna fazladan RAM'deki veriler HDD'de de saklanmış oluyor. Bu şekilde; makine aksi bir durumda kapanır ise en kötü ihtimalle hibernate tarzı bir açılış yapıyor. Eğer sistem kapatılmamış ise, sleep gibi hızlı açılıyor.</dd>
</dl>
<ul>
<li><b>Connected Standby (ya da InstantGo)</b> mobil cihazlarda görülen bir yöntemdir, masaüstlerine çok sonradan gelmiştir. Sleep ile aynı mantıktadır. Tek farkı, ek olarak; isteyen uygulamalar internet ağını kullanacak kod bloklarını sürekli arka planda çalıştırabilirler.</li>
</ul>
<h2><span id=".C3.96zet_a.C3.A7.C4.B1l.C4.B1.C5.9F.28boot.29_s.C3.BCreci" class="mw-headline">Özet açılış(boot) süreci</span></h2>
<ul>
<li>BIOS süreci (eski süreç)</li>
</ul>
<dl>
<dd><code>BIOS ----(HDD)----&gt; MBR ----&gt; Bootloader ----&gt; OS</code></dd>
</dl>
<ul>
<li>UEFI sonrası yeni süreç:</li>
</ul>
<dl>
<dd><code>UEFI ----(HDD)----&gt; Bootloader ----&gt; OS</code></dd>
</dl>
<ul>
<li>UEFI sonrası, BIOS uyumlu kurulmuş bir disk üzerinde işletim sistemini başlatma:</li>
</ul>
<dl>
<dd><code>UEFI ----(HDD)----&gt; MBR ----&gt; Bootloader ----&gt; OS</code></dd>
</dl>
<h2><span id="Uyku_ve_di.C4.9Fer_kapanma_metodlar.C4.B1_sonras.C4.B1_boot_s.C3.BCre.C3.A7leri_nas.C4.B1l_de.C4.9Fi.C5.9Fiyor.3F" class="mw-headline">Uyku ve diğer kapanma metodları sonrası boot süreçleri nasıl değişiyor?</span></h2>
<p>Uyku'ya alınan cihazın açılması Firmware'den (aygıt yazılımı) itibaren olmuyor. Sistem hiç kapanmamış olduğu için direk olarak işletim sistemi devam ediyor.<br />
Hibernate işleminde işletim sistemi normal kapanma metodunu uyguluyor. Açılışta da normal açılma süreci işleniyor. İşletim sistemleri otomatik olarak son durumunu algılayıp, Hibernate edilmiş ise dosyadan RAM'e aktarım yapıp devam ediyor. Eğer Hibernate edilmemiş ise; normal olarak açılıyor. Boot sürecinde bir değişiklik söz konusu değil.</p>
<h2><span id="MacOS_boot_i.C5.9Flemi" class="mw-headline">MacOS boot işlemi</span></h2>
<p>Apple, EFI'yi ilk kullanan şirketlerden biri. 2005 yılında, Apple Intel işlemcilere geçiş yaptığında klasik BIOS yerine EFI kullanmayı tercih etmişti. Yıllar sonra, UEFI spesifikasyonu sayesinde tüm PC'lerde UEFI kullanılmaya başlandı ve bu bir standart haline geldi. Mac'lerde şu an Apple'ın kendine göre uyarladığı bir EFI bulunmakta. Mac'lerdeki firmware tıpkı normal PC'lerde olduğu gibi UEFI ve Legacy modda işletim sistemi boot edebilir. Ancak Apple'ın yaptığı düzenlemeler olmadan MacOS önyüklenemez.</p>
<h2><span id="CSM_.28Compatibility_Support_Module.29" class="mw-headline">CSM (Compatibility Support Module)</span></h2>
<p>UEFI'nin 'BIOS compatibility mode'una verilen özel isim. UEFI devre dışı bırakılamaz. UEFI MBR-tarzı bölümlü sabit disklerden işletim sistemi açabilir. Bu da UEFI'nin geriye uyumlu çalıştığı anlamına gelir. Fakat CSM, her UEFI'de olmak zorunda değildir.</p>
<h2><span id="BIOS" class="mw-headline">BIOS</span></h2>
<ul>
<li>Bir aygıt yazılımıdır (firmware).</li>
</ul>
<ul>
<li>BIOS ana kartın üstündedir.</li>
</ul>
<ul>
<li>Makine başlatıldığında hangi aygıttan (CD, DVD, HDD, USB gibi) boot edileceğini belirler.</li>
</ul>
<ul>
<li>HDD ile başlatılırsa; HDD'nin ilk sektörünü okur. Burada okuduğu kısmı çalıştırır (execute). Çalıştırılan bu bölge MBR (Master Boot Record) olarak adlandırılır.</li>
</ul>
<h2><span id="MBR" class="mw-headline">MBR</span></h2>
<p>MBR (Master Boot Record), sabit diskin ilk sektörüdür. İki kısımdan oluşur:</p>
<p><b>1.</b> Master Boot Code: Çalıştırılabilir (execute) olan kısım.<br />
<b>2.</b> Master Partition Table: HDD için bölümlerin haritası. En çok 4 bölüm tutabilir. Bu sebeple 4 bölümden (birincil bölüm veya primary partition) fazlaya ayırmak gerekirse, diskin "genişletilmiş bölüm (extensable partititon)" özelliğinden yararlanılır. Genişletilmiş bölüm en fazla 1 adet olabilir. Fakat altında sınırsız bölüm barındırabilir. Altında olan her bölüme "mantıksal bölüm (logical partititon)" denir.</p>
<h2><span id="Bootloader_.28.C3.B6ny.C3.BCkleyici.29" class="mw-headline">Bootloader (önyükleyici)</span></h2>
<ul>
<li>MBR tarafından çalıştırılabilen bir sistemdir. Bu sistem ile işletim sistemleri baslatılır.</li>
</ul>
<ul>
<li>Her işletim sisteminin bootloader dosyalarını bir yerde saklaması gereklidir ki MBR o dizini okusun ve çalıştırsın.</li>
</ul>
<ul>
<li>Önyükleyici dosyaları Ubuntu'da varsayılan olarak <code>/boot/grub</code> dizinindedir. Bu dizinin Ubuntu'da, başlatılacak işletim sistemi ile aynı bölümde olma şartı yoktur. Örnegin <code>/boot/grub</code> , <code>/dev/sda9</code>'da iken, Ubuntu'nun tüm dosyaları <code>/dev/sda5</code>'te olabilir. Eğer bölümleri ayırırsak, Ubuntu'yu sildiğimizde <a title="GRUB" href="https://wiki.ubuntu-tr.net/index.php?title=GRUB">GRUB</a> sistemi de silinmeyeceği için HDD'de kurulu diğer işletim sistemleri hala başlatılabilir olacaktır. Fakat Grub, Ubuntu ile aynı disk bölümünde olursa, Ubuntu bölüm silindiğinde (ya da formatlandığında), Grup başlamayacağı için HDD'de kurulu diğer işletim sistemleri de başlamayacaktır.</li>
</ul>
<ul>
<li>Windows'un ön yükleyicisi (bootloader'i) "<b>Windows Boot Manager (BOOTMGR</b>)" olarak isimlendirilmektedir. Dosyaları; "System Reserved" isimli disk bölümünde durmaktadır.</li>
</ul>
<ul>
<li>Herhangi bir işletim sistemi HDD'ye kurulduğunda, MBR dizini üzerinde değişiklik yapar. Bu değişiklikler:</li>
</ul>
<dl>
<dd>
<dl>
<dd><b>1.</b> MBR içine hangi bölümün master boot (active) olduğu yazılır. Yani; hangi bölümdeki ön yükleyicinin (bootloader) başlatılacağının adresidir. (her disk bölümü altında bir bootloader olabilir, ama sadece 1 tanesi başlayacaktır). İşletim sistemi kurulumunda yeni bir önyükleyici kurulmayacak ise bu işlemin yapılmasına gerek yoktur.</dd>
</dl>
</dd>
</dl>
<dl>
<dd>
<dl>
<dd><b>2.</b> GRUB normal koşullarda MBR alanına kurulur. Fakat MBR alanı çok küçük olduğundan, Grub kendini 2 parçaya böler. Bir kısmı MBR içinde, ikinci kısmı farklı bir (boot bayrağının olduğu) disk bölümünde saklanır. 2-stage bootloader kavramı burada ortaya çıkmıştır. Normal koşullarda MBR'nin içindeki çalıştırıcı (executor), <a class="extiw" title="v:ext4" href="http://tr.wikipedia.org/wiki/ext4">ext4</a> dosya sistemini okuyamaz. Ubuntu'da Grub dosyaları ext bölümünde bulunur. MBR'nin Grub'u çalıştırması için ext dosya sistemini tanıması lazım. İşte bu ext-tanıma kısmı modülü 1'inci stage bootloader kısmı ile çözülmüş oluyor.</dd>
</dl>
</dd>
</dl>
<ul>
<li>Windows, her kurulumdan sonra sürekli MBR'yi kendi ön yükleyicisine (bootloader) yönlendirir. Windows'un ön yükleyicisi diğer işletim sistemlerini zaten tanımaz. Bu sebeple her Windows kurulumu sonrası, Linux ve diğer işletim sistemler ile Grub'u tekrar kurmak gerekmektedir.</li>
</ul>
<h2><span id="fixmbr" class="mw-headline">fixmbr</span></h2>
<p>Windows'un bir komut satırı uygulaması. Bu komut ile MBR tamamen sıfırdan değiştirilmektedir. <code>fixmbr</code> komutu sonrası Windows kendi ön yükleyicisine yönlendirme yapacak şekilde MBR'yi yeniden yazmaktadır.</p>
<h2><span id="ntldr" class="mw-headline">ntldr</span></h2>
<p>Windows NT için ön yükleyicidir (bootloader). Günümüzde tamamen yeniden tasarlandığı için artık kullanılmamaktadır. Yeni tasarım Windows Boot Manager (BOOTMGR) üzerinedir. BOOTMGR başladığında eski bir Windows sürümü seçilirse, BOOTMGR, ntldr'yi başlatmaktadır.</p>
<h2><span id="GRUB_vs_GRUB2" class="mw-headline">GRUB vs GRUB2</span></h2>
<p><a title="GRUB" href="https://wiki.ubuntu-tr.net/index.php?title=GRUB">GRUB</a> (GRand Unified Bootloader) önyükleme yazılımı, ikinci sürümde neredeyse sıfırdan tasarlandı. Bu yüzden çoğu yerde farklı yazılım gibi algılanmaktadır. Oysa Grub2, Grub'un güncel sürümüdür. Grub'un eski sürümüne "GRUB Legacy" adı da verilir. "Grub legacy" sadece BIOS uyumlu bölümlendirmeleri destekler.</p>
<h2><span id="SYSLINUX" class="mw-headline">SYSLINUX</span></h2>
<p><a class="extiw" title="v:NTFS" href="http://tr.wikipedia.org/wiki/NTFS">NTFS</a> veya <a class="extiw" title="v:NTFS" href="http://tr.wikipedia.org/wiki/NTFS">FAT32</a> dosya sistemlerine kurulu Linux dağıtımını başlatmak için gerekli bir önyükleyici (bootloader) çeşididir.</p>
<h2><span id="LILO_.28LInux_LOader.29" class="mw-headline">LILO (LInux LOader)</span></h2>
<p>Bir BIOS uyumlu önyükleyici çeşididir. Daha sonra UEFI'ler için ELILO isminde bir türevi çıkarılmıştır.</p>
<h2><span id="OS-Loader" class="mw-headline">OS-Loader</span></h2>
<p>Bootloader yani önyükleyici, ismi gereği genel bir terimdir. MBR'nin içindeki sisteme de, MBR'nin başlattığı sisteme de aslında bootloader denilebilir. Çünkü sistemi boot/load ediyorlar. Bu sebeple bazı insanlar, günümüzdeki sistemlere "2 stage bootloader" olarak varsayıyor. 1'inci stage: MBR ön yükleyicisinin çalıştırıcısı (execution). 2'inci stage ise: GRUB, BOOTMGR gibi yazılımların çalıştırıcısıdır. Dolayısı ile bir makalede; MBR'ye bootloader yazınca, 2'inci aşamaya OS-Loader diyen kaynaklar olabiliyor.</p>
<h2><span id="UEFI_.28EFI.29" class="mw-headline">UEFI (EFI)</span></h2>
<p>UEFI (Unified Extensible Firmware Interface) ya da eski adıyla EFI, yeni gelen bir sistemdir. BIOS'a alternatif bir aygıt yazılımıdır (firmware). UEFI her konuda çok daha gelişmiştir diyebiliriz. Sadece süreç olarak bakıldığında; MBR gereksinimi ortadan kalkmıştır. Sürecin işleyişi konusunda bilgi almak için yukarıdaki "Özet boot süreci" başlığına bakabilirsiniz. Bazı UEFI ara yüzlerinde "BIOS" kelimesi görülebilmektedir. Bunun sebebi BIOS tabanlı sistemler üzerinde ekstra modül olarak UEFI kullanılmasıdır.</p>
<h2><span id="UEFI_boot_manager" class="mw-headline">UEFI boot manager</span></h2>
<p>Bağlı olan tüm diskler içindeki tüm başlatılabilir sistemlerin (işletim sistemi, bootloader, MBR) listesini tutar ve bunlara ekleme/çıkarma/değişiklik yapılmasını sağlar. Kısmen Grub'un görevini görmektedir diyebiliriz. Listenin veritabanı ana kartın içindedir. Bu listedeki öncelik sırasına göre, ana kartı üzerinde olan UEFI ilgili sistemi başlatacaktır.<br />
Bu liste dışarıdan düzenlenebilmektedir. Örneğin Linux'ta "efibootmgr" uygulaması bunu yapıyor. Her işletim sistemi, kurulumunda bu listeye ekler ya da siler ya da düzenler. Aynı şekilde ana karttaki UEFI yazılımı grafik arayüzü ile son kullanıcı manuel olarak da ekleme/silme/değiştirme yapabilir.<br />
Listenin içinde BIOS-uyumlu bölümlerde olabilir. Çünkü UEFI, geriye uyumlu, yani BIOS uyumludur.</p>
<p>Aşağıda, örnek bir <b>efibootmgr</b> komut satırı çıktısı verilmiş ve açıklaması yapılmıştır.</p>
<pre class="lang:sh decode:true" title="1">BootCurrent: 0002
Timeout: 3 seconds
BootOrder: 0003,0002,0000,0004</pre>
<pre class="lang:sh decode:true " title="2">Boot0000* CD/DVD Drive  BIOS(3,0,00)</pre>
<pre class="lang:sh decode:true" title="3">Boot0001* Hard Drive    HD(2,0,00)</pre>
<pre class="lang:sh decode:true " title="4">Boot0002* Fedora        HD(1,800,61800,6d98f360-cb3e-4727-8fed-5ce0c040365d)File(\EFI\fedora\grubx64.efi)</pre>
<pre class="lang:sh decode:true" title="5">Boot0003* opensuse      HD(1,800,61800,6d98f360-cb3e-4727-8fed-5ce0c040365d)File(\EFI\opensuse\grubx64.efi)
Boot0004* Hard Drive    BIOS(2,0,00)P0: ST1500DM003-9YN16G</pre>
<p><i><b>Açıklamalar:</b></i></p>
<p>(1) Boot deneme sırasını temsil eder.</p>
<p>(2) Buradaki BIOS kelimesi, eski BIOS uyumlu açılışı temsil eder.</p>
<p>(3) HDD'yi aç diyor. Özellikle disk bölümü belirtmemiş. Bu durumda UEFI native mod'da HDD'yi açar. GPT bölümlü olan bu HDD içerisinde, UEFI disk bölümünü bulur. "Fallback path mode (ya da fallback mode)" denir buna, yani; native uefi mode (Bios değil) fakat HDD karar veriyor hangi disk bölümünün açılacağına. Detaylar için ESP ile ilgili başlıklarına bakınız.</p>
<p>(4) uefi native mode disk bölümü belirtilmiş. ".efi" uzantısı UEFI aygıt yazılımının çalıştırılabilir bootloader dosyası uzantısıdır.</p>
<p>(5) HDD'yi aç der. Özellikle disk bölümü belirtmemiş. Fakat BIOS uyumlu olsun demiş. Bu durumda HDD içerisinden MBR'yi okur eskisi gibi. Yukarıdaki Boot0001'da, UEFI geri uyumlu modda olmadığı için GPT'yi okumuştu. Burada ise MBR okunacak.</p>
<h2><span id="Secure_boot" class="mw-headline">Secure boot</span></h2>
<ul>
<li>UEFI ile gelen bir özellik. Manuel olarak devre dışı bırakılabilmektedir. Açılacak olan işletim sisteminin ön yükleyicisinin anahtarı, UEFI içerisindeki anahtarlarla uyuşması gerekiyor.</li>
</ul>
<ul>
<li>Bu sistemle rastgele bir kullanıcının USB'den istediği gibi işletim sistemini çalıştırması engellenmiş oluyor.</li>
</ul>
<ul>
<li>Makine ile kurulu gelen işletim sistemlerinin anahtarı UEFI içerisine kaydedilmiş oluyor.</li>
</ul>
<ul>
<li>Microsoft, Windows'un anahtarını bazı farklı işletim sistemleri firmalarına da veriyor, örneğin [[v:Fedora (işletim sistemi)|Fedora). Bu şekilde o makinede, güncel Fedora ISO'su ile direk işletim sistemi başlatılabiliyor oluyor.</li>
</ul>
<h2><span id="UEFI_based_botloaders" class="mw-headline">UEFI based botloaders</span></h2>
<p>UEFI aygıt yazılımı, direk olarak önyükleyiciyi (bootloader) çalıştırır. BIOS tabanlı sistemlerde ise, MBR ön yükleyiciyi çalıştırırdı. UEFI çok daha gelişmiş oluğundan çalıştırdığı önyükleyici de daha gelişmiştir. Farklı executable dosyası çalıştırırlar. Bu sebeple ön yükleyiciler de kendilerini güncellemişlerdir. Eğer HDD içerisinde sadece UEFI'nin çalıştırabileceği bir önyükleyici var ise; aynı HDD BIOS'lu ana kartlarda işletilemeyecektir.</p>
<h2><span id="Volume_Boot_Record_.28VBR_ya_da_partition_boot_sector.29" class="mw-headline">Volume Boot Record (VBR ya da partition boot sector)</span></h2>
<p>VBR; "volume boot sector", "partition boot record" ya da "partition boot sector" tanımlarıyla ifade edilebilir.</p>
<p>MBR çok ufak olduğundan, tüm detayları üzerinde tutmak mümkün değildir. Bu sebeple her mantıksal ve birincil bölümün başında VBR olur. VBR'ler de MBR'ler gibidir. Bölüm bilgilerini daha detaylı şekilde tutarlar.</p>
<h2><span id="GPT_.28GUID_Partition_Table.29" class="mw-headline">GPT (GUID Partition Table)</span></h2>
<ul>
<li>UEFI'nin tanıdığı, MBR'ye göre çok daha gelişmiş bir bölüm tutma şemasıdır.</li>
</ul>
<ul>
<li>Eski Bios-mbr uyumlu bölümlendirmelere "msdos partition table" adı verilir.</li>
</ul>
<ul>
<li>GPT bilgileri diskin en başındadır. GPT olan bir HDD'de MBR'de vardır. MBR bölümü her zaman bırakılır. Bu şekilde geriye uyumluluk sağlanmış olur.</li>
</ul>
<ul>
<li>GPT olarak tasarlanmış bir diski makineye taktığınızda BIOS ana kartlar ile buradaki işletim sistemlerini başlatamazsınız. Fakat burada yanlış anlaşılma olmasın: Sadece işletim sistemini boot edemezsiniz. Onun dışında, bir işletim sistemi yürütülür durumdayken, GPT bölünlenmiş HDD'yi bağlayıp (mount edip), hem Windows hem de diğer tüm işletim sistemleri ile okuyup yazabilirsiniz (ön tanımlı olarak işletim sistemi okuyamasa bile üçüncü parti uygulamalarla yapılabilir). Çünkü HDD'yi okuyan bir yazılımdır. BIOS değil. Yani işletim sistemi boot etmekle, HDD'yi sadece veri olarak kullanmak tamamen ayrı kavramlardır.</li>
</ul>
<h2><span id="Windows_recovery_partititon" class="mw-headline">Windows recovery partititon</span></h2>
<ul>
<li>Windows'un çökmesi halinde Windows'u yeniden kurmak için gerekli dosyaları ve yazılımı barındıran disk bölümüdür. Bu bölüm Windows yüklemesi sırasında otomatik oluşturulur.</li>
</ul>
<ul>
<li>Bölüm winRE dosyalarını içeriyor. WinRE, Windows kurtarma işlemlerini yapan yazılımın adıdır.</li>
</ul>
<h2><span id="ESP_.28EFI_System_Partition_ya_da_EFISYS.29" class="mw-headline">ESP (EFI System Partition ya da EFISYS)</span></h2>
<ul>
<li>Diskte varolan işletim sistemlerinin EFI dosyaları (bootloader'ları) + Bootloader için gerekli sistem sürücüleri (driver) dosyaları bu bölümdedir.</li>
</ul>
<ul>
<li>FAT32 olmak zorundadır. FAT16 olması UEFI implementasyonunda yazmaktadır. Fakat Windows işletim sistemi fat16 olması durumunda sorun çıkardığı için, artık her yerde FAT32 kullanılmaktadır.</li>
</ul>
<ul>
<li>Boyutu değişkendir. Örnek boyut: Ortalama 40 MB sadece Windows-10 ve Ubuntu yüklü bir makine için yeterlidir. Fakat ilerde yapılabilecek ek işletim sistemi kurulumlarının EFI dosyaları için bu bölümün boyutunu yüksek tutmakta yarar var.</li>
</ul>
<ul>
<li><code>\EFI</code> dizini altında her işletim sisteminin kendi ön yükleyicisi ayrı dizinlerde mevcuttur. <code>\EFI\BOOT</code> dizini HDD "fallback mode" ile yürütüldüğünde devreye girer. Yani; UEFI, hiçbir disk bölümünü belirtmeden HDD'yi açtığında (boot ettiğinde) UEFI, ESP bölümünü bulur. Daha sonra içerisinde <code>\EFI\BOOT\BOOTx64.EFI</code> (gibi ya da standart önceden belirlenmiş farklı önyükleyici adresleri) dosyasını çalıştırır. Yani işletim sistemlerinin ön yükleyicileri dışında genel bir UEFI arayüzü (bootloader'i) mevcuttur. Bu bootloader "default bootloader" olarak da adlandırılmaktadır. Bazı UEFI aygıt yazılımları bu bootloader'i bulamadığı zaman Windowsun ön tanımlı bootloader'ini da açmayı denemektedir: EFI/Microsoft/BOOT/bootmgfw.efi.</li>
</ul>
<ul>
<li><code>\EFI</code> dizini altında sürücüler ve işletim sistemi çekirdekleri de mevcuttur. EFI dosyası executable'ı olarak Linux çekirdeği çalıştırılabiliyor. Linux güncel sürümleri bunu desteklemektedir. Bu özellik; EFI Boot Stub (ya da EFI Stub) olarak isimlendiriliyor.</li>
</ul>
<ul>
<li><code>\EFI</code> dizini altında aynı zamanda sürücü (driver) dosyaları bulunmaktadır. Sürücüler: dosya dizinlerine erişim sürücüleri (ext, ntfs gibi), ağ kartlarının daha geniş özelliklerle kullanılabilmesini, önyükleyici sırasında takılan USB cihazların tanınması gibi işler için gerekli olabilmektedirler.</li>
</ul>
<h2><span id="MSR_.28.22Microsoft_System_Reserved_Partition.22_ya_da_.22Sistem_ayr.C4.B1ld.C4.B1.22_b.C3.B6l.C3.BCm.C3.BC.29" class="mw-headline">MSR ("Microsoft System Reserved Partition" ya da "Sistem ayrıldı" bölümü)</span></h2>
<ul>
<li>Sadece GPT disklerde oluşan bir bölümdür.</li>
</ul>
<ul>
<li>ESP'den sonra ve Windows kurulu bölümden önce olmak zorundadır.</li>
</ul>
<ul>
<li>Windows sürümüne göre dosya sistemi biçimi NTFS ya da FAT32 olabilir.</li>
</ul>
<ul>
<li>Boyutu Windows sürümü ve disk boyutuna göre değişebilir.</li>
</ul>
<ul>
<li>bootmgr bu bölümde yüklüdür.</li>
</ul>
<h2><span id="RAID" class="mw-headline">RAID</span></h2>
<p>Açık adı: Redundant Array of Inexpensive Disks ya da Redundant Array of Independent Disks.</p>
<ul>
<li>Birden fazla diski tek bir disk gibi gösterme özelliğidir.</li>
</ul>
<ul>
<li>RAID kendi içerisinde birçok özelliği vardır: RAID0, RAID1 gibi... Bunlardan sadece bir tanesi seçilmek zorundadır.</li>
</ul>
<ul>
<li>RAID0: 2 diskimiz var. 2 disk tek bir disk gibi gösteriliyor. 2 tarafta da farklı bilgiler tutuluyor. Performans artışı sağlıyor. Çünkü bazı durumlarda iki diskten ayrı ayrı dosyaları aynı anda okuyabiliyor. Tek diskte olsaydık aynı anda bir dosya okuyabilecektir.</li>
</ul>
<ul>
<li>RAID1: 2 diskimiz var. 2 disk tek bir disk gibi gösteriliyor. 2 tarafta da aynı datalar tutuluyor. Bu şekilde birine bir zarar geldiğinde diğerine devam edilebiliyor. Performans açısından kötü.</li>
</ul>
<ul>
<li>Sadece donanımsal ya da sadece yazılımsal çözümlerle sağlanmaktadırlar.</li>
</ul>
<h2><span id="Flag_.28bayrak.29" class="mw-headline">Flag (bayrak)</span></h2>
<p>GPT ve MBR, her disk bölümü için bir bayrak bulundururlar. Bayrakların birer anlamı vardır:</p>
<ul>
<li>Boot: tüm HDD'de sadece bir bölümde bu set edilebilir. İlk o bölümün boot edileceği anlamına gelir. MBR sistemlerde çalıştırılacak ön yükleyicinin olduğu bölüm iken, GPT sitemlerde EFI kurulu bölüme atanmalıdır.</li>
</ul>
<ul>
<li>Diag: O bölümün diagnostics/recovery amaçlı kullanıldığını belirtir.</li>
</ul>
<ul>
<li>Hidden: Microsoft otomatik bağlamak (mount) istenmediği bölümlere bu bayrağı atıyor.</li>
</ul>
<ul>
<li>RAID: Raid teknoloji için kullanılan bir bölüm olduğunu gösterir.</li>
</ul>
<ul>
<li>Msftres: Sadece GPT'de disklerin içindeki bölümlerde mevcuttur. Bölümün "Microsoft Reserved partition" olduğunu gösterir.</li>
</ul>
<ul>
<li>msftdata: Microsoft kendi oluşturduğu dizinlere bunu atıyor. Bazı Linux sistemleri de kendi dizinlerine bu bayrağı attığı görülüyor.</li>
</ul>
<ul>
<li>swap: HDD üzerinde kurulu tüm Linux sistemler bu bölümü swap (takas) alanı olarak kullanabileceklerini belirtir.</li>
</ul>
<ul>
<li>BIOS_GRUB: GPT kurulu bir HDD'de, sadece "grub legacy"'nin kurulu olduğu bir bölüm var ise, o bölüme bu bayrak atanır.</li>
</ul>
<ul>
<li>legacy_boot: GPT yapılı disklerde, SYSLINUX önyükleyicisinin bulunduğu bölüme atanmaktadır.</li>
</ul>
<h2><span id="Partititon_name.2C_partititon_label" class="mw-headline">Partititon name, partititon label</span></h2>
<ul>
<li>Name, GPT alanında olan bir etikettir.</li>
</ul>
<ul>
<li>Label ise disk bölümünün içinde olan bir etikettir.</li>
</ul>
<h2><span id="GParted" class="mw-headline">GParted</span></h2>
<p><a title="GParted" href="https://wiki.ubuntu-tr.net/index.php?title=GParted">GParted</a>, Linux üzerinde çalışan, GUI içeren bir disk yönetim aracıdır. GParted'in <a class="mw-redirect" title="Canlı sistem" href="https://wiki.ubuntu-tr.net/index.php?title=Canl%C4%B1_sistem">canlı CD/USB</a> sürümü, bilgisayardaki işletim sisteminden bağımsız olarak her sistemde kullanılabilir.</p>
<h2><span id="GParted_anahtar_ikonu" class="mw-headline">GParted anahtar ikonu</span></h2>
<ul>
<li>Her disk bölümünün yanında bu ikon olabilir. Bu icon o disk bölümünün bağlanmış (mount edilmiş) olduğu ve bu sebeple üzerinde işlem yapılmasına izin vermeyeceği anlamına gelir.</li>
</ul>
<ul>
<li>Anahtar işaretli bir bölüm üzerinde işlem yapmak için o bölüm önce ayrılmalıdır (unmount). Eğer ilgili bölüm, çalıştırılan işletim sistemi dosyalarını içerir ise ayrılamaz. Böyle bir durumda ilgili bölüm ancak <a class="extiw" title="v:canlı sistem" href="http://tr.wikipedia.org/wiki/canl%C4%B1_sistem">canlı CD</a> üzerinden ya da aynı HDD üzerinde farklı bir bölümdeki işletim sistemi çalıştırılarak yapılabilir.</li>
</ul>
