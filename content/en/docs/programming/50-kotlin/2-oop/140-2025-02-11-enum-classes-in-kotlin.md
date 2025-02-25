---
draft: false
title: Enum Classes in Kotlin
linkTitle: Enum Classes
translationKey: enum-classes-in-kotlin
weight: 140
description: This article explains what enum classes are, how to use them effectively, and some advanced techniques to make the most out of them in your Kotlin applications.
date: 2025-02-11
url: enum-classes-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Enum Classes
featured_image: /images/kotlin-1.png
---
## Introduction

Kotlin, a modern programming language developed by JetBrains, has become one of the most popular choices for Android and backend development due to its concise syntax and powerful features. One of the most useful features in Kotlin is the `enum` class, which provides a way to define a set of named constants. Unlike Java’s traditional enums, Kotlin’s `enum` classes offer additional flexibility, including properties, methods, and interfaces.

In this article, we will explore what enum classes are, how to use them effectively, and some advanced techniques to make the most out of them in your Kotlin applications.

## What is an Enum Class?

An `enum` (short for "enumeration") class in Kotlin is a special class that represents a fixed set of constants. Enum classes are particularly useful when dealing with predefined values, such as days of the week, error codes, states of an application, or user roles.

In Kotlin, an `enum` class is defined using the `enum` keyword followed by the class name and a comma-separated list of constants:

```kotlin
enum class Direction {
    NORTH, SOUTH, EAST, WEST
}
```

Each constant inside the `enum` class is an instance of that class. Let’s explore how we can work with enum classes in Kotlin.

## Adding Properties and Methods to Enums

Kotlin allows enum constants to have properties and methods, making them more powerful than Java’s enums. Let’s modify our `Direction` enum to include a property that describes the movement:

```kotlin
enum class Direction(val description: String) {
    NORTH("Moving Up"),
    SOUTH("Moving Down"),
    EAST("Moving Right"),
    WEST("Moving Left");

    fun printDescription() {
        println(description)
    }
}
```

Here, each enum constant has a property `description`, and we have also added a method `printDescription()` that prints the description.

## Enum with Custom Functions

Since enum constants are instances of a class, we can also define abstract methods that each enum constant must implement:

```kotlin
enum class Operation {
    ADD {
        override fun calculate(x: Int, y: Int): Int = x + y
    },
    SUBTRACT {
        override fun calculate(x: Int, y: Int): Int = x - y
    },
    MULTIPLY {
        override fun calculate(x: Int, y: Int): Int = x * y
    },
    DIVIDE {
        override fun calculate(x: Int, y: Int): Int = x / y
    };

    abstract fun calculate(x: Int, y: Int): Int
}
```

In this example, each constant of `Operation` provides its own implementation of the `calculate` function.

## Accessing Enum Constants

You can access an enum constant using dot notation:

```kotlin
val direction = Direction.NORTH
println(direction) // Output: NORTH
```

You can also retrieve all enum constants using the `values()` function:

```kotlin
for (dir in Direction.values()) {
    println(dir)
}
```

To get an enum constant by its name, use the `valueOf()` function:

```kotlin
val dir = Direction.valueOf("SOUTH")
println(dir) // Output: SOUTH
```

## Enum Inheritance and Implementing Interfaces

While enum classes cannot inherit from other classes, they can implement interfaces. This is useful when you need shared behavior across different enum constants:

```kotlin
interface Drawable {
    fun draw()
}

enum class Shape : Drawable {
    CIRCLE {
        override fun draw() = println("Drawing a Circle")
    },
    SQUARE {
        override fun draw() = println("Drawing a Square")
    },
    TRIANGLE {
        override fun draw() = println("Drawing a Triangle")
    }
}
```

Here, each enum constant provides its own implementation of the `draw` method from the `Drawable` interface.

## When to Use Enum Classes?

Enum classes are useful in a variety of scenarios, such as:

- Defining finite state values (e.g., status of an order: `PENDING`, `SHIPPED`, `DELIVERED`).
- Representing a set of predefined options (e.g., days of the week, user roles).
- Implementing strategy patterns by defining functions within each enum constant.

However, you should avoid using enums when the set of values is likely to change frequently or when you need a more dynamic approach (e.g., using sealed classes for complex scenarios).

## Conclusion

Enum classes in Kotlin provide a powerful way to define a fixed set of constants while allowing for properties, methods, and interface implementations. They are an excellent choice for scenarios where you need predefined, immutable values with additional behavior.

By leveraging enums effectively, you can write cleaner, more maintainable Kotlin code that is easy to understand and extend. Whether you are working on an Android app or a backend service, enum classes can help you manage state and options efficiently.

Happy coding with Kotlin!
