---
draft: false
title: Collections in Kotlin Lists, Sets, and Maps
linkTitle: Collections
translationKey: collections-in-kotlin-lists-sets-and-maps
weight: 200
description: we will explore the three main collection types in Kotlin Lists, Sets, and Maps, along with their mutable and immutable variants.
date: 2025-02-08
url: collections-in-kotlin-lists-sets-and-maps
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
  - Lists
  - Sets
  - Maps
featured_image: /images/kotlin-1.png
---
Kotlin provides a rich set of collection types that help developers manage groups of objects efficiently. In this comprehensive guide, we'll explore the three main collection types in Kotlin: Lists, Sets, and Maps, along with their mutable and immutable variants.

## Understanding Kotlin Collections

Kotlin's collection framework is built on two main principles: immutability and mutability. Each collection type comes in both variants, allowing developers to choose the most appropriate one for their needs.

### Lists in Kotlin

Lists are ordered collections that can contain duplicate elements.

#### Creating Lists

```kotlin
// Immutable Lists
val immutableList = listOf(1, 2, 3, 4, 5)
val emptyList = listOf<String>()

// Mutable Lists
val mutableList = mutableListOf(1, 2, 3, 4, 5)
val arrayList = ArrayList<Int>()
```

#### Common List Operations

```kotlin
fun demonstrateListOperations() {
    val numbers = mutableListOf(1, 2, 3, 4, 5)
    
    // Adding elements
    numbers.add(6)
    numbers.addAll(listOf(7, 8))
    
    // Accessing elements
    val firstElement = numbers[0]
    val lastElement = numbers.last()
    
    // Modifying elements
    numbers[0] = 10
    
    // Removing elements
    numbers.remove(3)
    numbers.removeAt(0)
    
    // Checking contents
    val containsThree = numbers.contains(3)
    val isEmpty = numbers.isEmpty()
    
    // Finding elements
    val indexOf5 = numbers.indexOf(5)
    val lastIndexOf = numbers.lastIndexOf(8)
}
```

### Sets in Kotlin

Sets are collections that contain unique elements, eliminating duplicates automatically.

#### Creating Sets

```kotlin
// Immutable Sets
val immutableSet = setOf(1, 2, 3, 4, 5)
val emptySet = setOf<String>()

// Mutable Sets
val mutableSet = mutableSetOf(1, 2, 3, 4, 5)
val hashSet = HashSet<Int>()
```

#### Common Set Operations

```kotlin
fun demonstrateSetOperations() {
    val numbers = mutableSetOf(1, 2, 3, 4, 5)
    
    // Adding elements (duplicates are ignored)
    numbers.add(6)
    numbers.add(1) // Will not be added as it's a duplicate
    
    // Removing elements
    numbers.remove(3)
    
    // Set operations
    val set1 = setOf(1, 2, 3)
    val set2 = setOf(3, 4, 5)
    
    val union = set1.union(set2)        // [1, 2, 3, 4, 5]
    val intersection = set1.intersect(set2)  // [3]
    val difference = set1.subtract(set2)     // [1, 2]
}
```

### Maps in Kotlin

Maps store key-value pairs, where each key is unique.

#### Creating Maps

```kotlin
// Immutable Maps
val immutableMap = mapOf("one" to 1, "two" to 2)
val emptyMap = mapOf<String, Int>()

// Mutable Maps
val mutableMap = mutableMapOf("one" to 1, "two" to 2)
val hashMap = HashMap<String, Int>()
```

#### Common Map Operations

```kotlin
fun demonstrateMapOperations() {
    val scores = mutableMapOf(
        "John" to 85,
        "Alice" to 90,
        "Bob" to 88
    )
    
    // Adding entries
    scores["Carol"] = 92
    scores.put("David", 87)
    
    // Accessing values
    val aliceScore = scores["Alice"]
    val defaultScore = scores.getOrDefault("Eve", 0)
    
    // Modifying entries
    scores["John"] = 87
    
    // Removing entries
    scores.remove("Bob")
    
    // Checking contents
    val hasJohn = scores.containsKey("John")
    val has90 = scores.containsValue(90)
}
```

