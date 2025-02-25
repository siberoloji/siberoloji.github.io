---
draft: false
title: Kotlin Code Example for Extension Functions
linkTitle: Kotlin Code Example
translationKey: kotlin-code-example-for-extension-functions
weight: 191
description: Kotlin code example for extension functions
date: 2025-02-24
url: kotlin-code-example-for-extension-functions
tags:
  - Kotlin
  - kotlin code example
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
featured_image: /images/kotlin-1.png
---

This Kotlin code snippet is the main entry point of a program that checks if a user-input number is prime or not. It prompts the user to enter a number, attempts to parse it as an integer, and then checks if it's prime using the `isPrime()` function. If the input is valid, it prints whether the number is prime or not; otherwise, it displays an error message.

```kotlin
/**
 * Checks if a given number is prime or not.
 */
fun main() {
    println("Please enter a number:")
    val input = readlnOrNull()?.toIntOrNull()
    if (input != null) {
        if (input.isPrime()) println("$input is a prime number")
        else println("$input is not a prime number")
    } else {
        println("Invalid input. Please enter a valid number.")
    }
}

/**
 * Checks if a given number is prime or not.
 * @return true if the number is prime, false otherwise.
 */

fun Int.isPrime(): Boolean {
    if (this <= 1) return false
    for (i in 2..<(this - 1)) {
        if (this % i == 0) return false
    }
    return true
}
```
