---
draft: false

title:  'Linux İşletim Sisteminde PCI Donanım Bilgilerini Öğrenme'
date: '2016-12-19T01:58:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'ekran kartınız PCI bağlantısı ile bilgisayarınıza bağlıdır. Bu yazıda, Linux İşletim Sisteminde PCI cihazlarını listeleme, hafıza boyutu ve kullandığı kernel modüllerinin neler olduğunu tespit etmeyi açıklayacağım.' 
 
url:  /tr/linux-isletim-sisteminde-pci-donanim-bilgilerini-ogrenme/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'linux nasıl'
---


Bilgisayarınız ana kartına takılan Çevresel Donanımların Bağlantısı anlamında kullanılan PCI(Peripheral Component Interconnect), 1992 yılında Intel tarafından geliştirilmiştir. PCI Slot adıyla ifade edilen bağlantı noktalarına takılan cihazların ana kartla ve birbirleriyle haberleşmesini sağlayan bir teknolojidir. Zamanla PCI Express haline dönüşen bu standart, bilgisayarınıza katılı bulunan donanımların çalışıp çalışmadığını ve hataları tespit etmekte de kullanılır. Örneğin Ses kartınız, ekran kartınız PCI bağlantısı ile bilgisayarınıza bağlıdır. Bu yazıda, Linux İşletim Sisteminde PCI cihazlarını listeleme, hafıza boyutu ve kullandığı kernel modüllerinin neler olduğunu tespit etmeyi açıklayacağım.



Öncelikle bilgisayarımızda hangi PCI donanımlarının bulunduğunu görelim. Bu listede bulunan donanımların varlığı, sisteminizde doğru çalıştığı anlamına gelmez. Örneğin, ses kartınız çalışmıyor olabilir. Birazdan göreceğimiz listede, Ses donanımı bulunuyor ise bu çalışıyor anlamına gelmez. Sadece donanımınızda bulunan PCI cihazlarının Model, Üretici bilgilerinin listesi olarak düşünün. Aşağıdaki komut ile donanımı listeleyelim.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">lspci
00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor DRAM Controller (rev 06)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor PCI Express x16 Controller (rev 06)
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller (rev 06)
00:03.0 Audio device: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor HD Audio Controller (rev 06)
00:14.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset Family USB xHCI (rev 05)
00:16.0 Communication controller: Intel Corporation 8 Series/C220 Series Chipset Family MEI Controller #1 (rev 04)
00:1b.0 Audio device: Intel Corporation 8 Series/C220 Series Chipset High Definition Audio Controller (rev 05)
00:1c.0 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #1 (rev d5)
00:1c.2 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #3 (rev d5)
00:1c.3 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #4 (rev d5)
00:1f.0 ISA bridge: Intel Corporation HM86 Express LPC Controller (rev 05)
00:1f.2 SATA controller: Intel Corporation 8 Series/C220 Series Chipset Family 6-port SATA Controller 1 [AHCI mode] (rev 05)
00:1f.3 SMBus: Intel Corporation 8 Series/C220 Series Chipset Family SMBus Controller (rev 05)
01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 950M] (rev a2)
03:00.0 Network controller: Qualcomm Atheros QCA9565 / AR9565 Wireless Network Adapter (rev 01)
04:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. Device 5287 (rev 01)
04:00.1 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 12)</pre>
<!-- /wp:preformatted -->


Şimdi bu donanımlardan incelemek istediğimiz bir tanesini seçelim. Bu örnekte, aşağıdaki donanımı ele alacağız.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller (rev 06)</pre>
<!-- /wp:preformatted -->


Bu örnekte gördüğünüz gibi cihaz bilgisinin bulunduğu satırın baş tarafında numaralardan oluşan bir kod bulunuyor (00:02.0). Bu kod, cihazın takılı bulunduğu domain, bus, cihaz tipini bize bildirmektedir. Bu kodu kullanarak cihazın detaylı bilgisine ulaşabiliriz. Aşağıdaki komut bu işlemi gerçekleştirir.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">lspci -v -s 00:02.0
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller (rev 06) (prog-if 00 [VGA controller])
	Subsystem: ASUSTeK Computer Inc. 4th Gen Core Processor Integrated Graphics Controller
	Flags: bus master, fast devsel, latency 0, IRQ 34
	Memory at f7400000 (64-bit, non-prefetchable) [size=4M]
	Memory at d0000000 (64-bit, prefetchable) [size=256M]
	I/O ports at f000 [size=64]
	Expansion ROM at &lt;unassigned&gt; [disabled]
	Capabilities: &lt;access denied&gt;
	Kernel driver in use: i915
	Kernel modules: i915</pre>
<!-- /wp:preformatted -->


