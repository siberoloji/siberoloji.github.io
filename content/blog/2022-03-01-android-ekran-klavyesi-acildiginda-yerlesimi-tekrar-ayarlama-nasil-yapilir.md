---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "1"
categories:
- Android Kod Örnekleri
date: "2022-03-01T17:38:28Z"
guid: https://blog.siberoloji.com/?p=206
id: 206
image: /assets/images/2022/03/androidkeyboardadjustment.png
tags:
- android
- android kod Örnekleri
- ekran klavyesi
title: Android Ekran Klavyesi açıldığında yerleşimi tekrar ayarlama nasıl yapılır?
url: /tr/android-ekran-klavyesi-acildiginda-yerlesimi-tekrar-ayarlama-nasil-yapilir/
---

  Bazen, ekranda yazılım klavyesi göründüğünde düzeni değiştirmeniz gerekir. AndroidManifest.xml dosyasında ilgili aktivite bölümüne bir kod satırı ekleyerek bunu düzeltebilirsiniz.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">android:windowSoftInputMode="adjustResize"</code></pre>
<!-- /wp:code -->

  Yukarıdaki kodu AndroidManifest.xml dosyanızda ilgili aktivite bölümüne eklemeniz yeterli olacaktır.</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="kotlin" class="language-kotlin">&lt;activity
            android:name=".MainActivity"
            android:exported="true"
            android:screenOrientation="fullSensor"
            android:theme="@style/NoActionBarTheme"
            android:windowSoftInputMode="adjustResize"&gt;
            &lt;intent-filter&gt;
                &lt;action android:name="android.intent.action.MAIN" /&gt;

                &lt;category android:name="android.intent.category.LAUNCHER" /&gt;
            &lt;/intent-filter&gt;
        &lt;/activity&gt;</code></pre>
<!-- /wp:code -->

  </p>
 