### Understanding the Problem
Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.
Exclude non-letters when determining word size. For instance, the length of `"it's"` is 3, not 4.

**Explicit Requirements:**

- Input: A string.
- Return: A hash.
- Count only alphabetical characters.

**Implicit requirements:**

- How are empty strings evaluated?
    - An empty hash is returned.
- How are the hash key-value pairs formatted?
    - The key and value are both integers.

**Mental Model:**

- Create a method that takes a string as an argument.  Initialize an empty hash with a default value.  Split the string into an array of substrings using a whitespace, `' '`, as a delimiter.  Then iterate over the array's elements.  For each element, count the number of alphanumeric characters.  Add or update key-value pair to the hash where the key is the number of characters in the current element and the value is `+= 1`.  Return the hash.

---
### Examples/Tests
```ruby
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
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
- initialize an empty hash with a default value: `0`
- iterate over the array's elements:
  - run count_alphanumeric
  - if hash has a key with element's size, add `1` to its value
  - else add a new key-value with the key set to the element's size and value set to `1`
- return the hash

**word_sizes** hash conversion at the end
- split string argument into an array of word substrings using a whitespace delimiter, `' '`
- initialize a hash with a default value: `0`
- iterate over the new array's elements:
  - run count_alphanumeric
  - if current element's size is not a hash key
    - count the number of elements in the array that have the same size
    - set a new hash key-value: element's character count, number of occurrences
  - else
    - nil
- return the hash

**count_alphanumeric**
- iterate over string:
  - remove character if it is non-alphanumeric
- return the size of the string

---
### Code
*see `07_word_sizes`*
