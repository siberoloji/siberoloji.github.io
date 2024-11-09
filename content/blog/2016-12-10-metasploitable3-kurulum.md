---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Siber Güvenlik
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-12-10T01:50:00Z"
excerpt: Geçtiğimiz günlerde Metasploitable3 yayınlandı. Pentest eğitimlerinde kullanılan
  ve özellikle Metasploit Framework scriptleri için geliştirilen hedef sistem, yeni
  bir anlayışla hazırlanmış durumda. Önceden olduğu gibi sabit bir .iso kalıbı olarak
  dağıtılmıyor.
guid: https://www.siberoloji.com/?p=1108
id: 1108
image: /assets/images/2024/06/cyber2.jpg
tags:
- metasploitable3
- siber güvenlik
title: Metasploitable3 Kurulum
url: /tr/metasploitable3-kurulum/
---

  Geçtiğimiz günlerde Metasploitable3 yayınlandı. Pentest eğitimlerinde kullanılan ve özellikle Metasploit Framework scriptleri için geliştirilen hedef sistem, yeni bir anlayışla hazırlanmış durumda. Önceden olduğu gibi sabit bir .iso kalıbı olarak dağıtılmıyor.
 

  Sürekli yeni güncellemelerin yerleştirleceğş bir container yapıyla sunuluyor. Sistem Windows 8 SR2 Server üzerine inşa edilmiş durumda. Metasploitable3 hedef sistemini bilgisayarınıza indirip kurmak için bir takım gereklilikler bulunuyor. Bunların kurulumunu ve Linux bilgisayarlarınızda derlemenin nasıl yapıldığını yazının devamında adım adım anlattık. Ayrıca yazının sonunda bu anlatımların video playlistini de bulabilirsiniz.
 

  Metasploitable3, Github adresinden dağıtılıyor.&nbsp;<a href="https://github.com/rapid7/metasploitable3">Metasploitable3 Github Sayfası</a>
 

  Metasploitable3 üzerinde bulunan zafiyetler Aşağıdaki listede şu an için mevcut bulunan zafiyetleri görebilirsiniz. Projenin Wiki sayfasına zaman içinde yeni servisler ve zafiyetler yükleneceği belirtiliyor.
 

<!-- wp:list -->
 <!-- wp:list-item -->
- GlassFish 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Apache Struts 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Tomcat 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Jenkins 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- IIS FTP 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- IIS HTTP 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- psexec 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- SSH 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- WinRM 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- chinese caidao 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ManageEngine 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ElasticSearch 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Apache Axis2 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- WebDAV 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- SNMP 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- MySQL 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- JMX 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- WordPress 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- SMB 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Remote Desktop 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- PHPMyAdmin 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
<h2 class="wp-block-heading" id="kurulum-için-gereklililer">Kurulum için gereklililer
<!-- /wp:heading -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Metasploitable3 Git Clone 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Packer 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Vagrant 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Vagrant Reload Plugin 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Virtualbox 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Vagrant Up 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- İnternet Bağlantısı 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
<h2 class="wp-block-heading" id="1-adım-metasploitable3-git-clone">1. Adım: Metasploitable3 git clone
<!-- /wp:heading -->

  Aşağıdaki komut ile git deposunu bilgisayarınıza klonlayın. git kullanmasını bilenler zaten ne yapacaklarını anlamıştır. Bilmeyenler için adım adım anlatalım. Sisteminizde git kurulu değilse aşağıdaki adımları takip ederek kendinize Ev klasörü içerisinde bir git klasörü oluşturun. Sisteminizde kurulu değilse git programını kurun. Bu sayede github projelerini bilgisayarınıza indirip kullanabilirsiniz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo apt install git
cd
mkdir git
cd git/
git clone <a href="https://github.com/rapid7/metasploitable3.git">https://github.com/rapid7/metasploitable3.git</a>
</code></pre>
<!-- /wp:code -->

  Bu komutlar sonucunda ev klasörünüzün içinde metasploitable3 isimli bir klasör ve içinde gerekli paketler klonlanmış olacak.
 

 
<h2 class="wp-block-heading" id="2-adım-packer-kurulum">2. Adım: Packer Kurulum
<!-- /wp:heading -->

  Şimdi birlikte packer programını kuralım. Bu adresten&nbsp;<a href="https://www.packer.io/downloads.html">Packer İndirme Bağlantısı</a>&nbsp;Linux İşletim sisteminize uygun olan .zip uzantılı dosyayı indirin.
 

  İndirdiğiniz dosyayı arşiv yöneticisi yardımıyla Home (Ev) klasörünüzün altına çıkartın. Çıkarılan klasör /home/kallanıcıadınız/packer/ şeklinde bir klasör olmalı.
 

  Packer klasörünün içerisinde sadece 1 dosya bulunur. Bu dosyanın yolunu şimdi sisteme tanıtalım. Dosyamızın adresi olan /home/kullanıcıadınız/packer/ adresini PATH indeksine tanıtmamız gerekli. Bunun için, aşağıdaki formatı kullanarak packer klasör adresimizi hazırlayıp Home klasörümüz içerisindeki .profile dosyamızın en altına yerleştirip kaydediyoruz. Home klasörü altında .profile dosyasını göremiyorsanız, gizli dosyaları görmek için Ctrl+H tuşlarını kullanın. .profile dosyanızı aşağıda resimdeki örneğe benzer olmalı
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">export PATH***=*** $PATH:/home/kullacıadınız/packer/
</code></pre>
<!-- /wp:code -->

  Ayrıca aşağıdaki komutu kullanarak /usr/bin/ klasörüne link koymanızı da tavsiye ediyoruz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cd /usr/bin
