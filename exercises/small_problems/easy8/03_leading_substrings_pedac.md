### Understanding the Problem
Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

**Explicit Requirements:**

- Input: A string.
- Return: An array of string elements.
- The return array's elements are substrings of the input string.
- The first substring element is the first substring of the input string.
- Each consecutive substring element is one more character from the input than the previous substring.
- The return array is sorted from shortest to longest.

**Implicit requirements:**

- Can the input argument be any character?
    - The test examples suggest only alphabetical characters need to be considered.
    - The problem's constraints don't imply any challenge to handling all types of characters.

**Mental Model:**

- Create a method that takes a string argument.  Iterate through the string's substrings and return an array from the iterations' return values.  On each iteration, create a string starting from index 0, to the current iteration number.  Return the array.

---
### Examples/Tests
```ruby
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
```
---
### Data Structures
String.
Array.

---
### Algorithm
**leading_substrings(string)**
- take a string arugment
- iterate through the argument's substrings and return a new array:
  - create a string from argument[0]..argument[i]
- return the array

---
### Code
*see `03_leading_substrings.rb`*
