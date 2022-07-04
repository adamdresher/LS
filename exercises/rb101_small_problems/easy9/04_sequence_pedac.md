### Understanding the Problem
Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

**Explicit Requirements:**

- Input: An integer.
- Return: An array.
- Return array contains only integer elements.
  - Elements are in sequence.
  - Elements are 1 to argument.

**Implicit requirements:**

- What should the return array contain if the argument is 1?
    - An array with only one element.
- What should the return array contain if the argument is 0?
    - The problem and test cases don't suggest this should be considered.
- What should the return array contain if the argument is a negative number?
    - The problem and test cases don't suggest this should be considered.
    - Could return negative number to 1

**Mental Model:**

- Create a method that takes an integer argument.  Initialize an empty array.  Pass a range of numbers from 1 to the argument.  Return the array.

---
### Examples/Tests
```ruby
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
# Further Exploration
p sequence(0) == [0, 1]
p sequence(-5) == [-5 ,-4, -3, -2, -1, 0, 1]
```
---
### Data Structures
Array.

---
### Algorithm
**sequence(num)**
- take an integer argument
- initialize an empty array
  - pass a range of numbers from 1 to the argument
- return the array

**Algorithm 2**
**sequence(num)**
- take an integer argument
- define a range of numbers from 1 to the argument
- convert the range to an array
- return the array

**Further Exploration**
**sequence(num)**
- take an integer argument
- if argument is greater than 0
  - define a range of numbers from 1 to the argument
- else
  - define a range of numbers from argument to 1
- convert the range to an array
- return the array

---
### Code
*see `04_sequence.rb`*
