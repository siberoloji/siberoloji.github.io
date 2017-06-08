---
title: MSF İçerik Araştırması
layout: post
date:  2017-06-05 09:11:06.000000000 +02:00
type: post
author: siberoloji
img: metasploit.jpg
published: true
status: publish
categories:
- Nasıl
- Araştırma
tags:
- msfconsole
- metasploit Framework
- Metasploit Framework search
- msf meterpreter search

excerpt: Hedef bilgisayarda meterpreter shell açtıktan sonra yapılacak işlemlerden birisi de bilgisayar bulunan dosyaları araştırmaktır. Firmalar, kullanıcılarını bilgilerinin güvenliğini sağlamaları konusunda eğitirler. Bu eğitim konularından birisi de hassas bilgileri paylaşımlı sunucularda değil de yerel bilgisayarlarda tutmaktır. 
---

# İçerik Araştırması

Hedef bilgisayarda meterpreter shell açtıktan sonra yapılacak işlemlerden birisi de bilgisayar bulunan dosyaları araştırmaktır. Firmalar, kullanıcılarını bilgilerinin güvenliğini sağlamaları konusunda eğitirler. Bu eğitim konularından birisi de hassas bilgileri paylaşımlı sunucularda değil de yerel bilgisayarlarda tutmaktır. İçerik araştırması da genelde bu tarz hassas bilgilerin olduğu dosya ve klasörleri keşfetmek için yapılır.

Meterpreter oturumunun sunduğu ```search``` komutu ile ilgili birkaç örnek inceleyelim.

```search -h``` komutuyla search hakkında yardım bilgilerini görüntüleyebilirsiniz.

```sh
meterpreter > search -h
Usage: search [-d dir] [-r recurse] -f pattern
Search for files.

OPTIONS:

    -d   The directory/drive to begin searching from. Leave empty to search all drives. (Default: )
    -f   The file pattern glob to search for. (e.g. *secret*.doc?)
    -h   Help Banner.
    -r   Recursivly search sub directories. (Default: true)
```
## Açıklamalar

```-d```: Arama yapılacak klasörü belirtir. Boş bırakılırsa tüm klasörler aranır.

```-f```: Belli bir dosya paterni belirtmek için kullanılır.

```-h```: Yardımı görüntüler.

```-r```: Arama, belirtilen klasör ve tüm alt klasörlerinde gerçekleştirilir. Varsayılan olarak zaten aktif durumdadır.

Aşağıdaki örnek komut, tüm disk bölümlerinde, klasör ve alt klasörlerde ```.jpg``` uzantılı dosyaları arayacaktır.

```sh
meterpreter > search -f *.jpg
Found 418 results...
...snip...
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Blue hills.jpg (28521 bytes)
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Sunset.jpg (71189 bytes)
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Water lilies.jpg (83794 bytes)
    c:\Documents and Settings\All Users\Documents\My Pictures\Sample Pictures\Winter.jpg (105542 bytes)
...snip...
```

```search``` komutunda varsayılan olarak tüm klasörler aranmaktadır ancak bu işlem çok zaman alır. Ayrıca, hedef bilgisayar kullanıcısı bilgisayarının yavaşladığını fark edebilir. Bu nedenle, ```-d``` seçeneğini kullanarak arama yapılacak klasörü belirtmek hem zaman kazandırır hem de sistemin işlem yükünü hafifletir. Aşağıda buna bir örnek kullanımı görebilirsiniz. Komutu girerken klasör ayırıcı işaretini ```\\``` şeklinde girdiğimize dikkat edin.

```sh
meterpreter > search -d c:\\documents\ and\ settings\\administrator\\desktop\\ -f *.pdf
Found 2 results...
    c:\documents and settings\administrator\desktop\operations_plan.pdf (244066 bytes)
    c:\documents and settings\administrator\desktop\budget.pdf (244066 bytes)
meterpreter >
```
