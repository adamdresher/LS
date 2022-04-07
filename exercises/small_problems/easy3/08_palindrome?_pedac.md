### Understanding the Problem
Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

**Explicit Requirements:**

- Input: A string.
- Return: A boolean.

**Implicit requirements:**

- Is this case-sensitive?  
    - Yes.
- Are special characters considered?
    - Yes.
- Are whitespaces considered?
    - Yes.

**Mental Model:**

- Create a method that takes a string argument and compares it to itself with the sequence of all characters reversed, then returns a boolean if they match.

---
### Examples/Tests
```ruby
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
```
---
### Data Structures
None.

---
### Algorithm
**palindrome?**
- START

- READ string
- SET string_reversed to the reverse order of string's characters
- compare string to string_reversed
- RETURN boolean

- END

---
### Code
*see `08_palindrome?.rb`*
