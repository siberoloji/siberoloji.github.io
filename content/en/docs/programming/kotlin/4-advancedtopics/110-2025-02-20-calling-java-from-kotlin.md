---
draft: false
title: Calling Java from Kotlin
linkTitle: Calling Java from Kotlin
translationKey: calling-java-from-kotlin
weight: 110
description: This guide explores how to effectively call Java code from Kotlin, covering common patterns, potential pitfalls, and best practices for smooth integration between the two languages.
date: 2025-02-20
url: calling-java-from-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - Java
  - Interoperability
featured_image: /images/kotlin-1.png
---

One of Kotlin's greatest strengths is its seamless interoperability with Java. This comprehensive guide explores how to effectively call Java code from Kotlin, covering common patterns, potential pitfalls, and best practices for smooth integration between the two languages.

## Basic Java-Kotlin Interoperability

### Property Accessors

When calling Java code from Kotlin, getters and setters are automatically converted to properties:

```kotlin
// Java class
public class JavaUser {
    private String name;
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
}

// Kotlin usage
val user = JavaUser()
user.name = "John" // Calls setName()
println(user.name) // Calls getName()
```

### Method Calls

Java methods can be called directly from Kotlin with some automatic conversions:

```kotlin
// Java class
public class JavaCalculator {
    public double add(double a, double b) {
        return a + b;
    }
    
    public void processData(List<String> data) {
        // Process data
    }
}

// Kotlin usage
val calculator = JavaCalculator()
val result = calculator.add(10.5, 20.5)
calculator.processData(listOf("one", "two", "three"))
```

## Handling Java Types in Kotlin

### Nullability Annotations

Kotlin respects Java's nullability annotations:

```kotlin
// Java code with annotations
public class JavaService {
    @Nullable
    public String getMaybeNull() {
        return null;
    }
    
    @NotNull
    public String getNeverNull() {
        return "Always returns a value";
    }
}

// Kotlin usage
val service = JavaService()
val nullable: String? = service.maybeNull    // Type is String?
val nonNull: String = service.neverNull      // Type is String
```

### Platform Types

When Java code lacks nullability annotations, Kotlin treats the types as platform types:

```kotlin
// Java code without annotations
public class JavaLibrary {
    public String getMessage() {
        return "Hello";
    }
}

// Kotlin usage
val library = JavaLibrary()
val message: String = library.message    // Compiler allows this
val nullableMessage: String? = library.message  // Also allowed
```

## Collections and Arrays

### Working with Java Collections

Kotlin provides seamless integration with Java collections:

```kotlin
// Java class
public class JavaCollectionExample {
    public List<String> getItems() {
        return Arrays.asList("one", "two", "three");
    }
    
    public void processItems(List<String> items) {
        // Process items
    }
}

// Kotlin usage
val example = JavaCollectionExample()
val items: List<String> = example.items
example.processItems(listOf("four", "five"))

// Converting between mutable and immutable collections
val mutableList: MutableList<String> = example.items.toMutableList()
val immutableList: List<String> = mutableList.toList()
```

### Array Handling

Working with Java arrays in Kotlin:

```kotlin
// Java class
public class JavaArrays {
    public String[] getStringArray() {
        return new String[] {"a", "b", "c"};
    }
    
    public void processArray(int[] numbers) {
        // Process numbers
    }
}

// Kotlin usage
val arrays = JavaArrays()
val strings: Array<String> = arrays.stringArray
arrays.processArray(intArrayOf(1, 2, 3))

// Converting collections to arrays
val list = listOf("x", "y", "z")
val array = list.toTypedArray()
```

## Handling Java Static Members

### Static Methods and Fields

Kotlin provides companion object-like syntax for Java static members:

```kotlin
// Java class
public class JavaStaticExample {
    public static final String CONSTANT = "Static constant";
    
    public static void staticMethod() {
        // Static method implementation
    }
}

// Kotlin usage
val constant = JavaStaticExample.CONSTANT
JavaStaticExample.staticMethod()
```

## Exception Handling

### Checked Exceptions

Kotlin doesn't require explicit handling of checked exceptions:

```kotlin
// Java method with checked exception
public class JavaIO {
    public static void writeFile() throws IOException {
        // Write to file
    }
}

// Kotlin usage - no try-catch required
fun writeToFile() {
    JavaIO.writeFile()  // Kotlin doesn't force exception handling
}

// But you can still handle exceptions if needed
fun safeWriteToFile() {
    try {
        JavaIO.writeFile()
    } catch (e: IOException) {
        // Handle exception
    }
}
```

## Working with Java Generics

### Generic Type Conversion

Handling Java generics in Kotlin:

```kotlin
// Java generic class
public class JavaContainer<T> {
    private T value;
    
    public T getValue() {
        return value;
    }
    
    public void setValue(T value) {
        this.value = value;
    }
}

// Kotlin usage
val stringContainer = JavaContainer<String>()
stringContainer.value = "Hello"
val value: String = stringContainer.value
```

## SAM (Single Abstract Method) Conversions

### Working with Java Interfaces

Kotlin provides lambda syntax for Java SAM interfaces:

```kotlin
// Java interface
public interface JavaCallback {
    void onComplete(String result);
}

// Java class
public class JavaAsync {
    public void doWork(JavaCallback callback) {
        // Async work
    }
}

// Kotlin usage
val async = JavaAsync()
async.doWork { result -> 
    println("Work completed: $result")
}
```

## Best Practices

### 1. Nullability Handling

Always consider nullability when working with Java code:

```kotlin
class SafeJavaWrapper(private val javaObject: JavaClass) {
    fun safeMethod(): String {
        return javaObject.possiblyNullMethod() ?: "Default value"
    }
}
```

### 2. Collection Type Safety

Be explicit about collection mutability:

```kotlin
class CollectionHandler {
    fun processJavaCollection(javaList: List<String>) {
        // Create a new mutable list if modification is needed
        val mutableCopy = javaList.toMutableList()
        mutableCopy.add("New item")
    }
}
```

### 3. Extension Functions

Use extension functions to make Java APIs more Kotlin-friendly:

```kotlin
// Extension function for Java class
fun JavaClass.kotlinStyle() = when (this.javaMethod()) {
    null -> "Default"
    else -> this.javaMethod()
}
```

## Advanced Interoperability

### Builder Pattern Adaptation

Converting Java builders to Kotlin-style DSL:

```kotlin
// Java builder
public class JavaBuilder {
    public JavaBuilder setName(String name) { /* ... */ }
    public JavaBuilder setAge(int age) { /* ... */ }
    public JavaObject build() { /* ... */ }
}

// Kotlin DSL wrapper
fun createJavaObject(block: JavaBuilder.() -> Unit): JavaObject {
    return JavaBuilder().apply(block).build()
}

// Usage
val object = createJavaObject {
    setName("John")
    setAge(30)
}
```

## Conclusion

Kotlin's interoperability with Java is one of its strongest features, allowing developers to gradually migrate existing Java codebases or use Java libraries effectively in Kotlin projects. Key points to remember:

- Understand platform types and nullability
- Use appropriate collection types
- Handle Java static members properly
- Take advantage of Kotlin's SAM conversions
- Consider creating Kotlin-friendly wrappers for complex Java APIs

By following these guidelines and understanding the interoperability mechanisms, you can effectively combine Java and Kotlin code in your projects while maintaining code quality and readability.
