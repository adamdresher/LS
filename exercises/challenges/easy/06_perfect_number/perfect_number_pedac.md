#### Problem
Goal: Create a program that can determine whether a nature number's Aliquot sum defines it as 'perfect', 'abundant', or 'deficient'.
Input: Integer
Return: String
Rules:
- natural numbers are positive integers
- Aliquot sums are the sum of all the divisors of its number (excluding the number itself)
- divisors are numbers that can be used to divide a number without a remainder
  - 'perfect' means the Aliquot sum equals its number
  - 'abundant' means the Aliquot sum is greater than its number
  - 'deficient' means the Aliquot sum is less than its number
- prime numbers are always deficient because they have no divisors
- numbers less than 1 are not natural numbers and should raise an exception

#### Examples
6 => 1 + 2 + 3 == 6 => perfect
28 => 1 + 2 + 4 + 7 + 14 == 28 => perfect
15 => 1, 3, 5 == 8 => deficient
12 => 1 + 2 + 3 + 4 + 6 == 16 => abundant
24 => 1 + 2 + 3 + 4 + 6 + 8 + 12 == 36 => abundant

1 => no valid divisors => deficient
3 => 1 => deficient
5 => 1 => deficient
7 => 1 => deficient

#### Data Structures
- list of argument's divisors (Array)

#### Algorithm
- PerfectNumber class
  - `::classify(num)`
    - collect all the divisors of num
    - remove num from list
    - sum list
    - compare sum against num

- `UnnaturalNumberError` exception
  - subclass `StandardError`
  - return a custom message: "#{num} is not a natural number"
