### Understanding the Problem
Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

**Explicit Requirements:**

- Input: Two integers via user input.
- Output: A multiline string.
- User's input will be positive integers.

**Implicit requirements:**

- Does the program validate the user's inputs?
    - No.
- What does 'power' mean?
    - The first integer is raised to the power of the second integer.
- How is the output formatted?
    - `'==> '`, plus the first user input, plus an operation, plus the second user input, plus the result.

**Mental Model:**

- Create a program that asks user for a number, then again for a second number.  Calculate the following with the two numbers: addition, subtraction, product, quotient, remainder, and power.  Output the equations with results.

---
### Examples/Tests
```ruby
# Example input:
==> Enter the first number:
23
==> Enter the second number:
17

# Ouput:
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

```
---
### Data Structures
Hash.

---
### Algorithm
- START

- SET prompt

- SET hash for math
  - addition: ['+', nil]
  - subtraction: ['-', nil]
  - multiplication: ['*', nil]
  - division: ['/', nil]
  - remainder: ['%', nil]
  - power: ['**', nil]

- PRINT request for first number
- GET first number
- SET first_num = input

- PRINT request for second number
- GET second number
- SET second_num = second number

- SET math[:addition][1]       = first_num +  second_num
- SET math[:subtraction][1]    = first_num -  second_num
- SET math[:multiplication][1] = first_num *  second_num
- SET math[:division][1]       = first_num /  second_num
- SET math[:remainder][1]      = first_num %  second_num
- SET math[:power][1]          = first_num ** second_num

- WHILE iterator < hash length
  - PRINT prompt(first_num + math[operator][0] + second_num = math[opeartor][1])
  - NEXT iteration

- END

---
### Code
*see `02_arithemtic_integer.rb`*
