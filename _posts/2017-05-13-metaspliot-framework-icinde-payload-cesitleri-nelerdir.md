---
layout: post
title: MSF İçinde Payload Çeşitleri?
date: 2017-05-13 08:45:06.000000000 +02:00
type: post
img: metasploit.jpg
published: false
status: publish
categories:
- Nasıl
- Araştırma
tags:
- msfconsole
- metasploit Framework
- Metasploit Framework payload
- msf payload türleri
excerpt:
---

# Payload Grupları Nelerdir?

Payload, bir exploit modül türünü ifade eder. Metasploit Framework içerisinde 3 farklı grup payload modülü bulunur. Tekil, Sahneleyiciler ve Sahneler (Singles, Stagers ve Stages) olarak ayırabileceğimiz bu modüllere bakacağız. 

## Tekil payloadlar (Singles)

Bu tür payload modülleri, ihtiyaç duydukları bütün kodları ve işlemleri kendi bünyesinde barındırlar. Çalışmak için herhangi bir yardımcıya ihtiyaç duymazlar. Örneğin, hedef sisteme bir kullanıcı ekleyen payload, işlemini yapar ve durur. Başka bir komut satırına vb. ihtiyaç duymaz. 

Tek başlarına bir program olduklarında netcat vb. programlar tarafından fark edilip yakalanabilirler.

“windows/shell_bind_tcp” isimlendirmesine dikkat edelim. Windows için shell_bind_tcp tekil bir payload olarak çalışır. Bir sonraki bölümde farklı bir isimlendirme göreceğiz.

, bütün . These different types allow for a great deal of versatility and can be useful across numerous types of scenarios. Whether or not a payload is staged, is represented by ‘/’ in the payload name. For example, “windows/shell_bind_tcp” is a single payload with no stage, whereas “windows/shell/bind_tcp” consists of a stager (bind_tcp) and a stage (shell).


## Sahneleyiciler (Stagers)


Sahneleyici payload modülleri, hedef bilgisayar ile yerel bilgisayar arasında ağ bağlantısı kuran kodlardır. Genellikle küçük kodlar barındırırlar. Çalışabilmek için bir sahneye ihtiyaç duyarlar. Metasploit Framework, en uygun olan payload modülünü kullanacak, başarılı olmaz ise daha az başarı vadeden payload otomatik olarak seçilecektir. 

```windows/shell/bind_tcp``` isimlendirmesine dikkat edelim. Burada ```bind_tcp``` sahneleyicidir ve bir sahneye ihtiyaç duyar. İşte bu isimlendirmede, ```windows``` ile ```bind_tcp``` arasında bulunan ```shell``` sahneyi ifade etmektedir. 

## Sahneler (Stages)

Sahne olarak ifade ettiğimiz payload modül tipleri, sahneleyiciler tarafından kullanılırlar. Aracılık ettiklerinden ```windows/shell/bind_tcp``` isimlendirmesinde orta kısma yazılırlar. Herhangi bir boyut kısıtlamaları yoktur. Meterpreter, VNC Injection ve iPhone ‘ipwn’ Shell bunlara örnek olarak verilebilir.

# Payload Tipleri Nelerdir?

Yazının ilk bölümünde Payloadları 3 gruba ayırmıştık. Şimdi payloadları tiplerine göre inceleyelim.

## Inline (Non Staged)

Bu tür payloadlar, ihtiyaç duydukları sahneyi (shell) de kendi içlerinde bulundurduklarından daha stabil çalışırlar. Boyutları bir miktar büyük olduklarında karşı tarafın farketmesi de daha kolay olmaktadır. Bazı Exploitler, kısıtlamalarından dolayı bu payloadları kullanamayabilirler. 

## Staged

Sahneleyiciler, karşı taraftan aldığı bir bilgiyi yine karşı tarafta çalıştırmak istediğinde kendisine sağlanan sahneyi (stage) kullanır. Bu tip payloadlara Sahlenen (Staged) adı verilmektedir. 

## Meterpreter

Meterpreter, the short form of Meta-Interpreter is an advanced, multi-faceted payload that operates via dll injection. The Meterpreter resides completely in the memory of the remote host and leaves no traces on the hard drive, making it very difficult to detect with conventional forensic techniques. Scripts and plugins can be loaded and unloaded dynamically as required and Meterpreter development is very strong and constantly evolving.

## PassiveX

PassiveX is a payload that can help in circumventing restrictive outbound firewalls. It does this by using an ActiveX control to create a hidden instance of Internet Explorer. Using the new ActiveX control, it communicates with the attacker via HTTP requests and responses.

##NoNX

The NX (No eXecute) bit is a feature built into some CPUs to prevent code from executing in certain areas of memory. In Windows, NX is implemented as Data Execution Prevention (DEP). The Metasploit NoNX payloads are designed to circumvent DEP.

## Ord

Ordinal payloads are Windows stager based payloads that have distinct advantages and disadvantages. The advantages being it works on every flavor and language of Windows dating back to Windows 9x without the explicit definition of a return address. They are also extremely tiny. However two very specific disadvantages make them not the default choice. The first being that it relies on the fact that ws2_32.dll is loaded in the process being exploited before exploitation. The second being that it’s a bit less stable than the other stagers.

## IPv6

The Metasploit IPv6 payloads, as the name indicates, are built to function over IPv6 networks.

## Reflective DLL injection

Reflective DLL Injection is a technique whereby a stage payload is injected into a compromised host process running in memory, never touching the host hard drive. The VNC and Meterpreter payloads both make use of reflective DLL injection. You can read more about this from Stephen Fewer, the creator of the reflective DLL injection method.