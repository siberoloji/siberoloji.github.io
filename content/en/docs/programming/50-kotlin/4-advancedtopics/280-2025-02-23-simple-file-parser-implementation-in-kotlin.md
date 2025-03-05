---
draft: false
title: Simple File Parser Console Application in Kotlin
linkTitle: Simple File Parser
translationKey: simple-file-parser-implementation-in-kotlin
weight: 280
description: Learn how to create a simple file parser console application in Kotlin. We will cover reading files, parsing content, handling errors, and implementing basic operations to extract and display structured information.
date: 2025-02-23
url: simple-file-parser-implementation-in-kotlin
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
featured_image: /images/kotlin-1.png
---
## Introduction

Parsing files is a common task in software development, especially when dealing with structured or semi-structured data. Kotlin, a modern, expressive, and concise programming language, offers powerful libraries and features that make file parsing efficient and straightforward. In this article, we will create a simple file parser console application using Kotlin. We will cover reading files, parsing content, handling errors, and implementing basic operations to extract and display structured information.

## Prerequisites

Before we dive into coding, ensure you have the following:

- **Kotlin Installed**: You can use the Kotlin compiler or IntelliJ IDEA for development.
- **Basic Knowledge of Kotlin**: Understanding of functions, loops, and file handling.
- **JVM Installed**: If using the Kotlin compiler.

## Setting Up the Project

To begin, create a new Kotlin project in IntelliJ IDEA or set up a simple Kotlin file (`FileParser.kt`) in your development environment.

### Dependencies

For file handling and parsing, Kotlin's standard library is sufficient. However, if dealing with complex formats (e.g., JSON, XML, CSV), you might consider libraries such as:

- `kotlinx.serialization` for JSON/XML.
- `Apache Commons CSV` for CSV parsing.

For this tutorial, we'll focus on a simple text-based file parser using only Kotlin’s standard features.

## Implementing the File Parser

### Step 1: Reading a File

Kotlin provides easy ways to read files using `File` operations. Let's start by reading a text file:

```kotlin
import java.io.File

fun readFile(filePath: String): List<String> {
    return try {
        File(filePath).readLines()
    } catch (e: Exception) {
        println("Error reading file: ${e.message}")
        emptyList()
    }
}
```

This function reads the file line by line and returns a list of strings. If an error occurs (e.g., file not found), it handles the exception and returns an empty list.

### Step 2: Parsing the File Content

Let's assume the file contains structured data in the format:

```
ID,Name,Age
1,John Doe,30
2,Jane Smith,25
3,Michael Brown,40
```

We can write a function to parse this CSV-like content into a list of data objects.

```kotlin
data class Person(val id: Int, val name: String, val age: Int)

fun parseData(lines: List<String>): List<Person> {
    return lines.drop(1) // Skip header
        .mapNotNull { line ->
            val parts = line.split(",")
            if (parts.size == 3) {
                try {
                    Person(parts[0].toInt(), parts[1], parts[2].toInt())
                } catch (e: NumberFormatException) {
                    println("Skipping invalid line: $line")
                    null
                }
            } else {
                println("Skipping malformed line: $line")
                null
            }
        }
}
```

This function:

- Skips the header row.
- Splits each line by commas.
- Converts valid lines into `Person` objects.
- Handles errors gracefully.

### Step 3: Displaying Parsed Data

Once we parse the file, we can display the extracted data.

```kotlin
fun displayData(personList: List<Person>) {
    println("Parsed Data:")
    personList.forEach { println("ID: ${it.id}, Name: ${it.name}, Age: ${it.age}") }
}
```

### Step 4: Putting It All Together

Finally, we integrate all functions in a main entry point.

```kotlin
fun main() {
    val filePath = "data.txt" // Change this to your actual file path
    val lines = readFile(filePath)
    if (lines.isNotEmpty()) {
        val persons = parseData(lines)
        displayData(persons)
    } else {
        println("No data to process.")
    }
}
```

## Running the Application

To run the application:

1. Place a sample `data.txt` file in the project directory.
2. Compile and execute the Kotlin file using:

   ```sh
   kotlinc FileParser.kt -include-runtime -d FileParser.jar
   java -jar FileParser.jar
   ```

   OR, if using IntelliJ IDEA, run the `main` function.

## Enhancements and Next Steps

While this is a simple parser, you can extend it with:

- **Command-line arguments**: Accept file path as an argument.
- **Enhanced parsing**: Support JSON/XML using `kotlinx.serialization`.
- **Error logging**: Log errors to a file instead of printing to console.
- **Unit tests**: Write tests to validate parsing logic.

## Conclusion

In this tutorial, we built a simple file parser in Kotlin that reads, parses, and displays structured data from a text file. With Kotlin’s powerful features, file handling and parsing can be implemented efficiently with minimal code. By extending this example, you can handle more complex file formats and integrate advanced data processing features into your applications.

Happy coding!
