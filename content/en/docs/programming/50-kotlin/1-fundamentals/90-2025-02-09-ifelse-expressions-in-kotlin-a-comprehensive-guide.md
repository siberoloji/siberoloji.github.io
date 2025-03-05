---
draft: false
title: If/Else Expressions in Kotlin
linkTitle: If/Else Expressions
translationKey: ifelse-expressions-in-kotlin
weight: 90
description: We learn how to use if/else expressions in Kotlin in this comprehensive guide. We will discuss their syntax, various use cases, and best practices, along with examples to help you master this essential concept.
date: 2025-02-09
url: ifelse-expressions-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - If/Else Expressions
featured_image: /images/kotlin-1.png
---
## Introduction

Kotlin, a modern and expressive programming language developed by JetBrains, offers several powerful features that enhance code readability and efficiency. One such feature is **if/else expressions**, which allow developers to control the flow of execution based on conditions. Unlike traditional imperative languages where `if/else` is a statement, in Kotlin, `if/else` is an expression, meaning it can return a value and be assigned to a variable.

In this article, we will explore **if/else expressions** in Kotlin in detail. We will discuss their syntax, various use cases, and best practices, along with examples to help you master this essential concept.

## Understanding If/Else Expressions in Kotlin

In many programming languages, `if/else` is considered a control statement that does not return a value. However, in Kotlin, `if/else` can be used as an **expression** that returns a result.

### Basic Syntax

The basic syntax of an `if/else` expression in Kotlin is:

```kotlin
if (condition) {
    // Code block executed if condition is true
} else {
    // Code block executed if condition is false
}
```

Unlike traditional languages like Java or C++, Kotlin allows `if/else` to return a value, which means it can be assigned to a variable:

```kotlin
val result = if (10 > 5) "Greater" else "Smaller"
println(result) // Output: Greater
```

## Using If/Else as an Expression

Kotlin allows you to use `if/else` expressions as return values. This makes code more concise and eliminates unnecessary variable declarations.

### Example

```kotlin
fun max(a: Int, b: Int): Int {
    return if (a > b) a else b
}

fun main() {
    println(max(10, 20)) // Output: 20
}
```

In this example, the function `max` determines the maximum of two numbers using an `if/else` expression.

### Example with Multiple Branches

```kotlin
fun classifyNumber(num: Int): String {
    return if (num > 0) {
        "Positive"
    } else if (num < 0) {
        "Negative"
    } else {
        "Zero"
    }
}

fun main() {
    println(classifyNumber(-5)) // Output: Negative
}
```

Here, the function `classifyNumber` evaluates a number and returns a corresponding description using multiple `if/else` branches.

## If/Else Expressions with Code Blocks

When using `if/else` expressions with multiple lines of code, always ensure that the last expression inside a block is the return value.

### Example

```kotlin
val message = if (10 > 5) {
    println("Executing if block")
    "Greater"
} else {
    println("Executing else block")
    "Smaller"
}
println(message) // Output: Executing if block \n Greater
```

The above code prints an additional log message before returning the final value.

## Nesting If/Else Expressions

Nested `if/else` expressions can be used when multiple conditions need to be checked sequentially.

### Example

```kotlin
fun determineGrade(score: Int): String {
    return if (score >= 90) {
        "A"
    } else if (score >= 80) {
        "B"
    } else if (score >= 70) {
        "C"
    } else if (score >= 60) {
        "D"
    } else {
        "F"
    }
}

fun main() {
    println(determineGrade(85)) // Output: B
}
```

This function assigns letter grades based on the given score using nested `if/else` expressions.

## Combining If/Else with Logical Operators

Kotlin allows the use of logical operators such as `&&` (AND) and `||` (OR) within `if/else` conditions to simplify logic.

### Example

```kotlin
fun isEligibleForVoting(age: Int, isCitizen: Boolean): String {
    return if (age >= 18 && isCitizen) "Eligible" else "Not Eligible"
}

fun main() {
    println(isEligibleForVoting(20, true)) // Output: Eligible
}
```

## Using If/Else with When Expressions

Kotlin provides the `when` expression, which is often a cleaner alternative to complex `if/else` chains.

### Example

```kotlin
fun checkNumberType(num: Int): String {
    return when {
        num > 0 -> "Positive"
        num < 0 -> "Negative"
        else -> "Zero"
    }
}

fun main() {
    println(checkNumberType(0)) // Output: Zero
}
```

## Best Practices for Using If/Else Expressions

1. **Use expressions instead of statements**: If a value needs to be returned, always use `if/else` as an expression.
2. **Simplify conditions with logical operators**: Reduce redundant conditions using `&&` and `||` operators.
3. **Prefer ********`when`******** expressions for multiple conditions**: When dealing with multiple conditions, consider using `when` for better readability.
4. **Keep expressions concise**: If possible, simplify `if/else` expressions into single-line statements.

## Performance Considerations

In general, `if/else` expressions execute efficiently in Kotlin. However, for highly nested conditions, `when` expressions may provide better readability and performance optimization.

## Conclusion

Kotlin’s `if/else` expressions provide a powerful and concise way to handle conditional logic. Unlike many other languages, `if/else` in Kotlin can be used as an expression, making code more readable and eliminating unnecessary variable assignments. By following best practices and considering alternatives like `when`, developers can write clean, efficient, and maintainable Kotlin code.

Mastering `if/else` expressions will help you write more expressive and elegant Kotlin programs. Happy coding!