## Advanced Collection Features

### Collection Transformations

Kotlin provides powerful functions for transforming collections:

```kotlin
fun demonstrateTransformations() {
    val numbers = listOf(1, 2, 3, 4, 5)
    
    // Mapping
    val doubled = numbers.map { it * 2 }
    val stringNumbers = numbers.map { it.toString() }
    
    // Filtering
    val evenNumbers = numbers.filter { it % 2 == 0 }
    
    // Combining transformations
    val doubledEven = numbers
        .filter { it % 2 == 0 }
        .map { it * 2 }
}
```

### Collection Aggregation Operations

```kotlin
fun demonstrateAggregations() {
    val numbers = listOf(1, 2, 3, 4, 5)
    
    // Basic aggregations
    val sum = numbers.sum()
    val average = numbers.average()
    val max = numbers.maxOrNull()
    val min = numbers.minOrNull()
    
    // Custom aggregations
    val product = numbers.reduce { acc, num -> acc * num }
    val customSum = numbers.fold(0) { acc, num -> acc + num }
}
```

### Grouping and Partitioning

```kotlin
fun demonstrateGrouping() {
    val people = listOf(
        Person("John", 25),
        Person("Alice", 30),
        Person("Bob", 25),
        Person("Carol", 30)
    )
    
    // Grouping by age
    val byAge: Map<Int, List<Person>> = people.groupBy { it.age }
    
    // Partitioning by age
    val (young, notYoung) = people.partition { it.age < 30 }
}
```

## Best Practices and Guidelines

### Choosing Between Mutable and Immutable Collections

```kotlin
// Prefer immutable collections when possible
fun processData(data: List<Int>) {  // Immutable List parameter
    // Process the data without modifying it
}

// Use mutable collections when necessary
fun collectData(): MutableList<String> {
    val result = mutableListOf<String>()
    // Add items to the list
    return result
}
```

### Collection Type Selection Guidelines

```kotlin
// Use List when:
val orderedItems = listOf("First", "Second", "Third")  // Order matters

// Use Set when:
val uniqueNumbers = setOf(1, 2, 3, 2, 1)  // Duplicates should be eliminated

// Use Map when:
val userScores = mapOf(
    "User1" to 100,
    "User2" to 95
)  // Key-value pairs are needed
```

### Performance Considerations

```kotlin
// Size-optimized collections
val smallList = listOf(1, 2, 3)  // Optimal for small, fixed-size collections

// Performance-optimized collections
val largeList = ArrayList<Int>(10000)  // Pre-sized for large collections
val frequentLookups = HashSet<String>()  // Optimized for lookups
```

## Practical Examples

### Working with Complex Collections

```kotlin
data class Student(
    val name: String,
    val grade: Int,
    val subjects: List<String>
)

fun processStudentData(students: List<Student>) {
    // Group students by grade
    val byGrade = students.groupBy { it.grade }
    
    // Find students taking specific subjects
    val mathStudents = students.filter { 
        "Math" in it.subjects 
    }
    
    // Calculate average grade
    val averageGrade = students
        .map { it.grade }
        .average()
    
    // Create a map of student names to their subjects
    val studentSubjects = students.associate { 
        it.name to it.subjects 
    }
}
```

## Conclusion

Kotlin's collection framework provides a robust and flexible way to work with groups of data. The key points to remember are:

1. Choose between mutable and immutable collections based on your needs
2. Use the appropriate collection type (List, Set, or Map) for your use case
3. Leverage Kotlin's powerful collection operations for transformations and aggregations
4. Consider performance implications when working with large collections
5. Take advantage of type safety and null safety features

By understanding these concepts and following the best practices outlined in this guide, you can effectively use Kotlin collections to write more maintainable and efficient code. Remember that the choice of collection type and mutability can significantly impact your application's design and performance.

Remember to always consider the specific requirements of your project when choosing collection types and operations. The right choice can lead to more readable, maintainable, and efficient code.
