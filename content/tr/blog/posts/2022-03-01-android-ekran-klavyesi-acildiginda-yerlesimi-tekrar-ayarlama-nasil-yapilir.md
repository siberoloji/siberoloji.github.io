---
draft: false

title:  'Android Ekran Klavyesi açıldığında yerleşimi tekrar ayarlama nasıl yapılır?'
date: '2022-03-01T17:38:28+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/android-ekran-klavyesi-acildiginda-yerlesimi-tekrar-ayarlama-nasil-yapilir/
burst_total_pageviews_count:
    - '1'
featured_image: /images/androidkeyboardadjustment.png
categories:
    - 'Android Kod Örnekleri'
tags:
    - android
    - 'android kod Örnekleri'
    - 'ekran klavyesi'
---


Bazen, ekranda yazılım klavyesi göründüğünde düzeni değiştirmeniz gerekir. AndroidManifest.xml dosyasında ilgili aktivite bölümüne bir kod satırı ekleyerek bunu düzeltebilirsiniz.


```kotlin
android:windowSoftInputMode="adjustResize"```



Yukarıdaki kodu AndroidManifest.xml dosyanızda ilgili aktivite bölümüne eklemeniz yeterli olacaktır.


```kotlin
&lt;activity
            android:name=".MainActivity"
            android:exported="true"
            android:screenOrientation="fullSensor"
            android:theme="@style/NoActionBarTheme"
            android:windowSoftInputMode="adjustResize"&gt;
            &lt;intent-filter&gt;
                &lt;action android:name="android.intent.action.MAIN" /&gt;

                &lt;category android:name="android.intent.category.LAUNCHER" /&gt;
            &lt;/intent-filter&gt;
        &lt;/activity&gt;
```