Bu bilgileri, donanımınızla ilgili bir problem yaşadığınızda yardım etmek isteyen destek ekibine ulaştırmak, oldukça faydalı olacaktır. Kullanıcı olarak donanımınızla ilgili detaylı bilgi sahibi olmak isterseniz de oldukça kullanışlıdır. Dikkat ederseniz, bus ve driver yani otobüs ve sürücü kavramları bu cihazlarda oldukça sık kullanılıyor. Cihazın takılı olduğu bağlantı noktasına BUS yani otobüs deniyor. Bu noktada takılı cihazı kullanıp işletim sistemine yardımcı olacak yazılıma da DRIVER yani sürücü adı veriliyor.



Son olarak bilgisayarınızda bulunan tüm PCI cihazlarının her birinin hangi Kernel sürücüsünü kullandığını görelim. Bunun için lspci komutunun -k parametresini kullanacağız.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">lspci -k
00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor DRAM Controller (rev 06)
	Subsystem: ASUSTeK Computer Inc. Xeon E3-1200 v3/4th Gen Core Processor DRAM Controller
	Kernel modules: ie31200_edac
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor PCI Express x16 Controller (rev 06)
	Kernel driver in use: pcieport
	Kernel modules: shpchp
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller (rev 06)
	Subsystem: ASUSTeK Computer Inc. 4th Gen Core Processor Integrated Graphics Controller
	Kernel driver in use: i915
	Kernel modules: i915
00:03.0 Audio device: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor HD Audio Controller (rev 06)
	Subsystem: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor HD Audio Controller
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel
00:14.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset Family USB xHCI (rev 05)
	Subsystem: ASUSTeK Computer Inc. 8 Series/C220 Series Chipset Family USB xHCI
	Kernel driver in use: xhci_hcd
00:16.0 Communication controller: Intel Corporation 8 Series/C220 Series Chipset Family MEI Controller #1 (rev 04)
	Subsystem: ASUSTeK Computer Inc. 8 Series/C220 Series Chipset Family MEI Controller
	Kernel driver in use: mei_me
	Kernel modules: mei_me
00:1b.0 Audio device: Intel Corporation 8 Series/C220 Series Chipset High Definition Audio Controller (rev 05)
	Subsystem: ASUSTeK Computer Inc. 8 Series/C220 Series Chipset High Definition Audio Controller
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel
00:1c.0 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #1 (rev d5)
	Kernel driver in use: pcieport
	Kernel modules: shpchp
00:1c.2 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #3 (rev d5)
	Kernel driver in use: pcieport
	Kernel modules: shpchp
00:1c.3 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #4 (rev d5)
	Kernel driver in use: pcieport
	Kernel modules: shpchp
00:1f.0 ISA bridge: Intel Corporation HM86 Express LPC Controller (rev 05)
	Subsystem: ASUSTeK Computer Inc. HM86 Express LPC Controller
	Kernel driver in use: lpc_ich
	Kernel modules: lpc_ich
00:1f.2 SATA controller: Intel Corporation 8 Series/C220 Series Chipset Family 6-port SATA Controller 1 [AHCI mode] (rev 05)
	Subsystem: ASUSTeK Computer Inc. 8 Series/C220 Series Chipset Family 6-port SATA Controller 1 [AHCI mode]
	Kernel driver in use: ahci
	Kernel modules: ahci
00:1f.3 SMBus: Intel Corporation 8 Series/C220 Series Chipset Family SMBus Controller (rev 05)
	Subsystem: ASUSTeK Computer Inc. 8 Series/C220 Series Chipset Family SMBus Controller
	Kernel modules: i2c_i801
01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 950M] (rev a2)
	Subsystem: ASUSTeK Computer Inc. GM107M [GeForce GTX 950M]
	Kernel driver in use: nvidia
	Kernel modules: nvidiafb, nouveau, nvidia_367, nvidia_367_drm
03:00.0 Network controller: Qualcomm Atheros QCA9565 / AR9565 Wireless Network Adapter (rev 01)
	Subsystem: AzureWave QCA9565 / AR9565 Wireless Network Adapter
	Kernel driver in use: ath9k
	Kernel modules: ath9k
04:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. Device 5287 (rev 01)
	Subsystem: ASUSTeK Computer Inc. Device 202f
	Kernel driver in use: rtsx_pci
	Kernel modules: rtsx_pci
04:00.1 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 12)</pre>
<!-- /wp:preformatted -->


Burada anlatılanların daha ilerisine geçmek isteyenlere bir ipucu verelim. Bu PCI Donanım bilgileri, Linux İşletim Sisteminde /sys/bus/pci/devices/ klasöründe ayrı klasörler halinde tutulurlar. Bu klasörlerin içerisinde de dosyalar bulunur. Bu dosyaların her birince üretici bilgisi, cihaz numara ve ID bilgileri tutulur. Örneğin, bizim incelediğimiz donanımın bilgileri aşağıda adresi yazılı klasörde bulunmaktadır.


<!-- wp:preformatted -->
<pre class="wp-block-preformatted">/sys/bus/pci/devices/0000:00:02.0/</pre>
<!-- /wp:preformatted -->