---
draft: false

title:  'Insertion Sort Algorithm: A Step-by-Step Guide'
date: '2024-10-01T01:40:41+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /insertion-sort-algorithm-a-step-by-step-guide/
 
featured_image: /images/algorithms.jpeg
categories:
    - Programming
tags:
    - programming
---


Insertion sort is a simple sorting algorithm that works by repeatedly inserting an element into its correct position in an already sorted array. It's efficient for small datasets and can be a good choice when the array is nearly sorted.



**How Insertion Sort Works**


* **Start with the second element:** The first element is considered sorted.

* **Compare and insert:** Pick the next element and compare it with the elements in the sorted part of the array.

* **Shift elements:** If the current element is smaller than the compared element, shift the compared element and all elements after it one position to the right.

* **Insert:** Insert the current element into the empty position.

* **Repeat:** Repeat steps 2-4 for all remaining elements in the array.
**Visual Example**



Let's sort the array `[5, 2, 4, 6, 1, 3]` using insertion sort:



**Step 1:** The first element (5) is considered sorted.



**Step 2:** Compare 2 with 5. 2 is smaller, so shift 5 to the right and insert 2 in its place.


* Array: `[2, 5, 4, 6, 1, 3]`
**Step 3:** Compare 4 with 5. 4 is smaller, so shift 5 to the right and insert 4 in its place.


* Array: `[2, 4, 5, 6, 1, 3]`
**Step 4:** Compare 6 with 5. 6 is larger, so it remains in its position.


* Array: `[2, 4, 5, 6, 1, 3]`
**Step 5:** Compare 1 with 5. 1 is smaller, so shift 5, 6, and 3 to the right and insert 1 in its place.


* Array: `[1, 2, 4, 5, 6, 3]`
**Step 6:** Compare 3 with 5. 3 is smaller, so shift 5 and 6 to the right and insert 3 in its place.


* Array: `[1, 2, 3, 4, 5, 6]`
The array is now sorted.



**Code Implementation (Python)**


<!-- wp:code -->
<pre class="wp-block-code"><code lang="python" class="language-python">def insertion_sort(arr):
  n = len(arr)

  # Traverse through 1 to n
  for i in range(1, n):
    key = arr[i]

    # Move elements of arr[0..i-1], that are
    # greater than key,    to one position ahead
    # of their current position
    j = i-1
    while j >= 0 and key < arr[j]:
        arr[j+1] = arr[j]
        j -= 1
    arr[j+1] = key

# Driver code to test above
arr    = [5, 2, 4, 6, 1, 3]
insertion_sort(arr)
print("Sorted array is:")
for i in range(len(arr)):
    print(arr[i], end=" ")
```



**Time Complexity**


* **Best case:** The array is already sorted. The time complexity is O(n).

* **Average case:** The time complexity is O(n^2).

* **Worst case:** The array is sorted in reverse order. The time complexity is O(n^2).
**Space Complexity**



The space complexity of insertion sort is O(1) as it only requires a constant amount of extra space.



**Advantages of Insertion Sort**


* **Simple to implement:** Insertion sort is easy to understand and code.

* **Efficient for small datasets:** It's a good choice for small arrays.

* **Online algorithm:** It can process elements one at a time as they arrive.

* **Stable:** It preserves the relative order of elements with equal keys.
**Disadvantages of Insertion Sort**


* **Inefficient for large datasets:** It's not suitable for large arrays due to its quadratic time complexity.

* **Slow for nearly sorted arrays:** While it's efficient for sorted arrays, it can be slow for nearly sorted arrays.
**Conclusion**



Insertion sort is a basic sorting algorithm that's suitable for small datasets and simple applications. However, for larger datasets, more efficient algorithms like quicksort or merge sort are preferred. Understanding insertion sort is a good starting point for learning more complex sorting algorithms.
