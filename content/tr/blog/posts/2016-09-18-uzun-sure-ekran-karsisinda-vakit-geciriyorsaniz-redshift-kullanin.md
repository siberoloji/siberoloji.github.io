---
draft: false

title:  'Uzun Süre Ekran Karşısında Vakit Geçiriyorsanız, Redshift Kullanın'
date: '2016-09-18T17:58:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  "Bilgisayar veya Akıllı Telefon ekranına geç saatlere kadar baktıktan sonra uykuya dalma problemi yaşadığınız oluyor mu? Hemen hemen bütün ekranlar, kullanıcısına doğala yakın bir görüntü sağlamak amacıyla\_gün ışığını taklit eder ve mavi ışık yayarlar. Bu yayılan mavi ışığın bir yan etkisi de bulunmaktadır." 
 
url:  /tr/uzun-sure-ekran-karsisinda-vakit-geciriyorsaniz-redshift-kullanin/
 
featured_image: /images/cyber8.jpg
categories:
    - 'Linux Nasıl Yapılır'
tags:
    - linux
---
Bilgisayar veya Akıllı Telefon ekranına geç saatlere kadar baktıktan sonra uykuya dalma problemi yaşadığınız oluyor mu? Hemen hemen bütün ekranlar, kullanıcısına doğala yakın bir görüntü sağlamak amacıyla gün ışığını taklit eder ve mavi ışık yayarlar. Bu yayılan mavi ışığın bir yan etkisi de bulunmaktadır.

İnsan vücudunun uyku işlemi, salgılanan melatonin hormonu sayesinde düzenlenir. Melatonin hormonu, gün ışığının yokluğunda yani karanlıkta salgılanır. Sabah güneş doğduğunda veya gökyüzü aydınlandığında melatonin hormonu salgılanımı durur ve vücut uyku halinden çıkar.

Bilgisayar ekranının yaydığı mavi ışık, melatonin hormonu salgılanmasını engellediği için uykuya dalmanız ve fizyolojinizin normale dönmesi biraz zaman alır. Geç saatlere kadar bilgisayar ekranına baktınız ve ekranı kapattınız. Muhtemelen uykuya dalmanız normalden daha uzun sürecektir. Sadece uykuya dalma süresi değil, uyku kalitesi de bariz şekilde düşecektir.

Bu duruma bir miktar engel olmak için, bilgisayarınızın ekranından yayılan renklerin içerisinde bulunan mavi ışık oranını azaltmalısınız. Bu amaçla geliştirilen Redshift programını mutlaka denemelisiniz. Program, saate ve bulunduğunuz konumda güneşin durumuna göre ekran renklerinin sıcaklığını otomatik olarak ayarlayarak rahat bir deneyim yaşamanızı sağlıyor.

Ekran sıcaklığını Kelvin (3500K-6500K vb.) cinsinden değerlerle ayarlayan programı ilk günlerde biraz garip bulabilirsiniz. Ekranın kırmızı bir ton aldığını fark edip şaşırmayın. Kendinize biraz zaman tanıyın ve yavaş yavaş alışmaya çalışın. Bir kaç gün sonra artık gözlerinizin eskisi gibi kurumadığını ve bilgisayar başından ayrılınca daha kısa sürede uyuyabildiğinizi göreceksiniz.

Redshift programı, neredeyse bütün Linux dağıtımlarının paket depolarında bulunmaktadır. Kurulum için aşağıdaki komutları kullanmanız yeterli.

## Redshift Ubuntu - Debian Kurulum
```bash
sudo apt install redshift redshift-gtk```

## Redshift CentOS - Fedora Kurulum
```bash
sudo yum install redshift gtk-redshift```

## Redshift Yardım

Redshift programını, komut satırından kontrol etmeniz de mümkün. Aşağıdaki yardım komutu ile açıklamaları okuyabilirsiniz.
```bash
redshift -h 

```

## Redshift Ayarlar Dosyası

Programın ayarlarının bulunduğu dosyayı, ~/.config/redshift.conf adresinde bulabilirsiniz.
```bash
; Global settings for redshift
[redshift]
; Set the day and night screen temperatures
temp-day=5700
temp-night=3500

; Enable/Disable a smooth transition between day and night
; 0 will cause a direct change from day to night screen temperature.
; 1 will gradually increase or decrease the screen temperature.
transition=1

; Set the screen brightness. Default is 1.0.
;brightness=0.9
; It is also possible to use different settings for day and night
; since version 1.8.
;brightness-day=0.7
;brightness-night=0.4
; Set the screen gamma (for all colors, or each color channel
; individually)
gamma=0.8
;gamma=0.8:0.7:0.8
; This can also be set individually for day and night since
; version 1.10.
;gamma-day=0.8:0.7:0.8
;gamma-night=0.6

; Set the location-provider: 'geoclue', 'geoclue2', 'manual'
; type 'redshift -l list' to see possible values.
; The location provider settings are in a different section.
location-provider=manual

; Set the adjustment-method: 'randr', 'vidmode'
; type 'redshift -m list' to see all possible values.
; 'randr' is the preferred method, 'vidmode' is an older API.
; but works in some cases when 'randr' does not.
; The adjustment method settings are in a different section.
adjustment-method=randr

; Configuration of the location-provider:
; type 'redshift -l PROVIDER:help' to see the settings.
; ex: 'redshift -l manual:help'
; Keep in mind that longitudes west of Greenwich (e.g. the Americas)
; are negative numbers.
[manual]
lat=48.1
lon=11.6

; Configuration of the adjustment-method
; type 'redshift -m METHOD:help' to see the settings.
; ex: 'redshift -m randr:help'
; In this example, randr is configured to adjust screen 1.
; Note that the numbering starts from 0, so this is actually the
; second screen. If this option is not specified, Redshift will try
; to adjust _all_ screens.
[randr]
screen=1```
