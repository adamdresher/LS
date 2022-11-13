#### Problem
Goal: Create a program that converts modern decimal numbers into equivalent roman numbers.
Input: Integer
Output: String
Rules:
- max number is 3_000
- modern decimal numbers are expressed in Roman numerals as separate digits from left to right
- Roman numerals skip zero decimal numbers
- Roman numeral math:
  - chars before a larger char are subtraction
  - small chars after a larger char are addition
  - multiple same char are addition

decimal number to Roman numeral:
- 1:          I
- 5:          V
- 10:         X
- 50:         L
- 100:        C
- 500:        D
- 1_000:      M

Questions
- evaluate from right to left?

#### Examples
- 2:          II
- 3:          III
- 4:          IV
- 6:          VI
- 14:         XIV
- 17:         XVII
- 1990:       MCMXC
- 2008:       MMVIII
  - checks for multiples of 1_000
    - finds 2
    - add MM
    - removes 2_000
  - checks for multiples of 500
  - checks for multiples of 100
  - checks for multiples of 50
  - checks for multiples of 10
  - checks for multiples of 5
    - finds 1
    - add X
    - removes 5
  - checks for multiples of 1
    - finds 3
    - add III
    - removes 3

#### Data Structure
- Array: containing individual decimal digits
- Hash: dictionary to translate decimal digits to Roman numerals

1990 => [1, 9, 9, 0]

{ 1 => { (1..3) => 'I', 4 => 'IV', (5..8) => 'V', 9 => 'IX' },
  2 => { (1..3) => 'X', 4 => 'XL', (5..8) => 'L', 9 => 'XC' },
  3 => { (1..3) => 'C', 4 => 'CD', (5..8) => 'D', 9 => 'CM' },
  4 => { (1..3) => 'M' }
}

#### Algorithm
- split input num into a list of digits
  - digits.reverse
- iterate through list of digits
  - use index to search dictionary for valid options (nested hash)
    - divide num by 5
      - if remainder is 4
        - find nested hash value that includes num
      - else
        - access nested hash value for num and multiple by quotient
          - append new string with value
        - access nested hash value for remainder and multiple by remainder
          - append new string with value
