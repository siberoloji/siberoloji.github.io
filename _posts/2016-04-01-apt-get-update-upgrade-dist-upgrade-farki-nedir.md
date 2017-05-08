---
layout: post
title: apt-get update / upgrade / dist-upgrade farkı nedir?
date: 2016-04-01 08:41:24.000000000 +03:00
type: post
img: cyber2.jpg
published: true
status: publish
categories:
- Araştırma
- Linux
tags:
- apt-get dist-upgrade
- apt-get update
- apt-get update upgrade farkı nedir?
- apt-get upgrade

---

Ubuntu veya apt paket yöneticisi kullanan bir İşletim Sisteminiz varsa,<em> apt-get update</em> ve benzeri komutları mutlaka kullanmışsınızdır. <em>apt-get update</em>, <em>apt-get upgrade</em> ve <em>apt-get dist-upgrade</em> komutlarının birbirine benzemesine rağmen farklı görevleri olduğunu göstereceğiz.</span></p>
<p><span style="font-weight: 400;">Öncelikle, Linux sistemimizin kendisini güncellemek için bir merkeze bakıp, kontrol yapmaya ihtiyacı vardır. Bu listelerin bakılacağı yerler </span><span style="font-weight: 400; font-family: 'courier new', courier, monospace;">/etc/apt/sources.list</span><span style="font-weight: 400;"> dosyasında tutulur. Kısaca hangi paket depolarına bakılacağı buraya kaydedilir. apt-get update komutu ile burada yer alan paket depolarına bakılır.</span></p>
<p><span style="font-weight: 400;">Sisteminizin, paketlerini güncellemek amacıyla hangi paket depolarını kullandığını görmek için aşağıdaki komutu çalıştıralım.</span></p>
<pre class="lang:default decode:true"># Komut
cat /etc/apt/sources.list

# Çıktı

# deb cdrom:[Xubuntu 14.04.2 LTS _Trusty Tahr_ - Release amd64 (20150218.1)]/ trusty main multiverse restricted universe
# deb cdrom:[Xubuntu 14.04.2 LTS _Trusty Tahr_ - Release amd64 (20150218.1)]/ trusty main multiverse restricted universe

# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.
deb http://tr.archive.ubuntu.com/ubuntu/ trusty main restricted
deb-src http://tr.archive.ubuntu.com/ubuntu/ trusty main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://tr.archive.ubuntu.com/ubuntu/ trusty-updates main restricted
deb-src http://tr.archive.ubuntu.com/ubuntu/ trusty-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://tr.archive.ubuntu.com/ubuntu/ trusty universe
deb-src http://tr.archive.ubuntu.com/ubuntu/ trusty universe
deb http://tr.archive.ubuntu.com/ubuntu/ trusty-updates universe
deb-src http://tr.archive.ubuntu.com/ubuntu/ trusty-updates universe
</pre>
<h1><span style="font-weight: 400;">apt-get update</span></h1>
<p><span style="font-weight: 400;">apt-get update komutu sayesinde sisteminizde kurulu olan paketlerin, paket deposundaki versiyonları ile farkları araştırılır ve liste güncellenir. Aslında tek yapılan liste güncellemedir. Herhangi bir güncelleme işleminden önce çalıştırılması mutlaka tavsiye edilir çünkü sisteminizde gerekli güncelleme ve bağımlılıkların çözümü için gerekli bir işlemdir. </span></p>
<blockquote><p><em><span style="font-weight: 400;">apt-get update</span><span style="font-weight: 400;"> komutu ile sisteminize herhangi bir kurulum yapılmaz.</span></em></p></blockquote>
<pre class="lang:default decode:true "># Komut
sudo apt-get update

# Çıktı
      
