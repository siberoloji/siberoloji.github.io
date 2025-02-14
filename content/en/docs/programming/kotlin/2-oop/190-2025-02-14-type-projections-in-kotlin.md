---
draft: false
title: Type Projections in Kotlin
linkTitle: Type Projections
translationKey: type-projections-in-kotlin
weight: 190
description: Type projections are a powerful feature in Kotlin that help manage generic types while maintaining type safety.
url: type-projections-in-kotlin
date: 2025-02-14
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
Kotlin is a modern programming language that is widely used for Android development, backend services, and cross-platform applications. One of its key strengths is its robust type system, which includes features like null safety, type inference, and generics.

When working with generics in Kotlin, we often encounter situations where we need to restrict how types are used. This is where **type projections** come into play. Type projections provide a way to enforce type safety while still allowing flexibility in working with generic classes. In this blog post, we will explore type projections in Kotlin, their use cases, and how they compare to Java's approach to generics.

## Understanding Generics in Kotlin

Before diving into type projections, let's quickly revisit generics. Generics allow us to define classes, interfaces, and functions that can operate on a variety of types while maintaining type safety. Here is a simple example:

```kotlin
class Box<T>(val item: T) {
    fun getItem(): T {
        return item
    }
}
```

Here, `T` is a generic type parameter that allows `Box` to hold any type. We can create instances like:

```kotlin
val intBox = Box(10)
val stringBox = Box("Hello")
```

This flexibility makes generics powerful, but it also introduces the need for constraints to prevent unsafe operations, which leads us to **type projections**.

## What Are Type Projections?

Type projections in Kotlin are a way to define how generic types can be used as function parameters. They help prevent **type conflicts** and maintain type safety by limiting what operations can be performed on a generic type.

Kotlin provides **in-projections** (`in` keyword) and **out-projections** (`out` keyword) to control variance when working with generics.

### Covariant Type Projections (`out` Keyword)

Covariance means that a class with a generic type can be safely assigned to a more general type. In Kotlin, covariance is defined using the `out` keyword.

#### Example

```kotlin
interface Producer<out T> {
    fun produce(): T
}
```

Here, `Producer<T>` is declared as `out T`, meaning it can only **produce** values of type `T` but cannot consume them. This ensures type safety by preventing modifications that could break variance.

Consider the following usage:

```kotlin
class StringProducer : Producer<String> {
    override fun produce(): String {
        return "Hello"
    }
}

val stringProducer: Producer<String> = StringProducer()
val anyProducer: Producer<Any> = stringProducer  // Allowed because of 'out'
```

Since `String` is a subtype of `Any`, assigning `Producer<String>` to `Producer<Any>` is safe. This is known as **covariance**.

#### Why Use `out`?

- Safe assignment of subtypes.
- Used when we only produce values (not consume them).
- Common in APIs that return values of a generic type.

### Contravariant Type Projections (`in` Keyword)

Contravariance is the opposite of covariance. It allows a class with a generic type parameter to be assigned to a more specific type. This is defined using the `in` keyword.

#### Example

```kotlin
interface Consumer<in T> {
    fun consume(item: T)
}
```

Here, `Consumer<T>` is declared as `in T`, meaning it can only **consume** values of type `T` but cannot produce them.

Consider the following usage:

```kotlin
class StringConsumer : Consumer<String> {
    override fun consume(item: String) {
        println("Consumed: $item")
    }
}

val stringConsumer: Consumer<String> = StringConsumer()
val anyConsumer: Consumer<Any> = stringConsumer  // Not allowed
val objectConsumer: Consumer<Any> = object : Consumer<Any> {
    override fun consume(item: Any) {
        println("Consumed object: $item")
    }
}
val specificConsumer: Consumer<String> = objectConsumer // Allowed because of 'in'
```

Since `String` is a subtype of `Any`, assigning `Consumer<Any>` to `Consumer<String>` is safe. This is known as **contravariance**.

#### Why Use `in`?

- Safe assignment of supertypes.
- Used when we only consume values (not produce them).
- Common in APIs that accept values of a generic type.

## Star Projections (`*`)

In some cases, we may not know the exact type parameter when working with generics. Kotlin provides **star projections (`*`)** to handle such situations.

#### Example

```kotlin
fun printList(list: List<*>) {
    for (item in list) {
        println(item)
    }
}
```

Here, `List<*>` means a list of **some unknown type**. The only allowed operations are:

- Reading values (as `Any?`).
- Not adding new elements (to prevent type mismatches).

### Use Cases for Star Projections

- When the type parameter is unknown.
- When working with generic collections where mutation is not needed.

## Comparison to Java’s Generics

Kotlin’s type projections are similar to Java’s **wildcards (`? extends` and `? super`)**, but they provide a more expressive and type-safe alternative.

| Feature | Kotlin | Java |
|---------|--------|------|
| Covariance | `out` | `? extends` |
| Contravariance | `in` | `? super` |
| Star Projection | `*` | `?` (unbounded wildcard) |

Kotlin’s approach simplifies generics by making variance explicit at the declaration level (`out` and `in`), avoiding the need for wildcards in method parameters.

## Conclusion

Type projections in Kotlin provide a powerful way to work with generics while maintaining type safety. The `out` keyword enables covariance by allowing type production, while the `in` keyword allows contravariance by enabling type consumption. Additionally, star projections (`*`) help manage unknown types in a generic context.

By understanding and utilizing type projections effectively, Kotlin developers can write safer and more flexible generic code, avoiding common pitfalls associated with type mismatches.

Understanding type projections is essential for mastering generics in Kotlin, especially when designing reusable APIs or working with collections. Whether you're dealing with covariant producers, contravariant consumers, or star-projected lists, these concepts ensure robust and maintainable code.
