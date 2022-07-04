### Understanding the Problem
Write a method that takes a string argument, and returns `true` if all of the alphabetic characters inside the string are uppercase, `false` otherwise. Characters that are not alphabetic should be ignored.

**Explicit Requirements:**

- Input: A string.
- Return: A boolean.
- Return `true` if all of argument's substrings are uppercase.
- Return `false` if any of argument's substrings are uppercase.

**Implicit requirements:**

- How should an empty string argument be handled?
    - Empty strings return `true`.
- How should non-alphabetical characters be handled?
    - Non-alphabetical characters are ignored.

**Mental Model:**

- Create a method that takes a string argument.  Iterate through the argument's substrings, select all alphabetical characters, and return a new string.  Iterate through the new string and return `false` if any characters are not uppercase, else return `true`.

---
### Examples/Tests
```ruby
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true
```
---
### Data Structures
None.

---
### Algorithm
**uppercase?(str)**
- take a string argument
- iterate through the argument's substrings:
  - select all alphabetical characters
  - return a new string
- iterate through the new string
  - if any characters are not uppercase
    - return `false`
  - else
    - return `true`

---
### Code
