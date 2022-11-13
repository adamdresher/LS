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
- Hash: translates Roman numeral to decimal digit

{
  M: 1_000,
  D: 500,
  C: 100,
  L: 50,
  X: 10,
  V: 5,
  I: 1
}
[1, 9, 9, 0]
[1_000, 900, 90, 0]

#### Algorithm
Approach 1:
  - check first digit (right most)
    - check for multiples of 1
      - if 0 < multiple <= 3
        - add multiple * I
      - if 5 < multiple < 9
        - add (multiple - 5) * I
    - check for multiples of 5
      - if multiple + 1 == 2
        - add IX
      - else multiple == 1
        - add V

--------------------------------------------------------------------------------

Approach 2:
  - checks for multiples of 1_000
    - finds 1
    - add M
    - removes 1_000
    - checks for multiple of 100
      - if multiple + 1 == 10 # multiple == 9
        - finds 9
        - add CM
        - removes 900
  - checks for multiples of 500
    - check multiple of 100
      - multiple + 1 != 500
  - checks for multiples of 100
  - checks for multiples of 10
    - if multiple == 9
      - finds 9
      - add XC
      - removes 90
  - checks for multiples of 50
  - checks for multiples of 10
  - checks for multiples of 1
    - if multiple + 1 == 10
      - return IX
  - checks for multiples of 5
  - checks for multiples of 1

--------------------------------------------------------------------------------

- split decimal number into list of digits
- iterate through the digits
  - find out the digit's decimal place (list's length)
  - multiple digit by (10 to the power of length) (digit's original value)
- convert digit to roman numeral
  - iterate through dictionary and find desired number
    - if digit is a multiple of any value
      - multiply key by digit
      - append to roman_numeral
  - output

--------------------------------------------------------------------------------

  Approach 2
  - start with first digit
    - concat 2nd digit
    - if multiple of 10
      - add M * multiple
      - remove first digit
    - if multiple + 1 == 10 # multiple == 9
        - finds 9
        - add CM
        - removes 900
  - checks for multiples of 500
    - check multiple of 100
      - multiple + 1 != 500
  - checks for multiples of 100
  - checks for multiples of 10
    - if multiple == 9
      - finds 9
      - add XC
      - removes 90
  - checks for multiples of 50
  - checks for multiples of 10
  - checks for multiples of 1
    - if multiple + 1 == 10
      - return IX
  - checks for multiples of 5
  - checks for multiples of 1
 