---
draft: false
title: Installing Android Studio with Jetpack Compose Support
linkTitle: Installing Android Studio with Jetpack Compose Support
translationKey: installing-android-studio-with-jetpack-compose-support
description: Learn how to install Android Studio with Jetpack Compose support to start building modern UIs in Android apps.
url: installing-android-studio-with-jetpack-compose-support
weight: 50
date: 2025-02-26
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
---
Android development has evolved significantly, and Jetpack Compose is at the forefront of this transformation. It offers a modern toolkit for building native UI in Android apps with a declarative approach, reducing boilerplate code and making UI development more efficient. To get started with Jetpack Compose, you need to install Android Studio, which provides full support for this UI framework. This guide will walk you through the process of installing Android Studio with Jetpack Compose support, including system requirements, setup steps, and configurations.

## Why Jetpack Compose?

Jetpack Compose is a powerful framework for UI development in Android because it:

- Uses a declarative approach, making UI code more readable and concise.
- Provides reactive programming features, automatically updating the UI when data changes.
- Simplifies layout creation and customization.
- Offers excellent interoperability with existing Android Views.
- Enhances productivity with Live Preview and interactive UI design tools in Android Studio.

## System Requirements

Before installing Android Studio, ensure that your system meets the following requirements:

### Windows

- **Operating System:** Windows 10 or later (64-bit)
- **Processor:** Intel or AMD processor with support for virtualization
- **RAM:** Minimum 8 GB (16 GB recommended)
- **Disk Space:** At least 8 GB of available space
- **JDK:** Java Development Kit (JDK 17 or later)

### macOS

- **Operating System:** macOS 11 (Big Sur) or later
- **Processor:** Apple Silicon (M1/M2) or Intel
- **RAM:** Minimum 8 GB (16 GB recommended)
- **Disk Space:** At least 8 GB of available space
- **JDK:** Java Development Kit (JDK 17 or later)

### Linux

- **Operating System:** Ubuntu 20.04 LTS or later (64-bit)
- **Processor:** Intel or AMD processor
- **RAM:** Minimum 8 GB (16 GB recommended)
- **Disk Space:** At least 8 GB of available space
- **JDK:** Java Development Kit (JDK 17 or later)

## Installing Android Studio

Follow these steps to install Android Studio:

### Step 1: Download Android Studio

1. Visit the official Android Studio download page: [https://developer.android.com/studio](https://developer.android.com/studio).
2. Select the appropriate version for your operating system (Windows, macOS, or Linux).
3. Accept the terms and conditions and download the installer.

### Step 2: Install Android Studio

#### Windows

1. Run the `.exe` file you downloaded.
2. Follow the installation wizard’s instructions.
3. Select "Standard" installation to install the default settings and tools.
4. Click "Finish" once the installation is complete.

#### macOS

1. Open the `.dmg` file and drag Android Studio into the Applications folder.
2. Open Android Studio from the Applications folder.
3. Complete the setup wizard, selecting "Standard" installation.

#### Linux

1. Extract the downloaded `.tar.gz` file.
2. Navigate to the extracted folder and run `studio.sh` inside the `bin` directory.
3. Follow the setup wizard’s instructions.

## Configuring Jetpack Compose Support

Once Android Studio is installed, you need to enable Jetpack Compose support.

### Step 1: Install the Required Plugins

1. Open Android Studio.
2. Go to **File > Settings** (or **Android Studio > Preferences** on macOS).
3. Navigate to **Plugins**.
4. Search for **Jetpack Compose** and install it.
5. Restart Android Studio.

### Step 2: Set Up an Android Project with Jetpack Compose

1. Click **New Project** on the welcome screen.
2. Select "Empty Compose Activity" under the "Phone and Tablet" section.
3. Click **Next**.
4. Configure the project:
   - Name your project.
   - Choose Kotlin as the programming language.
   - Set **Minimum SDK** to API 21 or higher.
5. Click **Finish**.

### Step 3: Verify Dependencies

Open the `build.gradle (Module: app)` file and ensure the following dependencies are present:

```gradle
dependencies {
    implementation "androidx.activity:activity-compose:1.7.2"
    implementation "androidx.compose.ui:ui:1.4.3"
    implementation "androidx.compose.material:material:1.4.3"
    implementation "androidx.compose.ui:ui-tooling-preview:1.4.3"
    implementation "androidx.lifecycle:lifecycle-runtime-ktx:2.6.1"
}
```

If any dependencies are missing, add them and sync the project.

### Step 4: Enable Jetpack Compose in Build Features

Ensure your `build.gradle (Module: app)` file includes:

```gradle
android {
    composeOptions {
        kotlinCompilerExtensionVersion = "1.4.3"
    }
    buildFeatures {
        compose = true
    }
}
```

## Running and Previewing Jetpack Compose UI

### Step 1: Open `MainActivity.kt`

By default, an Empty Compose Activity project includes a `MainActivity.kt` file containing:

```kotlin
@Composable
fun Greeting(name: String) {
    Text(text = "Hello, $name!")
}

@Preview
@Composable
fun PreviewGreeting() {
    Greeting("Android")
}
```

### Step 2: Use Live Preview

1. Click the **Split** view in the top-right of the editor.
2. Click **Run Preview** to see the UI rendered in real-time.

### Step 3: Run the App on an Emulator or Device

1. Connect an Android device or start an emulator.
2. Click the **Run** button (▶) in Android Studio.
3. Your Jetpack Compose app will launch on the device.

## Troubleshooting Common Issues

- **Android Studio not detecting Jetpack Compose?** Ensure the latest version of Android Studio and Kotlin are installed.
- **Gradle sync issues?** Update dependencies and sync Gradle from **File > Sync Project with Gradle Files**.
- **Preview not working?** Ensure Jetpack Compose dependencies are correctly set and enable `Preview` in Android Studio.

## Conclusion

Setting up Android Studio with Jetpack Compose support is straightforward when following the right steps. With Compose, you can build beautiful and responsive UIs efficiently. Whether you’re a beginner or an experienced developer, Jetpack Compose is a game-changer for modern Android development. Happy coding!
