---
draft: false
title: Generic Classes in Kotlin
linkTitle: Generic Classes
translationKey: generic-classes-in-kotlin
weight: 170
description: "Generic classes in Kotlin: A comprehensive guide to using generics to create flexible and reusable code"
date: 2025-02-14
url: generic-classes-in-kotlin
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

Kotlin, a modern and expressive programming language, introduces a powerful feature known as **generics**. Generics allow developers to create classes, methods, and functions that operate on different types while maintaining type safety. This article will explore the concept of **generic classes** in Kotlin, covering their benefits, syntax, real-world use cases, and best practices.

## What are Generics in Kotlin?

Generics enable developers to write flexible and reusable code by allowing type parameters. Instead of specifying a concrete type, a generic class or function works with different types without sacrificing type safety.

For example, consider a simple class that holds a value:

```kotlin
class Box(val value: Any)
```

This class can store any type of value, but it lacks type safety. When retrieving the value, you might need explicit casting, leading to potential runtime errors. Instead, we can use generics:

```kotlin
class Box<T>(val value: T)
```

Here, `T` is a **type parameter**, making `Box` a generic class. Now, `Box` can hold any type while ensuring type safety at compile time.

## Syntax of Generic Classes

In Kotlin, a generic class is defined using angle brackets (`<>`) with a type parameter. Here's a basic syntax structure:

```kotlin
class GenericClass<T>(val data: T) {
    fun getData(): T {
        return data
    }
}
```

### Example Usage

```kotlin
fun main() {
    val intBox = GenericClass(10)   // GenericClass<Int>
    val stringBox = GenericClass("Kotlin")  // GenericClass<String>

    println(intBox.getData())  // Output: 10
    println(stringBox.getData())  // Output: Kotlin
}
```

In this example:

- `T` represents a placeholder for a type.
- `GenericClass` can store any type (`Int`, `String`, etc.).
- Type safety is ensured at compile time.

## Multiple Type Parameters

A generic class can also have multiple type parameters:

```kotlin
class PairBox<T, U>(val first: T, val second: U) {
    fun printValues() {
        println("First: $first, Second: $second")
    }
}
```

### Example Usage

```kotlin
fun main() {
    val pair = PairBox("Kotlin", 2024)
    pair.printValues()  // Output: First: Kotlin, Second: 2024
}
```

This feature is useful when handling collections of related types, such as key-value pairs.

## Generic Constraints

Sometimes, you may want to restrict the types a generic class can accept. Kotlin allows **type constraints** using the `where` keyword or direct specification with `:`.

```kotlin
class NumberBox<T : Number>(val number: T) {
    fun getDouble(): Double {
        return number.toDouble()
    }
}
```

### Example Usage

```kotlin
fun main() {
    val intBox = NumberBox(10)  // Allowed
    val doubleBox = NumberBox(10.5)  // Allowed
    // val stringBox = NumberBox("Hello")  // Compilation error

    println(intBox.getDouble())  // Output: 10.0
    println(doubleBox.getDouble())  // Output: 10.5
}
```

Here, `T : Number` ensures that only subtypes of `Number` (e.g., `Int`, `Double`, `Float`) can be used.

## Variance in Generics

Kotlin provides variance modifiers to control how generic types behave in relation to subtyping.

### Covariance (`out` Keyword)

The `out` keyword makes a type parameter **covariant**, meaning it can be used as a return type but not as a function parameter.

```kotlin
interface Producer<out T> {
    fun produce(): T
}
```

Example:

```kotlin
class StringProducer : Producer<String> {
    override fun produce(): String = "Hello, Kotlin!"
}

fun main() {
    val producer: Producer<Any> = StringProducer() // Allowed due to 'out'
    println(producer.produce())  // Output: Hello, Kotlin!
}
```

### Contravariance (`in` Keyword)

The `in` keyword makes a type parameter **contravariant**, meaning it can only be used as a function parameter but not as a return type.

```kotlin
interface Consumer<in T> {
    fun consume(value: T)
}
```

Example:

```kotlin
class StringConsumer : Consumer<String> {
    override fun consume(value: String) {
        println("Consumed: $value")
    }
}

fun main() {
    val consumer: Consumer<String> = StringConsumer()
    consumer.consume("Generics in Kotlin")
}
```

### Use-site Variance

Kotlin allows variance at function usage level using **use-site variance**:

```kotlin
fun copyFromProducer(producer: Producer<out Any>) {
    println(producer.produce())
}
```

This ensures flexibility while maintaining type safety.

## Real-World Use Cases of Generic Classes

1. **Collections API**: Kotlin’s built-in collections like `List<T>`, `Set<T>`, and `Map<K, V>` are generic classes.
2. **Data Wrappers**: Generic classes help create reusable wrappers for data processing.
3. **Repository Patterns**: Used in MVVM architectures for handling database or API responses.
4. **Network Responses**: Used in Retrofit and other frameworks to handle API results with generic response types.

## Best Practices for Using Generic Classes

1. **Use meaningful names**: Avoid single-letter names like `T` unless necessary; use descriptive names like `ItemType` or `ResponseType`.
2. **Avoid unnecessary constraints**: Use type constraints only when required.
3. **Prefer variance modifiers**: Use `out` for producers and `in` for consumers.
4. **Use generics for reusability**: Apply generics only when the class or function benefits from flexibility.

## Conclusion

Generics in Kotlin provide a robust way to write flexible and type-safe code. By understanding the syntax, constraints, and variance concepts, developers can leverage generics effectively in their projects. Whether working with collections, APIs, or repositories, generic classes improve code reusability and maintainability.

Kotlin’s generics make it easier to write efficient and scalable applications while ensuring type safety, making them a valuable tool for any Kotlin developer.
