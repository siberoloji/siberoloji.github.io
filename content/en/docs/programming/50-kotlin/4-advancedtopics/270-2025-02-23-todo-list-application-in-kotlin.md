---
draft: false
title: Building a To-Do List Console Application Using Kotlin
linkTitle: To-Do List Application
translationKey: todo-list-application-in-kotlin
description: Learn how to build a To-Do List Console Application using Kotlin programming language. This project covers key concepts like data handling, user input, and file management.
url: todo-list-application-in-kotlin
weight: 270
date: 2025-02-23
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

A **To-Do List Application** is a simple yet practical project for learning the fundamentals of Kotlin, including data handling, user input, and file management. Kotlin is a modern, concise, and expressive programming language that can be used to build console-based applications. In this article, we will walk through the steps of building a **To-Do List Console Application** using Kotlin.

## Prerequisites

Before we begin, ensure you have the following:

- Basic understanding of **Kotlin programming**.
- Kotlin installed on your system or an IDE like IntelliJ IDEA.
- Familiarity with Kotlin collections and file handling (optional but useful).

---

## Step 1: Setting Up the Project

1. Open **IntelliJ IDEA** or any Kotlin-supported IDE.
2. Create a new **Kotlin project**.
3. Set up a **main.kt** file to write the application logic.

---

## Step 2: Designing the To-Do List Structure

The application should support the following features:

- Adding tasks
- Viewing tasks
- Marking tasks as completed
- Removing tasks
- Saving and loading tasks from a file (optional)

### Defining the Task Data Class

```kotlin
data class Task(val id: Int, val description: String, var isCompleted: Boolean = false)
```

---

## Step 3: Implementing the Core Logic

### Creating the Main Function

```kotlin
fun main() {
    val taskList = mutableListOf<Task>()
    var taskIdCounter = 1
    while (true) {
        println("\nTo-Do List Application")
        println("1. Add Task")
        println("2. View Tasks")
        println("3. Mark Task as Completed")
        println("4. Remove Task")
        println("5. Exit")
        print("Enter your choice: ")
        when (readLine()?.toIntOrNull()) {
            1 -> {
                print("Enter task description: ")
                val description = readLine()?.trim()
                if (!description.isNullOrEmpty()) {
                    taskList.add(Task(taskIdCounter++, description))
                    println("Task added successfully!")
                } else {
                    println("Task description cannot be empty.")
                }
            }
            2 -> {
                if (taskList.isEmpty()) {
                    println("No tasks available.")
                } else {
                    println("\nTasks:")
                    taskList.forEach { task ->
                        println("${task.id}. ${task.description} [${if (task.isCompleted) "Completed" else "Pending"}]")
                    }
                }
            }
            3 -> {
                print("Enter task ID to mark as completed: ")
                val id = readLine()?.toIntOrNull()
                val task = taskList.find { it.id == id }
                if (task != null) {
                    task.isCompleted = true
                    println("Task marked as completed!")
                } else {
                    println("Task not found.")
                }
            }
            4 -> {
                print("Enter task ID to remove: ")
                val id = readLine()?.toIntOrNull()
                if (taskList.removeIf { it.id == id }) {
                    println("Task removed successfully!")
                } else {
                    println("Task not found.")
                }
            }
            5 -> {
                println("Exiting application...")
                return
            }
            else -> println("Invalid choice. Please try again.")
        }
    }
}
```

---

## Step 4: Enhancing the Application

### Saving and Loading Tasks from a File (Optional)

To persist tasks between runs, we can save and load them using a file.

#### Writing Tasks to a File

```kotlin
fun saveTasksToFile(taskList: List<Task>, fileName: String) {
    File(fileName).bufferedWriter().use { writer ->
        taskList.forEach { task ->
            writer.write("${task.id},${task.description},${task.isCompleted}\n")
        }
    }
}
```

#### Reading Tasks from a File

```kotlin
fun loadTasksFromFile(fileName: String): MutableList<Task> {
    val taskList = mutableListOf<Task>()
    val file = File(fileName)
    if (file.exists()) {
        file.forEachLine { line ->
            val parts = line.split(",")
            if (parts.size == 3) {
                val task = Task(parts[0].toInt(), parts[1], parts[2].toBoolean())
                taskList.add(task)
            }
        }
    }
    return taskList
}
```

---

## Step 5: Running the Application

1. Open your terminal or IDE console.
2. Compile and run the **main.kt** file.
3. Test different functionalities like adding, viewing, completing, and deleting tasks.

---

## Conclusion

In this tutorial, we built a **console-based To-Do List application** using Kotlin. This project demonstrates key Kotlin programming concepts like **lists, loops, and file handling**. You can enhance it further by adding features like **task priorities, due dates, or integrating a database**.

Would you like to see more advanced features added? Let us know in the comments!

Happy Coding! 🚀
