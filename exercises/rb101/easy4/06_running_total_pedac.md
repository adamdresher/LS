### Understanding the Problem
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

You may assume that the number passed in is an integer greater than 1.

**Explicit Requirements:**

- Input: An array.
- Return: A new array.

**Implicit requirements:**

- 

**Mental Model:**

- Create a method that accepts an array of integers.  Start by creating a variable with a value of `0`, iterate through the collection and add the current element to the variable, then push the variable to a new array (the result should be new elements with a value equal to the last element plus the argument's current element).  End by returning the new array.

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
**running_total**
- Create a method that accepts one parameter, `nums`, an array of integers
- Create an `updated_nums` variable assigned to an empty array
- Create a `current_num` variable assigned to `0`
- Create a `counter` variable assigned to `0`

- Loop through `nums` using `counter` to select `nums` elements
  - Break if `counter` size is equal to `nums` size
  - Add current element to `current_num`
  - Push `current_num` to `updated_nums`
  - Start next iteration by adding `1` to `counter`

- Return `updated_nums`

---
### Code
*see `06_running_total.rb`*
