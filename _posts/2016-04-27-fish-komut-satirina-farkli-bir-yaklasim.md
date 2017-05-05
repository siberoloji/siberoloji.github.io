---
layout: post
title: Fish - Komut Satırına Farklı Bir Yaklaşım
date: 2016-04-27 00:31:55.000000000 +03:00
type: post
img: linux-howto.jpg
published: true
status: publish
categories:
- Araştırma
- Linux
- Nasıl
tags:
- fish command line
- fish komut satırı
- fish shell
- fish terminal

---
<p>Linux denildiğinde herhalde ilk akla gelen konulardan bir tanesi de komut satırı ve terminaldir. Komut satırında yazdığınız ifadeleri işleyen kabuk (shell) ise farklı sürümleriyle kullanıcılara sunulur. Bash, Dash, Zsh, Csh bunlara örnek olarak verilebilir. Bu yazımızda size Fish kabuk programının kurulumunu açıklayacağız.</p>
<p>Fish, kullanıcı dostu olarak bilinen bir kabuk programıdır. Komut tamamlama, komut içerisinde farklı formları farklı renklendirme özelliklerine sahiptir. Komut yazımı esnasında çeşitli tavsiyeler sunar ve bunları, o an bulunduğunuz klasörü de dikkate alarak yapar. Önerileri yön tuşlarıyla kolayca seçebilirsiniz. Yardım komutlarını otomatik olarak web tarayıcıda açması da kullanım kolaylığı açısında vurgulanması gereken özelliklerinden birisidir.</p>
<h2>Debian için Fish Kurulum:</h2>
<pre class="lang:sh decode:true">---------------- Debian 8 ----------------
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' &gt;&gt; /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish

---------------- Debian 7 ----------------
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_7.0/ /' &gt;&gt; /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish</pre>
<h2>Ubuntu için Fish Kurulum:</h2>
<pre class="lang:sh decode:true ">---------------- Ubuntu ----------------
sudo add-apt-repository ppa:fish-shell/nightly-master
sudo apt-get update
sudo apt-get install python-software-properties
sudo apt-get update
sudo apt-get install fish

</pre>
<h2>Fedora için Fish Kurulum:</h2>
<pre class="lang:sh decode:true">---------------- Fedora 22 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_22/shells:fish:release:2.repo
yum install fish

---------------- Fedora 21 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_21/shells:fish:release:2.repo
yum install fish

---------------- Fedora 20 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_20/shells:fish:release:2.repo
yum install fish</pre>
<h2>CentOS için Fish Kurulum:</h2>
<pre class="lang:sh decode:true">---------------- CentOS 7 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
yum install fish

---------------- CentOS 6 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_6/shells:fish:release:2.repo
yum install fish</pre>
<h2>RHEL için Fish Kurulum:</h2>
<pre class="lang:sh decode:true">---------------- RHEL 7 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/RHEL_7/shells:fish:release:2.repo
yum install fish

---------------- RHEL 6 ----------------
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/RedHat_RHEL-6/shells:fish:release:2.repo
yum install fish</pre>
<p><strong>Başlatmak için</strong></p>
<pre class="lang:sh decode:true ">fish</pre>
<p>Denemenizi tavsiye ediyorum. Fish, Komut satırına farklı bir yaklaşım getiriyor. Ayrıntılı kullanım dokümanlarını programın <a href="http://fishshell.com/" target="_blank">adresinde</a> bulabilirsiniz.</p>
<p>[images_grid type="carousel" auto_slide="no" auto_duration="1" cols="three" lightbox="yes" source="media: 15601,15600,15599"][/images_grid]</p>
