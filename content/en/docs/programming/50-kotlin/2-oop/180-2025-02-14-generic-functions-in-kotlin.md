---
draft: false
title: Generic Functions in Kotlin
linkTitle: Generic Functions
translationKey: generic-functions-in-kotlin
weight: 180
description: Learn how to use generic functions in Kotlin to write reusable and type-safe code.
date: 2025-02-14
url: generic-functions-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
featured_image: /images/kotlin-1.png
---
## Introduction

Kotlin, the modern and expressive programming language developed by JetBrains, has gained immense popularity due to its conciseness and powerful features. One such feature that enhances code reusability and type safety is **generic functions**. Generic functions allow developers to write flexible and reusable code while ensuring compile-time type safety.

In this blog post, we will explore what generic functions are, how they work, and the benefits they offer. We will also discuss their syntax, use cases, and best practices for writing clean and efficient generic functions in Kotlin.

---

## What Are Generic Functions?

Generic functions in Kotlin allow you to define functions that can work with different data types while maintaining type safety. By using generics, you avoid redundancy and write more maintainable code.

A generic function is defined using **type parameters**, which are placed inside angle brackets (`<>`) before the function's parameter list. This enables the function to operate on various types while preserving type safety.

### Example of a Generic Function

```kotlin
fun <T> printValue(value: T) {
    println(value)
}

fun main() {
    printValue(42)         // Works with Int
    printValue("Hello")    // Works with String
    printValue(3.14)       // Works with Double
}
```

In the above example:
- `<T>` is a **type parameter**, allowing the function to accept any type.
- `printValue(value: T)` prints the given value regardless of its type.
- The function is called with different types, demonstrating its flexibility.

---

## Benefits of Generic Functions

1. **Code Reusability** – You can write a function once and use it with different types.
2. **Type Safety** – Generics ensure compile-time safety, reducing runtime errors.
3. **Better Performance** – Unlike reflection or type checking at runtime, generics are resolved at compile-time.
4. **Improved Readability** – The code becomes more concise and avoids boilerplate.

---

## Understanding Generic Constraints

While generics provide flexibility, sometimes you need to restrict the types that can be used. This is done using **generic constraints**.

### Using `T : Type` Constraint

You can restrict a generic type parameter to be a subtype of a specific class or interface using `:`.

```kotlin
fun <T : Number> add(a: T, b: T): Double {
    return a.toDouble() + b.toDouble()
}

fun main() {
    println(add(5, 10))      // Works with Int
    println(add(3.5, 2.5))  // Works with Double
    // println(add("5", "10")) // Compilation Error: String is not a Number
}
```

Here, `T : Number` ensures that only numeric types can be passed to the `add` function, preventing invalid type usage.

---

## Variance in Generic Functions

### Covariant (`out` Keyword)

Covariance allows a generic type to be **substituted by its subtype**. This is useful when a function returns a value.

```kotlin
fun <T : Number> getNumber(): T {
    throw NotImplementedError("Example function")
}
```

To ensure safe type usage, you can specify `out T`, which means `T` is only **produced** but never **consumed**.

```kotlin
fun <T : Number> processNumbers(list: List<T>) {
    for (item in list) {
        println(item.toDouble())
    }
}
```

### Contravariant (`in` Keyword)

Contravariance allows a generic type to be **substituted by its supertype**. This is useful when a function accepts values.

```kotlin
fun <T> copyFromSource(source: MutableList<in T>, destination: MutableList<T>) {
    for (item in source) {
        destination.add(item as T)
    }
}
```

Here, `in T` ensures that the function can accept a **supertype** of `T` but does not return it.

---

## Generic Extensions

Kotlin allows defining **generic extension functions**, making code more expressive.

### Example: Generic Extension Function

```kotlin
fun <T> List<T>.printAll() {
    for (item in this) {
        println(item)
    }
}

fun main() {
    val numbers = listOf(1, 2, 3)
    val words = listOf("Kotlin", "Java", "Swift")

    numbers.printAll()
    words.printAll()
}
```

This approach enhances code readability by applying generic functionality to existing classes.

---

## Real-World Use Cases

### 1. Generic Repository Pattern

Generics are widely used in repository patterns to handle various data models.

```kotlin
class Repository<T> {
    private val items = mutableListOf<T>()
    
    fun addItem(item: T) {
        items.add(item)
    }
    
    fun getAll(): List<T> = items
}

fun main() {
    val intRepo = Repository<Int>()
    intRepo.addItem(10)
    println(intRepo.getAll())
    
    val stringRepo = Repository<String>()
    stringRepo.addItem("Kotlin")
    println(stringRepo.getAll())
}
```

### 2. Generic API Response Handling

Generics help in handling API responses dynamically.

```kotlin
data class ApiResponse<T>(val data: T?, val error: String?)
```

This approach provides flexibility when dealing with different API response structures.

---

## Best Practices for Generic Functions

1. **Use Meaningful Type Parameters** – Use `T`, `R`, or descriptive names like `E` (Element) for clarity.
2. **Apply Constraints When Necessary** – Restrict types using `T : SuperType` to prevent invalid usage.
3. **Minimize Complexity** – Overusing generics can make code harder to understand.
4. **Prefer Inline Functions for Performance** – When using reified types, leverage `inline` for better efficiency.

```kotlin
inline fun <reified T> checkType(value: Any) {
    if (value is T) {
        println("Matched type: ${T::class.simpleName}")
    } else {
        println("Type mismatch")
    }
}
```

---

## Conclusion

Generic functions in Kotlin provide an elegant and type-safe way to write reusable and efficient code. They improve maintainability, reduce duplication, and enhance performance. By mastering generics, you can write more flexible and robust applications.

From simple functions to advanced use cases like repositories and API handling, generics unlock the full potential of Kotlin’s type system. Following best practices ensures clean, understandable, and efficient code.

Have you used generic functions in your Kotlin projects? Share your experiences and thoughts in the comments below!
