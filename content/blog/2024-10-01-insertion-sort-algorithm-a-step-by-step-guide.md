---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Programming
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-10-01T01:40:41Z"
guid: https://www.siberoloji.com/?p=1999
id: 1999
image: /assets/images/2024/10/algorithms.jpeg
tags:
- programming
title: 'Insertion Sort Algorithm: A Step-by-Step Guide'
url: /insertion-sort-algorithm-a-step-by-step-guide/
---

  Insertion sort is a simple sorting algorithm that works by repeatedly inserting an element into its correct position in an already sorted array. It's efficient for small datasets and can be a good choice when the array is nearly sorted. 
 

  ***How Insertion Sort Works***  
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Start with the second element:*** The first element is considered sorted. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Compare and insert:*** Pick the next element and compare it with the elements in the sorted part of the array. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Shift elements:*** If the current element is smaller than the compared element, shift the compared element and all elements after it one position to the right. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Insert:*** Insert the current element into the empty position. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Repeat:*** Repeat steps 2-4 for all remaining elements in the array. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Visual Example***  
 

  Let's sort the array&nbsp;<code>[5, 2, 4, 6, 1, 3]</code>&nbsp;using insertion sort: 
 

  ***Step 1:*** &nbsp;The first element (5) is considered sorted. 
 

  ***Step 2:*** &nbsp;Compare 2 with 5. 2 is smaller, so shift 5 to the right and insert 2 in its place. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Array:<code>[2, 5, 4, 6, 1, 3]</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Step 3:*** &nbsp;Compare 4 with 5. 4 is smaller, so shift 5 to the right and insert 4 in its place. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Array:<code>[2, 4, 5, 6, 1, 3]</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Step 4:*** &nbsp;Compare 6 with 5. 6 is larger, so it remains in its position. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Array:<code>[2, 4, 5, 6, 1, 3]</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Step 5:*** &nbsp;Compare 1 with 5. 1 is smaller, so shift 5, 6, and 3 to the right and insert 1 in its place. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Array:<code>[1, 2, 4, 5, 6, 3]</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Step 6:*** &nbsp;Compare 3 with 5. 3 is smaller, so shift 5 and 6 to the right and insert 3 in its place. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Array:<code>[1, 2, 3, 4, 5, 6]</code> 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  The array is now sorted. 
 

  ***Code Implementation (Python)***  
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="python" class="language-python">def insertion_sort(arr):
  n = len(arr)

  # Traverse through 1 to n
  for i in range(1, n):
    key = arr[i]

    # Move elements of arr[0..i-1], that are
    # greater than key, &nbsp;  to one position ahead
    # of their current position
    j = i-1
    while j &gt;= 0 and key &lt; arr[j]:
        arr[j+1] = arr[j]
        j -= 1
    arr[j+1] = key

# Driver code to test above
arr &nbsp;  = [5, 2, 4, 6, 1, 3]
insertion_sort(arr)
print("Sorted array is:")
for i in range(len(arr)):
    print(arr[i], end=" ")
</code></pre>
<!-- /wp:code -->

  ***Time Complexity***  
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Best case:*** The array is already sorted. The time complexity is O(n). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Average case:*** The time complexity is O(n^2). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Worst case:*** The array is sorted in reverse order. The time complexity is O(n^2). 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Space Complexity***  
 

  The space complexity of insertion sort is O(1) as it only requires a constant amount of extra space. 
 

  ***Advantages of Insertion Sort***  
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Simple to implement:*** Insertion sort is easy to understand and code. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Efficient for small datasets:*** It's a good choice for small arrays. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Online algorithm:*** It can process elements one at a time as they arrive. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Stable:*** It preserves the relative order of elements with equal keys. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Disadvantages of Insertion Sort***  
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Inefficient for large datasets:*** It's not suitable for large arrays due to its quadratic time complexity. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Slow for nearly sorted arrays:*** While it's efficient for sorted arrays, it can be slow for nearly sorted arrays. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  ***Conclusion***  
 

  Insertion sort is a basic sorting algorithm that's suitable for small datasets and simple applications. However, for larger datasets, more efficient algorithms like quicksort or merge sort are preferred. Understanding insertion sort is a good starting point for learning more complex sorting algorithms. 
 