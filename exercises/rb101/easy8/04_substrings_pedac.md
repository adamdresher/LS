### Understanding the Problem
Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:

**Explicit Requirements:**

- Input: A string.
- Return: An array.
- Return array is a list of input's substrings.
- Return elements are ordered by two rules:
  - First rule is to use the element's first substring's index in input string.
  - Second rule is to use the element's string size.

**Implicit requirements:**

- How are non-alphanumeric characters handled?
    - The problem and test cases do not consider non-alphabetical characters.

**Mental Model:**

- Create a method that takes a string argument.  Iterate through the argument's elements and return an array using iterations' return values as elements.  On each iteration, iterate through the argument using the outer iteration's current index as a starting point and return an array using inner iterations' return value as elements.  On each inner iteration, create a string from outer index to current index.  After inner and outer iterations are complete, flatten the return array to remove the nested arrays.  Return the array.

---
### Examples/Tests
```ruby
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
```
---
### Data Structures
String.
Array.

---
### Algorithm
**substrings(string)**
- create a method that takes a string argument
- iterate through the string's elements and return an array using iterations' return values as elements:
  - iterate through the argument using the outer iteration's curent index as a starting point and return an array using inner iterations' return value as elements:
    - create a string from outer index to current index
- flatten the return array to remove the nested arrays
- return the array

---
### Code
*see `04_substrings.rb`*
