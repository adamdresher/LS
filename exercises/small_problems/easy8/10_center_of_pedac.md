### Understanding the Problem
Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

**Explicit Requirements:**

- Input: A non-empty string.
- Return: A string character/s.
- Return string is the middle character/s of string argument.
  - If argument has an odd number of characters, returns 1 character.
  - If argument has a even number of characters, returns 2 characters.

**Implicit requirements:**

- 

**Mental Model:**

- Create a method that takes a string argument.  Count the number of characters in the argument.  Use the count to find the middle of the argument.  Return 1 character if the count is odd.  Else, return the middle two characters.

---
### Examples/Tests
```ruby
center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
```
---
### Data Structures
None.

---
### Algorithm
**center_of(string)**
- take a string argument
- set argument's size to a variable: `size`
- if size is odd
  - return character at index argument.size / 2
- else
  - return character at index argument.size / 2 and the previous character

---
### Code
*see `10_center_of.rb`*
