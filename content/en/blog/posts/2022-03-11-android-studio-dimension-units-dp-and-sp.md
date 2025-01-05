---
draft: false

title:  'Android Studio Dimension Units dp and sp'
date: '2022-03-11T20:27:54+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /android-studio-dimension-units-dp-and-sp/
burst_total_pageviews_count:
    - '2'
featured_image: /images/Android_Robot_original.png
categories:
    - Android
tags:
    - 'android dimension'
    - 'density-independent pixels'
    - dp
    - 'scalable pixels'
    - sp
---


## dp



The unit for margins and other distances in the UI is density-independent pixels (dp). It's like centimeters or inches, but for distances on a screen. Android translates this value to the appropriate number of real pixels for each device. As a baseline, 1dp is about 1/160th of an inch, but maybe bigger or smaller for some devices.



## sp



Just like dp is a unit of measure for distances on the screen, sp is a unit of measure for the font size. UI elements in Android apps use two different units of measurement, density-independent pixels (dp) which you used earlier for the layout, and scalable pixels (sp) which are used when setting the size of the text. By default, sp is the same size as dp, but it resizes based on the user's preferred text size.
