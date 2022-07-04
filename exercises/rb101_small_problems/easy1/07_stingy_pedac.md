### Understanding the Problem
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

- Modify `stringy` so it takes an additional optional argument that defaults to `1`. If the method is called with this argument set to `0`, the method should return a `String` of alternating 0s and 1s, but starting with `0` instead of `1`.

**Explicit Requirements:**

- Input: Integer
- Return: String

**Implicit requirements:**

- Is the input ever a float or negative number?
    - The problem description specifies a positive integer, so anything else should not be accepted.
- What about 0?
    - The test cases don't include 0, however the problem description states the argument will be a positive number.  Generally speaking, 0 is not considered a positive or negative number and thus should not be considered a valid argument for this method.
- Does it matter if you start with 1 or 0?
    - Yes, always start with 1.

**Mental Model:**

- Create a method that returns a string of alternating characters, `'1'` and `'0'`.  The string's length is based on the first parameter.  The second parameter dictates whether to start with `'1'` or `'0'` and is set to `'1'` as default.

---
### Examples/Tests
```ruby
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
```
---
### Data Structures


---
### Algorithm
- Algorithm 1:
  - Create a method called, `stringy` with a parameter called, `num`.
  - Create an empty string called, `string`.
  - Loop `num` times through a block.
  - The block checks if `string`s last substring is `1`.
  - If `true`, push `0` to `string`, else push `1` to `string`.
  - After iterating, return `string`.

- Algorithm 2, for Further Exploration:
  - Create a method called, `stringy` with a parameter called, `num`.
  - Create the variable, `string`, and assign it to the second parameter.
  - Loop `num` times through a block.
  - The block checks if `string`s last substring is `1`.
  - If `true`, push `0` to `string`, else push `1` to `string`.
  - After iterating, return `string`.

---
### Code
*see `07_stingy.rb`*
