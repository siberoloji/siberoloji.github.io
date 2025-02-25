---
draft: false
title: Single-Expression Functions in Kotlin
linkTitle: Single-Expression Functions
translationKey: single-expression-functions-in-kotlin
weight: 160
description: Learn how to use single-expression functions in Kotlin to simplify your code.
date: 2025-02-09
url: single-expression-functions-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - single-expression functions
featured_image: /images/kotlin-1.png
---
Single-expression functions are one of Kotlin's most elegant features, offering a concise way to write simple functions while maintaining readability and expressiveness. In this comprehensive guide, we'll explore everything you need to know about single-expression functions, from basic concepts to advanced usage patterns.

## Understanding Single-Expression Functions

Single-expression functions, also known as expression-body functions, are functions that consist of a single expression. These functions can be written without curly braces and the explicit return statement, making the code more concise and often more readable.

### Basic Syntax

Let's start with a comparison between traditional and single-expression functions:

```kotlin
// Traditional function
fun double(number: Int): Int {
    return number * 2
}

// Single-expression function
fun double(number: Int): Int = number * 2

// With type inference
fun double(number: Int) = number * 2
```

In single-expression functions, the equals sign (=) replaces the curly braces and return statement, making the code more compact without sacrificing clarity.

## Type Inference in Single-Expression Functions

Kotlin's smart compiler can often infer the return type of single-expression functions, allowing you to omit the return type declaration:

```kotlin
// The compiler infers these return types automatically
fun calculateSquare(n: Int) = n * n               // Returns Int
fun calculateAverage(a: Double, b: Double) = (a + b) / 2  // Returns Double
fun getMessage() = "Hello, World!"                // Returns String
```

However, there are cases where explicitly declaring the return type improves code clarity:

```kotlin
fun computeComplexValue(input: Double): Double = 
    Math.pow(input, 2) + Math.sqrt(input)
```

## Common Use Cases

### Mathematical Operations

Single-expression functions excel at representing mathematical operations:

```kotlin
fun square(n: Int) = n * n
fun cube(n: Int) = n * n * n
fun hypotenuse(a: Double, b: Double) = sqrt(a * a + b * b)
fun circumference(radius: Double) = 2 * PI * radius
```

### String Manipulation

They're also great for simple string operations:

```kotlin
fun capitalize(str: String) = str.uppercase()
fun getInitials(name: String) = name.split(" ")
    .map { it.first() }
    .joinToString("")
fun formatGreeting(name: String) = "Hello, $name!"
```

### Collection Operations

Single-expression functions work well with collection transformations:

```kotlin
fun List<Int>.sum() = this.reduce { acc, n -> acc + n }
fun List<String>.joinWithCommas() = this.joinToString(", ")
fun <T> List<T>.firstOrNull() = if (isEmpty()) null else this[0]
```

## Advanced Usage Patterns

### With Extension Functions

Single-expression functions are particularly useful when creating extension functions:

```kotlin
fun String.addPrefix(prefix: String) = "$prefix$this"
fun Int.isEven() = this % 2 == 0
fun <T> List<T>.secondOrNull() = if (size >= 2) this[1] else null
```

### With Generic Types

They work seamlessly with generic types:

```kotlin
fun <T> List<T>.firstAndLast() = Pair(first(), last())
fun <T : Comparable<T>> List<T>.sorted() = this.sortedBy { it }
fun <T, R> T.transform(transformer: (T) -> R) = transformer(this)
```

### With Higher-Order Functions

Single-expression functions can effectively return or work with lambdas:

```kotlin
fun makeCounter() = { start: Int -> generateSequence(start) { it + 1 } }
fun <T> predicate(value: T) = { item: T -> item == value }
fun composer(f: (Int) -> Int) = { x: Int -> f(f(x)) }
```

## Best Practices and Guidelines

### When to Use Single-Expression Functions

Single-expression functions are most appropriate when:

1. The function logic can be expressed in a single, clear expression
2. The function performs a simple transformation or calculation
3. The function returns a direct mapping or conversion
4. The function implements a simple business rule

```kotlin
// Good examples
fun isAdult(age: Int) = age >= 18
fun fullName(first: String, last: String) = "$first $last"
fun celsiusToFahrenheit(celsius: Double) = celsius * 9/5 + 32
```

### When to Avoid Single-Expression Functions

Avoid single-expression functions when:

1. The expression becomes too complex
2. Multiple operations need to be performed
3. The function requires error handling
4. The logic includes multiple branches

```kotlin
// Better as a regular function
fun calculateDiscount(price: Double, quantity: Int): Double {
    val baseDiscount = if (quantity > 10) 0.1 else 0.05
    val volumeDiscount = quantity * 0.01
    return price * (1 - (baseDiscount + volumeDiscount))
}
```

## Advanced Techniques

### Combining with Null Safety

Single-expression functions work well with Kotlin's null safety features:

```kotlin
fun String?.orEmpty() = this ?: ""
fun <T> T?.orDefault(default: T) = this ?: default
fun <T> List<T>?.orEmpty() = this ?: emptyList()
```

### With Scope Functions

They can be effectively combined with scope functions:

```kotlin
fun createUser(name: String) = User(name).apply {
    created = LocalDateTime.now()
    status = Status.ACTIVE
}

fun processData(data: String) = data.let {
    it.trim().lowercase()
}
```

### With Infix Notation

Single-expression functions can be declared as infix functions:

```kotlin
infix fun Int.power(exponent: Int) = Math.pow(this.toDouble(), exponent.toDouble())
infix fun <T> List<T>.elementAt(index: Int) = this[index]
infix fun String.repeat(times: Int) = this.repeat(times)
```

## Performance Considerations

Single-expression functions are compiled to the same bytecode as their traditional counterparts, so there's no performance overhead. However, there are some considerations:

```kotlin
// Potentially inefficient
fun processLargeList(list: List<Int>) = list
    .filter { it > 0 }
    .map { it * 2 }
    .sum()

// More efficient as a regular function with intermediate variables
fun processLargeList(list: List<Int>): Int {
    val filtered = list.filter { it > 0 }
    val doubled = filtered.map { it * 2 }
    return doubled.sum()
}
```

## Conclusion

Single-expression functions are a powerful feature in Kotlin that can make your code more concise and readable when used appropriately. They shine in situations where functions perform simple transformations, calculations, or return direct mappings. However, it's important to balance conciseness with readability and maintainability.

Remember these key points when working with single-expression functions:

- Use them for simple, clear expressions
- Take advantage of type inference when appropriate
- Consider readability when deciding between single-expression and traditional functions
- Combine them with other Kotlin features like extension functions and null safety
- Don't force complex logic into single expressions

By following these guidelines and understanding when to use single-expression functions, you can write more elegant and maintainable Kotlin code while taking full advantage of the language's expressive features.
