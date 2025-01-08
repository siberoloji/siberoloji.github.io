---
draft: false

title:  'Açıklamalı C++ Hello World'
date: '2024-06-30T17:05:14+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/aciklamali-c-merhaba-dunya/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Temel Bilgiler'
tags:
    - c++
---


Başlangıç ​​seviyesindekiler için en basit C++ programını anlatmaya çalıştık.


```bash
#include <iostream>

int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}
```



Verilen kod konsola “Hello World!” yazdıran basit bir C++ programıdır.



İlk satır, `#include <iostream>` iostream standart kütüphanesini içeren bir önişlemci yönergesidir. Bu kütüphane giriş/çıkış işlemlerine izin verir.



Bir sonraki kısım `main` fonksiyond`ur`. C++'da programın yürütülmesi `main` fonksiyonun çalışmasıyla başlar. `int main()`, `main` fonksiyonun bir tamsayı değeri döndüreceğini gösterir.



Fonksiyonun içinde bulunan `std::cout << "Hello, World!" << std::endl;` ifadesi  “Hello World!” dizesini ekrana yazdırmak için kullanılır. 



Son olarak `main` fonksiyonu `return 0;` ile biter. Bu ifade programdan çıkıp işletim sistemine 0 durumunu geri döndürmesine neden olur. `main`, 0 değerinin döndürülmesi genellikle programın hatasız olarak başarılı bir şekilde çalıştığını gösterir.
