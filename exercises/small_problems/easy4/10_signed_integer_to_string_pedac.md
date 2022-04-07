### Understanding the Problem
Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as `Integer#to_s`, `String()`, `Kernel#format`, etc. You may, however, use `integer_to_string` from the previous exercise.

**Explicit Requirements:**

- Input: An integer.
- Return: A signed number.

**Implicit requirements:**

- 

**Mental Model:**

- Create a method that takes an integer argument.  First, the argument is checked if it is greater than/equal to/less than zero and set result to an initialized variable.  Pass the argument into `integer_to_string` and set the return value to an initialized variable.  Then use the first variable to append a sign (`+`/`-`) to the second variable, and return the second variable.

---
### Examples/Tests
```ruby
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
```
---
### Data Structures
Array.

---
### Algorithm
**signed_integer_to_string**
- create a method that takes an integer argument
- compare the argument against `0` and set the return value to an initialized variable- `sign`
  - return `1` if the argument is greater than `0`
  - return `0` if the argument is equal to `0`
  - return `-1` if the argument is less than `0`
- pass the argument into `integer_to_string` and set the return value to an initialized variable- `string`
- use `sign` to append a sign (`+`/`-`) to `string`
- return `string`

---
### Code
*see `10_signed_integer_to_string.rb`*
