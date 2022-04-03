### Understanding the Problem
Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

**Explicit Requirements:**

- Input: A string.
- Return: A hash.

**Implicit requirements:**

- Are non-alphanumeric characters considered part of a word?
    - Yes.
- How are empty strings evaluated?
    - An empty hash is returned.
- How are the hash key-value pairs formatted?
    - The key and value are both integers.

**Mental Model:**

- Create a method that takes a string as an argument.  The string is split into an array of substrings using a whitespace, `' '`, as a delimiter.  Initialize an empty hash.  Then iterate over the array's elements.  For each element, count the number of characters.  Add or update key-value pair to the hash where the key is the number of characters in the current element and the value is `+= 1`.  Return the hash.

---
### Examples/Tests
```ruby
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
```
---
### Data Structures
Hash.
Array.

---
### Algorithm
**word_sizes**
- split string argument into an array of word substrings using a whitespace delimiter, `' '`
- initialize an empty hash
- iterate over the array's elements:
  - count the number of characters in element
  - if hash has a key with element's size, add `1` to its value
  - else add a new key-value with the key set to the element's size and value set to `1`
- return the hash

**word_sizes** hash conversion at the end
- split string argument into an array of word substrings using a whitespace delimiter, `' '`
- initialize a hash
- iterate over the array's elements:
  - return element's size
- iterate over the new array's elements:
  - if current element's size is not a hash key
    - count the number of elements in the array that have the same size
    - set a new hash key-value: element's character count, number of occurrences
  - else
    - nil
- return the hash

---
### Code
*see `06_word_sizes.rb`*
