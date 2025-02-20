---
draft: false
title: SAM Conversions in Kotlin
linkTitle: SAM Conversions
translationKey: sam-conversions-in-kotlin
weight: 140
description: A comprehensive guide to SAM (Single Abstract Method) conversions in Kotlin, including usage patterns, best practices, and advanced topics.
date: 2025-02-20
url: sam-conversions-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - SAM Conversions
featured_image: /images/kotlin-1.png
---
SAM (Single Abstract Method) conversions are a powerful feature in Kotlin that allows for more concise and expressive code when working with interfaces that have only one abstract method. This comprehensive guide explores SAM conversions, their usage patterns, and best practices in Kotlin programming.

## Understanding SAM Conversions

### What is a SAM Interface?

A SAM interface is an interface with a Single Abstract Method. In Java, these are often used for callbacks and event handlers. Common examples include Runnable, Callable, and Comparator.

```kotlin
// Java SAM interface
public interface OnClickListener {
    void onClick(View view);
}

// Kotlin usage with SAM conversion
button.setOnClickListener { view -> 
    println("Button clicked!")
}
```

## SAM Conversions in Java Interop

### Basic Usage

When working with Java SAM interfaces, Kotlin provides automatic conversion:

```kotlin
class JavaInteropExample {
    fun setupJavaThread() {
        // SAM conversion for Java's Runnable
        val thread = Thread {
            println("Running in new thread")
        }
        
        // Equivalent to:
        val verboseThread = Thread(Runnable {
            println("Running in new thread")
        })
    }
}
```

### Common Java SAM Interfaces

Working with popular Java SAM interfaces:

```kotlin
class CommonSamExample {
    fun demonstrateCommonSAMs() {
        // Comparator
        val comparator = Comparator<String> { a, b ->
            a.length - b.length
        }
        
        // Callable
        val callable = Callable {
            "Result from callable"
        }
        
        // Consumer
        val consumer = Consumer<String> {
            println(it)
        }
    }
}
```

## Kotlin SAM Interfaces

### Creating SAM Interfaces in Kotlin

To create a SAM interface in Kotlin that supports conversion, use the `fun` interface:

```kotlin
fun interface Processor {
    fun process(input: String): Int
}

class KotlinSamExample {
    fun usageExample() {
        // SAM conversion for Kotlin interface
        val processor = Processor { input ->
            input.length
        }
        
        // Usage
        val result = processor.process("Hello")
    }
}
```

### Multiple Function Interfaces

Only interfaces with exactly one abstract method can be SAM converted:

```kotlin
// Not a SAM interface - multiple abstract methods
interface MultiFunction {
    fun first()
    fun second()
}

// SAM interface with one abstract and one default method
fun interface ValidSam {
    fun execute()
    
    fun default() {
        println("Default implementation")
    }
}
```

## Advanced SAM Conversions

### Generic SAM Interfaces

Working with generic SAM interfaces:

```kotlin
fun interface Transformer<T, R> {
    fun transform(input: T): R
}

class GenericSamExample {
    fun demonstrateGenericSAM() {
        // String to Int transformer
        val lengthTransformer = Transformer<String, Int> { str ->
            str.length
        }
        
        // Int to String transformer
        val stringTransformer = Transformer<Int, String> { num ->
            num.toString()
        }
        
        // Usage
        val length = lengthTransformer.transform("Hello")
        val string = stringTransformer.transform(42)
    }
}
```

### SAM with Receivers

Creating SAM interfaces with receivers:

```kotlin
fun interface StringProcessor {
    fun String.process(): Int
}

class ReceiverSamExample {
    fun demonstrateReceiverSAM() {
        val processor = StringProcessor { 
            // 'this' refers to String
            this.length
        }
        
        // Usage
        val result = with(processor) {
            "Hello".process()
        }
    }
}
```

## Best Practices

### 1. Type Inference

Let Kotlin's type inference work with SAM conversions:

```kotlin
class TypeInferenceExample {
    fun demonstrate() {
        // Good - let type inference work
        val handler = EventHandler { event ->
            processEvent(event)
        }
        
        // Unnecessary - explicit types
        val verboseHandler: EventHandler = EventHandler { event: Event ->
            processEvent(event)
        }
    }
}
```

### 2. Function References

Use function references when appropriate:

```kotlin
class FunctionReferenceExample {
    private fun processItem(item: String) {
        println(item)
    }
    
    fun demonstrate() {
        // Using lambda
        val processor1 = ItemProcessor { item ->
            processItem(item)
        }
        
        // Using function reference - more concise
        val processor2 = ItemProcessor(::processItem)
    }
}
```

### 3. Context Preservation

Be mindful of context when using SAM conversions:

```kotlin
class ContextExample {
    private var counter = 0
    
    fun setupHandlers() {
        // Captures context
        val handler = EventHandler {
            counter++
            println("Event count: $counter")
        }
    }
}
```

## Common Patterns

### Builder Pattern

Using SAM conversions in builders:

```kotlin
fun interface BuilderAction {
    fun apply(builder: StringBuilder)
}

class StringBuilderWrapper {
    private val builder = StringBuilder()
    
    fun addContent(action: BuilderAction) {
        action.apply(builder)
    }
    
    fun build() = builder.toString()
}

// Usage
fun buildString(): String {
    val wrapper = StringBuilderWrapper()
    wrapper.addContent { it.append("Hello") }
    wrapper.addContent { it.append(" World") }
    return wrapper.build()
}
```

### Event Handling

Simplified event handling with SAM conversions:

```kotlin
fun interface EventListener<T> {
    fun onEvent(event: T)
}

class EventManager<T> {
    private val listeners = mutableListOf<EventListener<T>>()
    
    fun addListener(listener: EventListener<T>) {
        listeners.add(listener)
    }
    
    fun fireEvent(event: T) {
        listeners.forEach { it.onEvent(event) }
    }
}

// Usage
class EventExample {
    fun setupEvents() {
        val manager = EventManager<String>()
        
        manager.addListener { event ->
            println("Event received: $event")
        }
    }
}
```

## Conclusion

SAM conversions in Kotlin provide a powerful way to work with single-method interfaces, whether from Java or Kotlin. Key points to remember:

- Use `fun interface` for Kotlin SAM interfaces
- Leverage type inference for cleaner code
- Consider function references when appropriate
- Be mindful of context capture
- Use SAM conversions to create expressive DSLs and APIs

By understanding and properly utilizing SAM conversions, you can write more concise and expressive code while maintaining readability and functionality. Experiment with different patterns and best practices to find the most effective approach for your Kotlin projects.
