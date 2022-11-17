#### Problem
Goal: Create a program that takes a letter argument and outputs a ASCII diamond.
Input: a single letter (String)
Output: an ASCII diamond using only letters and whitespaces
Rules:
- letters are all uppercase
- the size of the diamond is based on the number of letters from 'A' to argument
- the diamond is both vertically and horizontally symmetrical
- 'A' is used for the top and bottom of the diamond
- the argument letter is used for the horizontal corners of the diamond
- the letters start with 'A' and increment through the alphabet with each line of the diamond
- each horizontal line is the same length
  - buffer with whitespaces
  - ends with newline

#### Example

A\n

   A   \n
  B B  \n
 C   C \n
D     D\n
 C   C \n
  B B  \n
   A   \n

A = 1
B = 2
C = 3
D = 4

3, A, 3 => D's idx * ' ' + (char insert idx * ' ') + D's idx * ' '
2, B, 1, B, 2
1, C, 3, C, 1
0, D, 5, D, 0
1, C, 3, C, 1
2, B, 1, B, 2
3, A, 0, 3

['A',
 'BB',
 'CC',
 'DD'] =>
['   A',
 '  BB',
 ' CC',
 'DD'] =>
['   A',
 '  B B',
 ' C  C',
 'D   D'] =>
['   A   ',
 '  B B  ',
 ' C   C ',
 'D     D'] =>

['A', 'D'] => arguments
['A', 'B', 'C' 'D'] => range
['A', 'B', 'C' 'D'], ['A', 'B', 'C'] => duplicate -1
['A', 'B', 'C' 'D'], ['C', 'B' 'A'] => reverse
['A', 'B', 'C' 'D', 'C', 'B' 'A'] => join

#### Data Structure
- list for letters from 'A' to argument
- list to store ASCII art matrix
  - top-level array contains vertical lines
  - nested arrays contain hoizontal lines


#### Algorithm
- `Diamond` class
  - `::make_diamond(last_letter)`
    - return last_letter if last_letter is 'A'
    - create list from 'A' to last_letter
    - double all letters except 'A' in list
    - turn list's letters into horizontal lines
      - iterate through list's letters
      - preprend whitespaces
        - whitespace * (arg last_letter's idx - current idx)
      - if there are 2 letters, insert whitespace
        -  letter + whitespace * (insert idx * 2 - 1) + letter
      - append whitespaces
        - whitespace * (arg last_letter's idx - current idx)
      - append newline
    - combine list with reversed copy minus middle line
      - copy list
      - delete last line
      - reverse list
      - append new list to the end of original list
