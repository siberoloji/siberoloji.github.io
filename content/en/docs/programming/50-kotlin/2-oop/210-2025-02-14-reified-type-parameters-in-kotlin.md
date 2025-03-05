---
draft: false
title: Reified Type Parameters in Kotlin
linkTitle: Reified Type Parameters
translationKey: reified-type-parameters-in-kotlin
weight: 210
description: This article explores reified type parameters in Kotlin, a feature that allows developers to retain type information at runtime.
url: reified-type-parameters-in-kotlin
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
  - Reified Type Parameters
featured_image: /images/kotlin-1.png
---
# Reified Type Parameters in Kotlin: A Deep Dive

Kotlin, a modern programming language developed by JetBrains, is known for its expressive syntax, safety features, and interoperability with Java. One of the powerful features of Kotlin is **reified type parameters**, which provide a way to work with generics more effectively at runtime. In this article, we will explore what reified type parameters are, how they work, and where they can be useful.

## Understanding Generics in Kotlin

Before diving into reified type parameters, it is important to understand how generics work in Kotlin. Generics allow developers to write code that can handle multiple types while maintaining type safety. For instance, a generic function in Kotlin might look like this:

```kotlin
fun <T> genericFunction(value: T) {
    println(value)
}
```

Here, `<T>` represents a type parameter, which means that `genericFunction` can accept a parameter of any type.

However, Kotlin (like Java) has **type erasure**, meaning that type information is lost at runtime. This means you cannot directly check the type of `T` inside the function, leading to limitations when working with generics.

## The Problem of Type Erasure

Consider the following example:

```kotlin
inline fun <T> checkType(value: Any) {
    if (value is T) {
        println("Value is of type T")
    } else {
        println("Value is not of type T")
    }
}
```

This function will result in a compilation error: **Cannot check for instance of erased type: T**. This happens because Kotlin follows Java's generics model, which erases type information at runtime. Since `T` is erased, the `is` check does not work.

## What Are Reified Type Parameters?

To solve this issue, Kotlin provides **reified type parameters**, which allow us to retain type information at runtime when used within inline functions. The keyword **reified** ensures that the type parameter remains available after compilation.

Here is an example of how reified type parameters work:

```kotlin
inline fun <reified T> checkType(value: Any) {
    if (value is T) {
        println("Value is of type ${T::class.simpleName}")
    } else {
        println("Value is not of type ${T::class.simpleName}")
    }
}

fun main() {
    checkType<String>("Hello")  // Output: Value is of type String
    checkType<Int>("Hello")     // Output: Value is not of type Int
}
```

### How Reified Works

1. The function `checkType` is **inline**, meaning its bytecode will be directly inserted wherever it is used, avoiding unnecessary function calls.
2. The `reified` keyword tells the compiler to keep the type information of `T`.
3. Since `T` is not erased, we can use `is` checks and access the class type (`T::class`).

## Benefits of Using Reified Type Parameters

Reified type parameters provide multiple advantages over normal generics:

### 1. Type Checking at Runtime

Unlike regular generics where type information is erased, reified types allow checking and casting at runtime:

```kotlin
inline fun <reified T> castTo(value: Any): T? {
    return if (value is T) value else null
}
```

This ensures safer type conversions without unchecked casts.

### 2. Eliminating the Need for `Class` Parameters

In Java and non-reified Kotlin functions, you often need to pass `Class<T>` as a parameter to retain type information:

```kotlin
fun <T> getGenericClass(clazz: Class<T>): T {
    return clazz.newInstance()
}
```

With reified types, this is no longer necessary:

```kotlin
inline fun <reified T> createInstance(): T {
    return T::class.java.getDeclaredConstructor().newInstance()
}
```

### 3. Improved Reflection Support

Since the type is preserved, reified types integrate well with Kotlin’s reflection features:

```kotlin
inline fun <reified T> printClassName() {
    println(T::class.qualifiedName)
}
```

## Limitations of Reified Type Parameters

Despite their advantages, reified type parameters come with some limitations:

1. **Only Works in Inline Functions**: Reified parameters require inlining, so they cannot be used in regular functions.
2. **Cannot Be Used with Non-Reified Functions**: Since they exist only at the call site, they cannot be passed as parameters to other functions.
3. **May Increase Code Size**: Inlining can lead to increased code size if used excessively.

## When to Use Reified Type Parameters

Reified type parameters are particularly useful in the following scenarios:

- **Type-safe JSON parsing**:

  ```kotlin
  inline fun <reified T> parseJson(json: String): T {
      return Gson().fromJson(json, T::class.java)
  }
  ```

- **Generic Factory Methods**:

  ```kotlin
  inline fun <reified T> newInstance(): T {
      return T::class.java.getDeclaredConstructor().newInstance()
  }
  ```

- **Filtering Lists by Type**:

  ```kotlin
  inline fun <reified T> List<Any>.filterByType(): List<T> {
      return this.filterIsInstance<T>()
  }
  ```

## Conclusion

Reified type parameters in Kotlin offer a powerful way to retain type information at runtime while leveraging inline functions. They solve the problem of type erasure, allowing for type checking, instance creation, and reflection-based operations without requiring explicit `Class<T>` parameters. While they come with some constraints, their benefits make them an essential feature for developers working with generics in Kotlin.

Understanding and applying reified type parameters effectively can lead to cleaner, safer, and more expressive Kotlin code. If you are working with generics and need runtime type information, leveraging reified types can significantly simplify your implementations.
