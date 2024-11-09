---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- C++ Fundamentals
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-08-02T12:25:39Z"
guid: https://www.siberoloji.com/?p=1460
id: 1460
image: /assets/images/2024/06/cpp.png
tags:
- c++
- c++ fundamentals
title: Single dimension vector operations in C++
url: /single-dimension-vector-operations-in-c/
---

  The provided code demonstrates various operations on a <code>std::vector</code> in C++.
 

 
 ## Code
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">#include &lt;iostream&gt;
#include &lt;vector&gt;

using namespace std;

/**
 * \brief Main function demonstrating various vector operations.
 *
 * This function performs the following operations on a vector:
 * - Initializes a vector with 5 elements.
 * - Fills the vector with numbers from 0 to 4.
 * - Adds and removes elements from the end of the vector.
 * - Inserts and removes elements at the beginning and specific positions.
 * - Clears the vector and prints its contents.
 *
 * \return int Exit status of the program.
 */
int main() {
    vector&lt;int&gt; numbers(5);
    cout &lt;&lt; "Initial vector elements: " &lt;&lt; endl;

    // Fill the vector with numbers
    for (int i = 0; i &lt; numbers.size(); i++) {
        numbers[i] = i;
        cout &lt;&lt; numbers[i] &lt;&lt; endl;
    }
    cout &lt;&lt; "-------------------" &lt;&lt; endl;

    // Add a number to the end of the vector
    numbers.push_back(5);
    cout &lt;&lt; "5 added as the last element: " &lt;&lt; numbers.back() &lt;&lt; endl;
    for (const int number : numbers) {
        cout &lt;&lt; number &lt;&lt; endl;
    }
    cout &lt;&lt; "-------------------" &lt;&lt; endl;

    // Remove the last number from the vector
    numbers.pop_back();
    cout &lt;&lt; "5 removed, now the last element is: " &lt;&lt; numbers[numbers.size() - 1] &lt;&lt; endl;
    for (const int number : numbers) {
        cout &lt;&lt; number &lt;&lt; endl;
    }
    cout &lt;&lt; "-------------------" &lt;&lt; endl;

    // Insert a number at the beginning of the vector
    numbers.insert(numbers.begin(), 10);
    cout &lt;&lt; "10 added as front number. Now the front number of the vector is: " &lt;&lt; numbers.front() &lt;&lt; endl;
    for (const int number : numbers) {
        cout &lt;&lt; number &lt;&lt; endl;
    }
    cout &lt;&lt; "-------------------" &lt;&lt; endl;

    // Remove the first number from the vector
    numbers.erase(numbers.begin());
    cout &lt;&lt; "Front number removed. The new front is: " &lt;&lt; numbers.front() &lt;&lt; endl;
    for (const int number : numbers) {
        cout &lt;&lt; number &lt;&lt; endl;
    }
    cout &lt;&lt; "-------------------" &lt;&lt; endl;

    // Insert a number at the 3rd position of the vector
    numbers.insert(numbers.begin() + 2, 20);
    cout &lt;&lt; "20 added to the 3rd position: " &lt;&lt; numbers[2] &lt;&lt; endl;
    for (const int number : numbers) {
        cout &lt;&lt; number &lt;&lt; endl;
    }
    cout &lt;&lt; "-------------------" &lt;&lt; endl;

    // Remove the number at the 3rd position of the vector
    numbers.erase(numbers.begin() + 2);
    cout &lt;&lt; "20 removed from the 3rd position: " &lt;&lt; numbers[2] &lt;&lt; endl;
    for (const int number : numbers) {
        cout &lt;&lt; number &lt;&lt; endl;
    }
    cout &lt;&lt; "-------------------" &lt;&lt; endl;

    // Clear the vector
    numbers.clear();
    cout &lt;&lt; "Numbers in the vector after clearing: " &lt;&lt; endl;
    for (const int number : numbers) {
        cout &lt;&lt; number &lt;&lt; endl;
    }
    cout &lt;&lt; "-------------------" &lt;&lt; endl;

    return 0;
}</code></pre>
<!-- /wp:code -->

 
 ## Explanation
<!-- /wp:heading -->

  The provided code demonstrates various operations on a <code>std::vector</code> in C++. The <code>main</code> function begins by initializing a vector named <code>numbers</code> with 5 elements and then fills it with numbers from 0 to 4 using a <code>for</code> loop:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">vector&lt;int&gt; numbers(5);
for (int i = 0; i &lt; numbers.size(); i++) {
    numbers[i] = i;
    cout &lt;&lt; numbers[i] &lt;&lt; endl;
}</code></pre>
<!-- /wp:code -->

  Next, the code adds an element to the end of the vector using <code>push_back</code> and prints the last element:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">numbers.push_back(5);
