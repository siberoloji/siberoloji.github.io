---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- C++ Code Samples
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-06-28T01:38:06Z"
guid: https://www.siberoloji.com/?p=1248
id: 1248
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ code samples
title: C++ Code example to convert Fahrenheit temperature to Celsius
url: /c-code-example-to-convert-fahrenheit-temperature-to-celsius/
---

  In this example, the entered Fahrenheit temperature value is converted to Celsius value with the help of a function. 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
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
}</code></pre>
<!-- /wp:code -->