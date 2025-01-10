---
draft: false

title:  'Metasploitable3 Kurulum'
date: '2016-12-10T01:50:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Geçtiğimiz günlerde Metasploitable3 yayınlandı. Pentest eğitimlerinde kullanılan ve özellikle Metasploit Framework scriptleri için geliştirilen hedef sistem, yeni bir anlayışla hazırlanmış durumda. Önceden olduğu gibi sabit bir .iso kalıbı olarak dağıtılmıyor.' 
 
url:  /tr/metasploitable3-kurulum/
 
featured_image: /images/cyber2.jpg
categories:
    - 'Siber Güvenlik'
tags:
    - metasploitable3
    - 'siber güvenlik'
---


Geçtiğimiz günlerde Metasploitable3 yayınlandı. Pentest eğitimlerinde kullanılan ve özellikle Metasploit Framework scriptleri için geliştirilen hedef sistem, yeni bir anlayışla hazırlanmış durumda. Önceden olduğu gibi sabit bir .iso kalıbı olarak dağıtılmıyor.



Sürekli yeni güncellemelerin yerleştirleceğş bir container yapıyla sunuluyor. Sistem Windows 8 SR2 Server üzerine inşa edilmiş durumda. Metasploitable3 hedef sistemini bilgisayarınıza indirip kurmak için bir takım gereklilikler bulunuyor. Bunların kurulumunu ve Linux bilgisayarlarınızda derlemenin nasıl yapıldığını yazının devamında adım adım anlattık. Ayrıca yazının sonunda bu anlatımların video playlistini de bulabilirsiniz.



Metasploitable3, Github adresinden dağıtılıyor. <a href="https://github.com/rapid7/metasploitable3">Metasploitable3 Github Sayfası</a>



Metasploitable3 üzerinde bulunan zafiyetler Aşağıdaki listede şu an için mevcut bulunan zafiyetleri görebilirsiniz. Projenin Wiki sayfasına zaman içinde yeni servisler ve zafiyetler yükleneceği belirtiliyor.


* 
* GlassFish

* Apache Struts

* Tomcat

* Jenkins

* IIS FTP

* IIS HTTP

* psexec

* SSH

* WinRM

* chinese caidao

* ManageEngine

* ElasticSearch

* Apache Axis2

* WebDAV

* SNMP

* MySQL

* JMX

* WordPress

* SMB

* Remote Desktop

* PHPMyAdmin




## Kurulum için gereklililer


* 
* Metasploitable3 Git Clone

* Packer

* Vagrant

* Vagrant Reload Plugin

* Virtualbox

* Vagrant Up

* İnternet Bağlantısı




## 1. Adım: Metasploitable3 git clone



Aşağıdaki komut ile git deposunu bilgisayarınıza klonlayın. git kullanmasını bilenler zaten ne yapacaklarını anlamıştır. Bilmeyenler için adım adım anlatalım. Sisteminizde git kurulu değilse aşağıdaki adımları takip ederek kendinize Ev klasörü içerisinde bir git klasörü oluşturun. Sisteminizde kurulu değilse git programını kurun. Bu sayede github projelerini bilgisayarınıza indirip kullanabilirsiniz.


```bash
sudo apt install git
cd
mkdir git
cd git/
git clone <a href="https://github.com/rapid7/metasploitable3.git">https://github.com/rapid7/metasploitable3.git</a>
```



Bu komutlar sonucunda ev klasörünüzün içinde metasploitable3 isimli bir klasör ve içinde gerekli paketler klonlanmış olacak.



## 2. Adım: Packer Kurulum



Şimdi birlikte packer programını kuralım. Bu adresten <a href="https://www.packer.io/downloads.html">Packer İndirme Bağlantısı</a> Linux İşletim sisteminize uygun olan .zip uzantılı dosyayı indirin.



İndirdiğiniz dosyayı arşiv yöneticisi yardımıyla Home (Ev) klasörünüzün altına çıkartın. Çıkarılan klasör /home/kallanıcıadınız/packer/ şeklinde bir klasör olmalı.



Packer klasörünün içerisinde sadece 1 dosya bulunur. Bu dosyanın yolunu şimdi sisteme tanıtalım. Dosyamızın adresi olan /home/kullanıcıadınız/packer/ adresini PATH indeksine tanıtmamız gerekli. Bunun için, aşağıdaki formatı kullanarak packer klasör adresimizi hazırlayıp Home klasörümüz içerisindeki .profile dosyamızın en altına yerleştirip kaydediyoruz. Home klasörü altında .profile dosyasını göremiyorsanız, gizli dosyaları görmek için Ctrl+H tuşlarını kullanın. .profile dosyanızı aşağıda resimdeki örneğe benzer olmalı


