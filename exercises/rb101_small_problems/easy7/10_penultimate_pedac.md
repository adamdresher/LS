### Understanding the Problem
Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

**Explicit Requirements:**

- Input: A string.
- Return: A new string.
- Return string is a second to last word from input string.
- Word is defined as a sequence of non-blank characters (`' '` delimiter).
- Input string contains at least two word substrings.

Further Exploration:

- Return string is the middle word from input string.
- Input string can be empty.

**Implicit requirements:**

- Is the method case sensitive?
    - No.
- Is the method senstive to non-alphabetical characters?
    - Only whitespaces are ignored (and used as a delimiter).
- What is returned for an empty input string?
    - A new empty string.

Further Exploration:

- How is the middle word defined when there are an even number of words in the input string?
    - Return the middle most two words.

**Mental Model:**

- Create a method that accepts a string argument.  Split the argument into an array of substrings using a whitespace as a delimiter.  Return the second to last element in the array.

Further Exploration:

- Create a method that accepts a string argument.  Split the argument into an array of substrings using a whitespace as a delimiter.  Use the size of the array to determine the middle element.  If the array is odd, divide the size by 2, round up to the nearest whole number, and return the element at this index.  If the array is even, divide the size by 2, find the element at this index and the previous index, join the elements with a whitespace delimiter, and return this new string.

---
### Examples/Tests
```ruby
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
# Further Exploration:
p penultimate('last word') == 'last word'
p penultimate('Launch School is great!') == 'School is'
p penultimate('Moses supposes his toeses are roses') == 'his'
p penultimate('')
```
---
### Data Structures
Array.

---
### Algorithm
**penultimate**
- take a string argument
- split argument into an array using `' '`
- return array[-2]

Further Exploration:
**penultimate**
- take a string argument
- split argument into an array using `' '`
- set an integer variable to middle index: `(array.size / 2)`
- if array.size.odd?
  - return array[middle_index]
- else
  - return [array[middle - 1], array[middle]].join(' ')
---
### Code
*see `10_penultimate.rb`*
