---
draft: false
title: Using LazyColumn and LazyRow for Lists in Jetpack Compose
linkTitle: LazyColumn and LazyRow in Jetpack Compose
translationKey: using-lazycolumn-and-lazyrow-for-lists-in-jetpack-compose
description: This article explains how to use LazyColumn and LazyRow in Jetpack Compose, what they are, how they work, and how to use them to create smooth and efficient lists in Jetpack Compose.
url: using-lazycolumn-and-lazyrow-for-lists-in-jetpack-compose
weight: 150
date: 2025-02-27
tags:
  - Compose
  - Jetpack
categories:
  - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Jetpack Compose
  - lazy loading
  - LazyColumn
  - LazyRow
---
Jetpack Compose, Google's modern toolkit for building native Android UIs, introduces powerful tools for handling lists efficiently. One of the key components for displaying lists is `LazyColumn` and `LazyRow`, which enable efficient rendering of large datasets without sacrificing performance.

In this blog post, we will explore what `LazyColumn` and `LazyRow` are, how they work, and how you can use them to create smooth and efficient lists in your Jetpack Compose applications.

---

## Understanding LazyColumn and LazyRow

When working with lists in traditional Android development using XML-based layouts and `RecyclerView`, developers had to implement complex view recycling mechanisms to ensure smooth scrolling performance. With Jetpack Compose, this process is significantly simplified using `LazyColumn` and `LazyRow`.

- **`LazyColumn`**: A vertically scrolling list that only composes and lays out the currently visible items, making it more efficient than a regular `Column`.
- **`LazyRow`**: A horizontally scrolling list that optimizes rendering by only composing visible items, similar to `LazyColumn` but in a horizontal orientation.

Both of these composables leverage lazy loading techniques to improve performance when rendering large lists.

---

## When to Use LazyColumn vs. LazyRow

Choosing between `LazyColumn` and `LazyRow` depends on the layout requirement:

- Use **`LazyColumn`** when you need a **vertical scrolling list** (e.g., displaying a list of messages, a list of articles, or a vertical feed).
- Use **`LazyRow`** when you need a **horizontal scrolling list** (e.g., a carousel of images, horizontally scrolling categories, or horizontal card-based UI components).

Unlike a standard `Column` or `Row`, which renders all child items regardless of whether they are visible, `LazyColumn` and `LazyRow` only compose the items currently visible on the screen, improving memory usage and UI performance.

---

## Implementing LazyColumn

To use `LazyColumn`, you define its items using the `items` function. Here's an example demonstrating how to create a simple list with `LazyColumn`:

```kotlin
@Composable
fun SimpleLazyColumn() {
    val itemsList = List(100) { "Item #$it" } // Creating a list of 100 items
    
    LazyColumn {
        items(itemsList) { item ->
            Text(
                text = item,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                fontSize = 18.sp
            )
        }
    }
}
```

### Key Points

- The `itemsList` contains 100 elements, but only the visible items are rendered at any given time.
- The `items()` function inside `LazyColumn` takes a list and generates UI elements for each item.
- The `modifier` ensures that each item has padding and takes up the full width of the screen.

---

## Implementing LazyRow

Similarly, `LazyRow` is used for horizontal scrolling lists. Here’s an example:

```kotlin
@Composable
fun SimpleLazyRow() {
    val itemsList = List(20) { "Item #$it" }
    
    LazyRow(modifier = Modifier.padding(16.dp)) {
        items(itemsList) { item ->
            Card(
                modifier = Modifier
                    .padding(8.dp)
                    .width(120.dp)
                    .height(80.dp),
                shape = RoundedCornerShape(8.dp),
                elevation = 4.dp
            ) {
                Box(
                    contentAlignment = Alignment.Center,
                    modifier = Modifier.fillMaxSize()
                ) {
                    Text(text = item, fontSize = 16.sp)
                }
            }
        }
    }
}
```

### Key Points

- `LazyRow` is used to create a horizontally scrolling list.
- Items are wrapped inside `Card` components to create a visually appealing UI.
- `Modifier.padding()` ensures spacing between items.
- `Box` is used to center the text inside each card.

---

## Adding Headers and Footers

You can add headers and footers in `LazyColumn` and `LazyRow` using the `item {}` function. Here’s an example:

```kotlin
@Composable
fun LazyColumnWithHeaderFooter() {
    val itemsList = List(50) { "Item #$it" }
    
    LazyColumn {
        item {
            Text("Header", fontSize = 20.sp, fontWeight = FontWeight.Bold, modifier = Modifier.padding(16.dp))
        }
        
        items(itemsList) { item ->
            Text(text = item, modifier = Modifier.padding(16.dp))
        }
        
        item {
            Text("Footer", fontSize = 20.sp, fontWeight = FontWeight.Bold, modifier = Modifier.padding(16.dp))
        }
    }
}
```

### Key Points

- The `item {}` function is used to add a single non-repeating item (like a header or footer).
- This technique is useful for adding section headers, banners, or dividers.

---

## Handling Click Events

To make list items interactive, you can use `Modifier.clickable`.

```kotlin
@Composable
fun ClickableLazyColumn() {
    val itemsList = List(10) { "Item #$it" }
    
    LazyColumn {
        items(itemsList) { item ->
            Text(
                text = item,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
                    .clickable { println("Clicked on $item") },
                fontSize = 18.sp
            )
        }
    }
}
```

### Key Points

- `Modifier.clickable {}` makes each item clickable.
- A simple `println` statement logs the clicked item (replace with actual event handling logic in a real app).

---

## Conclusion

`LazyColumn` and `LazyRow` are essential components in Jetpack Compose for handling large lists efficiently. They offer a straightforward API, improved performance through lazy loading, and support for headers, footers, and interactions with minimal boilerplate code.

By leveraging these components, you can create smooth and optimized list-based UIs in your Jetpack Compose applications. Whether you're displaying vertical lists with `LazyColumn` or horizontal carousels with `LazyRow`, these tools simplify the process of working with dynamic content in modern Android development.

---

Do you have any favorite use cases for `LazyColumn` or `LazyRow`? Let us know in the comments!