```bash
export PATH**=**$PATH:/home/kullacıadınız/packer/
```



Ayrıca aşağıdaki komutu kullanarak /usr/bin/ klasörüne link koymanızı da tavsiye ediyoruz.


```bash
cd /usr/bin
sudo ln -s /home/kullanıcıadınız/packer/packer
```



Artık packer kurulumu bitti. Test etmek için komut satırına packer komutunu verin. İşler yolunda gitmişse aşağıdaki çıktıyı alırsınız.


```bash
packer
usage: packer **[**--version**]** **[**--help**]** <command> **[**<args>]
Available commands are:
build build image(s) from template
fix fixes templates from old versions of packer
inspect see components of a template
push push a template and supporting files to a Packer build service
validate check that a template is valid
version Prints the Packer version
```



## 3. Adım: Vagrant Kurulum



Vagrant programı, .deb uzantılı dağıtılmaktadır. <a href="https://www.vagrantup.com/downloads.html">Bu adresten</a> Debian tabanlı kurulum dosyasını bilgisayar mimarinize göre 64 bit – 32 bit olarak seçin ve indirin.



İndirdiğiniz klasöre giderek, komut satırından aşağıdaki komutu verin. Dosya ismi ve sürümü değişiklik gösterebilir. Kendi indirdiğiniz sürümün adını yazın.


```bash
sudo dpkg -i vagrant_1.9.4_x86_64.deb 
(Reading database ... 318960 files and directories currently installed.)
Preparing to unpack vagrant_1.9.4_x86_64.deb ...
Unpacking vagrant (1:1.9.4) ...
Setting up vagrant (1:1.9.4) ...
```



Vagrant sisteminize kurulacak ve gerekli sistem ayarlarını otomatik olarak yapacaktır.



## 4. Adım: Vagrant Reload Plugin Kurulum



Vagrant sanal işletim sistemi yönetimi esnasında çalışacak scriptlerin her biri, kurulduktan sonra sanal işletim sistemini kapatıp açmak veya resetlemek isteyecektir. Bu işlemleri ve provision işlemlerini yapmayı sağlayan vagrant reload plugin eklentisini kuralım.


```bash
vagrant plugin install vagrant-reload
Installing the 'vagrant-reload' plugin. This can take a few minutes...
Fetching: vagrant-reload-0.0.1.gem (100%)
Installed the plugin 'vagrant-reload (0.0.1)'**!**
```



Kurulum başarı ile tamamlanınca size komut satırından sonuç haber verilecektir.



## 5. Adım: Virtualbox Kurulum



Sanallaştırma işlemlerinin kullanacağımız Virtualbox programını ve eklentilerini kuralım. <a href="https://www.virtualbox.org/wiki/Downloads[Bu">https://www.virtualbox.org/wiki/Downloads[Bu</a> adresi] kullanarak linux hosts için gerekli debian paketini ve aynı sayfada bulunan extension pack ilave eklentileri mutlaka indirmelisiniz.



İndirdiğimiz virtualbox.deb paketini sisteminize aşağıdaki komut yardımıyla kurabilirsiniz. İndirdiğiniz sürüm bu yazının hazırlandığı tarihten daha yeni olabilir. Dosya ismini sizin indirdiğiniz sürüm olarak yazmalısınız.


```bash
sudo dpkg -i virtualbox-5.1_5.1.8-111374-Ubuntu-xenial_amd64.deb
```



Kurulum talimatlarını tamamladıktan sonra programın Seçenekler bölümünden Extensions Pack kurulumunu da tamamlayın. Detayları ve eklenti paketinin yüklenmesini video anlatımda görebilirsiniz.



## 6. Adım: Build Script Çalıştırma



Artık bütün gereklilikler tamamlandı. Sanal işletim sistemimizin vagrant tarafından box olarak oluşturulması ve Virtualbox içerisine tanıtılması gerekmektedir. Bunun için git merkezinden klonladığımız dosyaların olduğu klasöre gidelim. Aşağıdaki komutlar .iso dosyası indirip gerekli tüm programları kuracakları için oldukça uzun sürecektir. Bu normaldir.


