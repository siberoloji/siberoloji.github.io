---
draft: false

title:  'Systemd ile Açılışta Başlayan Servisleri Kontrol Etme'
date: '2016-12-22T02:00:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Bilgisayarınızı kullanırken ihtiyacınız olan bir çok programı indirir, yükler ve denersiniz. Bunların bir kısmı yüklü olarak dururken, bir kısmını da beğenmez ve kaldırırsınız. Yüklü olan programların bir kısmını da çok sık\_kullanmazsınız. Örneğin, bilgisayarınıza yüklediğiniz Virtualbox Sanallaştırma yazılımını her zaman kullanmıyor olabilirsiniz. Şunu bilmelisiniz ki, bu tür programlar bilgisayarın açılışında başlatılmak üzere bir takım servisleri çalıştırırlar. " 
 
url:  /tr/systemd-ile-acilista-baslayan-servisleri-kontrol-etme/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - 'linux nasıl'
    - systemd
---
Bilgisayarınızı kullanırken ihtiyacınız olan bir çok programı indirir, yükler ve denersiniz. Bunların bir kısmı yüklü olarak dururken, bir kısmını da beğenmez ve kaldırırsınız. Yüklü olan programların bir kısmını da çok sık kullanmazsınız. Örneğin, bilgisayarınıza yüklediğiniz Virtualbox Sanallaştırma yazılımını her zaman kullanmıyor olabilirsiniz. Şunu bilmelisiniz ki, bu tür programlar bilgisayarın açılışında başlatılmak üzere bir takım servisleri çalıştırırlar. Sisteminizi açtığınızda kullanmayacağınız bu servisler, açılışta otomatik yüklendiklerinden başlangıç süresini arttırırlar. Sistemde arka planda çalıştıkları için kaynak israfına da yol açarlar. Bu yazıda sizlere, systemd , systemd-analyze  ve systemctl  kullanarak bilgisayarınızın açılışında başlamasını istemediğiniz servisleri nasıl iptal edebileceğinizi açıklayacağım.

## Sisteminizde systemd Var mı?

Bu yazıda anlatılanlar, **systemd** sistem yönetim altyapısını kullandığından, bilmiyorsanız öncelikle işletim sisteminizin systemd kullanıp kullanmadığını tespit etmelisiniz. Bunu, aşağıdaki komut ile yapabilirsiniz.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">systemd --version
systemd 229
+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN</pre>
<!-- /wp:preformatted -->
Yukarıdaki örneğe benzer bir çıktı aldıysanız, sisteminizde systemd var demektir. Bu çıktıdan; sürüm numarasının 229 olduğu görebiliriz.

## Sisteminizin Boot Süresi Ne kadar?

Bilgisayarınız açılmaya başladığında arka planda öncelikle kernel, ardından kullanıcı düzeyi servisler yüklenir. Bu sürenin kısaca özetini aşağıdaki komutu kullanarak görebilirsiniz.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">systemd-analyze

Startup finished in 4.891s (kernel) + 38.844s (userspace) = 43.735s</pre>
<!-- /wp:preformatted -->
Yukarıdaki çıktıda görülüyor ki sistem topam **43** saniyede açılmış. Bu sürenin ~4.8 saniyesini kernel yükleme işlemi kullanırken, ~38.8 saniyesi kullanıcı düzeyi uygulamalar için harcanmış. Peki bu uygulamaların hepsini, gerçekten kullanıyor musunuz veya ihtiyacınız var mı? Bunlardan bazıları açılışı geciktirirken aynı zamanda arka planda sistem kaynağı kullanıyor olabilirler.

## Açılış Raporunu Detaylı İnceleme

Bir önceki başlıkta verdiğimiz komut çıktısı, özet raporu verirken, şimdi kullanacağımız komut ise detaylı olarak servis düzeyinde zaman miktarını bize verecektir.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">systemd-analyze blame
         16.351s mysql.service
          9.098s apache2.service
          8.162s NetworkManager-wait-online.service
          5.641s activdevices.service
          5.566s dev-sda1.device
          4.645s NetworkManager.service
          4.074s accounts-daemon.service
          3.413s qemu-kvm.service
          3.234s rsyslog.service
          3.131s arpalert.service
          3.065s speech-dispatcher.service
          2.677s rc-local.service
          2.524s gpu-manager.service
          2.511s console-kit-log-system-start.service
          2.440s ufw.service
          2.430s vboxdrv.service
          2.212s networking.service
          2.107s thermald.service
          1.802s grub-common.service
          1.616s apparmor.service
          1.571s systemd-udevd.service
          1.291s systemd-tmpfiles-setup-dev.service
          1.201s irqbalance.service
          1.068s keyboard-setup.service
          1.058s loadcpufreq.service
          1.025s avahi-daemon.service
           845ms ondemand.service
