### Understanding the Problem
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

**Explicit Requirements:**

- Input: A string.
- Return: An integer.

**Implicit requirements:**

- Are non-alphanumeric characters included?
    - `#ord` accepts non-alphanumeric characters, so it seems reasonable to include these cases as well.
- How are multiples of the same character handled?
    - Count duplicates of any character ('every character' is different from every unique character).

**Mental Model:**

- Create a method that accepts a string argument.  Initialize a variable and set it to `0`.  Convert the string into an array of substrings and iterate through each element.  For each element, evaluate the ascii value and add it to the variable.  Return the variable.

---
### Examples/Tests
```ruby
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
```
---
### Data Structures
None.

---
### Algorithm
**ascii_value**
- create a method that accepts a string argument
- initialize a variable and set it to `0`: `sum`
- convert the string into an array of substrings
- iterate through each element
  - for each element, evaluate the ascii value and add it to `sum`
- return `sum`

---
### Code
*see `01_ascii_value.rb`*
