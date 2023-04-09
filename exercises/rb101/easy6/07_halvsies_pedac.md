### Understanding the Problem
Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

**Explicit Requirements:**

- Input: An array.
- Return: A new array of two nested arrays.

**Implicit requirements:**

- What are the elements of the array argument?
    - Integers.
- What is in the first and second nested arrays?
    - First nested array contains the first half of the argument's elements.
    - Second nested array contains the second half of the argument's elements.
- How is an odd number of elements handled?
    - The middle element is returned in the first nested array.
- How is an empty array argument handled?
    - An array of empty nested arrays is returned.

**Mental Model:**

- Create a method that accepts an array of integers.  The array's size divided by two and rounded down to the nearest whole integer is set to a variable: `middle`.  The array's elements from index `0` to `middle` are set to a new array.  The array's elements from index `middle + 1` to the end are set to another new array.  The two new arrays are nested in a new array: `[first half, second half]` and returned.

- Create a method that accepts an array of integers.  Pass the array's elements to a new array: `second_half`.  Determine the size of the array, set the number to a float, divide the number by 2 and round down.  From the new array, remove its elements with index `0` to the float number and pass them to a second new array.  Return an array of nested arrays: `[second new array, first new array]`.

---
### Examples/Tests
```ruby
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
```
---
### Data Structures
Array.

---
### Algorithm
**halvsies**
- take an array argument
- set a new variable, `first_half_end`: argument's size rounded down to the nearest whole integer
- set a new variable, `second_half_start`: argument's size rounded up to the nearest whole integer
- set a new array, `first_half`: argument's elements using index `0..first_half_end`
- set a new array, `second_half`: argument's elements using index `second_half_start..-1`

**halvsies**
- take an array argument
- initialize a variable, `middle`:
  - determine the argument's size
  - convert number to a float number
  - divide number by two
  - round down
  - set number to `middle`
- initialize a new array, `second_half`:
  - set all of argument's elements to `second_half`
- initialize a new array, `first_half`:
  - select from `second_half` all elements with index `0` to the `middle`
  - remove selected elements from `second_half`
  - add selected elements to `first_half`
- return `first_half` and `second_half` in a nested array

---
### Code
*see `07_halvsies.rb`*
