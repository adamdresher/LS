### Understanding the Problem
Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

**Explicit Requirements:**

- Input: Two arrays
- Return: A new Array object.
- Both array arguments have the same number of elements.
- All array arguments have one or more elements.
- New array's elements are argument's elements taken in alternation.

**Implicit requirements:**

- Which array argument gives the first element to the new array?
    - The test case implies that the first array argument gives the first element.
- Does the element value matter?
    - It's not explicitly stated.  Pass any element's value to the new array.

**Mental Model:**

- Write a method that takes two array arguments.  Initialize a new, empty array.  Initialize a coutner variable set to `0`.  Until the counter is equal to the first array's size, pass `array1[counter]` to the new array, then pass `array2[counter]` to the new array, then `counter += 1`.  Return the new array.

---
### Examples/Tests
```ruby
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
```
---
### Data Structures
Array.

---
### Algorithm
**interleave**
- take two array arguments
- initialize new_arr = []
- initialize counter = 0
- until counter == arr1.size
  - new_arr << arr1[counter]
  - new_arr << arr2[counter]
  - counter += 1
- return new_arr

---
### Code
*see `01_interleave.rb`*
