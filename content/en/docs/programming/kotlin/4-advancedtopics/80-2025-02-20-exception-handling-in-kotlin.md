---
draft: false
title: Exception Handling in Kotlin
linkTitle: Exception Handling
translationKey: exception-handling-in-kotlin
weight: 80
description: We will explore how exception handling works in Kotlin and examine best practices for implementing error handling in your applications.
date: 2025-02-20
url: exception-handling-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Exception Handling
featured_image: /images/kotlin-1.png
---
Exception handling is a crucial aspect of writing robust and reliable software. Kotlin, being a modern programming language, provides sophisticated mechanisms for handling exceptions effectively. In this comprehensive guide, we'll explore how exception handling works in Kotlin and examine best practices for implementing error handling in your applications.

## Understanding Exceptions in Kotlin

In Kotlin, all exceptions are descendants of the `Throwable` class. Unlike Java, Kotlin doesn't differentiate between checked and unchecked exceptions. This design decision was made to increase code flexibility and reduce boilerplate code while maintaining type safety.

### Types of Exceptions

Kotlin's exception hierarchy includes several main categories:

1. `Error`: Represents serious problems that a reasonable application should not try to catch
2. `Exception`: The base class for all exceptions that applications might want to catch
3. `RuntimeException`: Represents exceptions that can occur during runtime

## Basic Exception Handling

The fundamental construct for exception handling in Kotlin is the try-catch block. Here's a basic example:

```kotlin
fun readNumber(str: String): Int {
    try {
        return str.toInt()
    } catch (e: NumberFormatException) {
        println("The string '$str' is not a valid number")
        return 0
    }
}
```

### Multiple Catch Blocks

Kotlin allows you to handle different types of exceptions differently:

```kotlin
try {
    // Some code that might throw exceptions
    processFile()
} catch (e: FileNotFoundException) {
    println("File not found: ${e.message}")
} catch (e: IOException) {
    println("Error reading file: ${e.message}")
} finally {
    // Cleanup code that always executes
    closeResources()
}
```

## The Finally Block

The `finally` block contains code that executes regardless of whether an exception occurred or not. It's commonly used for cleanup operations:

```kotlin
fun processResource() {
    var resource: Resource? = null
    try {
        resource = acquireResource()
        // Work with resource
    } catch (e: Exception) {
        println("Error processing resource: ${e.message}")
    } finally {
        resource?.close()
    }
}
```

## Try as an Expression

One of Kotlin's unique features is that `try` can be used as an expression:

```kotlin
val number = try {
    str.toInt()
} catch (e: NumberFormatException) {
    null
}
```

This approach is particularly useful when you want to handle exceptions in a functional style.

## Throwing Exceptions

In Kotlin, you can throw exceptions using the `throw` expression:

```kotlin
fun validateAge(age: Int) {
    if (age < 0) {
        throw IllegalArgumentException("Age cannot be negative")
    }
    // Process valid age
}
```

### Custom Exceptions

Creating custom exceptions in Kotlin is straightforward:

```kotlin
class CustomBusinessException(
    message: String,
    val errorCode: Int
) : Exception(message)

fun processBusinessLogic() {
    throw CustomBusinessException("Invalid business state", 1001)
}
```

## Using the Elvis Operator with Exceptions

Kotlin's Elvis operator (`?:`) can be combined with `throw` for concise null checking:

```kotlin
fun getUser(id: String): User {
    return userRepository.findById(id) 
        ?: throw UserNotFoundException("User not found with id: $id")
}
```

## Exception Handling Best Practices

### 1. Be Specific with Exception Types

Instead of catching generic exceptions, catch specific ones:

```kotlin
// Not recommended
try {
    // Some code
} catch (e: Exception) {
    // Generic handling
}

// Recommended
try {
    // Some code
} catch (e: IllegalArgumentException) {
    // Specific handling
} catch (e: IllegalStateException) {
    // Specific handling
}
```

### 2. Use Try-with-Resources Pattern

For resource management, Kotlin provides the `use` function:

```kotlin
fun readFile(path: String): List<String> {
    File(path).bufferedReader().use { reader ->
        return reader.readLines()
    }
}
```

### 3. Proper Exception Propagation

Consider whether to handle or propagate exceptions:

```kotlin
fun processData(data: String) {
    try {
        // Process data
    } catch (e: Exception) {
        logger.error("Error processing data", e)
        throw BusinessException("Unable to process data", e)
    }
}
```

### 4. Logging and Documentation

Always include proper logging and documentation for exception handling:

```kotlin
/**
 * Processes user data and returns a result.
 * @throws UserNotFoundException if the user doesn't exist
 * @throws ValidationException if the data is invalid
 */
fun processUserData(userId: String): Result {
    try {
        // Process user data
    } catch (e: Exception) {
        logger.error("Error processing user data for userId: $userId", e)
        throw e
    }
}
```

## Advanced Exception Handling Patterns

### Using Result Type

Kotlin's standard library includes the `Result` class for handling operations that can fail:

```kotlin
fun computeValue(): Result<Int> {
    return kotlin.runCatching {
        // Potentially failing computation
        someComplexComputation()
    }
}

// Usage
val result = computeValue()
    .onSuccess { value -> println("Computation succeeded: $value") }
    .onFailure { exception -> println("Computation failed: ${exception.message}") }
```

### Coroutine Exception Handling

When working with coroutines, Kotlin provides special mechanisms for handling exceptions:

```kotlin
val exceptionHandler = CoroutineExceptionHandler { _, exception ->
    println("Caught exception: ${exception.message}")
}

GlobalScope.launch(exceptionHandler) {
    // Potentially throwing code
}
```

## Conclusion

Exception handling in Kotlin offers a robust and flexible approach to managing errors in your applications. By leveraging Kotlin's features like try-expressions, null safety, and coroutine exception handling, you can write more reliable and maintainable code. Remember to follow best practices such as being specific with exception types, proper resource management, and maintaining good documentation and logging practices.

The key is to find the right balance between handling exceptions at the appropriate level and maintaining code readability. With Kotlin's tools and patterns, you can implement error handling that is both effective and elegant.