```bash
cd ~/git/metasploitable3/
./build_win2008.sh 
cat: /etc/upstream-release: Is a directory
Compatible version of VirtualBox found.
Compatible version of packer was found.
Correct version of vagrant was found.
Compatible version of vagrant-reload plugin was found.
All requirements found. Proceeding...
Building the Vagrant box...
virtualbox-iso output will be **in **this color.

**==>** virtualbox-iso: Downloading or copying Guest additions
    virtualbox-iso: Downloading or copying: file:///usr/share/virtualbox/VBoxGuestAdditions.iso
**==>** virtualbox-iso: Downloading or copying ISO
    virtualbox-iso: Downloading or copying: <a href="http://download.microsoft.com/download/7/5/E/75EC4E54-5B02-42D6-8879-D8D3A25FBEF7/7601.17514.101119-1850_x64fre_server_eval_en-us-GRMSXEVAL_EN_DVD.iso">http://download.microsoft.com/download/7/5/E/75EC4E54-5B02-42D6-8879-D8D3A25FBEF7/7601.17514.101119-1850_x64fre_server_eval_en-us-GRMSXEVAL_EN_DVD.iso</a>
    virtualbox-iso: Download progress: 0%
    virtualbox-iso: Download progress: 0%
    virtualbox-iso: Download progress: 0%
    virtualbox-iso: Download progress: 0%
    virtualbox-iso: Download progress: 0%
    virtualbox-iso: Download progress: 1%
    virtualbox-iso: Download progress: 1%
    virtualbox-iso: Download progress: 1%
    ...
    ...
    virtualbox-iso (vagrant): Compressing: Vagrantfile
    virtualbox-iso (vagrant): Compressing: box.ovf
    virtualbox-iso (vagrant): Compressing: metadata.json
    virtualbox-iso (vagrant): Compressing: packer-virtualbox-iso-1494433445-disk001.vmdk
Build 'virtualbox-iso' finished.

**==>** Builds finished. The artifacts of successful builds are:
--> virtualbox-iso: 'virtualbox' provider box: windows_2008_r2_virtualbox.box
Box successfully built by Packer.
Attempting to add the box to Vagrant...
**==>** box: Box file was not detected as metadata. Adding it directly...
**==>** box: Adding box 'metasploitable3' (v0) for **provider: 
    box: Unpacking necessary files from: file:///home/umut/git/metasploitable3/windows_2008_r2_virtualbox.box
**==>** box: Successfully added box 'metasploitable3' (v0) for** 'virtualbox'**!**
Box successfully added to Vagrant.
---------------------------------------------------------------------
SUCCESS: Run 'vagrant up' to provision and start metasploitable3.
NOTE: The VM will need Internet access to provision properly.

```



## 7. Adım: Vagrant up



Gerekli tüm indirmeler ve inşa faaliyetleri artık tamamlandı. Sanal işletim sistemimiz hazır. Sanal makinemiz hazır. Artık bu Windows server üzerine, içinde zafiyet barındıran uygulamalar yüklenecek ve sanal işletim sistemi Metasploitable3 hazır hale gelecek. Bunun için, github tan klonladığımız klasörün içindeyken son bir komut veriyoruz.


```bash
sudo vagrant up
**[**sudo**]** password for **umut: 
Bringing machine 'default' up with 'virtualbox' provider...
**==>** default: Importing base box 'metasploitable3'...
**==>** default: Matching MAC address for **NAT networking...
**==>** default: Setting the name of the VM: metasploitable3_default_1494436809723_60405
**==>** default: Clearing any previously set network interfaces...
**==>** default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
**==>** default: Forwarding ports...
....
```



Bu işlem, bir defaya mahsus yapılmakta ve oldukça uzun sürmektedir. Sabırla beklemeye devam edin. Tamamlandığında işlemler bitecek ve komut satırına geri gelinecektir.



## 7. Adım: Son adımlar



Tüm adımları başarıyla tamamladıysanız artık sanallaştırma yazılımı Virtualbox içerisinden Metasploitable3 sürümünü çalıştırabilirsiniz. Normalde vangrant up komutu ile sanal sistem çalışmaktadır ancak varsayılan olarak headless olarak başlar. Headless başlangıç, görüntü penceresi olmadan başlangıçtır. Ağ, sistem kaynak kullanımı vb. ayarları yapmak için görüntü penceresinde görsel olarak görmek isterseniz, virtualbox ı başlatın ve sanal işletim sistemi üzerinde SHOW – GÖSTER seçeneği ile pencereyi açın.



Kullanıcı adı: vagrant



Parola: vagrant



Virtualbox içerisinde ağ ayarlarını kontrol etmeyi unutmayın. İki adet adaptör bulunuyor. Bir tanesi NAT üzerinden gerçek dünyaya açılıyor, diğer ise “host-only”.



Host-only adaptör kendisine vboxnet1 isimli bir sanal ağ kurar. Siz önceden Host-only vboxnet0 kullanıyor ve Kali İşletim sistemine bu adaptör tanımlıysa, test ve hedef sistemin ikisinin de host-only vboxnet0 ayarında olması gerektiğini hatırlatalım.



TIP: NAT adaptörünü mümkünse iptal etmenizi ve ihtiyacınız yoksa açmamanızı tavsiye ediyorum.
