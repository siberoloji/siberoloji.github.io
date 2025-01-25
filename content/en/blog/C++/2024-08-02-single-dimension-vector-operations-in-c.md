---
draft: false

title:  'Single dimension vector operations in C++'
date: '2024-08-02T12:25:39+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /single-dimension-vector-operations-in-c/
 
featured_image: /images/cpp.png
categories:
    - 'C++ Fundamentals'
tags:
    - c++
    - 'c++ fundamentals'
---


The provided code demonstrates various operations on a `std::vector` in C++.



## Code


```cpp
#include <iostream>
#include <vector>

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
    vector<int> numbers(5);
    cout << "Initial vector elements: " << endl;

    // Fill the vector with numbers
    for (int i = 0; i < numbers.size(); i++) {
        numbers[i] = i;
        cout << numbers[i] << endl;
    }
    cout << "-------------------" << endl;

    // Add a number to the end of the vector
    numbers.push_back(5);
    cout << "5 added as the last element: " << numbers.back() << endl;
    for (const int number : numbers) {
        cout << number << endl;
    }
    cout << "-------------------" << endl;

    // Remove the last number from the vector
    numbers.pop_back();
    cout << "5 removed, now the last element is: " << numbers[numbers.size() - 1] << endl;
    for (const int number : numbers) {
        cout << number << endl;
    }
    cout << "-------------------" << endl;

    // Insert a number at the beginning of the vector
    numbers.insert(numbers.begin(), 10);
    cout << "10 added as front number. Now the front number of the vector is: " << numbers.front() << endl;
    for (const int number : numbers) {
        cout << number << endl;
    }
    cout << "-------------------" << endl;

    // Remove the first number from the vector
    numbers.erase(numbers.begin());
    cout << "Front number removed. The new front is: " << numbers.front() << endl;
    for (const int number : numbers) {
        cout << number << endl;
    }
    cout << "-------------------" << endl;

    // Insert a number at the 3rd position of the vector
    numbers.insert(numbers.begin() + 2, 20);
    cout << "20 added to the 3rd position: " << numbers[2] << endl;
    for (const int number : numbers) {
        cout << number << endl;
    }
    cout << "-------------------" << endl;

    // Remove the number at the 3rd position of the vector
    numbers.erase(numbers.begin() + 2);
    cout << "20 removed from the 3rd position: " << numbers[2] << endl;
    for (const int number : numbers) {
        cout << number << endl;
    }
    cout << "-------------------" << endl;

    // Clear the vector
    numbers.clear();
    cout << "Numbers in the vector after clearing: " << endl;
    for (const int number : numbers) {
        cout << number << endl;
    }
    cout << "-------------------" << endl;

    return 0;
}
```



## Explanation



The provided code demonstrates various operations on a `std::vector` in C++. The `main` function begins by initializing a vector named `numbers` with 5 elements and then fills it with numbers from 0 to 4 using a `for` loop:


```cpp
vector<int> numbers(5);
for (int i = 0; i < numbers.size(); i++) {
    numbers[i] = i;
    cout << numbers[i] << endl;
}
```



Next, the code adds an element to the end of the vector using `push_back` and prints the last element:


```cpp
numbers.push_back(5);
cout << "5 added as the last element: " << numbers.back() << endl;
```



The last element is then removed using `pop_back`, and the code prints the new last element:


```cpp
numbers.pop_back();
cout << "5 removed, now the last element is: " << numbers[numbers.size() - 1] << endl;
```



The code proceeds to insert an element at the beginning of the vector using `insert` and prints the first element:


```cpp
numbers.insert(numbers.begin(), 10);
cout << "10 added as front number. Now the front number of the vector is: " << numbers.front() << endl;
```



The first element is then removed using `erase`, and the new first element is printed:


```cpp
numbers.erase(numbers.begin());
cout << "Front number removed. The new front is: " << numbers.front() << endl;
```



An element is inserted at the third position, and the element at that position is printed:


```cpp
numbers.insert(numbers.begin() + 2, 20);
cout << "20 added to the 3rd position: " << numbers[2] << endl;
```



The element at the third position is removed, and the new element at that position is printed:


```cpp
numbers.erase(numbers.begin() + 2);
cout << "20 removed from the 3rd position: " << numbers[2] << endl;
```



Finally, the vector is cleared using `clear`, and the code prints the contents of the now-empty vector:


```cpp
numbers.clear();
cout << "Numbers in the vector after clearing: " << endl;
for (const int number : numbers) {
    cout << number << endl;
}
```



This code effectively demonstrates how to manipulate a `std::vector` in C++ by adding, removing, and accessing elements at various positions.



## Output


```cpp
Initial vector elements: 
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

Process finished with exit code 0```



## Extra information



Common operations performed on `std::vector` in C++ include:


* **Initialization**:



```cpp
   std::vector<int> vec; // Empty vector
   std::vector<int> vec(5); // Vector with 5 default-initialized elements
   std::vector<int> vec = {1, 2, 3, 4, 5}; // Vector initialized with a list of elements
```





* **Accessing Elements**:



```cpp
   int first = vec.front(); // Access the first element
   int last = vec.back(); // Access the last element
   int element = vec[2]; // Access the element at index 2```





* **Modifying Elements**:



```cpp
   vec[2] = 10; // Modify the element at index 2```





* **Adding Elements**:



```cpp
   vec.push_back(6); // Add an element to the end
   vec.insert(vec.begin(), 0); // Insert an element at the beginning
   vec.insert(vec.begin() + 2, 15); // Insert an element at index 2```





* **Removing Elements**:



```cpp
   vec.pop_back(); // Remove the last element
   vec.erase(vec.begin()); // Remove the first element
   vec.erase(vec.begin() + 2); // Remove the element at index 2
   vec.clear(); // Remove all elements
```





* **Iterating Over Elements**:



```cpp
   for (int i = 0; i < vec.size(); ++i) {
       std::cout << vec[i] << std::endl;
   }

   for (int elem : vec) {
       std::cout << elem << std::endl;
   }

   for (auto it = vec.begin(); it != vec.end(); ++it) {
       std::cout << *it << std::endl;
   }
```





* **Size and Capacity**:



```cpp
   size_t size = vec.size(); // Get the number of elements
   size_t capacity = vec.capacity(); // Get the capacity of the vector
   bool isEmpty = vec.empty(); // Check if the vector is empty
   vec.reserve(10); // Reserve space for at least 10 elements
```





* **Swapping and Assigning**:



```cpp
   std::vector<int> vec2 = {7, 8, 9};
   vec.swap(vec2); // Swap contents with another vector
   vec = vec2; // Assign contents from another vector```



These operations cover the most common use cases for `std::vector` in C++.
