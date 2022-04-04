### Understanding the Problem
Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

**Explicit Requirements:**

- Input: A string.
- Return: A new string.
- Words are any sequence of non-blank characters.
- First character of all words are capitalized, and the rest of the word is lowercase.

**Implicit requirements:**

- How are empty string arguments handled?
    - Return a new empty string.
- How are non-alphabetical characters handled?
    - Return them, unmodified.

**Mental Model:**

- Set a constant variable to all alphabetical characters, uppercase and lowercase.
Create a method that takes a string argument.  Initialize a new, empty array.  Split the argument into an array of words using a whitespace delimiter.  Iterate over each array's words.  For each word, set a new, empty string variable and interate over the word's letters.  On each iteration if the letter is not included in the constant variable, add the letter to the new string variable.  Else if the letter is in the constant variable but not in the new string, uppercase the letter and add it to the new string variable.  Else, downcase the letter and add it to the new string variable.  After iterating over the word, add the new string to the new array.  Finally combine the array using a whitespace delimiter to create and return a new string.

---
### Examples/Tests
```ruby
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
```
---
### Data Structures
Array.

---
### Algorithm
- set a constant variable to /[A-z]/

**word_cap**
- take a string argument
- split argument into an array of words using `' '`
- iterate over array's words and return a new array:
  - pass word into helper method
  - return a new word, capitalize_word
- combine array's words into a new string using `' '`
- return new string

**capitalize_word**
- take a string argument
- iterate over argument's letters and return a new string:
  - unless letter is in constant variable
    - new_word << letter
  - else if letter is in constant variable, but not in new string
    - new_word << uppercased letter
  - else
    - new_string << downcased letter
- return new_word

**word_cap**
- take a string argument
- iterate through argument's character:
  - if character does not match constant
    - character
  - else
    - if index is 0
      - upcase the character
    - else if the prior character is not a match with constant
      - upcase the character
    - else
      - downcase the character

---
### Code
*see `03_word_cap.rb`*
