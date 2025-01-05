---
draft: false

title:  'C++ Fahrenheit sıcaklığı Celsius Derececeye çeviren kod örneği'
date: '2024-06-28T01:36:32+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /tr/c-fahrenheit-sicakligi-celsius-derececeye-ceviren-kod-ornegi/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Kod Örnekleri'
tags:
    - c++
---


Bu örnekte, girilen Fahrenheit sıcaklık değeri bir fonksiyon yardımı ile Celsius değerine dönüştürülmektedir.


```cpp
#include &lt;iostream&gt;
#include &lt;iomanip&gt;
#include &lt;limits&gt;

float temperatureConversion(const float temperatureInFahrenheit) {
    constexpr float conversionFactor = 5.0 / 9.0;
    return (temperatureInFahrenheit - 32) * conversionFactor;
}

int main() {
    float fahrenheitTemperature;
    std::cout &lt;&lt; "Enter the Fahrenheit temperature: ";
    std::cin &gt;&gt; fahrenheitTemperature;

    float celsiusTemperature = temperatureConversion(fahrenheitTemperature);
    std::cout &lt;&lt; std::fixed &lt;&lt; std::setprecision(std::numeric_limits&lt;float&gt;::digits10) &lt;&lt; "Celsius value: " &lt;&lt;
            celsiusTemperature &lt;&lt; std::endl;

    return 0;
}
```
