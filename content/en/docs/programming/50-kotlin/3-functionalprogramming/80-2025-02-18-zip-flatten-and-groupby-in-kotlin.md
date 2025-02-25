---
draft: false
title: Zip, Flatten, and groupBy in Kotlin
linkTitle: Zip, Flatten, and groupBy
translationKey: zip-flatten-and-groupby-in-kotlin
weight: 80
description: We will explore the `zip`, `flatten`, and `groupBy` functions in Kotlin, their use cases, and practical examples of how they can benefit your workflow.
date: 2025-02-18
url: zip-flatten-and-groupby-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - zip
  - flatten
  - groupBy
featured_image: /images/kotlin-1.png
---
Kotlin is a modern, expressive, and concise programming language that enhances developer productivity. It comes packed with a rich set of functions that make handling collections intuitive and efficient. Among these, `zip`, `flatten`, and `groupBy` are particularly useful when working with complex data transformations. In this post, we will explore these functions in detail, discuss their use cases, and provide examples to illustrate their practical applications.

---

## Understanding `zip` in Kotlin

The `zip` function in Kotlin is used to pair elements from two collections into a list of pairs. This function is particularly useful when you need to merge two lists into one structured dataset.

### Syntax

```kotlin
fun <T, R> Iterable<T>.zip(other: Iterable<R>): List<Pair<T, R>>
```

Additionally, you can use a transformation function with `zip`:

```kotlin
fun <T, R, V> Iterable<T>.zip(other: Iterable<R>, transform: (T, R) -> V): List<V>
```

### Example 1: Basic `zip` Usage

```kotlin
fun main() {
    val names = listOf("Alice", "Bob", "Charlie")
    val scores = listOf(85, 90, 78)
    
    val studentScores = names.zip(scores)
    println(studentScores) // Output: [(Alice, 85), (Bob, 90), (Charlie, 78)]
}
```

In this example, the elements from `names` and `scores` are combined into a list of pairs.

### Example 2: Using `zip` with a Transform Function

```kotlin
fun main() {
    val names = listOf("Alice", "Bob", "Charlie")
    val scores = listOf(85, 90, 78)
    
    val studentDescriptions = names.zip(scores) { name, score -> "$name scored $score" }
    println(studentDescriptions) // Output: [Alice scored 85, Bob scored 90, Charlie scored 78]
}
```

This approach allows you to customize how the elements from both collections are combined.

---

## Understanding `flatten` in Kotlin

The `flatten` function is used to convert a collection of collections (nested lists) into a single list by merging all sublists.

### Syntax

```kotlin
fun <T> Iterable<Iterable<T>>.flatten(): List<T>
```

### Example 1: Flattening a List of Lists

```kotlin
fun main() {
    val nestedList = listOf(
        listOf(1, 2, 3),
        listOf(4, 5),
        listOf(6, 7, 8, 9)
    )
    
    val flatList = nestedList.flatten()
    println(flatList) // Output: [1, 2, 3, 4, 5, 6, 7, 8, 9]
}
```

### Example 2: Flattening a List of Strings

```kotlin
fun main() {
    val words = listOf(
        listOf("Hello", "World"),
        listOf("Kotlin", "Programming")
    )
    
    val flattenedWords = words.flatten()
    println(flattenedWords) // Output: [Hello, World, Kotlin, Programming]
}
```

The `flatten` function is useful when dealing with nested data structures and when you need a flat representation of the elements.

---

## Understanding `groupBy` in Kotlin

The `groupBy` function is used to group elements of a collection based on a specified criterion. It returns a `Map<K, List<V>>`, where `K` is the grouping key and `V` is the list of elements corresponding to that key.

### Syntax

```kotlin
fun <T, K> Iterable<T>.groupBy(keySelector: (T) -> K): Map<K, List<T>>
```

You can also provide a transformation function:

```kotlin
fun <T, K, V> Iterable<T>.groupBy(keySelector: (T) -> K, valueTransform: (T) -> V): Map<K, List<V>>
```

### Example 1: Grouping by Even and Odd Numbers

```kotlin
fun main() {
    val numbers = listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    
    val groupedNumbers = numbers.groupBy { if (it % 2 == 0) "Even" else "Odd" }
    println(groupedNumbers) // Output: {Odd=[1, 3, 5, 7, 9], Even=[2, 4, 6, 8, 10]}
}
```

### Example 2: Grouping a List of Strings by Their First Letter

```kotlin
fun main() {
    val words = listOf("apple", "banana", "apricot", "blueberry", "avocado")
    
    val groupedWords = words.groupBy { it.first() }
    println(groupedWords) // Output: {a=[apple, apricot, avocado], b=[banana, blueberry]}
}
```

### Example 3: Grouping and Transforming Values

```kotlin
fun main() {
    val people = listOf(
        "Alice" to 25,
        "Bob" to 30,
        "Charlie" to 22,
        "Anna" to 27
    )
    
    val groupedAges = people.groupBy(
        keySelector = { it.first.first() },
        valueTransform = { it.second }
    )
    
    println(groupedAges) // Output: {A=[25, 27], B=[30], C=[22]}
}
```

This example demonstrates how `groupBy` can be used to categorize data and extract specific attributes from each group.

---

## Conclusion

Kotlin provides powerful collection functions such as `zip`, `flatten`, and `groupBy` that simplify data manipulation.

- `zip` is useful for combining two lists into structured pairs or transforming them into a new format.
- `flatten` helps to simplify nested collections into a single-level list.
- `groupBy` is invaluable when categorizing data based on specific criteria.

By mastering these functions, you can write more concise, readable, and efficient Kotlin code. Whether you are dealing with datasets, processing user inputs, or structuring your application’s data, these functions will be essential tools in your Kotlin toolkit.
