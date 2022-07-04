### Understanding the Problem
Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

**Explicit Requirements:**

- Input: Two arrays of numbers.
- Return: A new array of numbers.
- Input arrays are not empty.
- Return array's elements are the product of an element from each input array.
- Every combination of elements using an element from each array is used to create an element for the return array.
- Return array is sorted by increasing value, small to large.

**Implicit requirements:**

- Are any elements `nil`?
    - The test case does not suggest this is a consideration.
- How many combinations of elements will there be?
    - The product of both arrays' length.

**Mental Model:**

- Create a method that takes two array arguments.  Combine an element from the first array with an element from the second array and create an array of the two elements.  Continue combining elements from both arrays until every possible combination has been created.  Add the arrays as nested arrays within a new array.  Multiply the two elements within each nested array.  Flatten the nested arrays into number elements within the parent array.  Sort the elements, starting with smallest number first.  Return the new array.

---
### Examples/Tests
```ruby
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
```
---
### Data Structures
Array.

---
### Algorithm
**multiply_all_pairs**
- take two array arguments
- pass two array arguments to list_combinations
  - return a new array
- iterate over the new array's nested arrays:
  - multiply the elements within the nested array
- sort the array's elements, smallest first
- return the new array

**list_combinations**
- take two array arguments
- initialize a new, empty array
- iterate over the arr1's elements:
  - iterate over the arr2's elements:
    - set an array with the arr1's current element and arr2's current element
    - add the iteration's array to the initalized array in the outer scope
- return the new array
---
### Code
*see `09_multiply_all_pairs.rb`*
