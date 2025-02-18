---
draft: false
title: Inline Functions in Kotlin
linkTitle: Inline Functions
translationKey: inline-functions-in-kotlin
weight: 140
description: A comprehensive guide to inline functions in Kotlin, including their benefits, use cases, and best practices.
date: 2025-02-18
url: inline-functions-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Inline Functions
featured_image: /images/kotlin-1.png
---
Inline functions are a powerful feature in Kotlin that can significantly improve performance when working with higher-order functions and lambdas. This comprehensive guide explores inline functions, their benefits, use cases, and best practices.

## What Are Inline Functions?

Inline functions are functions marked with the `inline` keyword that tells the Kotlin compiler to copy the function's bytecode to every call site. Instead of creating function objects and generating calls, the compiler substitutes the function's body directly where it's called.

### Basic Syntax

```kotlin
inline fun performOperation(operation: () -> Unit) {
    println("Before operation")
    operation()
    println("After operation")
}
```

## Benefits of Inline Functions

### 1. Reduced Memory Overhead

Without inlining, each lambda creation typically requires instantiating an object:

```kotlin
// Without inline
fun regularHigherOrder(action: () -> Unit) {
    action()
}

// Creates a new object for lambda
regularHigherOrder { println("Hello") }

// With inline
inline fun inlinedHigherOrder(action: () -> Unit) {
    action()
}

// No object creation, code is inlined
inlinedHigherOrder { println("Hello") }
```

### 2. Performance Improvements

Especially beneficial for frequently called functions:

```kotlin
inline fun measureTime(block: () -> Unit): Long {
    val start = System.nanoTime()
    block()
    return System.nanoTime() - start
}
```

### 3. Non-Local Returns

Inline functions allow using return statements inside lambdas:

```kotlin
fun processItems(items: List<String>) {
    items.forEach { item ->
        if (item.isEmpty()) {
            return // Returns from processItems
        }
        println(item)
    }
}
```

## Advanced Features of Inline Functions

### noinline Modifier

Sometimes you don't want to inline every lambda parameter:

```kotlin
inline fun executeWithLog(
    noinline action: () -> Unit,
    logger: () -> Unit
) {
    logger()
    action() // This lambda won't be inlined
    logger()
}
```

### crossinline Modifier

Used when you need to ensure a lambda parameter doesn't contain non-local returns:

```kotlin
inline fun runTransaction(crossinline action: () -> Unit) {
    Transaction {
        action() // Guaranteed not to have non-local returns
    }
}
```

### Reified Type Parameters

One of the most powerful features of inline functions is the ability to access type parameters at runtime:

```kotlin
inline fun <reified T> isType(value: Any): Boolean {
    return value is T
}

// Usage
val result = isType<String>("test") // true
val result2 = isType<Int>("test")   // false
```

## Practical Examples

### 1. Custom Control Structures

```kotlin
inline fun executeCatching(action: () -> Unit, handler: (Exception) -> Unit) {
    try {
        action()
    } catch (e: Exception) {
        handler(e)
    }
}

// Usage
executeCatching(
    action = { 
        // Risky operation
        throw IllegalStateException("Error")
    },
    handler = { e ->
        println("Caught exception: $e")
    }
)
```

### 2. Resource Management

```kotlin
inline fun <T> withResource(
    resource: AutoCloseable,
    block: (AutoCloseable) -> T
): T {
    try {
        return block(resource)
    } finally {
        resource.close()
    }
}

// Usage
val fileContent = withResource(FileInputStream("file.txt")) { fis ->
    fis.bufferedReader().readText()
}
```

### 3. Custom Collection Operations

```kotlin
inline fun <T> List<T>.forEachWithIndex(action: (index: Int, T) -> Unit) {
    for (index in this.indices) {
        action(index, this[index])
    }
}

// Usage
listOf("a", "b", "c").forEachWithIndex { index, value ->
    println("Item at $index is $value")
}
```

## Best Practices and Considerations

### 1. When to Use Inline Functions

Use inline functions when:

- Working with higher-order functions that are called frequently
- Using reified type parameters
- Needing non-local returns in lambdas
- Implementing custom control structures

### 2. When to Avoid Inline Functions

Avoid inlining when:

- The function body is large (increases code size)
- The function is rarely called
- The function doesn't take function parameters
- The function is part of a public API that changes frequently

### 3. Performance Considerations

```kotlin
// Good candidate for inlining
inline fun repeat(times: Int, action: () -> Unit) {
    for (index in 0 until times) {
        action()
    }
}

// Poor candidate for inlining (large function body)
inline fun processData(data: List<String>, processor: (String) -> Unit) {
    // Large function body with complex logic
    // Better as a regular function
}
```

## Common Patterns

### 1. Timing Operations

```kotlin
inline fun measureTimeMillis(block: () -> Unit): Long {
    val start = System.currentTimeMillis()
    block()
    return System.currentTimeMillis() - start
}

// Usage
val time = measureTimeMillis {
    // Time-consuming operation
    Thread.sleep(1000)
}
```

### 2. Type-Safe Builders

```kotlin
class HTMLBuilder {
    var content = ""
    
    inline fun tag(name: String, block: () -> Unit) {
        content += "<$name>"
        block()
        content += "</$name>"
    }
}

inline fun html(block: HTMLBuilder.() -> Unit): String {
    return HTMLBuilder().apply(block).content
}

// Usage
val htmlContent = html {
    tag("div") {
        tag("p") {
            content += "Hello, World!"
        }
    }
}
```

### 3. Scoped Operations

```kotlin
inline fun <T> T.also(block: (T) -> Unit): T {
    block(this)
    return this
}

// Usage
val numbers = mutableListOf<Int>().also {
    it.add(1)
    it.add(2)
    println("List initialized with: $it")
}
```

## Conclusion

Inline functions are a powerful Kotlin feature that can significantly improve performance when used appropriately. They're particularly useful for:

- Eliminating the overhead of lambda expressions
- Creating custom control structures
- Working with reified type parameters
- Implementing resource management patterns

However, it's important to use them judiciously, considering factors like:

- Function size and complexity
- Frequency of calls
- API stability requirements
- Overall code maintainability

Remember that while inline functions can provide performance benefits, they should be used thoughtfully and not as a default choice for all functions. The key is to understand their strengths and limitations to make informed decisions about when to use them in your Kotlin code.
