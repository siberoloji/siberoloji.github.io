---
draft: false
title: Variance (in/out) in Kotlin Programming Language
linkTitle: Variance (in/out)
translationKey: variance-inout-in-kotlin
weight: 200
description: This blog post explores variance in Kotlin, a powerful feature that allows developers to handle subtyping relationships in generic types.
date: 2025-02-14
url: variance-inout-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Variance
featured_image: /images/kotlin-1.png
---
## Introduction

Variance is a crucial concept in Kotlin's type system that helps manage subtyping relationships in generic types. Understanding variance is essential for writing robust and type-safe code, especially when working with collections, function parameters, and return types.

Kotlin introduces two keywords—**`in`** and **`out`**—to define how generic type parameters behave in terms of subtyping. These keywords allow for more flexible and safe use of generics compared to Java's wildcard types.

In this blog post, we'll explore:

- What variance is
- Covariance (`out` keyword)
- Contravariance (`in` keyword)
- How variance affects function parameters and return types
- Real-world examples and best practices

## Understanding Variance

Variance determines how a generic type relates to its subtypes. In simpler terms, it defines whether a generic class or function can accept subtypes (`out`) or supertypes (`in`).

Consider this example:

```kotlin
open class Animal
class Dog : Animal()
class Cat : Animal()
```

If `List<Dog>` were a subtype of `List<Animal>`, we could safely pass a list of dogs where a list of animals is expected. However, mutability in collections makes this tricky because allowing modifications could lead to type safety issues.

To manage such scenarios, Kotlin provides two variance modifiers: `out` and `in`.

## Covariance (`out` Keyword)

Covariance allows a generic type to be **substitutable** for a supertype. In Kotlin, we declare a type as covariant using the `out` modifier.

### Example

```kotlin
interface Producer<out T> {
    fun produce(): T
}
```

Here, `T` is used only as a **return type** (produced value). The `out` modifier means `Producer<Dog>` is a subtype of `Producer<Animal>`, making it safe to use in a broader context.

### Why Covariance Works

A covariant type parameter is **read-only**—it can only be used as an output. If Kotlin allowed modifications, type safety issues could arise. Example:

```kotlin
fun feedAnimals(producer: Producer<Animal>) {
    val animal: Animal = producer.produce()
}

val dogProducer: Producer<Dog> = object : Producer<Dog> {
    override fun produce(): Dog = Dog()
}

feedAnimals(dogProducer) // Allowed because Producer<Dog> is a subtype of Producer<Animal>
```

Since `Dog` is a subtype of `Animal`, it is safe to use `Producer<Dog>` wherever `Producer<Animal>` is required.

## Contravariance (`in` Keyword)

Contravariance works in the opposite way—allowing a generic type to accept **supertypes**. This is useful when dealing with consumers that take values but don’t return them.

### Example

```kotlin
interface Consumer<in T> {
    fun consume(item: T)
}
```

Here, `T` is used only as an **input parameter**. The `in` modifier means `Consumer<Animal>` is a subtype of `Consumer<Dog>`, allowing more flexible assignments.

### Why Contravariance Works

A contravariant type parameter is **write-only**—it can only be used as an input, ensuring type safety.

```kotlin
fun trainDogs(trainer: Consumer<Dog>) {
    trainer.consume(Dog())
}

val animalTrainer: Consumer<Animal> = object : Consumer<Animal> {
    override fun consume(item: Animal) {
        println("Training an animal: ${item::class.simpleName}")
    }
}

trainDogs(animalTrainer) // Allowed because Consumer<Animal> is a supertype of Consumer<Dog>
```

Since `Animal` is a broader type than `Dog`, it is safe to use `Consumer<Animal>` where `Consumer<Dog>` is expected.

## Function Parameter and Return Type Variance

Kotlin's function types also follow variance rules:

- **Function return types are covariant (`out`)**.
- **Function parameter types are contravariant (`in`)**.

Example:

```kotlin
val producer: () -> Animal = { Dog() } // Covariant return type
val consumer: (Dog) -> Unit = { animal: Animal -> println(animal) } // Contravariant parameter
```

## Real-World Applications

### 1. Using Variance in Collections

Kotlin’s `List<T>` is declared as `List<out T>`, meaning it is **covariant**.

```kotlin
val animals: List<Animal> = listOf(Dog(), Cat()) // Allowed because List is covariant
```

However, `MutableList<T>` is **invariant**, meaning it cannot accept subtypes without explicit type casting.

```kotlin
val dogs: MutableList<Dog> = mutableListOf(Dog())
// val animals: MutableList<Animal> = dogs // Compilation error!
```

### 2. Variance in Function Interfaces

Consider a function interface for event handling:

```kotlin
interface EventListener<in T> {
    fun onEvent(event: T)
}
```

This allows handling events of a subtype while still being assigned to a supertype listener:

```kotlin
val animalEventListener: EventListener<Animal> = object : EventListener<Animal> {
    override fun onEvent(event: Animal) {
        println("Handling event for ${event::class.simpleName}")
    }
}

val dogEventListener: EventListener<Dog> = animalEventListener // Allowed due to contravariance
```

## Best Practices

- Use `out` when a type is **only** produced (e.g., producers, collections for reading).
- Use `in` when a type is **only** consumed (e.g., event handlers, function parameters).
- Avoid using variance when both reading and writing are necessary (e.g., `MutableList<T>`).
- Use variance to make APIs more flexible and type-safe.

## Conclusion

Variance in Kotlin (`in` and `out`) provides a powerful way to handle generics safely. Understanding when to use **covariance (`out`)** and **contravariance (`in`)** ensures that you can design APIs that are both flexible and type-safe.

By following these principles, you can write more reusable, robust, and maintainable Kotlin code.
