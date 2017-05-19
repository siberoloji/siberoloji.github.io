---
layout: post
title: MP3-WAV ve Wav-MP3 Dönüştürme
date: 2017-05-08 08:39:06.000000000 +02:00
author: siberoloji
type: post
img: cyber9.jpg
published: false
status: publish
categories:
- Nasıl
tags:
- mp3 dönüştürme
- mp3 wav dönüştürme
- wav mp3 dönüştürme
- wav dönüştürme
---

Bilgisayarımda kurulu olan, uzun zamandır kullandığım Thunderbird programının eposta geldiğinde uyarı olarak ses çalma özelliğini kullanmak istedim. Bu ayarı yapmak istediğimde .wav uzantılı bir ses dosyası gerektiğini anladım. Kullanmak istediğim dosya .mp3 uzantılıydı. Bu dönüşümü en kısa yoldan nasıl ypabileceğimi araştırdım ve bulduğum çözümü sizinle paylaşmak istedim.

Bu dönüşümü, Linux için geliştirilmiş görsel olarak kullanılan Winff ve Soundconverter programlarıyla yapabilirsiniz. Ben burada komut satırından işlemi açıklamak istiyorum.

## ffmpeg kuralım
Dönüşüm için ffmpeg yazılımını ve codeclerini kurmamız gerekiyor. 