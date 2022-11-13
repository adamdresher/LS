#### Problem
Goal: Create a program that takes a word and list of words, then returns a list of words that are anagrams for the word.
Input: String (word), list of string words
- list is an Array?
  - yes, test cases confirm
Output/Return:
- A new Array?
  - yes, to be on the safe side
Rules:
- anagram
  - cannot be the same word
  - must have same number of occurrences of original's characters
  - must contain all of original's characters
  - must not contain any new characters
  - case-insensitive

- returned list must contain all anagrams from original list
- returned list does not need to be ordered
- returns empty array if no matches found

- `Anagram` class
  - `#initialize(string)
  - `#match(array)`

#### Examples
'Orchestra', %w(cashregister Carthorse radishes) => ['Carthorse']
'corn', %w(corn dark Corn rank CORN cron park) => ['cron']
'good', %w(dog goody) => []
'ant', %w(tan stand at) => ['tan']

#### Data Structures
- Array: contain anagrams

#### Algorithm
- create an empty Array to store anagrams
- downcase the subject's chars

- iterate through the list of words
  - downcase current word
  - compare current word with subject
    - select if
      - they contain same number of occurrences of each char
      - they are not the same word
      - add current word to new list
- return new list