Get:4 http://mega.nz ./ Release [967 B]                                                   
Hit http://tr.archive.ubuntu.com trusty-updates/restricted i386 Packages       
Get:10 http://security.ubuntu.com trusty-security/main amd64 Packages [344 kB] 
Hit http://tr.archive.ubuntu.com trusty-updates/universe i386 Packages         
Hit http://ppa.launchpad.net trusty Release.gpg                                
Hit http://linux.dropbox.com trusty Release                                    
Hit http://tr.archive.ubuntu.com trusty-updates/multiverse i386 Packages       
Hit http://tr.archive.ubuntu.com trusty-updates/main Translation-en            
Hit http://ppa.launchpad.net trusty Release.gpg                                
Hit http://tr.archive.ubuntu.com trusty-updates/multiverse Translation-en      
Hit http://tr.archive.ubuntu.com trusty-updates/restricted Translation-en      
Hit http://tr.archive.ubuntu.com trusty-updates/universe Translation-en        
Hit http://ppa.launchpad.net trusty Release                                    
Hit http://tr.archive.ubuntu.com trusty-backports/main Sources                 
Hit http://tr.archive.ubuntu.com trusty-backports/restricted Sources           
Hit http://tr.archive.ubuntu.com trusty-backports/universe Sources             
Hit http://ppa.launchpad.net trusty Release                                    
Ign http://extras.ubuntu.com trusty/main Translation-en_US                     
Hit http://tr.archive.ubuntu.com trusty-backports/multiverse Sources           
Get:11 http://security.ubuntu.com trusty-security/restricted amd64 Packages [8.875 B]
Hit http://tr.archive.ubuntu.com trusty-backports/main amd64 Packages          
Hit http://tr.archive.ubuntu.com trusty-backports/restricted amd64 Packages    
Hit http://ppa.launchpad.net trusty Release                                    
Hit http://tr.archive.ubuntu.com trusty-backports/universe amd64 Packages      
Ign http://extras.ubuntu.com trusty/main Translation-en                        
Get:12 http://security.ubuntu.com trusty-security/universe amd64 Packages [117 kB]
Hit http://tr.archive.ubuntu.com trusty-backports/multiverse amd64 Packages    
Hit http://ppa.launchpad.net trusty Release                                    
Hit http://linux.dropbox.com trusty/main amd64 Packages                        
Hit http://tr.archive.ubuntu.com trusty-backports/main i386 Packages           
Hit http://tr.archive.ubuntu.com trusty-backports/restricted i386 Packages     
Get:13 http://security.ubuntu.com trusty-security/multiverse amd64 Packages [3.691 B]

Fetched 1.130 kB in 4s (237 kB/s)
Reading package lists... Done
</pre>
<h1><span style="font-weight: 400;">apt-get upgrade</span></h1>
<p><span style="font-weight: 400;">Sisteminizde kurulu olan paketlerin hepsini, apt-get update komutu ile güncellediğiniz listede bulunan en son sürüme yükseltir. Burada dikkat edilmesi gereken nokta <strong>KURULU</strong> olan paketler üzerinde güncelleme işlemi yapıldığıdır. A.lib dosyasının 1.1 sürümünü 1.2 sürümüne günceller. Sadece kurulu olan paketleri en güncel hale getirir.</span></p>
<p><span style="font-weight: 400;">Bir takım yazılım geliştiriciler veya sistem yöneticileri ihtiyaçları olmayan paket veya kernel dosyalarını, sistemlerinin kararlılığını düşünerek yüklemek istemezler. Böyle bir durumda upgrade oldukça kullanışlıdır. Yalnızca mevcut paketler en yeni sürüme yükseltilmiş olur. Önemli bir nokta da, sistemden hiçbir paketin silinmediğidir. </span>Yalnızca mevcut paketler en yeni sürüme yükseltilmiş olur.</p>
<pre class="lang:default decode:true"># Komut
sudo apt-get upgrade

# Çıktı

Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.</pre>
<h1><span style="font-weight: 400;">apt-get dist-upgrade</span></h1>
<p><span style="font-weight: 400;">Bu komut için, apt sistemindeki en fazla yetkiye sahip komut diyebiliriz. Mevcut paketleri günceller, sistemde olmayan yeni bağımlılıkları kurar, gerek kalmayanları siler. Bağımlılık problemlerinin çözümü ve sisteminizin en güncel kernel sürümüne yükseltilmesi için kullanılabilir. Tercih kullanıcınındır. Bir kısım kullanıcılar, yüklenen yeni kernel sürümü ile problem yaşayabilirler.</span></p>
<pre class="lang:default decode:true "># Komut
sudo apt-get dist-upgrade

# Çıktı

Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.</pre>
<p><span style="font-weight: 400;">apt-get dist-upgrade komutu ile sistem sürümü yeni bir dağıtıma yükseltilmez. Örneğin, 14.04 sürümünden 14.10'a geçmiş olmazsınız. </span></p>
<pre class="lang:default decode:true " title="Tek satır komut severler için.">sudo apt-get update &amp;&amp; sudo apt-get -y upgrade

# veya

sudo apt-get update &amp;&amp; sudo apt-get -y upgrade &amp;&amp; sudo apt-get dist-upgrade</pre>
