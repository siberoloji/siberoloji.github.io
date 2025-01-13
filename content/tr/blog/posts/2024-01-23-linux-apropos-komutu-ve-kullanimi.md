---
draft: false

title:  'Linux apropos komutu ve kullanımı'
date: '2024-01-23T12:56:55+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  '"apropos" komutunu yardım sayfalarının (man pages)  arama motoru olarak düşünebilirsiniz. Bu komut, komut isimlerinde ve kısa tanımlarında arama yapar.' 
 
url:  /tr/linux-apropos-komutu-ve-kullanimi/
classicmag_post_sidebar_option:
    - right-sidebar
classicmag_header_overlay:
    - global-layout
burst_total_pageviews_count:
    - '9'
featured_image: /images/bash-1.png
categories:
    - 'Temel Linux'
tags:
    - linux
    - 'temel linux'
---
Linux komut satırında kullanıma hazır komutları hatırlamakta bazen problem yaşayabilirsiniz. Hangi komutun ne ile ilgili olduğu hatırınıza gelmeyebilir. Böyle bir durumda "apropos" komutu ile komut kılavuz sayfalarındaki tanımlarda arama yapabilir ve aradığınızı daha kolay bulabilirsiniz. Bu yazımızda "apropos" komutunun kullanımı ile ilgili örnekler vereceğiz.

## apropos komutu

"apropos" komutunu yardım sayfalarının (man pages)  arama motoru olarak düşünebilirsiniz. Bu komut, komut isimlerinde ve kısa tanımlarında arama yapar. Yardım sayfalarının tamamında arama yapmaz. Aşağıda basit bir örnek verilmiştir. Bu komut, yardım sayfalarının tanımlarının herhangi bir yerinde veya komut adlarında "`unzip`" ifadesi geçen tüm komutların listesini verecektir.
```kotlin
linux@rpi4:~ $ apropos unzip
bunzip2 (1)          - a block-sorting file compressor, v1.0.8
funzip (1)           - filter for extracting from a ZIP archive in a pipe
gunzip (1)           - compress or expand files
unzip (1)            - list, test and extract compressed files in a ZIP archive
unzipsfx (1)         - self-extracting stub for prepending to ZIP archives
```

Bu örnekte görülen basit kullanımın ötesinde, bazı seçenekler kullanarak komutu ileri düzeyde de kullanmanız mümkündür. Aşağıdaki listede kullanabileceğiniz seçenekleri görebilirsiniz.
```kotlin
linux@rpi4:~ $ apropos -h
Usage: apropos [OPTION...] KEYWORD...

  -d, --debug                emit debugging messages
  -v, --verbose              print verbose warning messages
  -e, --exact                search each keyword for exact match
  -r, --regex                interpret each keyword as a regex
  -w, --wildcard             the keyword(s) contain wildcards
  -a, --and                  require all keywords to match
  -l, --long                 do not trim output to terminal width
  -C, --config-file=FILE     use this user configuration file
  -L, --locale=LOCALE        define the locale for this search
  -m, --systems=SYSTEM       use manual pages from other systems
  -M, --manpath=PATH         set search path for manual pages to PATH
  -s, --sections=LIST, --section=LIST
                             search only these sections (colon-separated)
  -?, --help                 give this help list
      --usage                give a short usage message
  -V, --version              print program version
```

## -e, --exact

