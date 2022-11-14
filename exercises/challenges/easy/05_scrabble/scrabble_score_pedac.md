#### Problem
Goal: Create a class that creates scrabble words and calculates their score.
Input: 
Output/Return: 
Rules:
- words are groups of English alphabet letters
  - each letter has an assigned value
- multiple of the same letter results in multiple of the letter's value
- case-insensitive
- whitespaces and new lines are worth 0 points
- nil returns 0 points

Tile Values:
\t, \n, ' '                   = 0
A, E, I O, U, L, N, R, S, T   = 1
D, G                          = 2
B, C, M, P                    = 3
F, G, V, W, Y                 = 4
K                             = 5
J, X                          = 8
Q, Z                          = 10

#### Examples
CABBAGE => CABGE (unique letters)

C, 1 = 3 * 1 = 3
A, 2 = 1 * 2 = 2
B, 2 = 3 * 2 = 6
G, 1 = 2 * 1 = 2
E, 1 = 1 * 1 = 1
total        = 14

#### Data Structure
- list of word's letters or points (Array or String)
- dictionary defining letters and their associated points (Hash or Array)

#### Algorithm
- Word class and Tile class
  - a word is a collection of tile collaborators
  - each tile accesses a Scrabble dictionary to define letter's points
  - word combines tiles points

- Word class
  - initialize dictionary with points and associated letters (constant)
  - `#initialize`
    - require a word argument (String or Array)
      - downcase the word
      - initialize `total` to 0
  - `#score` # 1st approach
    - iterates through dictionary's points
      - count how many letters from word are in the point's list of letters
      - multiply point by count
      - add result to total
    - return total

  - `#score` # 2nd approach
    - tally the number of each unique letter in word
    - iterate through tallied list
      - multiple current letter's value (quantity of letter) by the dictionary key which contains letter
    - sum values and return total

  - `#score` # 3rd approach
    - tally the number of each unique letter in word
    - iterate through the dictionary's subsets of letters
      - iterate through the 
