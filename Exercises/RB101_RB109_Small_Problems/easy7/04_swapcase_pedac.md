### Understanding the Problem
Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

**Explicit Requirements:**

- Input: A string.
- Return: A new string.
- Cannot use `String#swapcase`.
- Every uppercase letter is replaced by its lowercase version.
- Every lowercase letter is replaced by its uppercase version.
- All non alphabetical characters are unchanged.

**Implicit requirements:**

- How are empty string arguments handled?
    - Return a new empty string.

**Mental Model:**

- Create a method that accepts a string argument.  Initialize an empty, new string.  Iterate over substrings.  If the substring is uppercase, add the lowercase version to the new string.  If the substring is lowercase, add the uppercase version to the new string.  If the substring is neither, add the substring to the new string.  Return the new string.

- Initialize a constant array variable with two nested arrays, one nested array has string elements for the alphabet in lowercase and the other string elements for the alphabet in uppercase.
Create a method that accepts a string argument.  Convert the string into an array of substrings.  Iterate through the substrings.  If the substring matches any element in the constant's first nested array, return the element with the same index in the second array.  If the substring matches any element in the constant's second nested array, return the element with the same index in the second array.  Else, return self.  Rejoin the array as a string and return a new string.

---
### Examples/Tests
```ruby
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
```
---
### Data Structures


---
### Algorithm
**swapcase**
- take a string argument
- initialize a new, empty string
- iterate through string substrings:
  - if substring == substring.upcase
    - new string << substring.downcase
  - else
    - new string << substring.upcase
- return new string

**Algorithm 2**
- initialize a constant array variable with two nested arrays:
  - first nested array contains string elements for the alphabet in lowercase
  - second nested array contains string elements for the alphabet in uppercase

**swapcase**
- take a string argument
- convert the argument into an array of substrings
- iterate through the array of substrings:
  - if substring matches any element in constant's first nested array
    - find element's index
    - return element with same index in constant's second nested array
  - elsif substring matches any element constant's second nested array
    - find element's index
    - return element with the same index in constant's first nested array
  - else return self
- combine array into a string and return new string

---
### Code
*see `04_swapcase.rb`*
