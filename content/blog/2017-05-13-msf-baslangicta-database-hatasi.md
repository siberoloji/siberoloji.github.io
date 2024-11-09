---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Metasploit Framework
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2017-05-13T12:39:00Z"
excerpt: 'Metasploit framework yazılımını Kali İşletim sisteminde kullanıyorsanız,
  en son güncellemeden sonra msfconsole başlangıcında aşağıdaki hatayı almaya başlamış
  olabilirsiniz. msfconsole içerisinde veritabanı kulanımı, yaptığınız taramaların
  kayıt edilmesi ve tekrar kullanılmasında oldukça fayda sağlar. '
guid: https://www.siberoloji.com/?p=1143
id: 1143
image: /assets/images/2024/06/metasploit.jpg
tags:
- cybersecurity
- metasploit framework
title: MSF Başlangıçta Database Hatası
url: /tr/msf-baslangicta-database-hatasi/
---

  Metasploit framework yazılımını Kali İşletim sisteminde kullanıyorsanız, en son güncellemeden sonra&nbsp;<code>msfconsole</code>&nbsp;başlangıcında aşağıdaki hatayı almaya başlamış olabilirsiniz. msfconsole içerisinde veritabanı kulanımı, yaptığınız taramaların kayıt edilmesi ve tekrar kullanılmasında oldukça fayda sağlar. Bu hatanın sebebi de en son güncelleme ile Kali içerisine kurulan Postgresql 9.6 sürümüdür. 
 

  ***HATA***  
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">
"Failed to connect to the database: could not connect to server: Connection refused Is the server running on host "localhost" (::1) and accepting TCP/IP connections on port 5432? could not connect to server: Connection refused Is the server running on host "localhost" (127.0.0.1) and accepting TCP/IP connections on port 5432?"
</code></pre>
<!-- /wp:code -->

  Kali OS güncellemeden önce kullanılan Postgresql 9.5 sürümü, gelen istekleri 5432 portundan dinlemekteydi. Postgresql 9.6 ise conf dosyasında yapılan ayarlama ile dinlemeyi varsayılan olarak 5433 portundan yapmaya başladı. Metasploit Framework ise Postgresql ile haberleşmeyi hala 5432 portundan yapmaya çalışıyor. Bu durumu, aşağıdaki adımlarla kontrol edip düzeltelim ve Veri tabanımızı kullanmaya kaldığımız yerden devam edelim. 
 

<!-- wp:list -->
 <!-- wp:list-item -->
- Postgresql Servisi Başlatın: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">service postgresql start
</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Postgresql Dinleme Portu Şu an Ne? 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Aşağıdaki komut yardımı ile şu an Postgresql’in şu an dinlediği Port numarasını görebilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">ss -lntp | grep post
</code></pre>
<!-- /wp:code -->

  Muhtemelen aşağıdaki çıktıya benzer bir sonuç elde edeceksiniz. Dinleme portu olarak 5433 görüyorsanız bir sonraki adıma geçebiliriz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">LISTEN     0      128    127.0.0.1:5433                     ******* :*******                    users:***((*** "postgres",pid***=*** 2732,fd***=*** 6***))*** 
LISTEN     0      128        ::1:5433                    :::*******                    users:***((*** "postgres",pid***=*** 2732,fd***=*** 3***))*** 
</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
 <!-- wp:list-item -->
- Ayarlara Bakalım: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Aşağıdaki komutu kullanarak,&nbsp;<code>/etc/postgresql/9.6/main/postgresql.conf</code>&nbsp;ayar dosyasında hangi port ayarlanmış bakalım. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">grep "port =" /etc/postgresql/9.6/main/postgresql.conf

port ***=***  5433                <em># (change requires restart)</em>
</code></pre>
<!-- /wp:code -->

  Çıktıda 5432 yerine 5433 görüyorsanız problem burada demektir. 
 

<!-- wp:list -->
 <!-- wp:list-item -->
- Portu Değiştirelim: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sed -i 's/\(port = \)5433/\15432/' /etc/postgresql/9.6/main/postgresql.conf
</code></pre>
<!-- /wp:code -->

  Servisi tekrar başlatalım ve ardından&nbsp;<code>msfdb</code>&nbsp;başlangınıcını ayarlayalım. Artık,&nbsp;<code>msfconsole</code>&nbsp;ile Metasploit Framework başladığında Veri tabanına bağlanabilirsiniz. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">service postgresql restart
msfdb reinit</code></pre>
<!-- /wp:code -->