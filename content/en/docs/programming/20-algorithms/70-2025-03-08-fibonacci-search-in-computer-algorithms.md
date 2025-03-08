---
draft: false
title: Fibonacci Search in Computer Algorithms
linkTitle: Fibonacci Search
translationKey: fibonacci-search-in-computer-algorithms
description: Explains the Fibonacci Search algorithm, a comparison-based search technique for efficiently finding elements in a sorted array.
url: fibonacci-search-in-computer-algorithms
weight: 70
date: 2025-03-08
tags:
    - algorithms
categories:
    - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
    - algorithms
    - fibonacci search
---
## Introduction

Searching algorithms are fundamental in computer science, allowing efficient retrieval of information from a structured or unstructured data set. Among various search algorithms, Fibonacci Search is a lesser-known yet effective technique for searching in sorted arrays. It is particularly useful when dealing with datasets that fit in memory but require an alternative to binary search due to constraints such as computational efficiency in certain architectures. This article delves into the principles, workings, and advantages of Fibonacci Search in computer algorithms.

## Understanding Fibonacci Search

### What is Fibonacci Search?

Fibonacci Search is a comparison-based technique that leverages Fibonacci numbers to divide the search space efficiently. It operates on a sorted array and employs the Fibonacci sequence to reduce the problem size in a way similar to binary search but with slightly different partitioning.

This search method is particularly beneficial when the cost of accessing elements varies across the dataset, as it minimizes the number of costly lookups by using a well-structured partitioning scheme.

### How Fibonacci Numbers Work in Searching

The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones:

\\[ F_0 = 0, F_1 = 1, F_n = F_{n-1} + F_{n-2} \\]

For example, the first few Fibonacci numbers are: 0, 1, 1, 2, 3, 5, 8, 13, 21, etc.

In Fibonacci Search, we use these numbers to determine the positions for element comparison, ensuring a structured reduction of the search space.

## Algorithm Explanation

Fibonacci Search works by successively reducing the array size using Fibonacci numbers. Below are the key steps involved:

### Step 1: Initialize Fibonacci Numbers

- Compute the smallest Fibonacci number greater than or equal to the length of the array (`n`).
- Let `fibM = F_m`, `fibM1 = F_m-1`, and `fibM2 = F_m-2`.

### Step 2: Set Initial Comparison Position

- Define an offset, initialized to -1.
- The first position to check is `offset + fibM2` (i.e., `fibM2` positions ahead of `offset`).

### Step 3: Perform Comparisons and Reduce Search Space

- Compare the target value with the element at the computed position.
  - If the target value is smaller, reduce the Fibonacci sequence (`fibM = fibM2`, `fibM1 = fibM1 - fibM2`, `fibM2 = fibM - fibM1`) and update the index.
  - If the target value is greater, move the offset to the current position and reduce the sequence accordingly.
  - If the target value matches, return the index.

### Step 4: Handle the Last Element

- If after all reductions `fibM1` equals 1, check the last remaining element for a match.
- If found, return the index; otherwise, return -1.

## Implementation of Fibonacci Search

Below is an implementation of Fibonacci Search in Python:

```python
# Fibonacci Search Implementation in Python
def fibonacci_search(arr, x):
    n = len(arr)
    fibM2 = 0  # (m-2)'th Fibonacci number
    fibM1 = 1  # (m-1)'th Fibonacci number
    fibM = fibM2 + fibM1  # m'th Fibonacci number

    while fibM < n:
        fibM2 = fibM1
        fibM1 = fibM
        fibM = fibM2 + fibM1

    offset = -1

    while fibM > 1:
        i = min(offset + fibM2, n - 1)

        if arr[i] < x:
            fibM = fibM1
            fibM1 = fibM2
            fibM2 = fibM - fibM1
            offset = i
        elif arr[i] > x:
            fibM = fibM2
            fibM1 = fibM1 - fibM2
            fibM2 = fibM - fibM1
        else:
            return i

    if fibM1 and offset + 1 < n and arr[offset + 1] == x:
        return offset + 1

    return -1

# Example usage:
arr = [10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100]
x = 85
index = fibonacci_search(arr, x)
print(f"Element found at index {index}" if index != -1 else "Element not found")
```

## Complexity Analysis

- **Time Complexity:** The worst-case time complexity of Fibonacci Search is \\(O(\\log n)\\), similar to Binary Search.
- **Space Complexity:** Fibonacci Search requires additional space for storing Fibonacci numbers, making it slightly less space-efficient than Binary Search.

## Advantages of Fibonacci Search

1. **Efficient for Large Sorted Arrays:** Like Binary Search, Fibonacci Search effectively reduces the number of comparisons.
2. **Optimized for Uniformly Distributed Data:** It works well when data is evenly spread across the search space.
3. **Minimizes Costly Accesses:** In systems where element access is expensive (e.g., slow memory reads), Fibonacci Search reduces lookup costs more effectively than binary search.

## Disadvantages

1. **Not Suitable for Unsorted Arrays:** Like Binary Search, it only works on sorted arrays.
2. **Additional Overhead:** Requires computing Fibonacci numbers and keeping track of extra variables.
3. **Not Always Better than Binary Search:** While Fibonacci Search can be beneficial in some cases, Binary Search is often simpler and just as effective.

## Applications of Fibonacci Search

- **Database Indexing:** Searching in large, sorted datasets in databases.
- **Network Routing:** Optimization of pathfinding in network structures.
- **Optimization Problems:** Used in some optimization techniques where partitioning is required.

## Conclusion

Fibonacci Search is an efficient and interesting alternative to Binary Search for sorted arrays, especially in environments where access costs vary. While not universally superior to Binary Search, it offers advantages in specific scenarios, such as database retrieval and optimization problems. Understanding Fibonacci Search enriches the toolbox of any computer scientist or software developer looking to optimize search operations.
