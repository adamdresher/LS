### Understanding the Problem
Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

**Explicit Requirements:**

- Input: An array of numbers.
- Return: A number.
- Input array contains 1 or more numbers.
- Return number is the sum of sums of each leading subsequence.
  - If array has 4 numbers: (1 + 2) + (1 + 2 + 3) + (1 + 2 + 3 + 4)

**Implicit requirements:**

- Does the input array contain only integers?
  - The test cases suggest only integers need to be considered.

**Mental Model:**

- Create a method that takes an array of integers as an argument.  Initialize a variable, `final_sum` set to 0.  Iterate through the array's integer elements.  On each iteration, add current integer with all previous integers, then add this number to `final_sum`.  Return `final_sum`.

---
### Examples/Tests
```ruby
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
```
---
### Data Structures
Array.

---
### Algorithm
**sum_of_sums(arr)**
- Create a method that takes an array of integers as an argument
- Initialize a variable:
  - `final_sum` = `0`
- Iterate through the array's integer elements:
  - add current integer with all previous integers
  - then add this number to `final_sum`
- Return `final_sum`

---
### Code
*see `01_sum_of_sums.rb`*
