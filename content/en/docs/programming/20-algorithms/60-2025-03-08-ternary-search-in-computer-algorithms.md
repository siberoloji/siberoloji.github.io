---
draft: false
title: Ternary Search in Computer Algorithms
linkTitle: Ternary Search
translationKey: ternary-search-in-computer-algorithms
description: An article on the ternary search algorithm, a divide-and-conquer algorithm for finding the maximum or minimum of unimodal functions.
url: ternary-search-in-computer-algorithms
weight: 60
date: 2025-03-08
tags:
    - algorithms
categories:
    - Programming
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
    - algorithms
    - ternary search
---
## Introduction

Ternary search is a fundamental search algorithm used in computer science, primarily for finding the maximum or minimum of unimodal functions or searching within a sorted dataset. Unlike binary search, which divides the search space into two parts, ternary search divides it into three. This allows for potentially faster search times in specific cases where it is applicable.

In this article, we will delve into the working of ternary search, its implementation, complexity analysis, and applications. We will also compare it with other searching techniques like binary search and discuss when it is preferable to use ternary search.

---

## Understanding Ternary Search

Ternary search is a divide-and-conquer algorithm that splits the search interval into three parts instead of two. It is generally used when we are dealing with unimodal functions, which have a single peak (maximum or minimum) in a given interval.

### How Ternary Search Works

Ternary search works by dividing the search space into three equal parts and recursively narrowing down the segment where the target value or optimal function value exists. It follows these steps:

1. **Determine Two Midpoints**: Given a search interval `[low, high]`, two midpoints `mid1` and `mid2` are chosen such that:

   ```
   mid1 = low + (high - low) / 3
   mid2 = high - (high - low) / 3
   ```

   These divide the range into three segments.

2. **Evaluate the Condition**:
   - If searching for a target value in a sorted array:
     - If the target is at `mid1`, return `mid1`.
     - If the target is at `mid2`, return `mid2`.
     - If the target lies in the first third, recurse on `[low, mid1 - 1]`.
     - If the target lies in the last third, recurse on `[mid2 + 1, high]`.
     - Otherwise, recurse on `[mid1 + 1, mid2 - 1]`.

   - If searching for an extremum in a unimodal function:
     - Compare the function values at `mid1` and `mid2`.
     - If `f(mid1) < f(mid2)`, then the maximum/minimum lies in `[mid1, high]`.
     - Otherwise, the extremum lies in `[low, mid2]`.

3. **Repeat Until the Interval Shrinks**: The recursion continues until `low` equals `high`, at which point the target is found or the optimal value of the function is determined.

---

## Implementation of Ternary Search

Below is an implementation of ternary search in Python:

```python
# Iterative approach to ternary search

def ternary_search(arr, low, high, key):
    while low <= high:
        mid1 = low + (high - low) // 3
        mid2 = high - (high - low) // 3

        if arr[mid1] == key:
            return mid1
        if arr[mid2] == key:
            return mid2

        if key < arr[mid1]:
            high = mid1 - 1
        elif key > arr[mid2]:
            low = mid2 + 1
        else:
            low = mid1 + 1
            high = mid2 - 1
    
    return -1  # Element not found

# Example usage
arr = [1, 3, 5, 7, 9, 11, 15, 18]
key = 7
index = ternary_search(arr, 0, len(arr) - 1, key)
print("Element found at index:", index)
```

This implementation is an iterative version, which is generally preferred over recursion to avoid excessive function calls and stack overhead.

---

## Complexity Analysis

### Time Complexity

At each step, the search space is reduced to approximately **two-thirds** of its previous size, unlike binary search, which reduces it to half. The recurrence relation for ternary search is:

\\[ T(n) = T(n/3) + O(1) \\]

Solving this recurrence gives:

\\[ T(n) = O(log_3(n)) \\]

Since logarithm base change implies:

\\[ log_3(n) = log_2(n) / log_2(3) \\]

we see that **ternary search has a complexity of O(log n), but it is slightly slower than binary search due to its base 3 instead of 2**.

### Space Complexity

- **Iterative Implementation**: `O(1)` (constant space usage).
- **Recursive Implementation**: `O(log_3(n))` due to recursive call stack.

---

## Applications of Ternary Search

Ternary search is used in various computational problems, particularly where a unimodal function is involved. Some key applications include:

1. **Finding Extremes in Unimodal Functions**: Used in mathematical optimization where a function has a single peak or valley.
2. **Search in Sorted Arrays**: An alternative to binary search, though it is usually slower due to additional computations.
3. **Tuning Hyperparameters in Machine Learning**: When optimizing hyperparameters, ternary search can be used when the function to be optimized is unimodal.
4. **Game Theory and AI**: In scenarios where optimal decisions follow a unimodal pattern, ternary search helps in strategic decision-making.

---

## Comparison with Binary Search

| Feature           | Binary Search | Ternary Search |
|------------------|--------------|--------------|
| Search Division | 2 parts       | 3 parts       |
| Complexity      | O(log n)      | O(log n) (slower) |
| Efficiency     | Faster due to fewer comparisons | Slightly slower |
| Application    | General sorted search | Unimodal functions, optimization |

In most cases, **binary search is preferred over ternary search** for searching in sorted arrays because binary search requires fewer comparisons and is easier to implement. However, for unimodal functions, ternary search is a more suitable choice.

---

## Conclusion

Ternary search is a powerful algorithm for searching in a sorted array and for optimizing unimodal functions. While it has a logarithmic complexity similar to binary search, it tends to be less efficient for standard searching problems due to additional computations. However, it excels in function optimization scenarios where a single peak or trough exists.

Understanding when to use ternary search over binary search is crucial for writing efficient algorithms. While binary search remains the go-to method for sorted arrays, ternary search is invaluable in mathematical and AI-related applications where function optimization is required.

By mastering both search techniques, developers and data scientists can optimize their code for a variety of real-world scenarios, ensuring efficiency and performance in computational problems.
