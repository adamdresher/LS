### Understanding the Problem
Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

**Explicit Requirements:**

- Input: A string.
- Return: An array.
- Return array's elements contains word substrings from argument.
  - Every string element contains a word substring interpolated with a whitespace and number of characters in the word.
  - Words are defined by a single whitespace delimiter.
  - Any non-whitespace substring is/or is part of a word.

**Implicit requirements:**

- Are all characters in word substrings counted (numbers, non-alphanumerics, etc.)?
    - Yes, everything except whitespaces.
- How are empty string arguments handled?
    - Return an empty array.

**Mental Model:**

- Create a method that takes a string argument.  Convert the argument into an array of substrings using a whitespace delimiter.  Iterate over and mutate the array's elements.  On each iteration, count how many characters are in the current element.  Append this count number to the the current element using a whitespace delimiter.  Return the array.

---
### Examples/Tests
```ruby
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []
```
---
### Data Structures
Array.

---
### Algorithm
**word_lengths(str)**
- take a string argument
- convert the argument into an array of substrings using a whitespace delimiter
- iterate over and mutate the array's elements:
  - count how many characters are in the current element
- append this count number to the the current element using a whitespace delimiter
- return the array

---
### Code
*see `06_word_lengths.rb`*
