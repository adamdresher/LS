### Understanding the Problem
Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

**Explicit Requirements:**

- Input: An integer.
- Return: An integer.
- Return integer is the input integer's digits in reverse.

**Implicit requirements:**

- How is a single digit number handled?
    - Returns self.
- How is a negative number handled?
    - The problem and test cases do not suggest this needs to be considered.
- How is a input number ending in zeros handled?
    - They are ignored.
    - Ruby will always ignore leading zeros for Integers.

**Mental Model:**

- Take an integer argument.  Convert the argument to a string.  Reverse the order.  Convert the string to an integer.  Return the integer.

---
### Examples/Tests
```ruby
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
```
---
### Data Structures
Array.

---
### Algorithm
**reversed_number(num)**
- take an integer argument
- convert the argument to an array
- reverse the order of the array
- convert the string to an integer
- return the integer

---
### Code
*see `09_reversed_number.rb`*
