---
layout: post
title: Systemd ile Açılışta Başlayan Servisleri Kontrol Etme
date: 2016-12-22 22:23:48.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
- Nasıl
tags:
- systemctl
- systemd
- systemd açılış servisleri
- systemd başlangıç servisleri
- systemd-analyze
- systemd-analyze blame
author: siberoloji
---
<p>Bilgisayarınızı kullanırken ihtiyacınız olan bir çok programı indirir, yükler ve denersiniz. Bunların bir kısmı yüklü olarak dururken, bir kısmını da beğenmez ve kaldırırsınız. Yüklü olan programların bir kısmını da çok sık kullanmazsınız. Örneğin, bilgisayarınıza yüklediğiniz Virtualbox Sanallaştırma yazılımını her zaman kullanmıyor olabilirsiniz. Şunu bilmelisiniz ki, bu tür programlar bilgisayarın açılışında başlatılmak üzere bir takım servisleri çalıştırırlar. Sisteminizi açtığınızda kullanmayacağınız bu servisler, açılışta otomatik yüklendiklerinden başlangıç süresini arttırırlar. Sistemde arka planda çalıştıkları için kaynak israfına da yol açarlar. Bu yazıda sizlere, <span class="lang:sh decode:true crayon-inline ">systemd</span> , <span class="lang:sh decode:true crayon-inline ">systemd-analyze</span>  ve <span class="lang:sh decode:true crayon-inline ">systemctl</span>  kullanarak bilgisayarınızın açılışında başlamasını istemediğiniz servisleri nasıl iptal edebileceğinizi açıklayacağım.</p>
<h2>Sisteminizde systemd Var mı?</h2>
<p>Bu yazıda anlatılanlar, <strong>systemd</strong> sistem yönetim altyapısını kullandığından, bilmiyorsanız öncelikle işletim sisteminizin systemd kullanıp kullanmadığını tespit etmelisiniz. Bunu, aşağıdaki komut ile yapabilirsiniz.</p>
<pre class="lang:sh decode:true">systemd --version
systemd 229
+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN</pre>
<p>Yukarıdaki örneğe benzer bir çıktı aldıysanız, sisteminizde systemd var demektir. Bu çıktıdan; sürüm numarasının 229 olduğu görebiliriz.</p>
<h2>Sisteminizin Boot Süresi Ne kadar?</h2>
<p>Bilgisayarınız açılmaya başladığında arka planda öncelikle kernel, ardından kullanıcı düzeyi servisler yüklenir. Bu sürenin kısaca özetini aşağıdaki komutu kullanarak görebilirsiniz.</p>
<pre class="lang:sh decode:true">systemd-analyze

Startup finished in 4.891s (kernel) + 38.844s (userspace) = 43.735s</pre>
<p>Yukarıdaki çıktıda görülüyor ki sistem topam <strong>43</strong> saniyede açılmış. Bu sürenin ~4.8 saniyesini kernel yükleme işlemi kullanırken, ~38.8 saniyesi kullanıcı düzeyi uygulamalar için harcanmış. Peki bu uygulamaların hepsini, gerçekten kullanıyor musunuz veya ihtiyacınız var mı? Bunlardan bazıları açılışı geciktirirken aynı zamanda arka planda sistem kaynağı kullanıyor olabilirler.</p>
<h2>Açılış Raporunu Detaylı İnceleme</h2>
<p>Bir önceki başlıkta verdiğimiz komut çıktısı, özet raporu verirken, şimdi kullanacağımız komut ise detaylı olarak servis düzeyinde zaman miktarını bize verecektir.</p>
<pre class="lang:sh decode:true">systemd-analyze blame
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
<p>Çıktıyı incelediğimizde, en fazla sürenin <span class="lang:sh decode:true crayon-inline">16.351s mysql.service</span> tarafından kullanıldığını görmekteyiz. Bu servis veya listede bulunan diğer servislerden hangilerine sürekli ihtiyaç duymuyorsak, açılışta yüklenmesini iptal edebiliriz. Dikkat etmelisiniz ki, sistemden tamamen kaldırmıyoruz. Sadece başlangıçta yüklenmesini devre dışı bırakıyoruz.</p>
<h2>Açılışta Yüklenen Bir Servisi Devre Dışı Bırakma</h2>
<p>Farz edelim ki <span class="lang:sh decode:true crayon-inline">mysql.service</span> bu servisin açılışta başlamasına ihtiyacımız yok. İstediğimiz zaman kendimiz başlatabiliriz veya ileride tekrar başlangıçta yüklenecekler listesine ekleyebiliriz. Bunun için <span class="lang:sh decode:true crayon-inline">systemctl</span>  tarafından sağlanan <span class="lang:sh decode:true crayon-inline">enabled</span>  - <span class="lang:sh decode:true crayon-inline ">disabled</span>  anahtarlarını kullanabiliriz.</p>
<pre class="lang:sh decode:true">sudo systemctl disable mysql.service

Synchronizing state of mysql.service with SysV init with /lib/systemd/systemd-sysv-install...
Executing /lib/systemd/systemd-sysv-install disable mysql</pre>
<blockquote><p>Bazı servisler, doğrudan sistemin kararlılığı ile ilgilidir. Tam olarak ne işe yaradığını araştırmadan, bir servisi iptal etmemenizi tavsiye ediyorum.</p></blockquote>
<h2>Devre Dışı Bırakılan Servisi Başlatma</h2>
<p>Sisteminizi kullandığınız esnada, açılış esnasında yüklenmesini iptal ettiğiniz sistemi başlatmak isteyebilirsiniz. Bu durum 2 farklı şekilde ortay çıkabilir.</p>
<h3>Bilgisayarınızda çalışırken servisi hemen başlatmak</h3>
<p>Yukarıdaki örnekte gördüğümüz <span class="lang:sh decode:true crayon-inline ">mysql.service</span>  servisini hemen kullanmak için başlatmak isteyebilirsiniz. Bu durumda <span class="lang:sh decode:true crayon-inline ">systemctl</span>  tarafından sağlanan <span class="lang:sh decode:true crayon-inline ">start</span>  anahtarını kullanmanız yeterli.</p>
<pre class="lang:sh decode:true">sudo systemctl start mysql.service</pre>
<h3>Servisi tekrar açılış esnasında başlatmak</h3>
<p>Önceden iptal ettiğiniz servise çok sık ihtiyaç duymaya başladınız. Üzerinde çalıştığınız proje farklılaştı ve açılışta başlamasını istiyorsunuz. O zaman, aşağıdaki komut örneğindeki yöntemle servisi tekrar başlangıçta yüklenecek şekilde ayarlayabilirsiniz.</p>
<pre class="lang:sh decode:true">sudo systemctl enable mysql.service

Synchronizing state of mysql.service with SysV init with /lib/systemd/systemd-sysv-install...
Executing /lib/systemd/systemd-sysv-install enable mysql</pre>
<h2>Son Notlar</h2>
<p>İptal ettiğiniz servisin adını unutabilirsiniz. İptal ederken kullandığınız sistemin adını tekrar bulmak için, sisteminizde bulunan servislerin listesini ve durumunu aşağıdaki komut yardımıyla görebilirsiniz.</p>
<pre class="lang:sh decode:true">sudo systemctl list-unit-files --type=service

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
<p>Systemd konusunda detaylı bilgi için <a href="https://wiki.archlinux.org/index.php/Systemd" target="_blank">ArchLinux Wiki</a> sayfalarını size tavsiye edebilirim. Yazılar hakkında görüşlerinizi her zaman bekliyoruz.</p>
