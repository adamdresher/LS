### Understanding the Problem
Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.

**Explicit Requirements:**

- Input: A string.
- Return: A new string.
- Passes first original character to the new string.
- All consecutive duplicate characters are ignored.

**Implicit requirements:**

- Are non-alphabetic characters included?
    - Only alphabetic characters are included in the test cases.
- How is a string with a single character treated?
    - Returns a single character.
- How is an empty string treated?
    - Returns an empty string.

**Mental Model:**

- Create a method that accepts a string argument.  Initialize an empty string.  If argument is an empty string, return new string.  Iterate through the string argument's substrings.  For each substring element, add substring to the new string unless the substring is the last substring in the new string.  Return the new string.

---
### Examples/Tests
```ruby
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
```
---
### Data Structures
None.

---
### Algorithm
**crunch**
- initialize an empty string
- create an array of argument's substrings
- iterate through argument:
  - append element to new string unless element is the last substring in the new string
- return new string

---
### Code
*see `09_crunch.rb`*
