#### Problem
Goal: Create a program that can convert string octal numbers and return decimal numbers.
Input: String number (base-8 format)
Return: Integer (base-10 format)
Rules:
- invalid input is treated as an octal 0
  - input may contain only digits 0..7
- use custom implementation for converting numbers
  -  don't use any built-in or library methods for conversions
- octal means a base-8 number system
  - evaluated right to left, each digit is 8 to the power of index
  - index starts at 0
- decimal means a base-10 number system
  - evaluated right to left, each digit is 10 to the power of index
  - index starts at 0
- requires:
  - `Octal` class
    - `#initialize`
      - takes a String argument
    - `#to_decimal`
      - converts base-8 number to base-10 number

#### Examples
233
- base-10 number evaluation
  - 3 * 10**0 +
  - 3 * 10**1 +
  - 2 * 10**2 ==
  - 200 + 30 + 3 == 233

- base-8 number evaluation
  - 3 * 8**0 +
  - 3 * 8**1 +
  - 2 * 8**2 ==
  - 128 + 24 + 3 == 155

#### Data Structure
- list of argument's digits in reverse (Array)
  - this allows list to use index of each digit for base conversion

#### Algorithm
- `Octal` class
- `#initialize(string)`
  - take a String argument
- `#to_decimal`
  - return 0 if any chars in list are not '0'..'7'
    - include?
  - convert String to an list of digits
  - reverse order of the list
    - digits
  - iterate through the list of digits with index
    - map
    - convert each digit with base-8 system
  - sum Integers
