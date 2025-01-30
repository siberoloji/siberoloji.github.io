---
draft: false

title:  "How to move the layout up when the soft keyboard is shown\_Android?"
date: '2022-03-01T17:34:17+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /how-to-move-the-layout-up-when-the-soft-keyboard-is-shown-android/
featured_image: /images/androidkeyboardadjustment.png
categories:
    - 'Android Code Samples'
tags:
    - android
    - 'move layout up'
    - 'soft keyboard'
---
Sometimes, you need to change the layout when the soft keyboard appeared on the screen. You can fix this by adding a line of code into the AndroidManifest.xml file within the relevant activity section.
<!-- wp:code -->
<pre title="Code to xml file" class="wp-block-code"><code lang="kotlin" class="language-kotlin">android:windowSoftInputMode="adjustResize"```

Add this code to the activity.
```kotlin
<activity
            android:name=".MainActivity"
            android:exported="true"
            android:screenOrientation="fullSensor"
            android:theme="@style/NoActionBarTheme"
            android:windowSoftInputMode="adjustResize">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
```
