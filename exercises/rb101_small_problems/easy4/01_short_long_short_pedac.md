### Understanding the Problem
Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

**Explicit Requirements:**

- Input: Two strings.
- Mutate/Output/Return: A new string.

**Implicit requirements:**

- What to do with strings of equal length?
    - Can ignore this edge case.
- What to do with empty strings?
    - Empty strings should have a length of `0`.

**Mental Model:**

- Create a method that accepts two string arguments.  Determine which string is shortest and concatenate it with the longer string, then concatenate the shorter string to the end of the result.  Return the new string.

---
### Examples/Tests
```ruby
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
```
---
### Data Structures
None.

---
### Algorithm
**short_long_short**
- START

- IF size of string1 < size of string2
- THEN string1 + string2 + string1
- ELSE
- THEN string2 + string1 + string2
  
- END

---
### Code
*see `01_short_long_short.rb`*
