---
draft: false
title: Setting Up Kotlin Development Environment
linkTitle: Kotlin Development Environment
translationKey: setting-up-kotlin-development-environment
weight: 30
description: A guide to setting up a Kotlin development environment, including command-line tools, IntelliJ IDEA, Android Studio, and VS Code.
date: 2025-02-08
url: setting-up-kotlin-development-environment
tags:
  - Kotlin
categories:
  - Kotlin
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Kotlin
  - Programming
  - IDE
  - IntelliJ IDEA
featured_image: /images/kotlin-1.png
---
## Introduction

Kotlin is a modern, expressive, and powerful programming language that is widely used for Android development, backend services, and even frontend development with Kotlin/JS. Setting up a proper development environment is crucial for a smooth and efficient coding experience. This guide will walk you through the steps to install and configure Kotlin on your system, covering multiple setups including command-line tools, IntelliJ IDEA, Android Studio, and VS Code.

## Prerequisites

Before we begin, ensure that your system meets the following requirements:

- Windows, macOS, or Linux operating system
- Java Development Kit (JDK) version 8 or higher
- Internet connection for downloading necessary tools

## Step 1: Install Java Development Kit (JDK)

Kotlin runs on the Java Virtual Machine (JVM), so installing the JDK is essential.

### Installing JDK on Windows

1. Download the latest JDK from [Oracle](https://www.oracle.com/java/technologies/javase-downloads.html) or [OpenJDK](https://openjdk.org/)
2. Install the JDK and configure the environment variables:
   - Add `JAVA_HOME` to system variables.
   - Update the `Path` variable to include the JDK `bin` directory.

### Installing JDK on macOS

Use Homebrew to install OpenJDK:

```sh
brew install openjdk
```

Set up environment variables:

```sh
echo 'export JAVA_HOME=$(/usr/libexec/java_home)' >> ~/.zshrc
source ~/.zshrc
```

### Installing JDK on Linux

Use your package manager:

```sh
sudo apt update && sudo apt install openjdk-11-jdk
```

Verify installation with:

```sh
java -version
```

## Step 2: Install Kotlin Compiler (Command-Line Setup)

For those who prefer working with the command line, you can install the Kotlin compiler manually.

### Install Kotlin Compiler

- **Windows:** Download from [Kotlin official site](https://kotlinlang.org/), unzip, and add to `Path`.
- **macOS/Linux:** Install via SDKMAN:

```sh
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install kotlin
```

Verify installation:

```sh
kotlin -version
```

## Step 3: Install IntelliJ IDEA (Recommended IDE)

IntelliJ IDEA, developed by JetBrains, provides first-class support for Kotlin.

1. Download IntelliJ IDEA from [JetBrains](https://www.jetbrains.com/idea/download/).
2. Install and open IntelliJ IDEA.
3. Create a new Kotlin project:
   - Select **File > New Project**.
   - Choose **Kotlin** and the desired project type (JVM, Android, Multiplatform).
   - Configure the project SDK (ensure JDK is set).

## Step 4: Set Up Kotlin in Android Studio

For Android development, Android Studio is the best choice.

1. Download and install [Android Studio](https://developer.android.com/studio).
2. Open Android Studio and create a new project.
3. Choose **Kotlin** as the primary language during setup.
4. Install necessary Kotlin plugins via **File > Settings > Plugins**.

## Step 5: Using Kotlin in Visual Studio Code (VS Code)

If you prefer VS Code, follow these steps:

1. Install [Visual Studio Code](https://code.visualstudio.com/).
2. Open VS Code and go to **Extensions** (`Ctrl+Shift+X`).
3. Search for **Kotlin Language** and install the plugin.
4. Install the Kotlin compiler and configure the build system using Gradle.

## Step 6: Writing Your First Kotlin Program

Once Kotlin is installed, test your setup by writing a simple program.

### Using the Command Line

Create a new file `hello.kt`:

```kotlin
fun main() {
    println("Hello, Kotlin!")
}
```

Compile and run:

```sh
kotlinc hello.kt -include-runtime -d hello.jar
java -jar hello.jar
```

### Using IntelliJ IDEA

1. Open IntelliJ and create a new Kotlin file.
2. Write the same `main` function.
3. Click the **Run** button to execute the program.

## Conclusion

Setting up a Kotlin development environment is straightforward, whether using the command line, IntelliJ IDEA, Android Studio, or VS Code. With a properly configured environment, you can now start exploring Kotlin’s powerful features and build applications for various platforms. Happy coding!
