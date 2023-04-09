### Understanding the Problem
Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

**Explicit Requirements:**

- Input: A string.
- Return: A new string.

**Implicit requirements:**

- 

**Mental Model:**

- Create a method that accepts a string as an argument.  The string is transformed into a collection of substrings which are split by whitespaces, `' '`.  Iterate over the collection of string elements and swap the first/last characters.  Rejoin the collection of strings with a whitespace between them.  Return the string.

---
### Examples/Tests
```ruby
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
```
---
### Data Structures
Array.

---
### Algorithm
- Transform the string argument into an array of substring elements using a whitespace delimiter
- Iterate over the array
  - Remove and save both first and last characters
  - Prepend last character to the front the string
  - Prepend first character to the end of the string
- Rejoin the collection using a whitespace delimiter to return a string

---
### Code
*see `04_swap.rb`*
