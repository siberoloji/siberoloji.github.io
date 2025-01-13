---
draft: false

title:  'RAM Hızını ve Tipini Öğrenme'
date: '2016-12-31T02:04:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bilgisayarınızın donanım bilgilerini öğrenmek için Linux içerisinde kullanabileceğiniz eşitli komutlar bulunmaktadır. Bu yazımızda RAM kapasitesini, tipi nasıl öğrenebileceğimizi açıklayacağız. Bununla birlikte bilgisayarınızdaki donanımların hepsinin özet bilgisini de elde etmenin yolunu göstereceğiz.' 
 
url:  /tr/ram-hizini-ve-tipini-ogrenme/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'linux nasıl'
---
Bilgisayarınızın donanım bilgilerini öğrenmek için Linux içerisinde kullanabileceğiniz eşitli komutlar bulunmaktadır. Bu yazımızda RAM kapasitesini, tipi nasıl öğrenebileceğimizi açıklayacağız. Bununla birlikte bilgisayarınızdaki donanımların hepsinin özet bilgisini de elde etmenin yolunu göstereceğiz.

## free

free  komutunu kullanarak, o anda sisteminizin RAM yük durumunu, boş kapasiteyi görebilirsiniz.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">free
              total        used        free      shared  buff/cache   available
Mem:        8061380     1342316     5356816       42872     1362248     6370836
Swap:             0           0           0
</pre>
<!-- /wp:preformatted -->
total sütunu toplam kapasiteyi, used kullanımda olan miktarı, free ise boşta bulunan RAM miktarını gösterir.

## cat /proc/meminfo

meminfo  dosyasının içeriği, işletim tarafından sürekli güncellenen dinamik bir içeriğe sahiptir ve içindeki bilgileri cat komutuyla ekrana yazdırabilirsiniz. Bu komut sayesinde free  komutundan daha detaylı bilgileri elde etmek mümkündür.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">cat /proc/meminfo
MemTotal:        8061380 kB
MemFree:         5309524 kB
MemAvailable:    6324656 kB
Buffers:          132880 kB
Cached:          1107684 kB
SwapCached:            0 kB
Active:          1749032 kB
Inactive:         696600 kB
Active(anon):    1206752 kB
Inactive(anon):    43156 kB
Active(file):     542280 kB
Inactive(file):   653444 kB
Unevictable:        1856 kB
Mlocked:            1856 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                12 kB
Writeback:             0 kB
AnonPages:       1202772 kB
Mapped:           350092 kB
Shmem:             44848 kB
Slab:             124752 kB
SReclaimable:      79624 kB
SUnreclaim:        45128 kB
KernelStack:        9648 kB
PageTables:        34432 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     4030688 kB
Committed_AS:    4736008 kB
VmallocTotal:   34359738367 kB
VmallocUsed:           0 kB
VmallocChunk:          0 kB
HardwareCorrupted:     0 kB
AnonHugePages:    385024 kB
CmaTotal:              0 kB
CmaFree:               0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
DirectMap4k:      282052 kB
DirectMap2M:     4847616 kB
DirectMap1G:     3145728 kB</pre>
<!-- /wp:preformatted -->
## vmstat -s

vmstat -s  komutu, sisteminizin başladığından itibaren kaydedilen istatistikleri görüntülemenizi sağlar. Bu komut, diskleriniz hakkında da istatistikler gösterebilir. Detaylı parametreler için vmstat --help  komutunu kullanabilirsiniz. Aşağıdaki çıktıda, en üst satırda RAM bilgilerini görebilirsiniz.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">vmstat -s
      8061380 K total memory
      1452864 K used memory
      1824532 K active memory
       723452 K inactive memory
      5204380 K free memory
       135560 K buffer memory
      1268576 K swap cache
            0 K total swap
            0 K used swap
            0 K free swap
        23886 non-nice user cpu ticks
          227 nice user cpu ticks
         6408 system cpu ticks
      1505691 idle cpu ticks
         8786 IO-wait cpu ticks
            0 IRQ cpu ticks
          513 softirq cpu ticks
            0 stolen cpu ticks
      1208707 pages paged in
       182300 pages paged out
            0 pages swapped in
            0 pages swapped out
      1521903 interrupts
      5105745 CPU context switches
   1483203820 boot time
         6796 forks</pre>
<!-- /wp:preformatted -->
## dmidecode -t 16

dmidecode -t 16  komutu, sisteminizde bulunan toplam RAM sayısını ve sisteminizin desteklediği maksimum RAM kapasitesini gösterir. Burada ilave etmemiz gereken bir konu bulunuyor. Özellikle Dizüstü bilgisayarlarda bu komutun çıktısında RAM kapasitesi gerçekte olduğundan daha yüksek görünebilir. dmidecode  doğrudan BIOS bilgilerini gösterir ve Ana kartınızın desteklediği kapasiteyi listeler. Aşağıda örneği verilen çıktıda, Maksimum Capacity: 32 GB  ve Number of Devices : 4  görünse de gerçekte bu bilgisayara, maksimum 2 adet ve toplam 8 GB RAM takılabilmektedir.

**Soru**: O halde komut çıktısı neden böyle gösteriyor?

