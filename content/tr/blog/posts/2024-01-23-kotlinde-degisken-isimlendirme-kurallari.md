---
draft: false
title: Kotlin'de değişken isimlendirme kuralları
date: 2024-01-23T17:18:03+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Seçtiğiniz değişken ismi, tam olarak değişkenin ne işe yaradığını anlatmalıdır.  Kodunuzun karmaşık ve anlaşılmaz hale gelmemesi için uymanız tavsiye edilen kuralları sırayla görelim.
url: /tr/kotlinde-degisken-isimlendirme-kurallari/
featured_image: /images/kotlin-1.png
categories:
    - Temel Kotlin
tags:
    - kotlin
    - yazılım
---
Bildiğiniz gibi, her değişkenin benzersiz bir ismi bulunmalıdır. Başlangıçta problemsiz görünse de yazılımınız genişledikçe kodlarınızın anlaşılması zor hale gelebilir. Yazılımcıların zamanının çoğu kod yazmak ile değil başkalarının yazdığı kodu okumakla geçer.

Sizin yazdığınız kodun kolay okunabilir ve takip edilebilir olmasını istiyorsanız, isimlendirme kurallarına uymanız oldukça önemlidir. Seçtiğiniz değişken ismi, tam olarak değişkenin ne işe yaradığını anlatmalıdır.  Kodunuzun karmaşık ve anlaşılmaz hale gelmemesi için uymanız tavsiye edilen kuralları sırayla görelim.

## Uyulması Zorunlu İsimlendirme Kuralları
* 
* İsimler büyük küçük harf duyarlıdır. (number ile Number aynı ifade değildir.)

* İsimler sadece harf, rakam ve alt çizgilerden oluşmalıdır.

* İsimlerin en başında rakam olamaz (1month **yanlış** kullanımdır.)

* Kotlin yazılımının kendisi için ayırdığı anahtar kelimeler (val, var, fun vb.) değişken adı olarak kullanılamaz.
## Tavsiye Edilen İsimlendirme Kuralları
* 
* Bir değişken adı tek kelimeden oluşuyorsa tamamı küçük harfle yazılmalıdır. (`name`, `message`)

* Bir değişken adı birden fazla kelimeden oluşuyorsa, küçük harfli Deve tarzı yazım kullanılmalıdır. (numberOfStudents, numberOfPages). Görüldüğü gibi, ilk kelimenin tamamı küçük harf ile yazıldıktan sonra her bir kelimenin sadece ilk harfi büyük yazılmalıdır.

* Yasak olmamasına rağmen değişken adına _ alt çizgi ile başlamamalısınız.

* Değişkenle anlamlı isimler vermelisiniz. Değişken adı olarak `renk` ismi `r` ifadesinden daha açıklayıcı ve anlamlı olacaktır.
## Sihirli Sayılar

Aşağıdaki örnek komutta, ekrana 7 sayısı yazılmaktadır. Bu programı okuyan başka bir programcı için 7 sayısının, neyin sayısı olduğunun bilinmesi çok zordur. Bu tür durumlarda sayılar bir sabit dahi olsalar const kullanılarak isimlendirilmeli ve o şekilde kullanılmalıdır. İsimlendirirken, BÜYÜK_HARFLİ_YILAN türü kullanılmalıdır. Bu kullanım, kodun anlaşılması için büyük kolaylık sağlayacaktır.

Tavsiye Edilmeyen Kullanım
```kotlin
fun main() {
    println(7)
}
/* Output
7

Process finished with exit code 0
 */```

Tavsiye Edilen Kullanım
```kotlin
const val DAYS_OF_THE_WEEK = 7

fun main() {
    println(DAYS_OF_THE_WEEK)
}
/* Output
7

Process finished with exit code 0
 */```

Yukarıda açıkladığımız kurallara mümkün olduğunca uymanız durumunda hem size, hem de sonradan projeye dahil olacak arkadaşlarınıza çok yardımcı olacak ve zaman kazandıracaktır.
