---
draft: false

title:  'Kali Linux Genel Tanıtım'
date: '2016-04-26T17:31:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'Bilişim sistemleri güvenlik, test ve inceleme alanındaki faaliyetler yaygınlaştıkça ortaya çıkan ihtiyaçlara göre geliştirilen İşletim Sistemlerinin sayısı da artmaktadır. Bir kısım Linux dağıtımı CD/DVD vb. ortamlarda doğrudan çalıştırılabilir olarak, Kali Linux ve diğer bir kısmı ise hem çalıştırılabilir ve hem de kurulabilir şekilde dağıtılmaktadır.' 
 
url:  /tr/kali-linux-genel-tanitim/
 
featured_image: /images/cyber4.jpg
categories:
    - 'Temel Linux'
tags:
    - 'kali linux'
---
Bilişim sistemleri güvenlik, test ve inceleme alanındaki faaliyetler yaygınlaştıkça ortaya çıkan ihtiyaçlara göre geliştirilen İşletim Sistemlerinin sayısı da artmaktadır. Bir kısım Linux dağıtımı CD/DVD vb. ortamlarda doğrudan çalıştırılabilir olarak, Kali Linux ve diğer bir kısmı ise hem çalıştırılabilir ve hem de kurulabilir şekilde dağıtılmaktadır.

Bu dağıtımların içerisinde kurulu olan hazır programlar ise maksat ve hedeflere göre sınıflandırılabilmektedir. Bir çoğu açık kaynak kodlu olan programların arasında ticari yazılımlar da vardır. Ticari yazılımlar, topluluk sürümlerinde bir kısım özelliklerini ücretsiz kullanıma açmaktadır. Kullanıcı, Pro vb. Sürümü kullanmak isterse, ücretini ödeyerek lisans satın alabilmektedir.

<a href="http://distrowatch.com/" target="_blank" rel="noreferrer noopener">Distrowatch.com</a> sitesinde, Forensics kategorisini ve istatistikleri incelediğimizde popülerlik sıralamasına göre dağıtımların isimlerini aşağıda bulabilirsiniz.

1. Kali Linux (11) 2. BackBox Linux (56) 3. BlackArch Linux (77) 4. CAINE (121) 5. DEFT Linux (184) 6. Parrot Security OS (228) 7. NetSecL OS (242) 8. Matriux (0)

Biz bu çalışmamızda, Kali Linux dağıtımını inceleyeceğiz.

## Kali Linux

İlk çıktığında Backtrack adıyla tanınan dağıtım, Ubuntu İşletim Sistemini temel alarak oluşturulmuştur. Backtrack aslında WHAX ve Auditor Security Collection isimli dağıtımların birleşmesiyle ortaya çıkmıştır. Mart 2013 tarihinden itibaren ise Debian temelli ve Kali Linux adıyla dağıtılmaya başlanmıştır.

Debian test sürümünü temel almakta ve güncellemelerini bu sürüme göre yapmaktadır. Armel, armhf, i386 ve x86_64 mimarilerini desteklemektedir. Masaüstü ortamı olarak GNOME kullanan dağıtım kurulduğunda, 600 kadar program kullanıma hazır halde bulunmaktadır.

## Kurulu olarak gelen bazı programlar

Armitage

nmap

Wireshark

John the Ripper

Aircrack-ng

Burp Suite

OWASP ZAP

Metasploit Framework

## Kali Linux Genel Özellikleri

Kullanılan programların kaynak kodlarına git depolarından ulaşmak mümkündür. <a href="http://git.kali.org/gitweb/" target="_blank" rel="noreferrer noopener">http://git.kali.org/gitweb/</a> adresini ziyaret ederek kaynak kodları incelemeniz, hatta kendinize göre yeniden düzenlemeniz de mümkün.

File System Hierarchy FHS standartlarını takip eder. Kullanıcıların diğer dağıtımlardan tanıdıkları dosya sistemi (FHS Standartı) kullanılmaktadır.

İşletim sistemi için geliştirilen yazılımlar, programcıları tarafından dijital olarak imzalanmaktadır.

Kali Linux, özel olarak sistem güvenlik uzmanlarının kullanımı için geliştirilmiştir. Bu sebeple, günlük normal kullanım için bir takım engeller ile karşılaşmak mümkündür.

## Kali Linux, diğer dağıtımlardan farkı ne?

Kullanıcı, root hesabını kullanır.

Ağ servisleri devre dışıdır.

Değiştirilmiş Linux Kernel kullanılmaktadır.

Minimum ve kararlı paketler tercih edilir.
