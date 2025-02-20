---
draft: false
title: Flow API in Kotlin Programming Language
linkTitle: Flow API
translationKey: flow-api-in-kotlin-programming-language
weight: 70
description: we will dive deep into Flow API in Kotlin, exploring its features, advantages, and real-world use cases.
date: 2025-02-20
url: flow-api-in-kotlin-programming-language
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
Kotlin has revolutionized modern Android and backend development with its concise syntax and powerful features. One of its most important advancements is **Flow API**, introduced as a part of **Kotlin Coroutines** to handle asynchronous and reactive programming efficiently.  

In this article, we will dive deep into **Flow API** in Kotlin, exploring its features, advantages, and real-world use cases.  

---

## **What is Flow API in Kotlin?**  

**Flow API** is a **cold** asynchronous stream that emits multiple values sequentially. It is designed to **handle streams of data** asynchronously while following Kotlin's structured concurrency principles.  

Unlike **suspend functions**, which return a single value asynchronously, **Flow** can emit multiple values over time.  

### **Key Characteristics of Flow API:**  

- **Cold Stream**: The flow starts running only when a collector collects the emitted values.  
- **Sequential Emission**: Values are emitted one after another, ensuring sequential processing.  
- **Cancellation Support**: Flow is cooperative and cancels execution when the collector stops collecting.  
- **Backpressure Handling**: Flow handles **backpressure** automatically, ensuring optimal data flow without overwhelming the system.  

---

## **Why Use Flow API Instead of Other Reactive Approaches?**  

Before **Flow API**, developers often used **LiveData**, **RxJava**, or **Callbacks** to handle asynchronous operations. However, these approaches had certain drawbacks:  

| Approach   | Drawbacks |
|------------|-----------|
| **Callbacks** | Hard to manage in complex scenarios (callback hell) |
| **RxJava**  | Steep learning curve, requires additional dependencies |
| **LiveData** | Tied to Android lifecycle, not suitable for non-UI layers |

**Flow API** solves these issues by providing **a structured, lightweight, and efficient** way to manage streams without extra dependencies.

---

## **How to Use Flow API in Kotlin?**  

Let's explore the fundamental concepts of **Flow API** in Kotlin with examples.  

### **1. Creating a Simple Flow**  

To create a **Flow**, use the `flow {}` builder.  

```kotlin
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.delay

fun simpleFlow(): Flow<Int> = flow {
    for (i in 1..5) {
        delay(1000) // Simulate a delay
        emit(i) // Emit values one by one
    }
}

fun main() = runBlocking {
    simpleFlow().collect { value ->
        println("Received: $value")
    }
}
```

### **Explanation:**  

- The `flow {}` builder creates a **Flow** that emits numbers **1 to 5** with a delay of 1 second between each emission.  
- `emit(value)` is used to send values to the collector.  
- `collect {}` function is used to **collect** and process the emitted values.  

---

## **Flow Builders in Kotlin**  

Besides `flow {}`, Kotlin provides several built-in flow builders:  

| Flow Builder | Description |
|--------------|-------------|
| **flowOf()** | Creates a flow from a fixed set of values. |
| **asFlow()** | Converts a collection or sequence into a flow. |
| **channelFlow()** | Provides a more flexible way to emit values using coroutines. |

### **Example:** Using `flowOf()` and `asFlow()`  

```kotlin
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.runBlocking

fun main() = runBlocking {
    // Using flowOf()
    flowOf(1, 2, 3, 4, 5).collect { println(it) }

    // Using asFlow()
    listOf("A", "B", "C").asFlow().collect { println(it) }
}
```

---

## **Flow Operators: Transforming and Filtering Data**  

Flow provides powerful **operators** to process emitted data efficiently.  

### **1. Transforming Data**  

- `map {}` → Transforms each value.  
- `flatMapConcat {}` → Flattens nested flows sequentially.  
- `flatMapMerge {}` → Flattens nested flows concurrently.  

```kotlin
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.runBlocking

fun main() = runBlocking {
    (1..5).asFlow()
        .map { it * 2 } // Multiply each value by 2
        .collect { println(it) }
}
```

### **2. Filtering Data**  

- `filter {}` → Filters elements based on a condition.  
- `take(n)` → Takes the first `n` elements and cancels the flow afterward.  

```kotlin
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.runBlocking

fun main() = runBlocking {
    (1..10).asFlow()
        .filter { it % 2 == 0 } // Take even numbers
        .collect { println(it) }
}
```

---

## **Handling Flow Lifecycle and Cancellation**  

### **1. Flow is Cancellable**  

Flows respect coroutine cancellation and automatically stop execution when the collector stops collecting.  

```kotlin
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.withTimeoutOrNull

fun main() = runBlocking {
    withTimeoutOrNull(2500) { // Cancel flow after 2.5 seconds
        simpleFlow().collect { println(it) }
    }
    println("Flow cancelled!")
}
```

### **2. Flow with Lifecycle Awareness (onEach and launchIn)**  

`onEach {}` executes an action for each emitted value, while `launchIn(scope)` collects the flow in a coroutine scope.  

```kotlin
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.GlobalScope

fun main() = runBlocking {
    val flow = (1..5).asFlow()
        .onEach { println("Processing $it") }
        .launchIn(GlobalScope) // Runs in a separate coroutine scope
}
```

---

## **StateFlow and SharedFlow: Advanced Flow Concepts**  

### **1. StateFlow: Managing State in Kotlin**  

`StateFlow` is a special type of **Flow** that always holds the latest value and emits updates. It is a great replacement for **LiveData** in non-UI layers.  

```kotlin
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

fun main() = runBlocking {
    val stateFlow = MutableStateFlow(0)

    launch {
        for (i in 1..5) {
            delay(500)
            stateFlow.value = i
        }
    }

    stateFlow.collect { println("Received: $it") }
}
```

### **2. SharedFlow: For Hot Streams**  

Unlike **Flow**, `SharedFlow` is **hot**, meaning it does not depend on collectors to start emitting values. It is useful for event-based scenarios.  

```kotlin
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.launch

fun main() = runBlocking {
    val sharedFlow = MutableSharedFlow<String>()

    launch {
        sharedFlow.emit("Hello")
        sharedFlow.emit("World")
    }

    sharedFlow.collect { println(it) }
}
```

---

## **Conclusion**  

The **Flow API in Kotlin** is a powerful tool for handling **asynchronous streams of data** efficiently. With its **built-in operators, lifecycle awareness, and structured concurrency support**, Flow is a great alternative to **RxJava** and **LiveData**.  

### **Key Takeaways:**  

✔ **Flow is cold** and starts execution only when collected.  
✔ Supports **cancellation, transformations, and filtering**.  
✔ **StateFlow** and **SharedFlow** extend Flow's capabilities for state management and event handling.  
✔ Ideal for handling **network requests, database queries, and UI updates**.  

By mastering Flow API, you can **write efficient, reactive, and scalable** Kotlin applications! 🚀
