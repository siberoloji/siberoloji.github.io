---
draft: false
title: When Expressions in Kotlin
linkTitle: When Expression
translationKey: when-expression-in-kotlin
weight: 100
description: We will explore the `when` expression in Kotlin, which allows you to evaluate a value against multiple conditions and execute the corresponding block of code.
date: 2025-02-09
url: when-expressions-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Control Flow
  - Conditional Statements
  - When Expression
featured_image: /images/kotlin-1.png
---
## Introduction

Kotlin, a modern and expressive programming language developed by JetBrains, offers various control flow structures that make code more readable and concise. One such feature is the `when` expression, which serves as a powerful replacement for traditional `switch` statements found in languages like Java and C.

Unlike `switch`, which is limited to constant values, Kotlin’s `when` expression supports a wide range of conditions, making it highly flexible. In this article, we will explore `when` expressions in detail, including their syntax, use cases, and best practices, along with examples to help you master this feature.

## Understanding When Expressions in Kotlin

A `when` expression in Kotlin allows you to evaluate a value against multiple conditions and execute the corresponding block of code. It enhances readability and reduces the need for repetitive `if/else` statements.

### Basic Syntax

The basic syntax of a `when` expression is as follows:

```kotlin
when (value) {
    condition1 -> action1
    condition2 -> action2
    else -> defaultAction
}
```

Unlike Java’s `switch`, Kotlin’s `when` does not require explicit `break` statements since it does not fall through to subsequent cases.

### Example

```kotlin
fun checkNumber(num: Int): String {
    return when (num) {
        1 -> "One"
        2 -> "Two"
        3 -> "Three"
        else -> "Unknown number"
    }
}

fun main() {
    println(checkNumber(2)) // Output: Two
}
```

## When as an Expression

One of the most significant advantages of `when` in Kotlin is that it can be used as an **expression** rather than just a statement. This means it can return a value and be assigned to a variable.

### Example

```kotlin
val message = when (val day = 3) {
    1 -> "Monday"
    2 -> "Tuesday"
    3 -> "Wednesday"
    else -> "Invalid day"
}

println(message) // Output: Wednesday
```

## Using Multiple Conditions in a Single Case

Kotlin allows multiple conditions to be grouped together using a comma.

### Example

```kotlin
fun getVowelType(letter: Char): String {
    return when (letter) {
        'a', 'e', 'i', 'o', 'u' -> "Vowel"
        else -> "Consonant"
    }
}

fun main() {
    println(getVowelType('e')) // Output: Vowel
}
```

## When with Ranges

Kotlin allows using ranges (`..`) within `when` expressions to check if a value falls within a specific range.

### Example

```kotlin
fun gradeScore(score: Int): String {
    return when (score) {
        in 90..100 -> "A"
        in 80..89 -> "B"
        in 70..79 -> "C"
        in 60..69 -> "D"
        else -> "F"
    }
}

fun main() {
    println(gradeScore(85)) // Output: B
}
```

## When Without an Argument

Kotlin allows `when` to be used **without an argument**, effectively replacing multiple `if/else` conditions.

### Example

```kotlin
fun numberType(num: Int): String {
    return when {
        num > 0 -> "Positive"
        num < 0 -> "Negative"
        else -> "Zero"
    }
}

fun main() {
    println(numberType(-5)) // Output: Negative
}
```

## When with Type Checking and Smart Casts

Kotlin’s `when` can be used to check the type of an object, enabling smart casts inside branches.

### Example

```kotlin
fun describe(obj: Any): String {
    return when (obj) {
        is String -> "It's a string with length ${obj.length}"
        is Int -> "It's an integer with value $obj"
        is Boolean -> "It's a boolean with value $obj"
        else -> "Unknown type"
    }
}

fun main() {
    println(describe("Kotlin"))  // Output: It's a string with length 6
    println(describe(42))         // Output: It's an integer with value 42
    println(describe(true))       // Output: It's a boolean with value true
}
```

## When with Enum Classes

Kotlin’s `when` works seamlessly with `enum` classes, making it a great tool for handling enum-based logic.

### Example

```kotlin
enum class Day {
    MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY
}

fun weekendOrWeekday(day: Day): String {
    return when (day) {
        Day.SATURDAY, Day.SUNDAY -> "Weekend"
        else -> "Weekday"
    }
}

fun main() {
    println(weekendOrWeekday(Day.FRIDAY)) // Output: Weekday
}
```

## When with Sealed Classes

Sealed classes in Kotlin allow exhaustive pattern matching in `when` expressions, making them a great alternative to `enum` when additional functionality is needed.

### Example

```kotlin
sealed class Shape {
    class Circle(val radius: Double) : Shape()
    class Rectangle(val width: Double, val height: Double) : Shape()
}

fun calculateArea(shape: Shape): Double {
    return when (shape) {
        is Shape.Circle -> Math.PI * shape.radius * shape.radius
        is Shape.Rectangle -> shape.width * shape.height
    }
}

fun main() {
    val circle = Shape.Circle(5.0)
    println("Area: ${calculateArea(circle)}") // Output: Area: 78.53981633974483
}
```

## Best Practices for Using When Expressions

1. **Use ****`when`**** for multiple conditions** – `when` is often more readable than multiple `if/else` statements.
2. **Prefer ****`when`**** without arguments for boolean conditions** – When checking different boolean expressions, using `when` without an argument is cleaner.
3. **Leverage ****`when`**** with ranges and types** – Using `when` with ranges and type checking enhances code clarity.
4. **Ensure exhaustive handling in ****`when`**** expressions** – If working with `enum` or `sealed` classes, make sure all cases are covered.

## Conclusion

Kotlin’s `when` expression is a powerful and flexible alternative to `switch` statements, providing greater readability and functionality. Whether you are evaluating values, checking types, handling enums, or working with sealed classes, `when` expressions make conditional logic simpler and more expressive. By understanding and utilizing `when` effectively, you can write cleaner, more maintainable Kotlin code.

Mastering `when` expressions will enhance your ability to write concise, efficient, and readable Kotlin programs. Happy coding!
