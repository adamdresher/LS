### Understanding the Problem
Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

**Explicit Requirements:**

- Input: A string via user input.
- Output: A new string.
- String output is the number of characters in the string input.
- Whitespaces are not counted as a character.

**Implicit requirements:**

- Are special characters accepted and counted?
    - Assume yes.

**Mental Model:**

- Create a program that asks user for a word/s.  Calculate the number of characters, ignoring whitespaces, then output the result.

---
### Examples/Tests
```ruby
# Example input:
Please write word or multiple words: walk

# Output:
There are 4 characters in "walk".

# Example input:
Please write word or multiple words: walk, don't run

# Output:
There are 13 characters in "walk, don't run".
```
---
### Data Structures
Array.

---
### Algorithm
- START

- PRINT request for string input
- GET user input
- SET input to an array of substrings
- delete substrings == ' '
- count length of array

- PRINT results as a string

- END

---
### Code
*see `03_counting_number_of_characters.rb`*
