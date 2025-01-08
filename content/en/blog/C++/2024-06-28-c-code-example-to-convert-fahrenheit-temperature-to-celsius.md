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
#include <iostream>
#include <iomanip>
#include <limits>

float temperatureConversion(const float temperatureInFahrenheit) {
    constexpr float conversionFactor = 5.0 / 9.0;
    return (temperatureInFahrenheit - 32) * conversionFactor;
}

int main() {
    float fahrenheitTemperature;
    std::cout << "Enter the Fahrenheit temperature: ";
    std::cin >> fahrenheitTemperature;

    float celsiusTemperature = temperatureConversion(fahrenheitTemperature);
    std::cout << std::fixed << std::setprecision(std::numeric_limits<float>::digits10) << "Celsius value: " <<
            celsiusTemperature << std::endl;

    return 0;
}
```
