### Understanding the Problem
Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

**Explicit Requirements:**

- Input: A string.
- Return: A new string.
- New string's characters alternate between uppercase and lowercase.
- Non-alphabetical characters are returned, unmodified.
- Non-alphabetical characters are counted for alternating cycle.

**Implicit requirements:**

- Does the return string start with an uppercase or lowercase character?
    - Uppercase character.

**Mental Model:**

- Create a method that accepts a string argument.  Split the argument into an array of substrings.  Iterate through the array's substrings.  If the substring's index is even, upcase the character.  Else downcase the character.  Join the array with `''` as a delimiter and return a new string.

---
### Examples/Tests
```ruby
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
```
---
### Data Structures
Array.

---
### Algorithm
**staggered_case**
- take a string argument
- split the argument into an array of characters
- iterate through and mutate array's elements:
  - if element's index is even
    - element.upcase
  - else
    - element.downcase
- join array
- return new string

**staggered_case** # Further Exploration.
- take a string argument and a boolean argument
- split the string argument into an array of characters
- iterate through and mutate array's elements:
  - initialize a variable, `start_upcase`, set to:
    - if the boolean is true
      - check if element's index is even
    - else
      - check if element's index is odd
  - if start_upcase
    - element.upcase
  - else
    - element.downcase
- join array
- return new string
---
### Code
*see `05_staggered_case.rb`*
