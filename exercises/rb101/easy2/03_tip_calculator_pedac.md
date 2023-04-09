### Understanding the Problem
Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

**Explicit Requirements:**

- Input: Two user inputs given as integers.
- Output: Two strings with variables inconcatenated in.

**Implicit requirements:**

- Are the user inputs ever zero or negative numbers?
    - The test case and problem do not explicitly state one way or another.  Logic dictates neither input can be negative, but zero would be an acceptable input.
- Are the user inputs manipulated?
    - No, they are used to create new float variables with a tolerance of 1 decimal point.
- How is the tip percentage given?
    - An integer between 0 and 100.

**Mental Model:**

- Create a program that asks for two integers, bill and tip_rate.  Calculate the tip and assign it to a variable.  Use the tip to calculate the bill_total.  Output two strings that state the tip_total and bill_total.

Mental Model for Further Exploration:
- Create a program that asks for two integers, bill and tip_rate.  Calculate the tip_total with exactly two decimal places.  Use the tip_total to calculate the bill_total with exactly two decimal places.  Output two strings that state the tip_total and bill_total.

---
### Examples/Tests
```ruby
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
```
---
### Data Structures
None.

---
### Algorithm
Algorithm 1:
- Create a method, `tip_calculator`
- GET bill from user input
    - SET `bill` = input
- GET tip from user input
    - SET `tip_rate` = input
- SET `tip_rate` / 100.00
- SET `tip_total`  = `bill` * `tip_rate`
- SET `bill_total` = `bill` + `tip_total`  
- PRINT string with `tip_total`
- PRINT string with `bill_total`

Algorithm 2 for Further Exploration:
- Create a method, `tip_calculator`
- GET bill from user input
    - SET `bill` = input
- GET tip from user input
    - SET `tip_rate` = input
- SET `tip_rate` / 100.00
- SET `tip_total`  = `bill` * `tip_rate`
- SET `bill_total` = `bill` + `tip_total`
- SET `tip_total`  = 2 decimal places long
- SET `bill_total` = 2 decimal places long
- PRINT string with `tip_total`
- PRINT string with `bill_total`

---
### Code
*see `03_tip_calcualtor.rb`*
