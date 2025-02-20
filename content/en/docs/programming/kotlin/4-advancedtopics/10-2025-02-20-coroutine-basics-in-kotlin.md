---
draft: false
title: Coroutine Basics in Kotlin
linkTitle: Coroutine Basics
translationKey: coroutine-basics-in-kotlin
weight: 10
description: This guide explains the basics of coroutines in Kotlin, including what they are, how they work, and how to implement them in your projects.
date: 2025-02-20
url: coroutine-basics-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Coroutines
featured_image: /images/kotlin-1.png
---
## Introduction  

Kotlin has gained immense popularity as a modern, expressive, and concise programming language, particularly for Android development. One of its most powerful features is **coroutines**, which allow developers to write asynchronous and non-blocking code in a more readable and efficient manner.  

If you’re new to coroutines, this guide will walk you through the basics, explaining what coroutines are, how they work, and how to implement them in your Kotlin projects.  

## What Are Coroutines?  

Coroutines are lightweight threads that facilitate asynchronous programming without the complexity of traditional multithreading. They allow developers to write **suspending functions** that can execute asynchronously without blocking the main thread.  

Unlike traditional threads, coroutines are:  

- **Lightweight** – They use fewer system resources than threads.  
- **Suspendable** – They can be paused and resumed without blocking the thread.  
- **Structured** – Kotlin provides structured concurrency to manage coroutines effectively.  

### Difference Between Threads and Coroutines  

| Feature        | Threads                | Coroutines            |  
|---------------|------------------------|------------------------|  
| Resource Usage | Heavy (managed by OS)  | Lightweight (managed by runtime) |  
| Performance   | Expensive to create and switch | Optimized for concurrency |  
| Execution Control | Managed by OS        | Managed by Kotlin runtime |  
| Blocking     | Blocks the thread       | Can suspend without blocking |  

## Getting Started with Coroutines in Kotlin  

To use coroutines in Kotlin, you need to add the necessary dependencies to your project:  

```kotlin
dependencies {
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.4")
}
```  

### The `suspend` Keyword  

Kotlin introduces the `suspend` keyword to define functions that can be **paused and resumed** without blocking the thread.  

Example:  

```kotlin
suspend fun fetchData() {
    delay(2000) // Simulate network request
    println("Data fetched!")
}
```  

Here, `delay(2000)` suspends execution for 2 seconds without blocking the thread. This makes `fetchData()` a **suspending function**, which can only be called from another coroutine or suspending function.  

### Launching Coroutines  

Kotlin provides multiple ways to launch coroutines. The most common are:  

#### 1. `GlobalScope.launch` (Unstructured Concurrency)  

```kotlin
import kotlinx.coroutines.*

fun main() {
    GlobalScope.launch {
        delay(1000)
        println("Coroutine executed!")
    }
    Thread.sleep(2000) // Keeps JVM alive
}
```  

This launches a coroutine in a global scope that runs independently of the application's lifecycle. However, using `GlobalScope.launch` is discouraged for structured concurrency reasons.  

#### 2. `runBlocking` (Blocking Coroutine)  

```kotlin
import kotlinx.coroutines.*

fun main() = runBlocking {
    launch {
        delay(1000)
        println("Inside coroutine!")
    }
    println("Main thread continues")
}
```  

`runBlocking` creates a coroutine that **blocks** the current thread until execution completes. It’s useful for testing and scripting but should be avoided in production.  

#### 3. `CoroutineScope.launch` (Structured Concurrency)  

```kotlin
import kotlinx.coroutines.*

fun main() = runBlocking {
    val scope = CoroutineScope(Dispatchers.Default)
    scope.launch {
        delay(1000)
        println("Coroutine running!")
    }
    println("Main function ends")
}
```  

Using `CoroutineScope` ensures proper lifecycle management of coroutines, avoiding memory leaks.  

## Coroutine Builders  

Kotlin provides different coroutine builders to control coroutine execution:  

### 1. `launch` – Fire-and-Forget  

`launch` is used when you don’t need a result. It starts a coroutine and continues execution without waiting for it.  

```kotlin
CoroutineScope(Dispatchers.IO).launch {
    delay(1000)
    println("Task completed")
}
```  

### 2. `async` – Returns a Result  

`async` is used when you need to **return a value** from a coroutine. It returns a `Deferred` object, which can be awaited using `.await()`.  

```kotlin
import kotlinx.coroutines.*

fun main() = runBlocking {
    val result = async {
        delay(1000)
        42 // Returning a value
    }
    println("The answer is ${result.await()}")
}
```  

### 3. `withContext` – Switches Coroutine Context  

`withContext` is used to **switch the coroutine context** while executing a suspending function.  

```kotlin
import kotlinx.coroutines.*

suspend fun fetchData(): String {
    return withContext(Dispatchers.IO) {
        delay(1000)
        "Data Loaded"
    }
}

fun main() = runBlocking {
    println(fetchData())
}
```  

## Coroutine Dispatchers  

Coroutines run on different threads based on **dispatchers**. The most common ones are:  

- `Dispatchers.Main` – Runs on the **UI thread** (used in Android development).  
- `Dispatchers.IO` – Optimized for **network and disk** operations.  
- `Dispatchers.Default` – Optimized for **CPU-intensive tasks**.  
- `Dispatchers.Unconfined` – Starts on the caller thread but can move execution elsewhere.  

Example of using dispatchers:  

```kotlin
import kotlinx.coroutines.*

fun main() = runBlocking {
    launch(Dispatchers.IO) {
        println("Running on IO thread: ${Thread.currentThread().name}")
    }
}
```  

## Handling Exceptions in Coroutines  

To handle exceptions in coroutines, Kotlin provides **CoroutineExceptionHandler**:  

```kotlin
import kotlinx.coroutines.*

fun main() = runBlocking {
    val handler = CoroutineExceptionHandler { _, exception ->
        println("Caught exception: ${exception.message}")
    }

    val job = launch(handler) {
        throw RuntimeException("Something went wrong!")
    }

    job.join()
}
```  

Using structured concurrency and proper error handling prevents unexpected crashes.  

## Best Practices for Using Coroutines  

To make the most of coroutines, follow these best practices:  

1. **Use Structured Concurrency** – Always launch coroutines inside a scope (`CoroutineScope`).  
2. **Use the Right Dispatcher** – Optimize performance by choosing the right dispatcher.  
3. **Handle Exceptions Gracefully** – Use `try-catch` or `CoroutineExceptionHandler`.  
4. **Avoid GlobalScope.launch** – It leads to unstructured concurrency and potential memory leaks.  
5. **Use `withContext` for Blocking Operations** – Never block the main thread.  

## Conclusion  

Kotlin coroutines simplify asynchronous programming by providing a structured, readable, and efficient way to manage background tasks. By understanding how to create, manage, and handle coroutines properly, you can write better and more efficient Kotlin applications.  

If you’re working on Android or backend applications, mastering coroutines will significantly improve your development experience. Start experimenting with different coroutine builders and contexts, and you'll soon realize the power of Kotlin’s concurrency model.  
