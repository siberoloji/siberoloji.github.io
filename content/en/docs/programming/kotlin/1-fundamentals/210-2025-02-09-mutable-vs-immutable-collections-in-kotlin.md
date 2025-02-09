---
draft: false
title: Mutable vs Immutable Collections in Kotlin
linkTitle: Mutable vs Immutable Collections
translationKey: mutable-vs-immutable-collections-in-kotlin
weight: 210
description: In this guide, we'll explore the differences, benefits, and use cases of mutable and immutable collections in Kotlin.
date: 2025-02-09
url: mutable-vs-immutable-collections-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Collections
  - Mutable
  - Immutable
featured_image: /images/kotlin-1.png
---
Kotlin's collection framework provides both mutable and immutable variants of collections, offering developers flexibility while maintaining code safety. In this comprehensive guide, we'll explore the differences, benefits, and use cases of both collection types.

## Understanding Mutability in Kotlin Collections

Kotlin makes a clear distinction between mutable and immutable collections through its type system. This distinction helps developers make better decisions about data modification and access patterns.

### Basic Differences

Let's start with the fundamental differences:

```kotlin
// Immutable Collections
val immutableList = listOf(1, 2, 3)
val immutableSet = setOf(1, 2, 3)
val immutableMap = mapOf("one" to 1, "two" to 2)

// Mutable Collections
val mutableList = mutableListOf(1, 2, 3)
val mutableSet = mutableSetOf(1, 2, 3)
val mutableMap = mutableMapOf("one" to 1, "two" to 2)
```

## Immutable Collections

### Characteristics and Benefits

1. Thread Safety:

```kotlin
val sharedData = listOf(1, 2, 3, 4, 5)
// Safe to share across threads as it cannot be modified
```

2. Predictable Behavior:

```kotlin
fun processItems(items: List<String>) {
    // We can be confident that items won't be modified
    items.forEach { item ->
        println(item)
    }
}
```

3. Functional Programming Support:

```kotlin
val numbers = listOf(1, 2, 3, 4, 5)
val doubled = numbers.map { it * 2 }
val filtered = numbers.filter { it % 2 == 0 }
```

### Common Operations

```kotlin
fun demonstrateImmutableOperations() {
    val original = listOf(1, 2, 3)
    
    // Creating new collections from operations
    val added = original + 4
    val removed = original - 2
    val combined = original + listOf(4, 5, 6)
    
    // Transformations create new collections
    val mapped = original.map { it * 2 }
    val filtered = original.filter { it > 1 }
}
```

## Mutable Collections

### Characteristics and Benefits

1. In-place Modifications:

```kotlin
val numbers = mutableListOf(1, 2, 3)
numbers.add(4)
numbers.remove(2)
numbers[0] = 10
```

2. Performance Benefits:

```kotlin
fun buildLargeList(): List<Int> {
    val result = mutableListOf<Int>()
    for (i in 1..10000) {
        result.add(i)  // More efficient than creating new immutable lists
    }
    return result
}
```

3. Dynamic Content Management:

```kotlin
class ShoppingCart {
    private val items = mutableListOf<Item>()
    
    fun addItem(item: Item) {
        items.add(item)
    }
    
    fun removeItem(item: Item) {
        items.remove(item)
    }
}
```

### Common Operations

```kotlin
fun demonstrateMutableOperations() {
    val numbers = mutableListOf(1, 2, 3)
    
    // Modifying the collection
    numbers.add(4)
    numbers.addAll(listOf(5, 6))
    numbers.removeAt(0)
    numbers.clear()
    
    // Bulk modifications
    numbers.addAll(1..5)
    numbers.removeAll { it % 2 == 0 }
    numbers.retainAll { it < 4 }
}
```

## Making the Right Choice

### When to Use Immutable Collections

1. For API Design:

```kotlin
class UserRepository {
    // Return immutable list to prevent modifications
    fun getAllUsers(): List<User> {
        return users.toList()  // Create immutable copy
    }
}
```

2. For Thread Safety:

```kotlin
class SharedResource {
    private val data = listOf(1, 2, 3, 4, 5)
    
    fun getData(): List<Int> {
        return data  // Safe to share across threads
    }
}
```

3. For Function Parameters:

```kotlin
fun processItems(items: List<String>) {
    // Using immutable list ensures items won't be modified
    items.forEach { item ->
        println(item)
    }
}
```

### When to Use Mutable Collections

1. For Building Collections:

```kotlin
fun buildCollection(): List<String> {
    val result = mutableListOf<String>()
    // Add items efficiently
    result.add("Item 1")
    result.add("Item 2")
    return result.toList()  // Convert to immutable for return
}
```

2. For Caching:

```kotlin
class Cache<K, V> {
    private val storage = mutableMapOf<K, V>()
    
    fun put(key: K, value: V) {
        storage[key] = value
    }
    
    fun get(key: K): V? = storage[key]
}
```

3. For Internal State:

```kotlin
class DataProcessor {
    private val processedItems = mutableSetOf<String>()
    
    fun process(item: String) {
        if (item !in processedItems) {
            // Process item
            processedItems.add(item)
        }
    }
}
```

## Best Practices and Patterns

### Converting Between Mutable and Immutable

```kotlin
fun demonstrateConversion() {
    // Converting mutable to immutable
    val mutableList = mutableListOf(1, 2, 3)
    val immutableList: List<Int> = mutableList.toList()
    
    // Creating mutable copy of immutable collection
    val immutable = listOf(1, 2, 3)
    val mutable = immutable.toMutableList()
}
```

### Defensive Copying

```kotlin
class SafeContainer<T> {
    private val items = mutableListOf<T>()
    
    fun addItem(item: T) {
        items.add(item)
    }
    
    // Return defensive copy
    fun getItems(): List<T> {
        return items.toList()
    }
}
```

### Thread-Safe Collection Usage

```kotlin
class ThreadSafeRepository {
    private val _items = mutableListOf<String>()
    private val lock = Any()
    
    fun addItem(item: String) {
        synchronized(lock) {
            _items.add(item)
        }
    }
    
    fun getItems(): List<String> {
        synchronized(lock) {
            return _items.toList()
        }
    }
}
```

## Performance Considerations

```kotlin
fun performanceExample() {
    // Efficient for building
    val mutableList = mutableListOf<Int>()
    repeat(1000) {
        mutableList.add(it)
    }
    
    // Less efficient, creates multiple lists
    var immutableList = listOf<Int>()
    repeat(1000) {
        immutableList = immutableList + it
    }
}
```

## Conclusion

The choice between mutable and immutable collections in Kotlin depends on various factors:

1. Immutable Collections:
   - Provide thread safety
   - Ensure predictable behavior
   - Support functional programming patterns
   - Ideal for public APIs and shared data

2. Mutable Collections:
   - Allow in-place modifications
   - More efficient for building collections
   - Suitable for internal state management
   - Better for frequently changing data

Best practices to remember:

- Use immutable collections by default
- Convert to mutable only when necessary
- Implement defensive copying when exposing collections
- Consider thread safety implications
- Use the appropriate collection type for your use case

By understanding these differences and following these guidelines, you can make informed decisions about collection mutability in your Kotlin code, leading to more maintainable and robust applications.
