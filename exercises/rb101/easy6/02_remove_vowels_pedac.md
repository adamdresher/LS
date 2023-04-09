### Understanding the Problem
Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

**Explicit Requirements:**

- Input: A string.
- Return: A new string.

**Implicit requirements:**

- How are empty arrays handled?
    - There is no test case for this
    - Return an empty array
- How should the method handle a case where all substrings of an element are vowels?
    - Remove all vowels and return an empty string
- Is the method case sensitive?
    - No.  The argument's vowels can be upper or lowercase

**Mental Model:**

- Create a method that takes an array of string elements.  Iterate through each string element, removing all vowels.  Return a new array.

---
### Examples/Tests
```ruby
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
```
---
### Data Structures
Array.

---
### Algorithm
- initialize a CONSTANT array variable set to vowel string elements: %w(a e i o u)

**remove_vowels**
- accept an array argument
- initialize an empty array variable
- iterate through the array's elements:
  - iterate through the element's substrings:
    - unless the downcased substring matches any element in CONSTANT
      - add substring to new array
- return new array

**Algorithm 2**
- initialize a CONSTANT array variable set to vowel string elements: %w(a e i o u)

**remove_vowels**
- accept an array argument
- create a copy of the argument
- iterate through the copy's elements:
  - iterate through element's substrings:
    - if the downcased substring matches any element in CONSTANT
      - remove substring
- return new array

**Algorithm 3**
- initialize a CONSTANT array variable set to vowel string elements: %w(a e i o u A E I O U)

**remove_vowels** # does not return an empty array elment if all substrings are removed
- accept an array argument
- convert argument into a string using `' '` as a delimiter
- iterate through string's substrings:
  - if the downcased substring matches any element in CONSTANT
    - remove element
- convert string to a new array using `' '` as a delimiter

---
### Code
*see `02_remove_vowels.rb`*
