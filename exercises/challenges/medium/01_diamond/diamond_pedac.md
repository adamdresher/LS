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


<!-- #### Algorithm
- `Diamond` class
  - `::make_diamond(last_letter)`
    - return last letter if last_letter is 'A'
    - create list of letters from 'A' to last letter
    - create top half of diamond
    - create bottom half of diamond
      - copy top half minus last line
      - reverse
    - combine top half and bottom half

    - create half diamond
      - iterate through list of letters and convert each to a line
      - combine lines

    - create horizontal line
      - define padding
      - define shape
      - create line
        - padding + shape + padding + new line

    - create padding
        - whitespace * (arg last letter's idx - current idx)

    - create shape
      - return char if char is 'A'
      - if idx is 0, fill size is 0
      - else fill size is idx * 2 - 1
      - join char + fill size + char -->

#### Algorithm
  - `Diamond` class
    - `::make_diamond(last_letter)`
      - create top half of diamond
      - create bottom half of diamond
        - copy top half minus last line
        - reverse
      - combine top and bottom half

    - create top half
      - create quarater
      - iterate through lines of quarter
        - copy current line reversed
        - if current line is idx 0
          - use copy minus first char
        - combine current line with copy
        - append a new line

    - fill quarter
      - create a range of chars from 'A' to last letter
      - create an empty quarter
      - iterate through the range of chars with index
        - use index to find char's location in quarter
          - use current index to locate string
          - use current index to whitespace  with char at string's index

      - create empty quarter
        - Array of empty strings
        -   number of strings is equal to size of range
          - string contains whitespaces equal to size of range
