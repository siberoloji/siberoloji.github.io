---
draft: false
title: Handling Gestures and Touch Events in Jetpack Compose
linkTitle: Handling Gestures and Touch Events
translationKey: handling-gestures-and-touch-events-in-jetpack-compose
description: Learn how to handle gestures and touch events in Jetpack Compose
url: handling-gestures-and-touch-events-in-jetpack-compose
weight: 220
date: 2025-03-04
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - Gestures
  - Touch Events
---
Jetpack Compose, Google’s modern UI toolkit for Android, offers a powerful and flexible way to handle gestures and touch events. With a declarative approach to UI development, Compose simplifies interactions while providing fine-grained control over gesture recognition and event handling. In this blog post, we will explore the fundamentals of handling gestures and touch events in Jetpack Compose, covering everything from basic click handling to more advanced gestures like drag, swipe, and multi-touch interactions.

## Understanding Gesture Detection in Jetpack Compose

Jetpack Compose provides a set of built-in modifiers that allow developers to easily detect and respond to user interactions. These modifiers make handling gestures straightforward while offering customization for more complex use cases.

### 1. Basic Click Handling

Handling a simple click event in Jetpack Compose is as easy as adding the `clickable` modifier to a composable.

```kotlin
@Composable
fun ClickableBox() {
    Box(
        modifier = Modifier
            .size(100.dp)
            .background(Color.Blue)
            .clickable { println("Box clicked!") }
    )
}
```

In this example, when the user taps the blue box, a message is logged in the console. The `clickable` modifier not only detects taps but also provides built-in support for accessibility and ripple effects.

### 2. Detecting Press Gestures

Sometimes, you need to detect when a user presses down and releases, without necessarily considering it a "click." The `pointerInput` modifier allows you to handle touch gestures more granularly using `detectTapGestures`.

```kotlin
@Composable
fun PressGestureBox() {
    Box(
        modifier = Modifier
            .size(100.dp)
            .background(Color.Green)
            .pointerInput(Unit) {
                detectTapGestures(
                    onPress = {
                        println("Box pressed!")
                    }
                )
            }
    )
}
```

The `onPress` callback is triggered when the user presses down on the box, even if they don’t release their finger.

## Handling Advanced Gestures

Beyond simple clicks and presses, Jetpack Compose provides powerful mechanisms for handling advanced gestures like drag, swipe, and multi-touch interactions.

### 1. Implementing Drag Gestures

To detect drag gestures, you can use `pointerInput` with `detectDragGestures`. This is useful for implementing elements that respond to user movement, such as a draggable card.

```kotlin
@Composable
fun DraggableBox() {
    var offset by remember { mutableStateOf(Offset.Zero) }

    Box(
        modifier = Modifier
            .offset { IntOffset(offset.x.roundToInt(), offset.y.roundToInt()) }
            .size(100.dp)
            .background(Color.Red)
            .pointerInput(Unit) {
                detectDragGestures { change, dragAmount ->
                    offset += dragAmount
                }
            }
    )
}
```

In this example, the `detectDragGestures` function updates the `offset` state based on user movement, causing the box to move with the user's finger.

### 2. Detecting Swipe Gestures

Swipe gestures are commonly used for implementing dismissible elements or navigation behaviors. You can use `detectHorizontalDragGestures` or `detectVerticalDragGestures` for swipe detection.

```kotlin
@Composable
fun SwipeableBox() {
    var offsetX by remember { mutableStateOf(0f) }

    Box(
        modifier = Modifier
            .offset { IntOffset(offsetX.roundToInt(), 0) }
            .size(150.dp, 100.dp)
            .background(Color.Magenta)
            .pointerInput(Unit) {
                detectHorizontalDragGestures { _, dragAmount ->
                    offsetX += dragAmount
                }
            }
    )
}
```

This example moves the box horizontally in response to swipe gestures.

### 3. Multi-Touch Gestures (Pinch to Zoom)

For handling multi-touch gestures like pinch-to-zoom, use `detectTransformGestures`.

```kotlin
@Composable
fun ZoomableBox() {
    var scale by remember { mutableStateOf(1f) }

    Box(
        modifier = Modifier
            .graphicsLayer(scaleX = scale, scaleY = scale)
            .size(150.dp)
            .background(Color.Yellow)
            .pointerInput(Unit) {
                detectTransformGestures { _, _, zoom, _ ->
                    scale *= zoom
                }
            }
    )
}
```

This snippet detects pinch gestures and adjusts the box’s scale accordingly.

## Gesture Combinations and Customization

Jetpack Compose allows combining multiple gestures using `awaitPointerEventScope`, giving developers fine-grained control over event sequences.

```kotlin
@Composable
fun CustomGestureBox() {
    Box(
        modifier = Modifier
            .size(100.dp)
            .background(Color.Cyan)
            .pointerInput(Unit) {
                awaitPointerEventScope {
                    while (true) {
                        val event = awaitPointerEvent()
                        println("Event: ${event.type}")
                    }
                }
            }
    )
}
```

This approach lets you analyze different types of touch events in real time, offering high flexibility for custom interactions.

## Conclusion

Jetpack Compose simplifies gesture handling with its declarative approach, built-in modifiers, and powerful event detection mechanisms. Whether you need to detect simple clicks, handle drag-and-drop interactions, or implement multi-touch gestures, Compose provides flexible and customizable APIs to meet your needs.

By leveraging `clickable`, `pointerInput`, `detectTapGestures`, `detectDragGestures`, and `detectTransformGestures`, you can create intuitive and responsive UI interactions that enhance the user experience in your Android apps.

As Jetpack Compose continues to evolve, gesture handling capabilities will likely expand further, making it even easier to build rich, interactive applications. Experiment with these APIs and customize them to fit your app's needs for a seamless touch experience.
