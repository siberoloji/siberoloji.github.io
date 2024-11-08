---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


burst_total_pageviews_count:
- "11"
categories:
- Android Kod Örnekleri
date: "2022-03-01T13:40:58Z"
guid: https://blog.siberoloji.com/?p=201
id: 201
image: /assets/images/2022/03/upbuttonhalfscreen.png
tags:
- android
- android geri tuşu
title: Android Uygulamada &#8220;Geri Tuşu&#8221; Ekleme Nasıl Yapılır?
url: /tr/android-uygulamada-geri-tusu-ekleme-nasil-yapilir/
---

  Android yazılımında, MainActivity dışında, kullanıcı navigasyonu için YUKARI düğmesini eklemeniz gerekecektir. Projenizin AndroidManifest.xml dosyasına gerekli kodları ekleyerek işlem çubuğunda YUKARI butonunu görüntüleyebilirsiniz. 
 

  Projemizde iki aktivitemiz var. Biri MainActivity, diğeri DisplayMessageActivity. Kullanıcı MainActivity ekranındaki düğmeye dokunduğunda, program DisplayMessageActiviy'e girer. Kullanıcı nasıl GERİ gidebilir? 
 

  ANA etkinliğin adını ALT etkinliğine bildirebiliriz, böylece Android, DisplayMessageActivity'de YUKARI(Geri) düğmesini gösterebilir. 
 

<!-- wp:code -->
<pre title="Before adding UP button" class="wp-block-code"><code lang="kotlin" class="language-kotlin">...
&lt;activity
            android:name=".DisplayMessageActivity"
            android:exported="false" /&gt;
        &lt;activity
            android:name=".MainActivity"
            android:exported="true"&gt;
            &lt;intent-filter&gt;
                &lt;action android:name="android.intent.action.MAIN" /&gt;

                &lt;category android:name="android.intent.category.LAUNCHER" /&gt;
            &lt;/intent-filter&gt;
        &lt;/activity&gt;
...</code></pre>
<!-- /wp:code -->

  AndroidManifest.xml dosyanızda gerekli değişiklikleri yaptıktan sonra kodunuz bu şekilde olmalıdır. 
 

<!-- wp:code -->
<pre title="After declaring parent activity" class="wp-block-code"><code lang="kotlin" class="language-kotlin">...
&lt;activity
            android:name=".DisplayMessageActivity"
            android:parentActivityName=".MainActivity"
            android:exported="false" &gt;
        &lt;meta-data
            android:name="android.support.PARENT_ACTIVITY"
            android:value=".MainActivity" /&gt;
        &lt;/activity&gt;

        &lt;activity
            android:name=".MainActivity"
            android:exported="true"&gt;
            &lt;intent-filter&gt;
                &lt;action android:name="android.intent.action.MAIN" /&gt;

                &lt;category android:name="android.intent.category.LAUNCHER" /&gt;
            &lt;/intent-filter&gt;
        &lt;/activity&gt;
...</code></pre>
<!-- /wp:code -->

  android:parentActivityName&nbsp;özelliği Android 4.1'de (API düzeyi 16) kullanıma sunuldu. Android'in eski sürümlerine sahip cihazları desteklemek için, adın "android.support.PARENT_ACTIVITY" olduğu ve değerin üst etkinliğin adı olduğu bir&nbsp;&nbsp;ad-değer çifti tanımlayın. 
 

<!-- wp:image {"id":198,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://www.siberoloji.com/assets/images/2022/03/upbuttonscreenshot-524x1024.png" alt="up button for Android" class="wp-image-198" /><figcaption class="wp-element-caption">Screenshot after adding UP button.</figcaption></figure>
<!-- /wp:image -->