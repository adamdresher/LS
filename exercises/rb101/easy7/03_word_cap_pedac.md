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
- How are words that start with a non-alphabetical character handled?
    - Return the non-alphabetical character.
    - Do not capitalize the first alphabetical character.

**Mental Model:**

# This solution ignores non-alphabetical characters when seeking characters to capitalize.
- Set a constant variable to all alphabetical characters, uppercase and lowercase.
Create a method that takes a string argument.  Initialize a new, empty array.  Split the argument into an array of words using a whitespace delimiter.  Iterate over each array's words.  For each word, set a new, empty string variable and interate over the word's letters.  On each iteration if the letter is not included in the constant variable, add the letter to the new string variable.  Else if the letter is in the constant variable but not in the new string, uppercase the letter and add it to the new string variable.  Else, downcase the letter and add it to the new string variable.  After iterating over the word, add the new string to the new array.  Finally combine the array using a whitespace delimiter to create and return a new string.

- Set a constant variable to all alphabetical characters, uppercase and lowercase.
Create a method that takes a string argument.  Initialize a new, empty string variable.  Next iterate over the argument's characters.  On each iteration add the return value to the new string.  Unless the character element is in the constant variable, return self.  If the element has an index of 0 or the prior element is not included in the constant variable, captialize the character element.  Else, lowercase the character element.  After iteration is complete, return the new string.

# This solution does not capitalize the first alphabetical character if it is preceded by a non-alphabetical character (which is not a whitespace).
- Set a constant variable to all alphabetical characters, uppercase and lowercase.
Create a method that takes a string argument.  Initialize a new, empty array.  Split the argument into an array of words using a whitespace delimiter.  Iterate over each array's words.  For each word, set a new, empty string variable and interate over the word's letters.  On each iteration if the letter is in the constant variable, uppercase the letter and add it to the new string variable.  Else, downcase the letter and add it to the new string variable.  After iterating over the word, add the new string to the new array.  Combine the array using a whitespace delimiter to create and return a new string.

- Create a method that takes a string argument.  Split the argument into an array of words using a whitespace delemiter.  Iterate over and mutate array's words.  For each word, capitalize the first character.  Combine the array using a whitespace delimiter to create and return a new string.

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
# This solution ignores non-alphabetical characters when seeking characters to capitalize.
- set a constant variable to /[A-z]/

**word_cap**
- take a string argument
- split argument into an array of words using `' '`
- iterate over array's words and return a new array:
  - pass word into helper method: `capitalize_word`
  - return a new word
- combine array's words into a new string using `' '`
- return new string

**capitalize_word**
- take a string argument
- iterate over argument's letters and return a new string:
  - initialize a new, empty string
  - if letter is in constant variable, but no alphabetical character is in new string
    - new string << upcase letter
  - else # non_alphabetical characters return self
    - new string << downcase letter
- return new string

**Algorithm 2**
# This solution ignores non-alphabetical characters when seeking characters to capitalize.
- set a constant variable to /[A-z]/

**word_cap**
- take a string argument
- initialize a new, empty string variable
- iterate through argument's character and add the return value to the new string:
  - if character is not included in constant variable
    - character
  - else
    - if index is 0
      - upcase character
    - else if the prior character is not included in constant variable
      - upcase character
    - else
      - downcase character
- return new string

# This solution does not capitalize the first alphabetical character if it is preceded by a non-alphabetical character (which is not a whitespace).
**Alogrithm 3**
- set a constant variable to /[A-z]/

**word_cap**
- take a string argument
- initialize a new, empty array
- split argument into an array of words using `' '`
- iterate over array's words:
  - set a new, empty string variable
  - iterate over the word's letters:
    - if the letter is included in the constant
      - new string << upcase letter
    - else
      - new string << downcase letter
  - new array << new string
- combine array using `' '`
- return new string

**Algorithm 4**
**word_cap**
- take a string argument
- split argument into an array of words using `' '`
- iterate over and mutate array's words:
  - capitalize the word
- combine array's elements using `' '`
- return the new string

---
### Code
*see `03_word_cap.rb`*