cout &lt;&lt; "5 added as the last element: " &lt;&lt; numbers.back() &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  The last element is then removed using <code>pop_back</code>, and the code prints the new last element:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">numbers.pop_back();
cout &lt;&lt; "5 removed, now the last element is: " &lt;&lt; numbers[numbers.size() - 1] &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  The code proceeds to insert an element at the beginning of the vector using <code>insert</code> and prints the first element:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">numbers.insert(numbers.begin(), 10);
cout &lt;&lt; "10 added as front number. Now the front number of the vector is: " &lt;&lt; numbers.front() &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  The first element is then removed using <code>erase</code>, and the new first element is printed:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">numbers.erase(numbers.begin());
cout &lt;&lt; "Front number removed. The new front is: " &lt;&lt; numbers.front() &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  An element is inserted at the third position, and the element at that position is printed:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">numbers.insert(numbers.begin() + 2, 20);
cout &lt;&lt; "20 added to the 3rd position: " &lt;&lt; numbers[2] &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  The element at the third position is removed, and the new element at that position is printed:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">numbers.erase(numbers.begin() + 2);
cout &lt;&lt; "20 removed from the 3rd position: " &lt;&lt; numbers[2] &lt;&lt; endl;</code></pre>
<!-- /wp:code -->

  Finally, the vector is cleared using <code>clear</code>, and the code prints the contents of the now-empty vector:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">numbers.clear();
cout &lt;&lt; "Numbers in the vector after clearing: " &lt;&lt; endl;
for (const int number : numbers) {
    cout &lt;&lt; number &lt;&lt; endl;
}</code></pre>
<!-- /wp:code -->

  This code effectively demonstrates how to manipulate a <code>std::vector</code> in C++ by adding, removing, and accessing elements at various positions.
 

 
 ## Output
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">Initial vector elements: 
0
1
2
3
4
-------------------
5 added as the last element: 5
0
1
2
3
4
5
-------------------
5 removed, now the last element is: 4
0
1
2
3
4
-------------------
10 added as front number. Now the front number of the vector is: 10
10
0
1
2
3
4
-------------------
Front number removed. The new front is: 0
0
1
2
3
4
-------------------
20 added to the 3rd position: 20
0
1
20
2
3
4
-------------------
20 removed from the 3rd position: 2
0
1
2
3
4
-------------------
Numbers in the vector after clearing: 
-------------------

Process finished with exit code 0</code></pre>
<!-- /wp:code -->

 
 ## Extra information
<!-- /wp:heading -->

  Common operations performed on <code>std::vector</code> in C++ include:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Initialization*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   std::vector&lt;int&gt; vec; // Empty vector
   std::vector&lt;int&gt; vec(5); // Vector with 5 default-initialized elements
   std::vector&lt;int&gt; vec = {1, 2, 3, 4, 5}; // Vector initialized with a list of elements</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- ***Accessing Elements*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   int first = vec.front(); // Access the first element
   int last = vec.back(); // Access the last element
   int element = vec[2]; // Access the element at index 2</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- ***Modifying Elements*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   vec[2] = 10; // Modify the element at index 2</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list"><!-- wp:list-item -->
- ***Adding Elements*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   vec.push_back(6); // Add an element to the end
   vec.insert(vec.begin(), 0); // Insert an element at the beginning
   vec.insert(vec.begin() + 2, 15); // Insert an element at index 2</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":5} -->
<ol start="5" class="wp-block-list"><!-- wp:list-item -->
- ***Removing Elements*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   vec.pop_back(); // Remove the last element
   vec.erase(vec.begin()); // Remove the first element
   vec.erase(vec.begin() + 2); // Remove the element at index 2
   vec.clear(); // Remove all elements</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":6} -->
<ol start="6" class="wp-block-list"><!-- wp:list-item -->
- ***Iterating Over Elements*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   for (int i = 0; i &lt; vec.size(); ++i) {
       std::cout &lt;&lt; vec[i] &lt;&lt; std::endl;
   }

   for (int elem : vec) {
       std::cout &lt;&lt; elem &lt;&lt; std::endl;
   }

   for (auto it = vec.begin(); it != vec.end(); ++it) {
       std::cout &lt;&lt; *it &lt;&lt; std::endl;
   }</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":7} -->
<ol start="7" class="wp-block-list"><!-- wp:list-item -->
- ***Size and Capacity*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   size_t size = vec.size(); // Get the number of elements
   size_t capacity = vec.capacity(); // Get the capacity of the vector
   bool isEmpty = vec.empty(); // Check if the vector is empty
   vec.reserve(10); // Reserve space for at least 10 elements</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":8} -->
<ol start="8" class="wp-block-list"><!-- wp:list-item -->
- ***Swapping and Assigning*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   std::vector&lt;int&gt; vec2 = {7, 8, 9};
   vec.swap(vec2); // Swap contents with another vector
   vec = vec2; // Assign contents from another vector</code></pre>
<!-- /wp:code -->

  These operations cover the most common use cases for <code>std::vector</code> in C++.
 