### Understanding the Problem
Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

**Explicit Requirements:**

- Input: Two integers.
- Return: An array.
- First argument is the number of elements in the return array.
  - Number will always be 0 or greater.
  - If 0, return array is empty.
- Second argument is the first number in the return array.
  - Number can be any integer.
- Return array's elements are multiples of the second argument.
  - Elements should be in sequential order.


**Implicit requirements:**

- How should the array return with a second argument of 0?
    - All elements should be 0.
- How should the array return if the second argument is negative?
    - All elements should be negative.

**Mental Model:**

- Create a method that takes two integer arguments.  Initialize an empty array and iterate over it a number of times based on the first argument.  Multiply the second argument by the current iteration number and set it as an element in the new array.  After all iteations, return the array.

---
### Examples/Tests
```ruby
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
```
---
### Data Structures
Array.

---
### Algorithm
**sequence(num1, num2)**
- take two integer arguments: num1, num2
- initialize an empty array
- define a range from 1 to num1
- multiply the second argument by the current iteration number
  - set return value as an element in the new array
- return the array

---
### Code
*see `08_sequence.rb`*
