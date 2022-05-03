### Understanding the Problem
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

**Explicit Requirements:**

- Input: An array.
- Return: A new array.
- Argument and return arrays both contain number elements.
- Return array has same number of elements as argument.
  - Each element has the total of all elements up to and including the current element.

**Implicit requirements:**

- Are all number types considered (Integer, Float, Radical, etc)?
    - The test cases suggest only Integers need to be considered.
- How is an empty array argument handled?
    - Return a new empty array.

**Mental Model:**

- Create a method that takes an array argument.  Iterate through the argument's elements and return a new array.  Each new element should be the sum of all elements up to and including the current element.  Return the new array.

---
### Examples/Tests
```ruby
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
```
---
### Data Structures
Array.

---
### Algorithm
**running_total(arr)**
- take an array argument
- iterate through the argument's elements and return a new array:
  - sum of all elements up to and including the current element
- return the new array

---
### Code
*see `05_running_total.rb`*