sudo ln -s /home/kullanıcıadınız/packer/packer
</code></pre>
<!-- /wp:code -->

  Artık packer kurulumu bitti. Test etmek için komut satırına packer komutunu verin. İşler yolunda gitmişse aşağıdaki çıktıyı alırsınız.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">packer
usage: packer ***[*** --version***]***  ***[*** --help***]***  &lt;command***&gt;***  ***[*** &lt;args&gt;]
Available commands are:
build build image***(*** s***)***  from template
fix fixes templates from old versions of packer
inspect see components of a template
push push a template and supporting files to a Packer build service
validate check that a template is valid
version Prints the Packer version
</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="3-adım-vagrant-kurulum">3. Adım: Vagrant Kurulum
<!-- /wp:heading -->

  Vagrant programı, .deb uzantılı dağıtılmaktadır.&nbsp;<a href="https://www.vagrantup.com/downloads.html">Bu adresten</a>&nbsp;Debian tabanlı kurulum dosyasını bilgisayar mimarinize göre 64 bit – 32 bit olarak seçin ve indirin.
 

  İndirdiğiniz klasöre giderek, komut satırından aşağıdaki komutu verin. Dosya ismi ve sürümü değişiklik gösterebilir. Kendi indirdiğiniz sürümün adını yazın.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dpkg -i vagrant_1.9.4_x86_64.deb 
***(*** Reading database ... 318960 files and directories currently installed.***)*** 
Preparing to unpack vagrant_1.9.4_x86_64.deb ...
Unpacking vagrant ***(*** 1:1.9.4***)***  ...
Setting up vagrant ***(*** 1:1.9.4***)***  ...
</code></pre>
<!-- /wp:code -->

  Vagrant sisteminize kurulacak ve gerekli sistem ayarlarını otomatik olarak yapacaktır.
 

 
<h2 class="wp-block-heading" id="4-adım-vagrant-reload-plugin-kurulum">4. Adım: Vagrant Reload Plugin Kurulum
<!-- /wp:heading -->

  Vagrant sanal işletim sistemi yönetimi esnasında çalışacak scriptlerin her biri, kurulduktan sonra sanal işletim sistemini kapatıp açmak veya resetlemek isteyecektir. Bu işlemleri ve provision işlemlerini yapmayı sağlayan vagrant reload plugin eklentisini kuralım.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">vagrant plugin install vagrant-reload
Installing the 'vagrant-reload' plugin. This can take a few minutes...
Fetching: vagrant-reload-0.0.1.gem ***(*** 100%***)*** 
Installed the plugin 'vagrant-reload (0.0.1)'***!*** 
</code></pre>
<!-- /wp:code -->

  Kurulum başarı ile tamamlanınca size komut satırından sonuç haber verilecektir.
 

 
<h2 class="wp-block-heading" id="5-adım-virtualbox-kurulum">5. Adım: Virtualbox Kurulum
<!-- /wp:heading -->

  Sanallaştırma işlemlerinin kullanacağımız Virtualbox programını ve eklentilerini kuralım.&nbsp;<a href="https://www.virtualbox.org/wiki/Downloads[Bu">https://www.virtualbox.org/wiki/Downloads[Bu</a>&nbsp;adresi] kullanarak linux hosts için gerekli debian paketini ve aynı sayfada bulunan extension pack ilave eklentileri mutlaka indirmelisiniz.
 

  İndirdiğimiz virtualbox.deb paketini sisteminize aşağıdaki komut yardımıyla kurabilirsiniz. İndirdiğiniz sürüm bu yazının hazırlandığı tarihten daha yeni olabilir. Dosya ismini sizin indirdiğiniz sürüm olarak yazmalısınız.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dpkg -i virtualbox-5.1_5.1.8-111374-Ubuntu-xenial_amd64.deb
</code></pre>
<!-- /wp:code -->

  Kurulum talimatlarını tamamladıktan sonra programın Seçenekler bölümünden Extensions Pack kurulumunu da tamamlayın. Detayları ve eklenti paketinin yüklenmesini video anlatımda görebilirsiniz.
 

 
<h2 class="wp-block-heading" id="6-adım-build-script-çalıştırma">6. Adım: Build Script Çalıştırma
<!-- /wp:heading -->

  Artık bütün gereklilikler tamamlandı. Sanal işletim sistemimizin vagrant tarafından box olarak oluşturulması ve Virtualbox içerisine tanıtılması gerekmektedir. Bunun için git merkezinden klonladığımız dosyaların olduğu klasöre gidelim. Aşağıdaki komutlar .iso dosyası indirip gerekli tüm programları kuracakları için oldukça uzun sürecektir. Bu normaldir.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">cd ~/git/metasploitable3/
