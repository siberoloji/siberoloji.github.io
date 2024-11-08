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
date: "2016-04-26T17:31:00Z"
excerpt: Bilişim sistemleri güvenlik, test ve inceleme alanındaki faaliyetler yaygınlaştıkça
  ortaya çıkan ihtiyaçlara göre geliştirilen İşletim Sistemlerinin sayısı da artmaktadır.
  Bir kısım Linux dağıtımı CD/DVD vb. ortamlarda doğrudan çalıştırılabilir olarak,
  Kali Linux ve diğer bir kısmı ise hem çalıştırılabilir ve hem de kurulabilir şekilde
  dağıtılmaktadır.
guid: https://www.siberoloji.com/?p=1081
id: 1081
image: /assets/images/2024/06/cyber4.jpg
tags:
- kali linux
title: Kali Linux Genel Tanıtım
url: /tr/kali-linux-genel-tanitim/
---

  Bilişim sistemleri güvenlik, test ve inceleme alanındaki faaliyetler yaygınlaştıkça ortaya çıkan ihtiyaçlara göre geliştirilen İşletim Sistemlerinin sayısı da artmaktadır. Bir kısım Linux dağıtımı CD/DVD vb. ortamlarda doğrudan çalıştırılabilir olarak, Kali Linux ve diğer bir kısmı ise hem çalıştırılabilir ve hem de kurulabilir şekilde dağıtılmaktadır.</p>
 

  Bu dağıtımların içerisinde kurulu olan hazır programlar ise maksat ve hedeflere göre sınıflandırılabilmektedir. Bir çoğu açık kaynak kodlu olan programların arasında ticari yazılımlar da vardır. Ticari yazılımlar, topluluk sürümlerinde bir kısım özelliklerini ücretsiz kullanıma açmaktadır. Kullanıcı, Pro vb. Sürümü kullanmak isterse, ücretini ödeyerek lisans satın alabilmektedir.</p>
 

  <a href="http://distrowatch.com/" target="_blank" rel="noreferrer noopener">Distrowatch.com</a>&nbsp;sitesinde, Forensics kategorisini ve istatistikleri incelediğimizde popülerlik sıralamasına göre dağıtımların isimlerini aşağıda bulabilirsiniz.</p>
 

  1.&nbsp;Kali Linux&nbsp;(11)<br>2.&nbsp;BackBox Linux&nbsp;(56)<br>3.&nbsp;BlackArch Linux&nbsp;(77)<br>4.&nbsp;CAINE&nbsp;(121)<br>5.&nbsp;DEFT Linux&nbsp;(184)<br>6.&nbsp;Parrot Security OS&nbsp;(228)<br>7.&nbsp;NetSecL OS&nbsp;(242)<br>8.&nbsp;Matriux&nbsp;(0)</p>
 

  Biz bu çalışmamızda, Kali Linux dağıtımını inceleyeceğiz.</p>
 

 
 ## Kali Linux</h2>
<!-- /wp:heading -->

  İlk çıktığında Backtrack adıyla tanınan dağıtım, Ubuntu İşletim Sistemini temel alarak oluşturulmuştur. Backtrack aslında WHAX ve Auditor Security Collection isimli dağıtımların birleşmesiyle ortaya çıkmıştır. Mart 2013 tarihinden itibaren ise Debian temelli ve Kali Linux adıyla dağıtılmaya başlanmıştır.</p>
 

  Debian test sürümünü temel almakta ve güncellemelerini bu sürüme göre yapmaktadır. Armel, armhf, i386 ve x86_64 mimarilerini desteklemektedir. Masaüstü ortamı olarak GNOME kullanan dağıtım kurulduğunda, 600 kadar program kullanıma hazır halde bulunmaktadır.</p>
 

 
 ## Kurulu olarak gelen bazı programlar</h2>
<!-- /wp:heading -->

  Armitage</p>
 

  nmap</p>
 

  Wireshark</p>
 

  John the Ripper</p>
 

  Aircrack-ng</p>
 

  Burp Suite</p>
 

  OWASP ZAP</p>
 

  Metasploit Framework</p>
 

 
 ## Kali Linux Genel Özellikleri</h2>
<!-- /wp:heading -->

  Kullanılan programların kaynak kodlarına git depolarından ulaşmak mümkündür.&nbsp;<a href="http://git.kali.org/gitweb/" target="_blank" rel="noreferrer noopener">http://git.kali.org/gitweb/</a>&nbsp;adresini ziyaret ederek kaynak kodları incelemeniz, hatta kendinize göre yeniden düzenlemeniz de mümkün.</p>
 

  File System Hierarchy FHS standartlarını takip eder. Kullanıcıların diğer dağıtımlardan tanıdıkları dosya sistemi (FHS Standartı) kullanılmaktadır.</p>
 

  İşletim sistemi için geliştirilen yazılımlar, programcıları tarafından dijital olarak imzalanmaktadır.</p>
 

  Kali Linux, özel olarak sistem güvenlik uzmanlarının kullanımı için geliştirilmiştir. Bu sebeple, günlük normal kullanım için bir takım engeller ile karşılaşmak mümkündür.</p>
 

 
 ## Kali Linux, diğer dağıtımlardan farkı ne?</h2>
<!-- /wp:heading -->

  Kullanıcı, root hesabını kullanır.</p>
 

  Ağ servisleri devre dışıdır.</p>
 

  Değiştirilmiş Linux Kernel kullanılmaktadır.</p>
 

  Minimum ve kararlı paketler tercih edilir.</p>
 