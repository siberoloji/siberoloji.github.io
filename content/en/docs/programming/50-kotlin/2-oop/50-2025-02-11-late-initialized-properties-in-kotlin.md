---
draft: false
title: Late-initialized Properties in Classes and Properties in Kotlin
linkTitle: Late-initialized Properties
translationKey: late-initialized-properties-in-kotlin
weight: 50
description: Learn about late-initialized properties, their usage, alternatives, and best practices in Kotlin classes.
date: 2025-02-11
url: late-initialized-properties-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - late-initialized properties
featured_image: /images/kotlin-1.png
---
Kotlin, as a modern programming language, introduces various property types and initialization techniques to enhance developer productivity and safety. One such feature is **late-initialized properties**, which allow properties to be initialized at a later stage, avoiding the need for nullable types in some scenarios. Understanding late-initialized properties in Kotlin is crucial for efficient class design and avoiding common pitfalls related to property initialization.

This article explores **late-initialized properties**, their usage, alternatives, and best practices when working with properties in Kotlin classes.

## Understanding Properties in Kotlin

Before diving into late-initialized properties, it's essential to understand how properties work in Kotlin. Unlike Java, where fields and methods are separate, Kotlin introduces **properties**, which combine a field with getter and setter functions.

Properties in Kotlin can be classified as:

- **Immutable (`val`)**: Read-only properties that cannot be reassigned after initialization.
- **Mutable (`var`)**: Properties that can change values during the object’s lifetime.
- **Nullable (`?`)**: Properties that can hold `null` values.
- **Lazy-initialized (`lazy`)**: Properties initialized when accessed for the first time.
- **Late-initialized (`lateinit`)**: Properties initialized at a later stage.

## What Are Late-initialized Properties?

In Kotlin, properties must be initialized when declared. However, in cases where the initialization cannot happen in the constructor, Kotlin provides the `lateinit` modifier for properties.

### Declaration of a Late-initialized Property

A `lateinit` property is declared using the `lateinit` keyword before a `var` property:

```kotlin
class User {
    lateinit var name: String
}
```

This means `name` will be assigned a value later but **must** be initialized before use.

### Why Use `lateinit`?

- **Avoiding nullability (`?`)**: Instead of using a nullable property (`var name: String?`), `lateinit` allows defining a property that is guaranteed to be initialized before usage.
- **Deferred Initialization**: Useful when the value is not available at the time of object creation.
- **Dependency Injection**: Helps in frameworks like Dagger or Koin where dependencies are injected after object construction.

### Late-initialized Property Usage Example

```kotlin
class UserProfile {
    lateinit var email: String

    fun initializeProfile(email: String) {
        this.email = email
    }
    
    fun printEmail() {
        println(email) // Ensure the property is initialized before use
    }
}

fun main() {
    val profile = UserProfile()
    profile.initializeProfile("user@example.com")
    profile.printEmail()
}
```

## Important Considerations and Pitfalls

### 1. `lateinit` Only Works with `var`

`lateinit` cannot be used with `val` properties because `val` properties must be initialized at object creation.

**Incorrect:**

```kotlin
class Example {
    lateinit val id: String // Compilation error
}
```

### 2. Allowed Data Types for `lateinit`

`lateinit` is only applicable to **non-primitive types**. It cannot be used with `Int`, `Double`, `Boolean`, etc.

**Incorrect:**

```kotlin
class Settings {
    lateinit var count: Int // Compilation error
}
```

For primitives, use nullable types (`var count: Int? = null`) or default values.

### 3. Checking Initialization with `::property.isInitialized`

Before using a `lateinit` property, you can check if it has been initialized to prevent runtime exceptions.

```kotlin
class Book {
    lateinit var title: String

    fun printTitle() {
        if (::title.isInitialized) {
            println("Book title: $title")
        } else {
            println("Title is not initialized yet!")
        }
    }
}
```

### 4. Runtime Exception if Accessed Before Initialization

Accessing a `lateinit` property before initialization results in `UninitializedPropertyAccessException`.

```kotlin
fun main() {
    val book = Book()
    book.printTitle()  // "Title is not initialized yet!"
}
```

## Alternative to `lateinit`: Lazy Initialization

When dealing with properties that can be initialized when first accessed, `lazy` initialization is an alternative.

### `lazy` vs `lateinit`

| Feature            | `lateinit` | `lazy` |
|-------------------|-----------|--------|
| Type             | `var`      | `val`  |
| Initialization   | Set manually later | Initialized on first access |
| Null Safety      | Non-null only | Supports any type |
| Primitive Support | No | Yes |
| Thread Safety | No | Yes (by default) |

### Example of `lazy` Initialization

```kotlin
class DatabaseConnection {
    val connection: String by lazy {
        println("Initializing connection...")
        "Connected to DB"
    }
}

fun main() {
    val db = DatabaseConnection()
    println(db.connection) // Triggers initialization
}
```

## When to Use `lateinit`

Use `lateinit` when:

- The property must be **mutable** (`var`).
- Initialization is **deferred** but **mandatory** before use.
- You want to **avoid nullability (`?`)** in properties.
- Using **Dependency Injection frameworks**.
- Working with **Android Views in Activities and Fragments** (`lateinit var button: Button`).

## When to Avoid `lateinit`

- If the property can be **initialized at declaration**, avoid `lateinit`.
- When dealing with **primitive types** (use `lazy` or default values instead).
- When thread safety is a concern (`lateinit` is not thread-safe, but `lazy` can be).
- If the property’s initialization is conditional and optional.

## Conclusion

Late-initialized properties (`lateinit`) in Kotlin provide an elegant way to handle properties that require deferred initialization. They are particularly useful in dependency injection, Android development, and cases where nullability should be avoided. However, improper use can lead to runtime exceptions and debugging challenges.

When deciding between `lateinit` and alternatives like `lazy` initialization, consider factors like mutability, thread safety, and necessity of deferred initialization. By understanding and applying these concepts effectively, Kotlin developers can write more robust and maintainable code.