./build_win2008.sh 
cat: /etc/upstream-release: Is a directory
Compatible version of VirtualBox found.
Compatible version of packer was found.
Correct version of vagrant was found.
Compatible version of vagrant-reload plugin was found.
All requirements found. Proceeding...
Building the Vagrant box...
virtualbox-iso output will be ***in *** this color.

***==&gt;***  virtualbox-iso: Downloading or copying Guest additions
    virtualbox-iso: Downloading or copying: file:///usr/share/virtualbox/VBoxGuestAdditions.iso
***==&gt;***  virtualbox-iso: Downloading or copying ISO
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
    virtualbox-iso ***(*** vagrant***)*** : Compressing: Vagrantfile
    virtualbox-iso ***(*** vagrant***)*** : Compressing: box.ovf
    virtualbox-iso ***(*** vagrant***)*** : Compressing: metadata.json
    virtualbox-iso ***(*** vagrant***)*** : Compressing: packer-virtualbox-iso-1494433445-disk001.vmdk
Build 'virtualbox-iso' finished.

***==&gt;***  Builds finished. The artifacts of successful builds are:
--***&gt;***  virtualbox-iso: 'virtualbox' provider box: windows_2008_r2_virtualbox.box
Box successfully built by Packer.
Attempting to add the box to Vagrant...
***==&gt;***  box: Box file was not detected as metadata. Adding it directly...
***==&gt;***  box: Adding box 'metasploitable3' ***(*** v0***)***  ***for *** provider: 
    box: Unpacking necessary files from: file:///home/umut/git/metasploitable3/windows_2008_r2_virtualbox.box
***==&gt;***  box: Successfully added box 'metasploitable3' ***(*** v0***)***  ***for***  'virtualbox'***!*** 
Box successfully added to Vagrant.
---------------------------------------------------------------------
SUCCESS: Run 'vagrant up' to provision and start metasploitable3.
NOTE: The VM will need Internet access to provision properly.

</code></pre>
<!-- /wp:code -->

 
<h2 class="wp-block-heading" id="7-adım-vagrant-up">7. Adım: Vagrant up
<!-- /wp:heading -->

  Gerekli tüm indirmeler ve inşa faaliyetleri artık tamamlandı. Sanal işletim sistemimiz hazır. Sanal makinemiz hazır. Artık bu Windows server üzerine, içinde zafiyet barındıran uygulamalar yüklenecek ve sanal işletim sistemi Metasploitable3 hazır hale gelecek. Bunun için, github tan klonladığımız klasörün içindeyken son bir komut veriyoruz.
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo vagrant up
***[*** sudo***]***  password ***for *** umut: 
Bringing machine 'default' up with 'virtualbox' provider...
***==&gt;***  default: Importing base box 'metasploitable3'...
***==&gt;***  default: Matching MAC address ***for *** NAT networking...
***==&gt;***  default: Setting the name of the VM: metasploitable3_default_1494436809723_60405
***==&gt;***  default: Clearing any previously set network interfaces...
***==&gt;***  default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
***==&gt;***  default: Forwarding ports...
....
</code></pre>
<!-- /wp:code -->

  Bu işlem, bir defaya mahsus yapılmakta ve oldukça uzun sürmektedir. Sabırla beklemeye devam edin. Tamamlandığında işlemler bitecek ve komut satırına geri gelinecektir.
 

 
<h2 class="wp-block-heading" id="7-adım-son-adımlar">7. Adım: Son adımlar
<!-- /wp:heading -->

  Tüm adımları başarıyla tamamladıysanız artık sanallaştırma yazılımı Virtualbox içerisinden Metasploitable3 sürümünü çalıştırabilirsiniz. Normalde vangrant up komutu ile sanal sistem çalışmaktadır ancak varsayılan olarak headless olarak başlar. Headless başlangıç, görüntü penceresi olmadan başlangıçtır. Ağ, sistem kaynak kullanımı vb. ayarları yapmak için görüntü penceresinde görsel olarak görmek isterseniz, virtualbox ı başlatın ve sanal işletim sistemi üzerinde SHOW – GÖSTER seçeneği ile pencereyi açın.
 

  <em>Kullanıcı adı:</em>&nbsp;vagrant
 

  <em>Parola:</em>&nbsp;vagrant
 

  Virtualbox içerisinde ağ ayarlarını kontrol etmeyi unutmayın. İki adet adaptör bulunuyor. Bir tanesi NAT üzerinden gerçek dünyaya açılıyor, diğer ise “host-only”.
 

  Host-only adaptör kendisine vboxnet1 isimli bir sanal ağ kurar. Siz önceden Host-only vboxnet0 kullanıyor ve Kali İşletim sistemine bu adaptör tanımlıysa, test ve hedef sistemin ikisinin de host-only vboxnet0 ayarında olması gerektiğini hatırlatalım.
 

  TIP: NAT adaptörünü mümkünse iptal etmenizi ve ihtiyacınız yoksa açmamanızı tavsiye ediyorum.
 