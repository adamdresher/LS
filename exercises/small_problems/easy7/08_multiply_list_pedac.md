### Understanding the Problem
Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

**Explicit Requirements:**

- Input: Two arrays of numbers.
- Return: A new array of numbers.
- New array's elements are the product of numbers from the arguments' elements.
- Each new element has the same index of it's input elements (product, multiplier, and multiplicand).
- Array arguments are of equal length.

**Implicit requirements:**

- Are the input arrays' elements of the same object class?
    - The test case suggests that only Integer objects should be considered.
- Are any elements `nil`?
    - The test case does not suggest `nil` should be considered.

**Mental Model:**

- Take two array arguments.  Iterate through the first array argument's elements and use the return values to create a new array.  On each iteration, multiply current element with the element of same index in the second array.  Return the new array.

---
### Examples/Tests
```ruby
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
```
---
### Data Structures
Array.

---
### Algorithm
**multiply_list**
- take two array arguments: arr1, arr2
- iterate through arr1's elements with their index and return new array:
  - current element * arr2

---
### Code
*see `08_multiply_list.rb`*