Aradığınız ifadenin tam olarak eşleşmesi gerekir. Aşağıda "partiti" ifadesini -e seçeneği ile ve -e seçeneği olmadan kullanımını görebilirsiniz.
```kotlin
linux@rpi4:~ $ apropos -e partiti
partiti: nothing appropriate.

linux@rpi4:~ $ apropos  partiti
addpart (8)          - tell the kernel about the existence of a partition
cfdisk (8)           - display or manipulate a disk partition table
cgdisk (8)           - Curses-based GUID partition table (GPT) manipulator
delpart (8)          - tell the kernel to forget about a partition
fdisk (8)            - manipulate disk partition table
fixparts (8)         - MBR partition table repair utility
gdisk (8)            - Interactive GUID partition table (GPT) manipulator
gparted (8)          - GNOME Partition Editor for manipulating disk partitions.
parted (8)           - a partition manipulation program
partprobe (8)        - inform the OS of partition table changes
partx (8)            - tell the kernel about the presence and numbering of on-disk partitions
repart.d (5)         - Partition Definition Files for Automatic Boot-Time Repartitioning
resizepart (8)       - tell the kernel about the new size of a partition
sfdisk (8)           - display or manipulate a disk partition table
sgdisk (8)           - Command-line GUID partition table (GPT) manipulator for Linux and Unix
systemd-gpt-auto-generator (8) - Generator for automatically discovering and mounting root, /home/, /srv/, ...
systemd-repart (8)   - Automatically grow and add partitions
systemd-repart.service (8) - Automatically grow and add partitions
```

## -r, --regex

Arama ifadenizde düzenli ifadeler bulundurmak isterseniz kullanabilirsiniz. Örneğin ^ifadesi düzenli ifadelerde "baş taraf" anlamına gelmektedir. Baş tarafı "tar" ile başlayan komutları bulmaya çalışalım. Gördüğünüz gibi apropos komutu komut adı "tar" ile başlayan  2 komut ve ayrıca, açıklama bölümü Tar ile başlayan başka bir komut daha bulmuştur.
```kotlin
linux@rpi4:~ $ apropos -r '^tar'
systemd.target (5)   - Target unit configuration
tar (1)              - an archiving utility
tarcat (1)           - concatenates the pieces of a GNU tar multi-volume archive```

## -a, --and

Arama yapacağınız tüm ifadelerin mutlaka bulunması gerektiğinde kullanabilirsiniz. Komut adında veya açıklamasında "tar" ve "file" geçen yardım sayfalarını aratalım.
```kotlin
linux@rpi4:~ $ apropos -a tar file
gpgtar (1)           - Encrypt or sign files into an archive
ptargrep (1)         - Apply pattern matching to the contents of files in a tar archive
qt-faststart (1)     - utility for Quicktime files
swapoff (2)          - start/stop swapping to file/device
swapon (2)           - start/stop swapping to file/device
systemd-xdg-autostart-generator (8) - User unit generator for XDG autostart files
```

## -w, --wildcard

Aramak istediğiniz ifadenin içerisinde joker karakterler kullandığınızı belirtir. Örneğin baş tarafı "color" ile başlayan ve devamında ne olursa olsun tüm ifadeleri bulmak istediğinizde kullanılır. Örneğimizde, içerisinde "color", "colorization", "color-name", "colormap" geçen tüm açıklamalar bulunmuştur.
```kotlin
linux@rpi4:~ $ apropos -w color*
cd-create-profile (1) - Color Manager Profile Creation Tool
cd-fix-profile (1)   - Color Manager Testing Tool
cd-it8 (1)           - Color Manager Testing Tool
colormgr (1)         - Color Manager Testing Tool
dircolors (1)        - color setup for ls
hp-colorcal (1)      - Printer Cartridge Color Calibration Utility
setvtrgb (1)         - customize the console color map
showrgb (1)          - display an rgb color-name database
terminal-colors.d (5) - configure output colorization for various utilities
xcmsdb (1)           - Device Color Characterization utility for X Color Management System
XcupGetReservedColormapEntries (3) - list colormap entries reserved by the system
XcupStoreColors (3)  - initialize shareable colormap entries at specific locations
xstdcmap (1)         - X standard colormap utility
```

Bu yazımızda "apropos" komutu ve sıklıkla kullanılan seçenekleri açıkladık. Daha detaylı bilgi için "man apropos" komutu ile yardım sayfalarına bakabilirsiniz.
