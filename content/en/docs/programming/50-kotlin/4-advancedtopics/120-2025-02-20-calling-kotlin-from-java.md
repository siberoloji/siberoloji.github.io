---
draft: false
title: Calling Kotlin from Java
linkTitle: Calling Kotlin from Java
translationKey: calling-kotlin-from-java
weight: 120
description: A comprehensive guide to calling Kotlin code from Java applications, covering essential concepts, best practices, and common patterns.
date: 2025-02-20
url: calling-kotlin-from-java
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
While Kotlin is fully interoperable with Java, calling Kotlin code from Java requires understanding certain conventions and annotations that make the interaction smooth and predictable. This comprehensive guide explores how to effectively use Kotlin code in Java applications, covering essential concepts, best practices, and common patterns.

## Basic Kotlin-Java Interoperability

### Properties

When calling Kotlin properties from Java, they are automatically exposed as getter and setter methods:

```kotlin
// Kotlin class
class KotlinUser {
    var name: String = ""
    val id: Int = 1
}

// Java usage
public class JavaClass {
    public void useKotlinProperties() {
        KotlinUser user = new KotlinUser();
        user.setName("John");  // Calls the setter
        String name = user.getName();  // Calls the getter
        int id = user.getId();  // Calls the getter for val
    }
}
```

### Functions

Kotlin functions are converted to Java methods:

```kotlin
// Kotlin functions
class KotlinService {
    fun processData(data: String): Boolean {
        return data.isNotEmpty()
    }
    
    fun calculateTotal(vararg numbers: Int): Int {
        return numbers.sum()
    }
}

// Java usage
public class JavaService {
    public void useKotlinFunctions() {
        KotlinService service = new KotlinService();
        boolean result = service.processData("test");
        int total = service.calculateTotal(1, 2, 3);
    }
}
```

## Handling Kotlin-Specific Features

### Data Classes

Kotlin data classes are accessible from Java with generated methods:

```kotlin
// Kotlin data class
data class Product(
    val id: String,
    val name: String,
    val price: Double
)

// Java usage
public class JavaShop {
    public void handleProduct() {
        Product product = new Product("1", "Phone", 999.99);
        String name = product.getName();
        Product copy = product.copy(price = 899.99);
        boolean equals = product.equals(copy);
        String toString = product.toString();
    }
}
```

### Companion Objects

Accessing Kotlin companion objects from Java requires special consideration:

```kotlin
// Kotlin class with companion object
class KotlinFactory {
    companion object {
        @JvmStatic
        fun create(): KotlinFactory = KotlinFactory()
        
        const val DEFAULT_SIZE = 100
    }
}

// Java usage
public class JavaFactory {
    public void useCompanion() {
        // With @JvmStatic
        KotlinFactory instance = KotlinFactory.create();
        
        // Accessing companion constant
        int size = KotlinFactory.DEFAULT_SIZE;
        
        // Without @JvmStatic, would need:
        // KotlinFactory.Companion.create();
    }
}
```

## Extension Functions

Using Kotlin extension functions in Java:

```kotlin
// Kotlin extension functions
@file:JvmName("StringUtils")

fun String.addPrefix(prefix: String): String = "$prefix$this"

// Java usage
public class JavaString {
    public void useExtension() {
        // Extension functions are compiled to static methods
        String result = StringUtils.addPrefix("World", "Hello ");
    }
}
```

## Null Safety

### Handling Nullable Types

Working with Kotlin's null safety features in Java:

```kotlin
// Kotlin class with nullable types
class KotlinNullable {
    fun processNullable(text: String?): Int? {
        return text?.length
    }
    
    @NotNull
    fun getNonNull(): String = "Never null"
}

// Java usage
public class JavaNullable {
    public void handleNullability() {
        KotlinNullable kotlin = new KotlinNullable();
        
        // Can pass null to nullable parameter
        Integer length = kotlin.processNullable(null);
        
        // Non-null return type is guaranteed
        String nonNull = kotlin.getNonNull();
    }
}
```

## Collections and Arrays

### Working with Kotlin Collections

Handling Kotlin collections in Java:

```kotlin
// Kotlin collections
class KotlinCollections {
    fun getList(): List<String> = listOf("a", "b", "c")
    
    fun getMutableList(): MutableList<String> = mutableListOf("x", "y", "z")
}

// Java usage
public class JavaCollections {
    public void useKotlinCollections() {
        KotlinCollections collections = new KotlinCollections();
        
        // Immutable list from Kotlin
        List<String> immutable = collections.getList();
        
        // Mutable list from Kotlin
        List<String> mutable = collections.getMutableList();
        mutable.add("w");  // OK
    }
}
```

## Function Types and Lambdas

### Using Kotlin Function Types

Working with Kotlin functions and lambdas in Java:

```kotlin
// Kotlin function types
class KotlinCallback {
    fun setHandler(handler: (String) -> Unit) {
        handler("Event")
    }
    
    fun processWithCallback(callback: (Int) -> Boolean) {
        callback(42)
    }
}

// Java usage
public class JavaCallback {
    public void useKotlinFunctions() {
        KotlinCallback callback = new KotlinCallback();
        
        // Using Function1 interface
        callback.setHandler(
            (String message) -> System.out.println(message)
        );
        
        // Using Function1 with return value
        callback.processWithCallback(
            (Integer num) -> num > 0
        );
    }
}
```

## Best Practices

### 1. Using @JvmOverloads

Making Kotlin default parameters accessible in Java:

```kotlin
// Kotlin class with default parameters
class KotlinConfig @JvmOverloads constructor(
    val host: String = "localhost",
    val port: Int = 8080,
    val timeout: Long = 5000
)

// Java usage
public class JavaConfig {
    public void createConfigs() {
        // All constructors are available
        KotlinConfig config1 = new KotlinConfig();
        KotlinConfig config2 = new KotlinConfig("example.com");
        KotlinConfig config3 = new KotlinConfig("example.com", 9090);
    }
}
```

### 2. Using @JvmField

Exposing Kotlin properties as fields:

```kotlin
// Kotlin class with field annotation
class KotlinFields {
    @JvmField
    var publicField: String = "Direct access"
}

// Java usage
public class JavaFields {
    public void accessFields() {
        KotlinFields fields = new KotlinFields();
        // Direct field access without getter/setter
        fields.publicField = "New value";
    }
}
```

### 3. File-Level Functions

Organizing Kotlin utility functions for Java use:

```kotlin
// Kotlin file: Utils.kt
@file:JvmName("Utils")

fun helper(input: String): String = input.uppercase()

// Java usage
public class JavaUtils {
    public void useUtils() {
        // Clean static method access
        String result = Utils.helper("test");
    }
}
```

## Conclusion

Calling Kotlin from Java is straightforward when you understand the interoperability features and annotations provided by Kotlin. Key points to remember:

- Use appropriate annotations (@JvmStatic, @JvmField, @JvmOverloads) to customize Java interop
- Understand how Kotlin properties translate to Java getters and setters
- Handle nullable types appropriately
- Leverage Kotlin's collection types in Java
- Use function types and lambdas effectively

By following these guidelines and understanding the interoperability mechanisms, you can effectively use Kotlin code in Java projects while maintaining code quality and taking advantage of Kotlin's features.
