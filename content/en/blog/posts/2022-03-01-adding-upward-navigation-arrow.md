---
draft: false

title:  'Adding Upward Navigation Arrow'
date: '2022-03-01T13:29:12+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /adding-upward-navigation-arrow/
featured_image: /images/upbuttonhalfscreen.png
categories:
    - 'Android Code Samples'
tags:
    - android
    - 'android navigation arrow'
---


In software for Android, except for the main activity, you will need to add the UP button for the user navigation. You can display the UP button in the action bar by adding the necessary codes to the AndroidManifest.xml file of your Project.



In our project, we have two activities. One is Main Activity, the other one is DisplayMessageActivity. When the user taps the button in the MainActivity screen, the program enters the DisplayMessageActiviy. How can the user go BACK?



We can declare the PARENT activity name to the CHILD activity so Android will be able to show UP(Back) button in the DisplayMessageActiviy.


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
...```



After making necessary changes in your AndroidManifest.xml file, your code should be like this.


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
...```



The `android:parentActivityName` attribute was introduced in Android 4.1 (API level 16). To support devices with older versions of Android, define a <a href="https://developer.android.com/guide/topics/manifest/meta-data-element">`&lt;meta-data&gt;`</a> name-value pair, where the name is `"android.support.PARENT_ACTIVITY"` and the value is the name of the parent activity.


<!-- wp:image {"id":198,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://www.siberoloji.com/wp-content/uploads/2022/03/upbuttonscreenshot-524x1024.png" alt="up button for Android" class="wp-image-198" /><figcaption class="wp-element-caption">Screenshot after adding UP button.</figcaption></figure>
<!-- /wp:image -->