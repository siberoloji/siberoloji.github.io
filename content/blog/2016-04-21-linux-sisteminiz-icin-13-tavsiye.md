---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Temel Linux
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2016-04-21T16:19:00Z"
excerpt: İlgilenmeniz gereken bir Linux sistemi varsa ve rahatça başınızı yastığa
  koymak istiyorsanız, en azından aşağıda tavsiye ettiğimiz önlemleri almış olmanız
  gerektiğini belirtmek istiyoruz.
guid: https://www.siberoloji.com/?p=1062
id: 1062
image: /assets/images/2024/06/linux1.png
tags:
- linux
title: Linux Sisteminiz İçin 13 Tavsiye
url: /tr/linux-sisteminiz-icin-13-tavsiye/
---

  İlgilenmeniz gereken bir Linux sistemi varsa ve rahatça başınızı yastığa koymak istiyorsanız, en azından aşağıda tavsiye ettiğimiz önlemleri almış olmanız gerektiğini belirtmek istiyoruz. 
 

<!-- wp:heading {"level":1} -->
# 1-Genel bir güvenlik politikanız olsun 
<!-- /wp:heading -->

  Sisteminizin ve kullanıcıların yetki sınırlarının neler olduğu konusunda çok detaylı olmasa da bir güvenlik politikası oluşturmalısınız. Sizin müsaadeniz olmadan yapılamayacaklar, yapılabilecekler veya hangi kullanıcı profilinin sınırının nerede bittiği konusunda kesin sınırlarınız olması oldukça faydalı olacaktır. Linux kullanımında Yetkilendirme işlemi ile uğraşmayıp kesin çözüm “root” yetkisi vermeye başlarsanız uykularınız kaçabilir. 
 

<!-- wp:heading {"level":1} -->
# 2-Fiziksel Sistem Güvenliği 
<!-- /wp:heading -->

  Sisteminizin fiziki olarak güvenlik altına alındığından emin olmalısınız. Sadece kapıyı kilitlemekten bahsetmiyorum. Örneğin, BIOS ayarlarından USB, CD gibi cihazlarla sistemin açılmasını kısıtlamak iyi bir fikirdir. Boot Şifresi de pek kullanılmamasına rağmen BIOS ayarlarını koruma altına almanıza yarar. 
 

<!-- wp:heading {"level":1} -->
# 3-SSH Kullanmaktan çekinmeyin 
<!-- /wp:heading -->

  SSH ile oturum açmak, pub key kullanımını zorunlu kılar. Böyle olunca, Brute Force tarzında şifre kırma saldırılarından mümkün olduğunca korunmuş olursunuz. Ssh kullanımı için bir miktar zaman ayırıp aşina olunca oldukça güvenli olduğunu siz de göreceksiniz. 
 

<!-- wp:heading {"level":1} -->
# 4-Güncelleme işini yarına bırakmayın 
<!-- /wp:heading -->

  Sisteminizi güncellemek için yarını beklemek istiyorsanız, geç kalmış olabilirsiniz. Birkaç satır komut ile yapacağınız işlemi yapmadığınız takdirde oldukça zor bir durumda kalabilirsiniz. Bu akşam, çok sevdiğiniz bir dizi veya maç olabilir. Nedense, veri istismarları da hep böyle zamanlara denk gelir. 
 

<!-- wp:heading {"level":1} -->
# 5-Açık Portlarınız, Evinizin Açık penceresi gibidir 
<!-- /wp:heading -->

  Sisteminizin veri akışı, portlar sayesinde yapılır. Netstat komutu yardımıyla açık portları kontrol etmeniz oldukça faydalıdır. Hangi servisin hangi portu kullandığına bir süre sonra aşina olursunuz ve gariplikler gözünüze hemen çarpar. Unutmayın, saldırganlar sisteminize girip 5 dakikada işlerini halledip çıkmak için girmezler. Genelde, kendilerine yetki alıp sık sık ziyaret etmeye başlarlar. Tespit etmeniz için portlar oldukça faydalı bilgiler verirler. Bir atasözümüzü burada belirtelim. “TİLKİ GEÇER, YOL OLUR”. Tilkinin hiç geçmemesi gerekli, bunu unutmayın. 
 

