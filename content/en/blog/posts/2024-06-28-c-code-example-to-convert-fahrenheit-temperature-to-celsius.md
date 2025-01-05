---
draft: false

title:  'C++ Code example to convert Fahrenheit temperature to Celsius'
date: '2024-06-28T01:38:06+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /c-code-example-to-convert-fahrenheit-temperature-to-celsius/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Code Samples'
tags:
    - c++
    - 'c++ code samples'
---


In this example, the entered Fahrenheit temperature value is converted to Celsius value with the help of a function.


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