</pre>
<!-- /wp:preformatted -->
Çıktıyı incelediğimizde, en fazla sürenin 16.351s mysql.service tarafından kullanıldığını görmekteyiz. Bu servis veya listede bulunan diğer servislerden hangilerine sürekli ihtiyaç duymuyorsak, açılışta yüklenmesini iptal edebiliriz. Dikkat etmelisiniz ki, sistemden tamamen kaldırmıyoruz. Sadece başlangıçta yüklenmesini devre dışı bırakıyoruz.

## Açılışta Yüklenen Bir Servisi Devre Dışı Bırakma

Farz edelim ki mysql.service bu servisin açılışta başlamasına ihtiyacımız yok. İstediğimiz zaman kendimiz başlatabiliriz veya ileride tekrar başlangıçta yüklenecekler listesine ekleyebiliriz. Bunun için systemctl  tarafından sağlanan enabled  - disabled  anahtarlarını kullanabiliriz.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo systemctl disable mysql.service

Synchronizing state of mysql.service with SysV init with /lib/systemd/systemd-sysv-install...
Executing /lib/systemd/systemd-sysv-install disable mysql</pre>
<!-- /wp:preformatted -->

<!-- wp:quote -->
<blockquote class="wp-block-quote">
Bazı servisler, doğrudan sistemin kararlılığı ile ilgilidir. Tam olarak ne işe yaradığını araştırmadan, bir servisi iptal etmemenizi tavsiye ediyorum.
</blockquote>
<!-- /wp:quote -->
## Devre Dışı Bırakılan Servisi Başlatma

Sisteminizi kullandığınız esnada, açılış esnasında yüklenmesini iptal ettiğiniz sistemi başlatmak isteyebilirsiniz. Bu durum 2 farklı şekilde ortay çıkabilir.

Bilgisayarınızda çalışırken servisi hemen başlatmak

Yukarıdaki örnekte gördüğümüz mysql.service  servisini hemen kullanmak için başlatmak isteyebilirsiniz. Bu durumda systemctl  tarafından sağlanan start  anahtarını kullanmanız yeterli.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo systemctl start mysql.service</pre>
<!-- /wp:preformatted -->
Servisi tekrar açılış esnasında başlatmak

Önceden iptal ettiğiniz servise çok sık ihtiyaç duymaya başladınız. Üzerinde çalıştığınız proje farklılaştı ve açılışta başlamasını istiyorsunuz. O zaman, aşağıdaki komut örneğindeki yöntemle servisi tekrar başlangıçta yüklenecek şekilde ayarlayabilirsiniz.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo systemctl enable mysql.service

Synchronizing state of mysql.service with SysV init with /lib/systemd/systemd-sysv-install...
Executing /lib/systemd/systemd-sysv-install enable mysql</pre>
<!-- /wp:preformatted -->
## Son Notlar

İptal ettiğiniz servisin adını unutabilirsiniz. İptal ederken kullandığınız sistemin adını tekrar bulmak için, sisteminizde bulunan servislerin listesini ve durumunu aşağıdaki komut yardımıyla görebilirsiniz.
<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo systemctl list-unit-files --type=service

UNIT FILE                                  STATE   
accounts-daemon.service                    enabled 
acpid.service                              disabled
alsa-restore.service                       static  
alsa-state.service                         static  
alsa-utils.service                         masked  
anacron-resume.service                     enabled 
anacron.service                            enabled 
apt-daily.service                          static  
atd.service                                enabled 
auditd.service                             enabled 
autovt@.service                            enabled 
avahi-daemon.service                       disabled
binfmt-support.service                     enabled 
bluetooth.service                          disabled
bootlogd.service                           masked  
bootlogs.service                           masked  
bootmisc.service                           masked  
brltty-udev.service                        static</pre>
<!-- /wp:preformatted -->
Systemd konusunda detaylı bilgi için <a href="https://wiki.archlinux.org/index.php/Systemd" target="_blank" rel="noreferrer noopener">ArchLinux Wiki</a> sayfalarını size tavsiye edebilirim. 
