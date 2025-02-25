---
draft: false
title: Infix Functions in Kotlin
linkTitle: Infix Functions
translationKey: infix-functions-in-kotlin
weight: 150
description: Learn how to use infix functions in Kotlin to simplify your code.
date: 2025-02-18
url: infix-functions-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Infix Functions
featured_image: /images/kotlin-1.png
---

Infix functions are a unique feature in Kotlin that allows you to call certain functions using a more natural, expression-like syntax. This comprehensive guide explores infix functions, their uses, benefits, and best practices for implementation.

## What Are Infix Functions?

Infix functions are member functions or extension functions marked with the `infix` modifier that can be called using infix notation - omitting the dot and parentheses from the call. These functions must have exactly one parameter.

### Basic Syntax

```kotlin
infix fun Int.times(str: String): String {
    return str.repeat(this)
}

// Usage:
val result = 3 times "Hello " // Instead of 3.times("Hello ")
println(result) // Prints: Hello Hello Hello
```

## Key Characteristics

### 1. Declaration Requirements

To declare an infix function, you must meet these criteria:

- Must be a member function or extension function
- Must have exactly one parameter
- Must be marked with the `infix` modifier
- Cannot have variable-length arguments or default values

```kotlin
class MyString(val value: String) {
    infix fun concat(other: String): MyString {
        return MyString(this.value + other)
    }
}

// Extension function
infix fun String.addPrefix(prefix: String): String {
    return "$prefix$this"
}
```

### 2. Precedence Rules

Infix function calls have lower precedence than arithmetic operators, type casts, and the `rangeTo` operator:

```kotlin
// Precedence example
val result = 1 shl 2 + 3 // Equivalent to: 1 shl (2 + 3)
val range = 1..10 step 2 // Equivalent to: (1..10).step(2)
```

## Practical Examples

### 1. Building Domain-Specific Languages (DSLs)

```kotlin
class Time(val hours: Int, val minutes: Int) {
    infix fun and(minutes: Int): Time {
        return Time(this.hours, this.minutes + minutes)
    }
}

infix fun Int.hours(minutes: Int): Time {
    return Time(this, minutes)
}

// Usage
val meetingTime = 2 hours 30 and 15
println("Meeting at ${meetingTime.hours}:${meetingTime.minutes}")
```

### 2. Collection Operations

```kotlin
data class Pair<A, B>(val first: A, val second: B) {
    infix fun to(other: B): Pair<A, B> {
        return Pair(first, other)
    }
}

// Custom collection operations
infix fun <T> List<T>.intersectWith(other: List<T>): List<T> {
    return this.filter { it in other }
}

// Usage
val list1 = listOf(1, 2, 3, 4)
val list2 = listOf(3, 4, 5, 6)
val common = list1 intersectWith list2
```

### 3. Mathematical Operations

```kotlin
data class Vector2D(val x: Int, val y: Int) {
    infix fun dot(other: Vector2D): Int {
        return this.x * other.x + this.y * other.y
    }
    
    infix fun cross(other: Vector2D): Int {
        return this.x * other.y - this.y * other.x
    }
}

// Usage
val v1 = Vector2D(2, 3)
val v2 = Vector2D(4, 5)
val dotProduct = v1 dot v2
val crossProduct = v1 cross v2
```

### 4. Testing and Verification

```kotlin
infix fun <T> T.shouldBe(expected: T) {
    if (this != expected) {
        throw AssertionError("Expected $expected but got $this")
    }
}

infix fun <T> T.shouldBeIn(collection: Collection<T>) {
    if (this !in collection) {
        throw AssertionError("$this should be in $collection")
    }
}

// Usage
fun testExample() {
    val result = calculateSomething()
    result shouldBe 42
    
    val name = "John"
    name shouldBeIn listOf("John", "Jane", "Bob")
}
```

## Advanced Use Cases

### 1. Building Type-Safe Builders

```kotlin
class HTMLBuilder {
    private var content = StringBuilder()
    
    infix fun tag(name: String): HTMLBuilder {
        content.append("<$name>")
        return this
    }
    
    infix fun content(text: String): HTMLBuilder {
        content.append(text)
        return this
    }
    
    infix fun end(name: String): HTMLBuilder {
        content.append("</$name>")
        return this
    }
    
    override fun toString() = content.toString()
}

// Usage
val html = HTMLBuilder()
    .tag("div") content "Hello" end "div"
println(html) // Prints: <div>Hello</div>
```

### 2. State Machines

```kotlin
sealed class State {
    object Idle : State()
    object Running : State()
    object Completed : State()
}

class StateMachine {
    private var currentState: State = State.Idle
    
    infix fun transition(event: String): State {
        currentState = when(currentState) {
            is State.Idle -> if (event == "start") State.Running else currentState
            is State.Running -> if (event == "complete") State.Completed else currentState
            is State.Completed -> currentState
        }
        return currentState
    }
}

// Usage
val machine = StateMachine()
machine transition "start"
machine transition "complete"
```

## Best Practices

### 1. When to Use Infix Functions

Use infix functions when:

- Creating domain-specific languages (DSLs)
- The function represents a natural binary operation
- The syntax makes the code more readable
- Building fluent interfaces

### 2. When to Avoid Infix Functions

Avoid infix functions when:

- The operation is not naturally binary
- The function name is unclear without context
- Regular method calls would be more readable
- The operation is complex or has side effects

### 3. Naming Conventions

```kotlin
// Good - clear and descriptive
infix fun Int.power(exponent: Int): Int
infix fun String.containsAll(words: List<String>): Boolean

// Bad - unclear or confusing
infix fun Int.process(value: Int): Int
infix fun String.apply(something: Any): String
```

## Common Patterns and Examples

### 1. Configuration Building

```kotlin
class Configuration {
    var host: String = ""
    var port: Int = 0
    
    infix fun on(port: Int): Configuration {
        this.port = port
        return this
    }
    
    infix fun with(host: String): Configuration {
        this.host = host
        return this
    }
}

// Usage
val config = Configuration() with "localhost" on 8080
```

### 2. Pair Creation

```kotlin
infix fun <A, B> A.to(that: B): Pair<A, B> = Pair(this, that)

// Usage
val pair = "key" to "value"
val map = mapOf("one" to 1, "two" to 2)
```

## Conclusion

Infix functions in Kotlin provide a powerful way to create more readable and expressive code. They're particularly useful for:

- Building domain-specific languages
- Creating fluent interfaces
- Implementing mathematical operations
- Writing test assertions

Key takeaways:

- Use infix functions when they enhance code readability
- Follow the single parameter requirement
- Consider precedence rules when combining operations
- Choose clear and descriptive function names

Remember that while infix functions can make code more expressive, they should be used judiciously. The goal is to enhance code readability and maintainability while keeping the code intuitive for other developers to understand and use.
