### Understanding the Problem
Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as `Integer#to_s`, `String()`, `Kernel#format`, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

**Explicit Requirements:**

- Input: An integer.
- Return: A string.

**Implicit requirements:**

- 

**Mental Model:**

- Create a CONSTANT hash set with integers assigned string countparts.  Then create a method that accepts an integer argument.  First a variable is initialized with an empty string.  Then the argument is iterated through: divide by 10 and the remainder is pushed to the string.  The string is reversed and returned.

---
### Examples/Tests
```ruby
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
```
---
### Data Structures
Hash.

---
### Algorithm
**integer_to_string**
- create a CONSTANT array set with subarrays.
  - each subarray has two elements: integers 0 - 9 and strings '0' - '9'
- create a method that accepts an integer argument
- create a variable initialized with an empty string
- iterate through the integer argument
  - divide integer by 10 and return the remainder
  - push the remainder to the string
- reverse the string
- return the string

---
### Code
*see `09_integer_to_string.rb`*
