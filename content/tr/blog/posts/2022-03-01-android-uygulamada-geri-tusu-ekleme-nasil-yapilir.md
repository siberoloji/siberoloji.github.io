---
draft: false
title: Android Uygulamada Geri Tuşu Ekleme Nasıl Yapılır?
date: 2022-03-01T13:40:58+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /tr/android-uygulamada-geri-tusu-ekleme-nasil-yapilir/
featured_image: /images/upbuttonhalfscreen.png
categories:
    - Android Kod Örnekleri
tags:
    - android
    - android geri tuşu
description: ""
---
Android yazılımında, MainActivity dışında, kullanıcı navigasyonu için YUKARI düğmesini eklemeniz gerekecektir. Projenizin AndroidManifest.xml dosyasına gerekli kodları ekleyerek işlem çubuğunda YUKARI butonunu görüntüleyebilirsiniz.

Projemizde iki aktivitemiz var. Biri MainActivity, diğeri DisplayMessageActivity. Kullanıcı MainActivity ekranındaki düğmeye dokunduğunda, program DisplayMessageActiviy'e girer. Kullanıcı nasıl GERİ gidebilir?

ANA etkinliğin adını ALT etkinliğine bildirebiliriz, böylece Android, DisplayMessageActivity'de YUKARI(Geri) düğmesini gösterebilir.
<!-- wp:code -->
<pre title="Before adding UP button" class="wp-block-code"><code lang="kotlin" class="language-kotlin">...
<activity
            android:name=".DisplayMessageActivity"
            android:exported="false" />
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
...```

AndroidManifest.xml dosyanızda gerekli değişiklikleri yaptıktan sonra kodunuz bu şekilde olmalıdır.
<!-- wp:code -->
<pre title="After declaring parent activity" class="wp-block-code"><code lang="kotlin" class="language-kotlin">...
<activity
            android:name=".DisplayMessageActivity"
            android:parentActivityName=".MainActivity"
            android:exported="false" >
        <meta-data
            android:name="android.support.PARENT_ACTIVITY"
            android:value=".MainActivity" />
        </activity>

        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
...```

android:parentActivityName özelliği Android 4.1'de (API düzeyi 16) kullanıma sunuldu. Android'in eski sürümlerine sahip cihazları desteklemek için, adın "android.support.PARENT_ACTIVITY" olduğu ve değerin üst etkinliğin adı olduğu bir  ad-değer çifti tanımlayın.
<!-- wp:image {"id":198,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://www.siberoloji.com/wp-content/uploads/2022/03/upbuttonscreenshot-524x1024.png" alt="up button for Android" class="wp-image-198" /><figcaption class="wp-element-caption">Screenshot after adding UP button.</figcaption></figure>
<!-- /wp:image -->