**Cevap**: Ana kartınızın teknolojisi, maksimum değerleri destekliyor olsa da üretici firma, RAM takılabilecek SLOT, yuva sayısını 2 adet üretmiştir. Böyle durumlarda gerçekte kaç SLOT bulunduğunu cihazın kapağını açmadan bilmek zordur.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo dmidecode -t 16
# dmidecode 3.0
Getting SMBIOS data from sysfs.
SMBIOS 2.7 present.

Handle 0x000B, DMI type 16, 23 bytes
Physical Memory Array
Location: System Board Or Motherboard
Use: System Memory
Error Correction Type: None
Maximum Capacity: 32 GB
Error Information Handle: Not Provided
Number Of Devices: 4</pre>
<!-- /wp:preformatted -->
## dmidecode -t 17

Bu komut ile, bir önceki komutta öğrendiğimiz RAM bilgilerinin detaylarını görebilirsiniz. Komut çıktısını incelediğimizde BANK 0, BANK 1, BANK 2 ve BANK 3 olarak 4 adet SLOT bulunduğu anlaşılmaktadır. Bunlardan BANK 0 ve BANK 2'de 4 GB büyüklüğünde RAM takılı olduğu görülmektedir. Type: DDR3  bölümü RAM tipi, Speed: 1600 Mhz ise RAM hızını göstermektedir.

BANK 1 ve BANK 3 Slotları komut çıktısında görülse de üretici firma, Ana Karta monte etmediğinden gerçekte kullanılamamaktadır.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo dmidecode -t 17

# dmidecode 3.0
Getting SMBIOS data from sysfs.
SMBIOS 2.7 present.

Handle 0x000C, DMI type 17, 34 bytes
Memory Device
	Array Handle: 0x000B
	Error Information Handle: Not Provided
	Total Width: 64 bits
	Data Width: 64 bits
	Size: 4096 MB
	Form Factor: SODIMM
	Set: None
	Locator: ChannelA-DIMM0
	Bank Locator: BANK 0
	Type: DDR3
	Type Detail: Synchronous
	Speed: 1600 MHz
	Manufacturer: Samsung
	Serial Number: 00000000
	Asset Tag: 9876543210
	Part Number: M471B5173EB0-YK0  
	Rank: 1
	Configured Clock Speed: 1600 MHz

Handle 0x000E, DMI type 17, 34 bytes
Memory Device
	Array Handle: 0x000B
	Error Information Handle: Not Provided
	Total Width: Unknown
	Data Width: Unknown
	Size: No Module Installed
	Form Factor: DIMM
	Set: None
	Locator: ChannelA-DIMM1
	Bank Locator: BANK 1
	Type: Unknown
	Type Detail: None
	Speed: Unknown
	Manufacturer: [Empty]
	Serial Number: [Empty]
	Asset Tag: 9876543210
	Part Number: [Empty]
	Rank: Unknown
	Configured Clock Speed: Unknown

Handle 0x000F, DMI type 17, 34 bytes
Memory Device
	Array Handle: 0x000B
	Error Information Handle: Not Provided
	Total Width: 64 bits
	Data Width: 64 bits
	Size: 4096 MB
	Form Factor: SODIMM
	Set: None
	Locator: ChannelB-DIMM0
	Bank Locator: BANK 2
	Type: DDR3
	Type Detail: Synchronous
	Speed: 1600 MHz
	Manufacturer: Kingston
	Serial Number: 573A23B6
	Asset Tag: 9876543210
	Part Number: 99U5469-045.A00LF 
	Rank: 1
	Configured Clock Speed: 1600 MHz

Handle 0x0011, DMI type 17, 34 bytes
Memory Device
	Array Handle: 0x000B
	Error Information Handle: Not Provided
	Total Width: Unknown
	Data Width: Unknown
	Size: No Module Installed
	Form Factor: DIMM
	Set: None
	Locator: ChannelB-DIMM1
	Bank Locator: BANK 3
	Type: Unknown
	Type Detail: None
	Speed: Unknown
	Manufacturer: [Empty]
	Serial Number: [Empty]
	Asset Tag: 9876543210
	Part Number: [Empty]
	Rank: Unknown
	Configured Clock Speed: Unknown</pre>
<!-- /wp:preformatted -->
## lshw

Donanımınız ile ilgili detaylı bilgilerin tamamını lshw  komutu ile elde edebilirsiniz. Aşağıdaki örnekte, memory  bilgileri gösterilmiştir. sudo lshw  komutuyla tüm bilgileri elde etmeniz mümkündür.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo lshw -short -C memory

H/W path         Device      Class          Description
=======================================================
/0/0                         memory         64KiB BIOS
/0/7/8                       memory         1MiB L2 cache
/0/7/9                       memory         256KiB L1 cache
/0/7/a                       memory         6MiB L3 cache
/0/b                         memory         8GiB System Memory
/0/b/0                       memory         4GiB SODIMM DDR3 Synchronous 1600 MHz (0,6 ns)
/0/b/1                       memory         DIMM [empty]
/0/b/2                       memory         4GiB SODIMM DDR3 Synchronous 1600 MHz (0,6 ns)
/0/b/3                       memory         DIMM [empty]</pre>
<!-- /wp:preformatted -->
Cihazınızın gerçekte kullanılabilir kapasitesini, üreticinin web sitesinde yayınlanan sayfalardan da kontrol etmenizi tavsiye ediyoruz.
