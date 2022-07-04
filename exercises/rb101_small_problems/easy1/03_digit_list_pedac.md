### Understanding the Problem
Create a method with a single parameter, positive integer, and return an array of all the digits that compose the parameter.

**Explicit Requirements:**

- Input: An integer.
- Return: An array of integers.

**Implicit requirements:**

- Is the argument ever a float or rational number?
    - The test case doesn't suggest we need to consider floats or rational numbers, only positive integers.
- Does the order for the returned digits matter?
    - Yes, the order stays true.

**Mental Model:**

- Create a method that accepts a single positive integer as an argument.  That integer is split into digits and returned as an array of digits with the same order.

---
### Examples/Tests
```ruby
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
```
---
### Data Structures
Array.

---
### Algorithm
**digit_list**
- Accept one parameter.
- Check if the parameter is an integer, if not return an error message.
- Check if the integer is positive, if not return an error message.
- Split the integer into digits and return as an array in the same order received.
- Return the array.

---
### Code
*see `03_digit_list.rb`*
