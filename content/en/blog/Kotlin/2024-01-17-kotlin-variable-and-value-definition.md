---
draft: false
title: Kotlin Variable and Value definition
date: 2024-01-17T19:01:16+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Variables are almost the most important building blocks in programming.
url: /kotlin-variable-and-value-definition/
featured_image: /images/KotlinFullColorLogoMarkRGB-250-250.png
categories:
    - Kotlin Fundamentals
tags:
    - kotlin
    - kotlin fundamentals
    - software
---


## What is a variable?



A variable is a record location in which a number, text or any other information is kept. Variables are almost the most important building blocks in programming. There are variables in which these values are kept in all the operations we will perform. We call its name "variable" because the value stored in it can be changed.



For example, consider a school and the classes within it. We should record the name of each class somewhere and the number of students in each class somewhere. Each variable must have a name (identifier) to distinguish it from other variables. In this case, we will have two variables that we will refer to as "class name" and "number of students".



## variable definition



In the program we will write, we must have defined the variable before we can use it. Kotlin offers two keywords to define variables. The variable names should not start with a number and it should be noted that they are case sensitive.



val (value)



The variables we define with the val expression are variable types in which the value does not change again after a value is assigned at the beginning of the program. For example, we can give the name of a Novel we want to transact with. Even if the number of pages changes as a result of different printing styles, the name of the author and the title of the novel will remain constant. However, this requires a fixed author name and book name for another book. Because of this need, we will define variables with the val expression, which we can assign the desired value to once during the first run of the program but cannot change later.



The contents of such variables are determined at **run time.**


```kotlin
fun main() {
val language = "Kotlin"
    println(language)
}

/* Output
Kotlin

Process finished with exit code 0
 */```



In the example above, a variable named `language` is defined and its value is assigned with `=` to `"Kotlin"` of type **String**. You should note that the `=` sign is used to assign the value. Now we can call this variable "language" while writing our codes in the program.



var (variable)



It is a type of variable that we can change the value stored in as much as and whenever we want. We can express it as a changeable variable.


```kotlin
fun main() {
    var dayOfWeek = "Monday"
    println(dayOfWeek) // prints Monday
    dayOfWeek = "Sunday" // new value is Sunday
    println(dayOfWeek) // prints Sunday
}

/* Output
Monday
Sunday

Process finished with exit code 0
 */```



As you can see in the example above, we first gave the `dayOfWeek` variable the value `Monday` and printed it on the screen. Then, we gave the value Sunday and printed the new value on the screen. In this way, we used a variable by changing the values in it.



const (constant)



Values that are known while the program is being coded and will not change no matter who uses the software are called constants. Constants also need to be recorded somewhere. For this reason, constant values are assigned by using the const expression together with the val expression.



The contents of such variables are determined at compile time.



Assigning data in different value types



You can define as many variables as you want to store different data types in Kotlin. You can see an example of this below.


```kotlin
fun main() {
    val ten = 10
    val greeting = "Hello"
    val firstLetter = 'A'

    println(ten) // prints 10
    println(greeting) // prints Hello
    println(firstLetter) // prints A
}

/* Output
10
Hello
A

Process finished with exit code 0
 */```



There is an important rule we need to point out here. For example, if we assume that you first assign an **Int**, that is, integer value to a variable using var (`val ten = 10`), the values we assign to that variable from now on must always be integers. Whatever the first data type was assigned, the data type to be assigned later must always be the same.



## Conclusion



We now know that the keywords `val` and `var` are used to define variables, that variable names must start with a letter, and that variables can only be assigned to the value type they were first assigned to. This information will be very useful for the next stages.
