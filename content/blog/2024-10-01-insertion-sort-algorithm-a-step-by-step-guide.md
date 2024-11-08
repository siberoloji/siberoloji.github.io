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
 

  <strong>How Insertion Sort Works</strong> 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Start with the second element:</strong> The first element is considered sorted.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Compare and insert:</strong> Pick the next element and compare it with the elements in the sorted part of the array.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Shift elements:</strong> If the current element is smaller than the compared element, shift the compared element and all elements after it one position to the right.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Insert:</strong> Insert the current element into the empty position.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Repeat:</strong> Repeat steps 2-4 for all remaining elements in the array.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  <strong>Visual Example</strong> 
 

  Let's sort the array&nbsp;<code>[5, 2, 4, 6, 1, 3]</code>&nbsp;using insertion sort: 
 

  <strong>Step 1:</strong>&nbsp;The first element (5) is considered sorted. 
 

  <strong>Step 2:</strong>&nbsp;Compare 2 with 5. 2 is smaller, so shift 5 to the right and insert 2 in its place. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Array: <code>[2, 5, 4, 6, 1, 3]</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Step 3:</strong>&nbsp;Compare 4 with 5. 4 is smaller, so shift 5 to the right and insert 4 in its place. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Array: <code>[2, 4, 5, 6, 1, 3]</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Step 4:</strong>&nbsp;Compare 6 with 5. 6 is larger, so it remains in its position. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Array: <code>[2, 4, 5, 6, 1, 3]</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Step 5:</strong>&nbsp;Compare 1 with 5. 1 is smaller, so shift 5, 6, and 3 to the right and insert 1 in its place. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Array: <code>[1, 2, 4, 5, 6, 3]</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Step 6:</strong>&nbsp;Compare 3 with 5. 3 is smaller, so shift 5 and 6 to the right and insert 3 in its place. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Array: <code>[1, 2, 3, 4, 5, 6]</code></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  The array is now sorted. 
 

  <strong>Code Implementation (Python)</strong> 
 

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

  <strong>Time Complexity</strong> 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Best case:</strong> The array is already sorted. The time complexity is O(n).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Average case:</strong> The time complexity is O(n^2).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Worst case:</strong> The array is sorted in reverse order. The time complexity is O(n^2).</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Space Complexity</strong> 
 

  The space complexity of insertion sort is O(1) as it only requires a constant amount of extra space. 
 

  <strong>Advantages of Insertion Sort</strong> 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Simple to implement:</strong> Insertion sort is easy to understand and code.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Efficient for small datasets:</strong> It's a good choice for small arrays.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Online algorithm:</strong> It can process elements one at a time as they arrive.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Stable:</strong> It preserves the relative order of elements with equal keys.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Disadvantages of Insertion Sort</strong> 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Inefficient for large datasets:</strong> It's not suitable for large arrays due to its quadratic time complexity.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Slow for nearly sorted arrays:</strong> While it's efficient for sorted arrays, it can be slow for nearly sorted arrays.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  <strong>Conclusion</strong> 
 

  Insertion sort is a basic sorting algorithm that's suitable for small datasets and simple applications. However, for larger datasets, more efficient algorithms like quicksort or merge sort are preferred. Understanding insertion sort is a good starting point for learning more complex sorting algorithms. 
 