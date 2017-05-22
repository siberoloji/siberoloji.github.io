---
layout: post
title: Terminix, Bir Çok Terminal Penceresi Bir Arada
date: 2016-10-07 12:40:01.000000000 +03:00
type: post
published: true
status: publish
categories:
- Linux
tags:
- terminix
- terminix kurulum
- terminix terminal
author: siberoloji
---
<p>Terminal kullanmayı seviyorsanız ve özellikle birden çok terminal ile işlemlerinizi yapıyorsanız Terminix terminal programını deneyebilirsiniz. Açtığınız pencereleri, ekranı dikey ve yatay şekilde bölerek yerleştirebildiğiniz terminix programına bir kısayol tuşu atayarak, Quake benzeri kullanıma da sahip olabilirsiniz.</p>
<h2>Terminix programının genel özellikleri</h2>
<ul>
<li>Terminal pencerelerini dikey ve yatay olarak yerleştirebilme.</li>
<li>Sürükle bırak yardımıyla pencere yerlerini değiştirebilme</li>
<li>Fare yardımıyla bir pencereyi ana pencereden ayırma</li>
<li>Bir terminalde yazılan komutun diğerlerinde de tekrar kullanılabilme imkanı</li>
<li>Pencere tasarımını kaydederek sonradan tekrar yükleyebilme</li>
<li>Transparan arka plan rengi ayarlayabilme</li>
<li>Terminal penceresi aktif olmasa da işlem tamamlandı uyarısı alabilme</li>
<li>Farklı renk şemalarıyla pencere tasarımı kaydedebilme</li>
</ul>
<p><img class="alignnone wp-image-16116 size-large" src="{{ site.baseurl }}/assets/3pencereliterminix-1024x576.png" alt="3pencereliterminix" width="1000" height="563" /></p>
<p><img class="alignnone wp-image-16117 size-large" src="{{ site.baseurl }}/assets/4pencereliterminix-1024x576.png" alt="4pencereliterminix" width="1000" height="563" /></p>
<h2>Terminix Kurulum</h2>
<h3>Gereklilikler</h3>
<ul>
<li>GTK 3.14 ve üzeri</li>
<li>GTK VTE 0.42 ve üzeri</li>
<li>Dconf</li>
<li>GSettings</li>
<li>Nautilus-Python for Nautilus</li>
</ul>
<h3>RHEL/CentOS 7 and Fedora 22-24</h3>
<p>Öncelikle /etc/yum.repos.d/ klasörünün içerisine terminix.repo isimli yeni bir dosya oluşturup içerisine aşağıda bulunan kodları yapıştırarak kayıt etmelisiniz. Not: (kaydederek çıkmak için :wq kullanılır.)</p>
<pre class="lang:sh decode:true">vi /etc/yum.repos.d/terminix.repo</pre>
<pre class="lang:sh decode:true " title="terminix.repo dosyasının içerisine kopyalanacak">[heikoada-terminix]
name=Copr repo for terminix owned by heikoada
baseurl=https://copr-be.cloud.fedoraproject.org/results/heikoada/terminix/fedora-$releasever-$basearch/
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/heikoada/terminix/pubkey.gpg
enabled=1
enabled_metadata=1</pre>
<p>Kaydedip kapatın (:wq &lt;enter&gt;) ve daha sonra kurulumu aşağıdaki komutlarla yapın.</p>
<pre class="">---------------- <strong>RHEL/CentOS 7</strong> ---------------- 
# yum update
# yum install terminix
---------------- <strong>Fedora 22-24</strong> ---------------- 
# dnf update
# dnf install terminix</pre>
<h3>Ubuntu 16.04-14.04 ve Linux Mint 18-17</h3>
<p>Terminix, Debian ve Ubuntu resmi paket depolarında bulunmamaktadır. Bu sebeple github sayfasından sıkıştırılmış dosyayı indirerek kurabiliriz.</p>
<pre class="">cd
wget -c https://github.com/gnunn1/terminix/releases/download/1.1.1/terminix.zip
sudo unzip terminix.zip -d / 
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
</pre>
<h3>OpenSUSE</h3>
<p>OpunSUSE kullanıcıları resmi paket depolarında Terminix bulunduğundan doğrudan kurulum yapabilirler.</p>
<h3>ArcLinux</h3>
<p>Arc Linux kullanıcıları https://aur.archlinux.org/packages/terminix adresinde bulunan paketleri kullanarak Terminix kurabilirler.</p>
<pre class="lang:sh decode:true ">pacman -S terminix</pre>
<h2>Terminix Kaldırmak</h2>
<p>Aşağıdaki komutları, metin editörüyle oluşturacağınız uninstall.sh isimli dosyaya kaydedin ve kapatın.</p>
<pre class="lang:sh decode:true" title="uninstall.sh isimli dosya içeriği">#!/usr/bin/env sh

if [ -z  "$1" ]; then
    export PREFIX=/usr
    # Make sure only root can run our script
    if [ "$(id -u)" != "0" ]; then
        echo "This script must be run as root" 1&gt;&amp;2
        exit 1
    fi
else
    export PREFIX=$1
fi

echo "Uninstalling from prefix ${PREFIX}"

rm ${PREFIX}/bin/terminix
rm ${PREFIX}/share/glib-2.0/schemas/com.gexperts.Terminix.gschema.xml
glib-compile-schemas ${PREFIX}/share/glib-2.0/schemas/
rm -rf ${PREFIX}/share/terminix

find ${PREFIX}/share/locale -type f -name "terminix.mo" -delete
find ${PREFIX}/share/icons/hicolor -type f -name "com.gexperts.Terminix.png" -delete
find ${PREFIX}/share/icons/hicolor -type f -name "com.gexperts.Terminix*.svg" -delete
rm ${PREFIX}/share/nautilus-python/extensions/open-terminix.py
rm ${PREFIX}/share/dbus-1/services/com.gexperts.Terminix.service
rm ${PREFIX}/share/applications/com.gexperts.Terminix.desktop
rm ${PREFIX}/share/metainfo/com.gexperts.Terminix.appdata.xml</pre>
<p>Oluşturduğunuz uninstall.sh isimli dosyayı çalıştırılabilir hale getirin ve kaldırma işlemini tamamlayın.</p>
<pre class="">chmod +x uninstall.sh
sudo sh uninstall.sh</pre>
<p>&nbsp;</p>