<!-- wp:heading {"level":1} -->
# 6-ROOT oturum açmayı unutun 
<!-- /wp:heading -->

  Bazen işin en hızlısını yapmak isteyebilirsiniz. Root olarak oturum açmak da çok cazip geliyor olabilir. Tekrar düşünmelisiniz. 
 

<!-- wp:heading {"level":1} -->
# 7-Sistem log dosyaları ne işe yarar? 
<!-- /wp:heading -->

  Linux sisteminizde bulunan log dosyaları, yönetici ve kullanıcıların okuması ve incelemesi için üretilir. Sağlıklı bir Linux, rahatsızlık duyduğu konularda size log dosyaları ile haber verir. Mutlaka kayıtları kontrol etmeyi öğrenin ve boş vermeyin. 
 

<!-- wp:heading {"level":1} -->
# 8-Yedekleme 
<!-- /wp:heading -->

  Çok klasik bir tavsiye olacak ancak yine de söylemekten zarar gelmez. Yedekleme çok önemlidir. Sisteminizi yedekleyin. Yedekleme konusunda bir tavsiye de parola korumasıdır. Yedek dosyalarınızı parola koruması ile saklayın. Korunmamış yedekleme dosyaları büyük zafiyet meydana getirebilir. 
 

<!-- wp:heading {"level":1} -->
# 9-IPv6 kullanıyor musunuz? 
<!-- /wp:heading -->

  Mevcut durumda IPv6 kullanmıyorsanız kapatın. Kullanmadığınız bir şeyin sisteminizde açık durmasına gerek yoktur. Bazı dağıtımlarda varsayılan olarak açık halde gelen IPv6 kapatılmadığı takdirde, kötü niyetli kişiler zararlı paketleri IPv6 üzerinden gönderirler. Sistem yöneticileri de genelde IPv6 yı takip etmezler. 
 

<!-- wp:heading {"level":1} -->
# 10-SSH Banner kullanabilirsiniz. 
<!-- /wp:heading -->

  Sisteminize ssh ile bağlanan kullanıcılara ufak ikazları, önemli duyuruları ssh banner kullanarak haber verebilirsiniz. Hatta kullanıcı farkındalığı oluşturmak için oldukça iyi bir yöntemdir. 
 

<!-- wp:heading {"level":1} -->
# 11-Gereksiz servisler kapatılmalıdır. 
<!-- /wp:heading -->

  Bu konuda fazla söze gerek yok. Bir çok program yükleyip denersiniz. Sonra kaldırmaz veya durdurmazsınız. Gereksiz olanları kapatın. Mesela Bluetooth? 
 

<!-- wp:heading {"level":1} -->
# 12-SELinux 
<!-- /wp:heading -->

  Güvenlik politikalarınız için SELinux kullanmanızı tavsiye ediyoruz. Bazı dağıtımlarda apparmor kullanılıyor ancak varsayılan olarak permessive modunda. Bu konuda araştırma yapıp bilgi sahibi olmalısınız. 
 

<!-- wp:heading {"level":1} -->
# 13-Az Program, Az Zafiyet 
<!-- /wp:heading -->

  Sisteminizde ihtiyaç duymadığınız programları kaldırmak oldukça etkili bir yaklaşımdır. Bazı programları ayda bir defa bile kullanmadığınız halde sisteminizde kurulu olarak tutmaya gerek yoktur. Kullanmak gerektiğinde bir-iki komut ile basit bir şekilde kurup çalıştırmak mümkündür. Ne kadar az program yüklüyse o kadar az zafiyet barındırırsınız. 
 

  Tüm bunları hayata geçirdiyseniz, iyi uykular. 
 