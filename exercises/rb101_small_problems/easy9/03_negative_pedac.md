### Understanding the Problem
Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

**Explicit Requirements:**

- Input: An integer.
- Return: An integer.
- Return number is always negative or 0.
  - If argument number is positive, converts number to negative.
  - If argument number is negative, returns self.

**Implicit requirements:**

- 

**Mental Model:**

- Create a method that takes an integer argument.  If argument is negative, return self.  Else multiply number by -1 and return return value.

---
### Examples/Tests
```ruby
negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby
```
---
### Data Structures
None.

---
### Algorithm
**negative(num)**
- take an integer argument
- if argument is negative
  - return self
- else
  - multiply number by -1
  - return return value

---
### Code
*see `03_negative.rb`*
