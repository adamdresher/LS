### Understanding the Problem
Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

**Explicit Requirements:**

- Input: Two arrays.
- Return: A new array.
- The return object should not have any duplicate elements (regardless if duplicates are in the same argument).

**Implicit requirements:**

- Can the arguments' elements be any object class?
    - The test case implies the method takes arrays of integers as arguments.
    - Don't consider other object classes for now.
- Does the order of the return array's elements matter?
    - The test case implies the return array is sorted by size, smallest to largest.

**Mental Model:**

- Create a method that takes two array arguments.  Initialize a new, empty array.  Iterate through both array arguments' elements, adding each element to the new array if it is not found in the new array.

- Create a method that takes two array arguments.  Initialize a new, empty array.  Iterate through both array arguments, checking if each element is found in the new array.  If the element is not found, add it to the new array.  Return the new array.

---
### Examples/Tests
```ruby
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
```
---
### Data Structures
Arrays.

---
### Algorithm
**merge**
- take two array arguments
- initialize new, empty array
- iterate through both arguments:
  - if element is in the new array
    - add to new array
- return new array 

---
### Code
*see `06_merge.rb`*
