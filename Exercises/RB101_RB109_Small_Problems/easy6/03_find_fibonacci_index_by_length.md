### Understanding the Problem
Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

**Explicit Requirements:**

- Input: An integer.
- Return: An integer.
- Integer argument is the number of digit characters in the targeted Fibonacci number.
- First Fibonacci number has index 1 (index + 1).
- Return value is the index number of the targeted Fibonacci number plus 1.

**Implicit requirements:**

- 

**Mental Model:**

Create a method that accepts an integer argument.  Initialize a variable set to an array of integers: `[1, 1]`.  Until the argument equals the size of the array's last element, add the array's last two elements together and append the return value to the end of the array.  When the argument equals the size of the array's last element, return the index of array's last element plus `1`.

---
### Examples/Tests
```ruby
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
```
---
### Data Structures
None.

---
### Algorithm
**find_fibonacci_index_by_length**
- takes an integer argument
- initialize a variable set to an array: `[1, 1]`
- until argument == array.last.size
  - array << array[-1] + array[-2]
-  return the index of the last element plus one: `array.size`

---
### Code
*see `03_find_fibonacci_index_by_length`*
