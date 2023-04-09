### Understanding the Problem
Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

**Explicit Requirements:**

- Input: A string
- Return: A new string.
- Arguements are a combination of alphabetic and non-alphabetic characters.
- Alphabetic characters are all lowercase characters.
- Non-alphabetic characters are replaced by whitespaces.
- One whitespace is used to replace any continuous length of non-alphabetic characters.

**Implicit requirements:**

-

**Mental Model:**

Create a method that accepts a string argument.  First the argument is split into an array of substring elements.  Next the array is iterated over.  If the element is an alphabetic character, it is added to a new string and whitespace_assignment is turned on (`true`).  If the element is a non-alphabetic character and whitespace_assignment is turned on (`true`), then add whitespace to new string and whitespace_assignment is turned off (`false`), else next iteration.  After iterations complete, return the new string.

---
### Examples/Tests
```ruby
cleanup("---what's my +*& line?") == ' what s my line '
```
---
### Data Structures
Array.

---
### Algorithm
**cleanup**
- split the string argument into an array of substrings
- iterate over array
  - if element is an alphabetic character
    - add element to new string
    - whitespace = true
  - elsif element is a non-alphabetic character
    - if whitespace == false
      - add whitespace to new string
      - whitespace = false
    - else
      - next
- return new string

---
### Code
*see `05_cleanup.rb`*
