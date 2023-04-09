### Understanding the Problem
A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

Note: underscores are used for clarity above. Ruby lets you use underscores when writing long numbers; however, it does not print the underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.

**Explicit Requirements:**

- Input: An integer.
- Return: An integer.
- A dobule number must be an even number of digits.
- A double number is a number which the first half digits match the second half digits.
  - Ex. 123123 == true.
    - first_half = 123, second_half 123
    - first_half == second_half
- If integer argument is a double number, return self.
- Else, multiply integer argument by 2, return new integer.
- Underscores should be ignored.
  - Underscores are part of Ruby syntax to make Numeric objects more readable.

**Implicit requirements:**

- Can the argument be a float or non-integer number?
    - The test cases suggest only integers should be considered.
- How is a single digit integer handled?
    - It should be multiplied by 2 and the return value returned.

**Mental Model:**

- Create a method that takes an integer argument.  If argument has an even number of digits and the first half is the same as the second half, return self.  Else multiply the argument by two, and return the new integer.

---
### Examples/Tests
```ruby
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
```
---
### Data Structures
None.

---
### Algorithm
**twice(num)**
- take an integer argument
- if argument has an even number of digits and the first half is the same as the second half
  - return self
- else
  - multiply the argument by two
  - return the new integer

---
### Code
*see `02_twice.rb`*
