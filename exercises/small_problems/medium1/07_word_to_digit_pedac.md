### Understanding the Problem
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

**Explicit Requirements:**

- Input: A string
- Return: A new string
- Return string replaces word representation of numbers to String representation Integer

**Implicit requirements:**

- How are multi-digit numbers handled?
    - Not considered in test cases.
- How are number words with adjacent characters handled (non-alphanumerics)?
    - Non-alphanumerics should be ignored.

**Mental Model:**

- Create a copy of the argument.  Iterate through the copy and replace the number words with integers.  Return the string.

---
### Examples/Tests
```ruby
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
```
---
### Data Structures
Hash with keys-value pairs set to number words and String integers.

---
### Algorithm
**word_to_digit(str)**
- initialize a constant hash with keys set to word numbers and values set to appropriate Integer converted to a string
- create a copy of str
- iterate through the constant's keys:
  - if key matches a substring in copy
    - replace substring with key's value
- return the copy

---
### Code
*see `07_word_to_digit.rb`*
