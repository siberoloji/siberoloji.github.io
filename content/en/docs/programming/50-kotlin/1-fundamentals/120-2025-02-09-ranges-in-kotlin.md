---
draft: false
title: Ranges in Kotlin
linkTitle: Ranges
translationKey: ranges-in-kotlin
weight: 120
description: We will explore ranges in Kotlin and their usage in loops, conditional expressions, and collection processing.
date: 2025-02-09
url: ranges-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - ranges
featured_image: /images/kotlin-1.png
---
## Introduction

Kotlin, a modern programming language developed by JetBrains, offers a wide range of powerful and expressive features. One such feature is **ranges**, which provide an elegant way to represent a sequence of values. Ranges are particularly useful in loops, conditional expressions, and collection processing.

In this blog post, we will explore **ranges in Kotlin** in detail, covering their syntax, different types, use cases, and best practices to help you leverage them effectively in your Kotlin programs.

---

## What Are Ranges in Kotlin?

A **range** in Kotlin represents a sequence of values defined by a **start** and **end** value. It provides a concise way to iterate over a progression of numbers, characters, or even custom objects when used with operators.

### **Basic Syntax of Ranges**

A range is created using the `..` operator:

```kotlin
val range = 1..10 // Represents numbers from 1 to 10
```

This range includes both the **start (1)** and **end (10)** values.

---

## Types of Ranges in Kotlin

Kotlin supports several types of ranges:

### **1. Numeric Ranges**

Numeric ranges are used to define a sequence of numbers.

#### **Integer Ranges (`IntRange`)**

```kotlin
val intRange = 1..5
for (num in intRange) {
    println(num) // Prints 1 to 5
}
```

#### **Floating-Point Ranges (`ClosedFloatingPointRange`)**

Unlike integer ranges, floating-point ranges do not support iteration:

```kotlin
val floatRange = 1.0..5.0
println(3.5 in floatRange) // true
```

### **2. Character Ranges (`CharRange`)**

Kotlin allows creating ranges with characters:

```kotlin
val charRange = 'a'..'e'
for (char in charRange) {
    println(char) // Prints a to e
}
```

### **3. String Ranges (Not Supported)**

Unlike numeric and character ranges, Kotlin does not support direct **String** ranges:

```kotlin
// This will cause a compilation error
// val stringRange = "apple".."orange"
```

### **4. Reverse Ranges (`downTo`)**

To create a decreasing sequence, use `downTo`:

```kotlin
val reverseRange = 5 downTo 1
for (num in reverseRange) {
    println(num) // Prints 5 to 1
}
```

### **5. Step Ranges (`step`)**

To modify the increment step in a range, use `step`:

```kotlin
val stepRange = 1..10 step 2
for (num in stepRange) {
    println(num) // Prints 1, 3, 5, 7, 9
}
```

---

## Using Ranges in Conditional Statements

Ranges are useful in `if` conditions and `when` expressions.

### **Using `in` with `if` Conditions**

```kotlin
fun checkAge(age: Int) {
    if (age in 18..65) {
        println("You are eligible to work.")
    } else {
        println("You are not eligible to work.")
    }
}

fun main() {
    checkAge(25) // Output: You are eligible to work.
}
```

### **Using `when` with Ranges**

```kotlin
fun categorizeNumber(num: Int) {
    when (num) {
        in 1..10 -> println("Small number")
        in 11..100 -> println("Medium number")
        else -> println("Large number")
    }
}

fun main() {
    categorizeNumber(15) // Output: Medium number
}
```

---

## Iterating Over Ranges with Loops

### **Using `for` Loop with Ranges**

```kotlin
for (i in 1..5) {
    println(i) // Prints 1 to 5
}
```

### **Using `while` Loop with Ranges**

```kotlin
var num = 1
while (num in 1..5) {
    println(num)
    num++
}
```

---

## Ranges in Collection Operations

Kotlin ranges are often used in collection-related operations like filtering or checking indices.

### **Checking Index in a List**

```kotlin
val list = listOf("Apple", "Banana", "Cherry")
if (2 in list.indices) {
    println(list[2]) // Output: Cherry
}
```

### **Filtering Using Ranges**

```kotlin
val numbers = listOf(5, 12, 7, 25, 30)
val filtered = numbers.filter { it in 10..20 }
println(filtered) // Output: [12]
```

---

## Best Practices for Using Ranges in Kotlin

1. **Prefer `step` over manually skipping iterations** – Instead of manually incrementing a counter, use `step` for better readability.
2. **Use `downTo` for reverse iteration** – Avoid using negative steps manually.
3. **Leverage `when` with ranges** – It enhances readability when working with multiple conditional checks.
4. **Check for `in` membership** – Instead of writing multiple conditions, use `in` to simplify range-based checks.
5. **Be cautious with floating-point ranges** – Iteration is not supported, so use them only for containment checks.

---

## Conclusion

Ranges in Kotlin provide an elegant and efficient way to work with sequences of numbers, characters, and conditions. They are widely used in loops, conditional expressions, and collection manipulations. By understanding how to utilize ranges effectively, you can write more concise and readable Kotlin code.

From numeric to character ranges, step iterations to reverse progressions, Kotlin’s range system is powerful and flexible. Start integrating these concepts into your Kotlin programs to take full advantage of their capabilities!

Happy coding! 🚀
