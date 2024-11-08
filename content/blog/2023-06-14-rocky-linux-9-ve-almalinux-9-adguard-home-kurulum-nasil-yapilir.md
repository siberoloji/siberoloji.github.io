---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "2"
categories:
- Linux Nasıl Yapılır
date: "2023-06-14T19:07:07Z"
excerpt: 'AdGuard Home, ağınıza gelen trafikte bulunan reklam ve takipçi kodları engellemeyi
  hedefleyen açık kaynak kodlu DNS sunucu yazılımıdır. '
guid: https://www.siberoloji.com/?p=376
id: 376
image: /assets/images/2023/06/adguard.webp
tags:
- adguard
- dns
- linux nasıl
title: Rocky Linux 9 ve AlmaLinux 9 AdGuard Home Kurulum Nasıl Yapılır?
url: /tr/rocky-linux-9-ve-almalinux-9-adguard-home-kurulum-nasil-yapilir/
---

  AdGuard Home, ağınıza gelen trafikte bulunan reklam ve takipçi kodları engellemeyi hedefleyen açık kaynak kodlu DNS sunucu yazılımıdır. Ev veya küçük ofisinizde bulunan bir sunucuya kurarak tüm ağınızda reklam engelleme yapabilirsiniz. 
 

  Bu yazımızda, Rocky Linux 9 ve AlmaLinux 9 sürümünü kullanan sunucumuza Adguard Home kurulumunu paylaşacağız.  
 

  Aşağıdaki adımları komut satırınızda sırayla uygulamalısınız. 
 

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Sistem paketlerini güncelleyelim.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo dnf clean all &amp;&amp; sudo dnf update
sudo dnf groupinstall "Development Tools"</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>AdGuard paketlerini GitHub üzerinden indirip kuralım</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li>Firewall için gerekli izinleri açalım.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">sudo firewall-cmd --add-service={dns,http,https} --permanent
sudo firewall-cmd --add-port=3000/tcp --permanent
sudo firewall-cmd --reload</code></pre>
<!-- /wp:code -->

  Adguard uygulası sunucuya kuruldu. Son ayarları yapmak ve kullanıcı oluşturmak için http://localhost:3000 veya http://sunucuipadresi:3000 adresini web tarayıcıda ziyaret etmelisiniz. 
 

  Son olarak kurulum yaptığınız sunucunun IP adresini, Router cihazınızın içinde bulunan DNS IP adresleri bölümüne girebilirsiniz. Bu sayede tüm trafiği size ait bir DNS sunucu üzerinden filtrelenerek içeri girecektir. 
 

   
 