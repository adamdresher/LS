### Understanding the Problem
Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

**Explicit Requirements:**

- Input: A string.
- Return: A new string.
- Return string has every consonant character doubled in order of occurrence.
- All non consonant characters are not doubled.

**Implicit requirements:**

- Are non consonant characters used as substrings of the return string?
    - Yes.
- How are whitespaces empty string arguments handled?
    - Return a new empty string.

**Mental Model:**

- Create a method that takes a string argument.  Convert the argument into an array.  Iterate through the array and return a new array using each iteration's return value as an element.  On each iteration, if the current substring is a consonant, double it.  If not a consonant, return substring.  Join the array as a string and return it.

---
### Examples/Tests
```ruby
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
```
---
### Data Structures
Array.

---
### Algorithm
**double_consonants(string)**
- takes a string argument
- convert the argument into an array
- iterate through the array and return a new array using each iteration's return value as an element:
  - if the current substring is a consonant
    - substring * 2
  - else
    - return substring
- join the array as a string with '' as a delimiter
- return string

---
### Code
*see `08_double_consonants.rb*`
