---
draft: false

title:  'apt-get update / upgrade / dist-upgrade farkı nedir?'
date: '2016-04-01T13:56:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Ubuntu veya apt paket yöneticisi kullanan bir İşletim Sisteminiz varsa,\_apt-get update\_ve benzeri komutları mutlaka kullanmışsınızdır.\_apt-get update,\_apt-get upgrade\_ve\_apt-get dist-upgrade\_komutlarının birbirine benzemesine rağmen farklı görevleri olduğunu göstereceğiz." 
 
url:  /tr/apt-get-update-upgrade-dist-upgrade-farki-nedir/
 
featured_image: /images/cyber2.jpg
categories:
    - 'Temel Linux'
tags:
    - apt-get
---
Ubuntu veya apt paket yöneticisi kullanan bir İşletim Sisteminiz varsa, apt-get update ve benzeri komutları mutlaka kullanmışsınızdır. apt-get update, apt-get upgrade ve apt-get dist-upgrade komutlarının birbirine benzemesine rağmen farklı görevleri olduğunu göstereceğiz.

Öncelikle, Linux sistemimizin kendisini güncellemek için bir merkeze bakıp, kontrol yapmaya ihtiyacı vardır. Bu listelerin bakılacağı yerler /etc/apt/sources.list dosyasında tutulur. Kısaca hangi paket depolarına bakılacağı buraya kaydedilir. apt-get update komutu ile burada yer alan paket depolarına bakılır.

Sisteminizin, paketlerini güncellemek amacıyla hangi paket depolarını kullandığını görmek için aşağıdaki komutu çalıştıralım.
```bash
# Komut
cat /etc/apt/sources.list

# Çıktı

# deb cdrom:[Xubuntu 14.04.2 LTS _Trusty Tahr_ - Release amd64 (20150218.1)]/ trusty main multiverse restricted universe
# deb cdrom:[Xubuntu 14.04.2 LTS _Trusty Tahr_ - Release amd64 (20150218.1)]/ trusty main multiverse restricted universe

# See <a href="http://help.ubuntu.com/community/UpgradeNotes">http://help.ubuntu.com/community/UpgradeNotes</a> for how to upgrade to
# newer versions of the distribution.
deb <a href="http://tr.archive.ubuntu.com/ubuntu/">http://tr.archive.ubuntu.com/ubuntu/</a> trusty main restricted
deb-src <a href="http://tr.archive.ubuntu.com/ubuntu/">http://tr.archive.ubuntu.com/ubuntu/</a> trusty main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb <a href="http://tr.archive.ubuntu.com/ubuntu/">http://tr.archive.ubuntu.com/ubuntu/</a> trusty-updates main restricted
deb-src <a href="http://tr.archive.ubuntu.com/ubuntu/">http://tr.archive.ubuntu.com/ubuntu/</a> trusty-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb <a href="http://tr.archive.ubuntu.com/ubuntu/">http://tr.archive.ubuntu.com/ubuntu/</a> trusty universe
deb-src <a href="http://tr.archive.ubuntu.com/ubuntu/">http://tr.archive.ubuntu.com/ubuntu/</a> trusty universe
deb <a href="http://tr.archive.ubuntu.com/ubuntu/">http://tr.archive.ubuntu.com/ubuntu/</a> trusty-updates universe
deb-src <a href="http://tr.archive.ubuntu.com/ubuntu/">http://tr.archive.ubuntu.com/ubuntu/</a> trusty-updates universe
```

# apt-get update

apt-get update komutu sayesinde sisteminizde kurulu olan paketlerin, paket deposundaki versiyonları ile farkları araştırılır ve liste güncellenir. Aslında tek yapılan liste güncellemedir. Herhangi bir güncelleme işleminden önce çalıştırılması mutlaka tavsiye edilir çünkü sisteminizde gerekli güncelleme ve bağımlılıkların çözümü için gerekli bir işlemdir.
<!-- wp:quote -->
<blockquote class="wp-block-quote">
apt-get update komutu ile sisteminize herhangi bir kurulum yapılmaz.
</blockquote>
<!-- /wp:quote -->

