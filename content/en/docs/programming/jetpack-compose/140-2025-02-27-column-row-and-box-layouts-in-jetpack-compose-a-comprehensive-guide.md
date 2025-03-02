---
draft: false
title: Column, Row, and Box Layouts in Jetpack Compose
linkTitle: Column, Row, and Box Layouts in Jetpack Compose
translationKey: column-row-and-box-layouts-in-jetpack-compose
description: A comprehensive guide to using Column, Row, and Box layouts in Jetpack Compose for structuring UI elements efficiently.
url: column-row-and-box-layouts-in-jetpack-compose
weight: 140
date: 2025-02-27
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Column
  - Row
  - Box
---
Jetpack Compose is revolutionizing UI development in Android by offering a declarative approach to designing interfaces. Among the many powerful tools it provides, the `Column`, `Row`, and `Box` layouts are fundamental building blocks for structuring UI elements efficiently. In this blog post, we’ll dive deep into these layout components, exploring their usage, properties, and best practices.

## Introduction to Jetpack Compose Layouts

Jetpack Compose replaces the traditional `XML`-based layouts with composable functions that define UI components in a more intuitive and flexible manner. Unlike the `ConstraintLayout` or `LinearLayout` from the View system, Compose provides simple yet powerful layout components that adapt seamlessly to different screen sizes and configurations.

Three of the most commonly used layouts in Jetpack Compose are:

- `Column`: Arranges child components vertically.
- `Row`: Arranges child components horizontally.
- `Box`: Stacks child components on top of each other.

Let’s explore each layout in detail.

---

## Column Layout in Jetpack Compose

A `Column` is a composable that arranges its children in a vertical sequence, similar to `LinearLayout` with a vertical orientation in the traditional Android View system.

### Basic Usage

```kotlin
@Composable
fun ColumnExample() {
    Column(modifier = Modifier.fillMaxSize()) {
        Text(text = "First item", modifier = Modifier.padding(16.dp))
        Text(text = "Second item", modifier = Modifier.padding(16.dp))
        Text(text = "Third item", modifier = Modifier.padding(16.dp))
    }
}
```

### Properties of Column

The `Column` composable provides several properties to customize its behavior:

- `modifier`: Allows customization like padding, background color, height, and width.
- `verticalArrangement`: Controls the vertical alignment of child elements (e.g., `Arrangement.Top`, `Arrangement.Center`, `Arrangement.SpaceBetween`).
- `horizontalAlignment`: Aligns children horizontally (e.g., `Alignment.Start`, `Alignment.CenterHorizontally`).

### Example with Alignment and Arrangement

```kotlin
@Composable
fun ColumnWithAlignment() {
    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(text = "Item 1")
        Text(text = "Item 2")
        Text(text = "Item 3")
    }
}
```

This example centers all child elements both horizontally and vertically.

---

## Row Layout in Jetpack Compose

The `Row` composable arranges its children horizontally, similar to a `LinearLayout` with horizontal orientation in the traditional Android system.

### Basic Usage

```kotlin
@Composable
fun RowExample() {
    Row(modifier = Modifier.fillMaxWidth()) {
        Text(text = "Item 1", modifier = Modifier.padding(16.dp))
        Text(text = "Item 2", modifier = Modifier.padding(16.dp))
        Text(text = "Item 3", modifier = Modifier.padding(16.dp))
    }
}
```

### Properties of Row

The `Row` composable has similar properties to `Column`:

- `modifier`: Customizes padding, size, and other layout properties.
- `horizontalArrangement`: Aligns child elements horizontally (`Arrangement.Start`, `Arrangement.SpaceBetween`).
- `verticalAlignment`: Aligns child elements vertically (`Alignment.Top`, `Alignment.CenterVertically`).

### Example with Arrangement and Alignment

```kotlin
@Composable
fun RowWithAlignment() {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceAround,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(text = "Left")
        Text(text = "Center")
        Text(text = "Right")
    }
}
```

This positions elements with equal spacing around them.

---

## Box Layout in Jetpack Compose

The `Box` composable stacks its children on top of each other, similar to `FrameLayout` in the traditional Android View system.

### Basic Usage

```kotlin
@Composable
fun BoxExample() {
    Box(modifier = Modifier.fillMaxSize()) {
        Text(text = "Bottom Item", modifier = Modifier.align(Alignment.BottomEnd))
        Text(text = "Top Item", modifier = Modifier.align(Alignment.TopStart))
    }
}
```

### Properties of Box

- `modifier`: Customizes size, padding, background, etc.
- `contentAlignment`: Aligns all children within the `Box` (`Alignment.Center`, `Alignment.BottomStart`).
- `align` (for individual children): Aligns specific items differently from the rest.

### Example with Overlapping Components

```kotlin
@Composable
fun BoxWithOverlappingItems() {
    Box(modifier = Modifier.size(200.dp).background(Color.Gray)) {
        Text(
            text = "Bottom Layer",
            modifier = Modifier.align(Alignment.Center)
        )
        Text(
            text = "Top Layer",
            modifier = Modifier.align(Alignment.TopEnd).background(Color.Red)
        )
    }
}
```

This example places one `Text` in the center while another overlaps at the top-right corner.

---

## Combining Column, Row, and Box

These three layouts can be combined to create complex UI structures.

### Example: Profile Card Layout

```kotlin
@Composable
fun ProfileCard() {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Box(modifier = Modifier.size(80.dp).background(Color.LightGray)) {
            Text(text = "Image", modifier = Modifier.align(Alignment.Center))
        }
        Column(modifier = Modifier.padding(start = 16.dp)) {
            Text(text = "John Doe", fontSize = 20.sp, fontWeight = FontWeight.Bold)
            Text(text = "Android Developer", fontSize = 16.sp)
        }
    }
}
```

This creates a profile card with an image placeholder and user details arranged in a `Row` with a `Box` and a `Column` inside it.

---

## Conclusion

Jetpack Compose’s `Column`, `Row`, and `Box` composables provide powerful, flexible, and intuitive ways to structure UI layouts. Understanding these layouts is essential for creating responsive and organized UI components in modern Android apps. By mastering these layout components, you can efficiently design interfaces that are both visually appealing and adaptable to different screen sizes.

Are you using Jetpack Compose in your projects? Share your experiences in the comments below!
