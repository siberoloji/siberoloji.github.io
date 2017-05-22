---
layout: post
title: Tasksel, Ubuntu ve Debian için Toplu Yükleme Aracı
date: 2016-09-21 13:01:02.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
- Linux Blog
tags:
- tasksel
- tasksel kurulum
author: siberoloji
---
<p>Linux kullanıcılarının yazılım yüklemek için kullandıkları paket yöneticileri vardır. Örneğin, komut satırından apt-get, apt, dnf, pacman araçları veya görsel olarak kullanılabilen Yazılım Yöneticileri. Ayrıca görsel olarak paketlerin yüklenmesini sağlayan synaptic yazılımını da belirtmeden geçmeyelim. Bu yazıda, yazılım yüklemenin tek tek paketler şeklinde değilde, mesela LAMP, Mail Server benzeri gruplanmış paketleri yüklemede kullanılan Tasksel aracından bahsedeceğiz.</p>
<p>Tasksel, Debian ve Ubuntu için geliştirilmiştir. Yüklemek istediğiniz bir grup birbirine bağımlı yazılımı, tek bir paket olarak yüklemenizi sağlar. "Ubuntu Mate Masaüstü yüklemek" dendiğinde, bir çok paketin bir araya gelmesinden oluşan bir sistemden bahsedilmektedir. Görsel masaüstü kullanan sistemler, Yazılım Yönetim araçlarından bu grup halindeki yazılımları tek tıklama ile yükleyebilirler. Ancak, ssh ile bağlandığınız sunucu bilgisayarınıza, PostgreSQL kurmak isterseniz bunu tek tek bağımlılıklarla uğraşmak yerine Tasksel ile yapabilirsiniz.</p>
<h2></h2>
<h2>Tasksel, Debian ve Ubuntu için Kurulum</h2>
<p>Tasksel programını, aşağıdaki komut yardımıyla kolayca kurabiliriz.</p>
<pre class="lang:sh decode:true ">sudo apt-get install tasksel</pre>
<p><img class="alignnone wp-image-16010 size-full" src="{{ site.baseurl }}/assets/tasksel1.gif" alt="tasksel1" width="904" height="282" /></p>
<p>Kurulumdan sonra aşağıdaki komut şablonları, yüklemek istediğiniz grubun kurulmasında ve kaldırılmasında size yardımcı olacaktır.</p>
<pre class="lang:sh decode:true">sudo tasksel install grubun_adı
sudo tasksel remove grubun_adı
sudo tasksel komut_satırı-seçenekleri</pre>
<h2></h2>
<h2>Tasksel Başlatmak İçin</h2>
<pre class="lang:sh decode:true">sudo tasksel</pre>
<p><img class="alignnone wp-image-16009 size-full" src="{{ site.baseurl }}/assets/tasksel2.gif" alt="tasksel2" width="904" height="282" /></p>
<h2></h2>
<h2>Tasksel Kurulabilir Grupların Listesi İçin</h2>
<pre class="lang:sh decode:true ">sudo tasksel --list-tasks</pre>
<h4>Liste Komutunun Çıktısı</h4>
<pre class="lang:sh decode:true">u manual Manual package selection
...
u postgresql-server PostgreSQL database
u samba-server Samba file server
u tomcat-server Tomcat Java server
i ubuntu-desktop Ubuntu desktop
u ubuntu-gnome-desktop Ubuntu GNOME desktop
u ubuntu-mate-cloudtop Ubuntu MATE cloudtop
u ubuntu-mate-core Ubuntu MATE minimal installation
u ubuntu-mate-desktop Ubuntu MATE desktop
u ubuntu-usb Ubuntu desktop USB
u ubuntustudio-audio Audio recording and editing suite
u ubuntustudio-desktop Ubuntu Studio desktop
u ubuntustudio-desktop-core Ubuntu Studio minimal DE installation
u ubuntustudio-font-meta Large selection of font packages
u ubuntustudio-graphics 2D/3D creation and editing suite
u ubuntustudio-photography Photograph touchup and editing suite
u ubuntustudio-publishing Publishing applications
u ubuntustudio-video Video creation and editing suite
u virt-host Virtual Machine host
u xubuntu-core Xubuntu minimal installation
u xubuntu-desktop Xubuntu desktop
u openssh-server OpenSSH server
u server Basic Ubuntu server</pre>
<h2></h2>
<h2>Örnek: LAMP Server Kurulum</h2>
<p>LAMP Server kurmak için, paket yöneticiniz yardımıyla Apache, MySQL ve Php ayrı ayrı kurabileceğiniz gibi aşağıdaki komutla, tek bir grup olarak da kurabilirsiniz.</p>
<pre class="">sudo tasksel install lamp-server</pre>
<p><img class="alignnone wp-image-16008 size-full" src="{{ site.baseurl }}/assets/tasksel3.gif" alt="tasksel3" width="880" height="312" /></p>
<p>Tasksel ile ilgili yardım ve detaylı seçenekler için, her zaman olduğu gibi aşağıdaki man komutunu kullanabilirsiniz.</p>
<pre class="lang:sh decode:true">man tasksel
</pre>
<p>&nbsp;</p>
