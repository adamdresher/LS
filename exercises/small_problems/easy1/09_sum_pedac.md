### Understanding the Problem
Write a method that takes one argument, a positive integer, and returns the sum of its digits.

**Explicit Requirements:**

- Input: An integer.
- Return: An integer.

**Implicit requirements:**

- Can the method take a negative or non-natural number?
    - It should not be accepted.
- What happens if a large number is given with underscores, `_`?
    - It should be accepted.

**Mental Model:**

- Create a method called, `sum`, with the parameter, `num`.  The argument must be a positive integer.  Return the sum the digits of `num`.

---
### Examples/Tests
```ruby
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
```
---
### Data Structures
None.

---
### Algorithm
  - Create a method called, `sum`, with the parameter, `num`.
  - Return an error if the argument is not a positive integer.
  - Return the sum of the digits of `num`.

---
### Code
*see `09_sum.rb`*
