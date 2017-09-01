---
layout: page
title: Sık Sorulan Sorular
permalink: /faq/
excerpt: Bu sayfada, Linux kullanımı ile ilgili sık sık veya nadiren kullandığımız, gerekli olduğunda hemen bulmak istediğimiz komutlar bir araya toplanmaktadır.
---
**SORU:** 

apt sistemlerinde apt-get update, apt-get upgrade ve apt-get dist-upgrade ne işe yarar? Farkı nedir?

**CEVAP:**

[Cevap ilgili blog yazısında](https://siberoloji.github.io/apt-get-update-upgrade-dist-upgrade-farki-nedir/)

---

**SORU:** 

systemd kullanan sistemlerde, işletim sisteminin açılış süresini hangi komutla görebilirim?

**CEVAP:**

```systemd-analyze```

---

**SORU:** 

systemd kullanan sistemlerde, hangi servisin başlangıçta ne kadar sürede başladığını nasıl görebilirim?

**CEVAP:**

```systemd-analyze blame```

---

**SORU:** 

Bir web adresinin IP adresini nasıl bulabilirim?

**CEVAP:**

```resolveip www.example.com```

---

**SORU:** 

Bir Linux sisteminde kimler oturum açmış durumda ve ne yapıyorlar, Nasıl görüntülenir?

**CEVAP:**

```w```

---

**SORU:** 

Dosya adında uzantı olmayan bir dosyanın türünü (jpg,doc,exe,pdf?) nasıl öğrenebiliriz?

**CEVAP:**

```file dosya```

---

**SORU:** 

FreeBSD güncelleme komutları

**CEVAP:**

```freebsd-update fetch```

```freebsd-update install```

---

**SORU:** 

FreeBSD güncellemeyi geri alma komutu

**CEVAP:**

```freebsd-update rollback```

---

**SORU:** 

FreeBSD klavye düzenini değiştirme

**CEVAP:**

```kbdmap```

---

**SORU:** 

FreeBSD klavye düzenini sistem başlangıcında Türkçe yapma

**CEVAP:**

Freebsd klavye kod dosyaları ```/usr/share/syscons/keymaps/``` klasörünün içinde bulunur. İçeriği görmek için ```ls /usr/share/syscons/keymaps/``` komutunu kulanabilirsiniz.

/etc/rc.conf dosyasına aşağıdaki ayarlama satırını ekleyin.
```keymap="/usr/share/syscons/keymaps/tr.iso9.q.kbd"```

---

**SORU:** 

FreeBSD versiyon bilgisi öğrenmek için gerekli komut

**CEVAP:**

```freebsd-version ; uname -a```

---

**SORU:** 

FreeBSD ipfw kurallarını görüntüleme

**CEVAP:**

```ipfw -d list```

---

**SORU:** 

FreeBSD ağ ve ip bilgisini görüntüleme düzenini değiştirme

**CEVAP:**

```ifconfig```

```ifconfig em0 | grep "inet " | awk '{ print $2 }'```

Not: em0 yerine ```ifconfig``` çıktısında yazan ağ kartının adı yazılmalıdır.

---

**SORU:** 

FreeBSD içinde mevcut kullanıcıları listeleme

**CEVAP:**

```cat /etc/passwd | cut -d: -f1 | grep -v \#```

---

**SORU:** 

FreeBSD içinde mevcut kullanıcıların ne yaptıklarını listeleme

**CEVAP:**

```w```

---

**SORU:** 

FreeBSD için apache kurulum komutları

**CEVAP:**

```pkg install apache24```
```sysrc apache24_enable="yes"```
```service apache24 start```

---

**SORU:** 

FreeBSD içinde kurulum yaparken "size mismatch, fetching from remote" hatası alırsanız aşağıdaki komut ile güncelleme yapabilirsiniz?

**CEVAP:**

```pkg update -f```

---

**SORU:** 

FreeBSD içine php ve uyumluluk modüllerinin kurulumu (myslq veya postgresql kurulumu opsiyonel)

**CEVAP:**

```pkg install php71 php71-mysqli php71-xml  php71-gd php71-curl php71-zlib php71-zip php71-hash php71-tokenizer php71-pgsql```

```cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini```

```nano /usr/local/etc/php.ini```

```cgi.fix_pathinfo=0```

```rehash```

```sysrc nginx_enable=yes mysql_enable=yes php_fpm_enable=yes postgresql_enable=yes```

```service mysql-server start```

```service php-fpm start```

```nano /usr/local/etc/php-fpm.d/www.conf```

```;listen = 127.0.0.1:9000``` bu satırın başına ; ekleyelim ve hemen altına aşağıdaki satırı ekleyelim.

```listen = /var/run/php-fpm.sock```

ardından aşağıdaki satırların başındaki ; işaretlerini kaldıralım.

```listen.owner = www```

```listen.group = www```

```listen.mode = 0660```


---

**SORU:** 

Linux içinde komut satırından torrent indirmek için komut

**CEVAP:**

```aria2c file.torrent```
veya
```aria2c http://www.adresi.com/file.torrent```

---

**SORU:** 

SSH üzerinden dosya transferine dair ```scp``` örnekleri

**CEVAP:**

**İki farklı** uzak makinada arasında transfer:

```scp username1@hostname1:/path/to/file username2@hostname2:/path/to/other/file```

**Yerel** makinadan **Uzak** Makinaya transfer:

```scp /path/to/local/file username@hostname:/path/to/remote/file```

**Uzak** Makinadan **Yerel** Makinaya Transfer:

```scp username@hostname:/path/to/remote/file /path/to/local/file```

Uzak Makinadan Yerel Makinaya **Farklı Port** ile transfer:

```scp -P 1234 username@hostname:/path/to/remote/file /path/to/local/file```

---

**SORU:** 

FreeBSD boot mesajlarını görme

**CEVAP:**

```more /var/run/dmesg.boot```

---


**SORU:** 

FreeBSD Boot Configuration dosyası hangisidir?

```/boot/loader.conf```

**CEVAP:**

---

**SORU:** 

FreeBSD Örnek ayar dosyaları nerede bulunur?

**CEVAP:**

```/usr/share/examples/etc/hosts```

---

**SORU:** 

FreeBSD Network ayarlarını yaptıktan sonra ağ ayarlarını tekrar başlatma

**CEVAP:**

```service netif restart```

---

**SORU:** 

FreeBSD içinde ```/etc/rc.conf``` dosyasında default gateway tanımlanmışsa, ```service netif restart``` komutunu ilave olarak hangi komut çalıştırılır?

**CEVAP:**

```service routing restart```

---

**SORU:** 

FreeBSD içinde bir NIC kart nasıl test edilir?

**CEVAP:**

NIC kartının kendisine ping sinyali gönderilir. Cevap alınırsa, diğer NIC kartlarının IP adreslerine ping sinyali gönderilir.

```ping -c5 192.168.1.13```

```ping -c5 192.168.2.27```

---

**SORU:** 

FreeBSD içinde DHCP Server aktif değilse (Bkz.: ```cat /etc/rc.conf```) manual ayar nasıl yapılır.

**CEVAP:**

```/etc/rc.conf``` içine aşağıdaki örneğe benzer şekilde satırlar eklenmelidir.

```ifconfig_dc0="inet 192.168.1.3 netmask 255.255.255.0"```
```ifconfig_dc1="inet 10.0.0.1 netmask 255.255.255.0 media 10baseT/UTP"```

---

**SORU:** 

FreeBSD DNS ayarları yapılmamış ise nasıl yapılır?

**CEVAP:**

```/etc/hosts``` dosyasının içine domain ve IP adrese manual olarak eklenmelidir.

---

**SORU:** 

FreeBSD aktif rotalama tablosunu görme

**CEVAP:**

```netstat -rn```

---

**SORU:** 

FreeBSD içinde dinleme yapan portları görme

**CEVAP:**

```netstat -ln```

---

**SORU:** 

FreeBSD için RAM ve SWAP planlaması nasıl olmalıdır?

**CEVAP:**

RAM miktarı 4GB ve aşağısındaysa, SWAP miktarı RAM miktarnın 2 katı olmalıdır.
RAM miktarı 4GB dan daha büyükse, SWAP miktarı RAM miktarıyla eşit olmalıdır.

---

**SORU:** 

FreeBSD sistem durumunu öğrenmek için kullanılabilecek komutlar nelerdir?

**CEVAP:**

```ps -x```
```systat```
```netstat```

---

**SORU:** 

FreeBSD çalışan prosesleri &CPU sıralı inceleme

**CEVAP:**

```ps ax --no-headings -o user,pid,%cpu,%mem,vsz,sgi_rss,tname,stat,start_time,time,ucmd |sort -nrk 3```

---

**SORU:** 



**CEVAP:**



---