```bash
# Komut
sudo apt-get update

# Çıktı
      
Get:4 <a href="http://mega.nz/">http://mega.nz</a> ./ Release [967 B]                                                   
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-updates/restricted i386 Packages       
Get:10 <a href="http://security.ubuntu.com/">http://security.ubuntu.com</a> trusty-security/main amd64 Packages [344 kB] 
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-updates/universe i386 Packages         
Hit <a href="http://ppa.launchpad.net/">http://ppa.launchpad.net</a> trusty Release.gpg                                
Hit <a href="http://linux.dropbox.com/">http://linux.dropbox.com</a> trusty Release                                    
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-updates/multiverse i386 Packages       
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-updates/main Translation-en            
Hit <a href="http://ppa.launchpad.net/">http://ppa.launchpad.net</a> trusty Release.gpg                                
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-updates/multiverse Translation-en      
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-updates/restricted Translation-en      
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-updates/universe Translation-en        
Hit <a href="http://ppa.launchpad.net/">http://ppa.launchpad.net</a> trusty Release                                    
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-backports/main Sources                 
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-backports/restricted Sources           
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-backports/universe Sources             
Hit <a href="http://ppa.launchpad.net/">http://ppa.launchpad.net</a> trusty Release                                    
Ign <a href="http://extras.ubuntu.com/">http://extras.ubuntu.com</a> trusty/main Translation-en_US                     
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-backports/multiverse Sources           
Get:11 <a href="http://security.ubuntu.com/">http://security.ubuntu.com</a> trusty-security/restricted amd64 Packages [8.875 B]
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-backports/main amd64 Packages          
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-backports/restricted amd64 Packages    
Hit <a href="http://ppa.launchpad.net/">http://ppa.launchpad.net</a> trusty Release                                    
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-backports/universe amd64 Packages      
Ign <a href="http://extras.ubuntu.com/">http://extras.ubuntu.com</a> trusty/main Translation-en                        
Get:12 <a href="http://security.ubuntu.com/">http://security.ubuntu.com</a> trusty-security/universe amd64 Packages [117 kB]
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-backports/multiverse amd64 Packages    
Hit <a href="http://ppa.launchpad.net/">http://ppa.launchpad.net</a> trusty Release                                    
Hit <a href="http://linux.dropbox.com/">http://linux.dropbox.com</a> trusty/main amd64 Packages                        
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-backports/main i386 Packages           
Hit <a href="http://tr.archive.ubuntu.com/">http://tr.archive.ubuntu.com</a> trusty-backports/restricted i386 Packages     
Get:13 <a href="http://security.ubuntu.com/">http://security.ubuntu.com</a> trusty-security/multiverse amd64 Packages [3.691 B]

Fetched 1.130 kB in 4s (237 kB/s)
Reading package lists... Done
```

# apt-get upgrade

Sisteminizde kurulu olan paketlerin hepsini, apt-get update komutu ile güncellediğiniz listede bulunan en son sürüme yükseltir. Burada dikkat edilmesi gereken nokta **KURULU** olan paketler üzerinde güncelleme işlemi yapıldığıdır. A.lib dosyasının 1.1 sürümünü 1.2 sürümüne günceller. Sadece kurulu olan paketleri en güncel hale getirir.

Bir takım yazılım geliştiriciler veya sistem yöneticileri ihtiyaçları olmayan paket veya kernel dosyalarını, sistemlerinin kararlılığını düşünerek yüklemek istemezler. Böyle bir durumda upgrade oldukça kullanışlıdır. Yalnızca mevcut paketler en yeni sürüme yükseltilmiş olur. Önemli bir nokta da, sistemden hiçbir paketin silinmediğidir. Yalnızca mevcut paketler en yeni sürüme yükseltilmiş olur.
```bash
# Komut
sudo apt-get upgrade

# Çıktı

Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.```

# apt-get dist-upgrade

Bu komut için, apt sistemindeki en fazla yetkiye sahip komut diyebiliriz. Mevcut paketleri günceller, sistemde olmayan yeni bağımlılıkları kurar, gerek kalmayanları siler. Bağımlılık problemlerinin çözümü ve sisteminizin en güncel kernel sürümüne yükseltilmesi için kullanılabilir. Tercih kullanıcınındır. Bir kısım kullanıcılar, yüklenen yeni kernel sürümü ile problem yaşayabilirler.
```kotlin
# Komut
sudo apt-get dist-upgrade

# Çıktı

Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.```

apt-get dist-upgrade komutu ile sistem sürümü yeni bir dağıtıma yükseltilmez. Örneğin, 14.04 sürümünden 14.10'a geçmiş olmazsınız. 
```bash
sudo apt-get update &amp;&amp; sudo apt-get -y upgrade

# veya

sudo apt-get update &amp;&amp; sudo apt-get -y upgrade &amp;&amp; sudo apt-get dist-upgrade```
