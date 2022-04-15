### Understanding the Problem
Build a command line calculator program that uses two numbers and performs simple arithmetic: addition, subtraction, multiplication, and division.


**Explicit Requirements:**

- Input: Three user inputs.
  - Two integers.
  - One special character.
- Output: An integer or float.

**Implicit requirements:**

- Are the user inputs ever zero or negative numbers?
    - Sure.
- Are the user inputs manipulated?
    - Yes based on the the user input's special character.

**Mental Model:**

- Create a program that asks the user for two numbers and then a type of operation in the form of a special character.  The first number is operated on by the second number using the type of operation given.  The return value is assigned to a variable and then output to the user.

---
### Examples/Tests
None.

---
### Data Structures
None.

---
### Algorithm
- Ask user for the first number and assign it `num1`
- Ask user for a type of operation (+, -, *, /, **) and assign it to `operation`
- Ask user for the second number and assign it to `num2`
- Compute a math equation with `num1` `operation` `num2 ` and assign it to `result`
- Output `result`

---
### Code
*see `calculator.rb`*
  