### Understanding the Problem
Write a method that takes a string, and returns a new string in which every character is doubled.

**Explicit Requirements:**

- Input: A string. 
- Return: A new string.
- New string contains each of input argument's substrings, doubled.
- Doubled substrings are ordered with substring.
  - AABBCC

**Implicit requirements:**

- Should the method double all characters?
    - Yes, all non-alphabetical characters should be included.
- How are whitespaces handled?
    - It is also returned doubled.
- How is an empty string argument handled?
    - Returns a new empty string.

**Mental Model:**

- Create a method that takes a string argument.  Iterate through the argument's substrings and return a new string using the iteration's return values as substrings.  On each iteration, double the substring.  Return the new string.

---
### Examples/Tests
```ruby
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
```
---
### Data Structures
String.

---
### Algorithm
**repeater(string)**
- takes a string argument
- iterate through argument's substrings and use block to create a new string:
  - double the substring
- return the new string

---
### Code
*see `07_repeater.rb`*
