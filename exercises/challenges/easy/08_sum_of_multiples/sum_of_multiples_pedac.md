#### Problem
Goal: Create a program that uses a number and set of numbers to calculate the sum of all the multiples of all the numbers in the set that are less than the first number.  Use 3 and 5 as a default value for the set.
Input: Integer (natural number), list of Integers
Output/Return: Integer
Rules:
- range of possible multiples is 1 to first argument
- multiples are based off elements from second argument
- default value for the second argument is [3, 5]

#### Examples
- 20, [3,5]
  - 1..20
    - [1, 3, 6, 8, 12, 15, 18].sum +
    - [5, 10, 15].sum ==

#### Data Structure
- List storing all the multiples (Array)


#### Algorithm
- `SumOfMultiples` class
  - create class variable to `[3, 5]`, default value

  - `#initialize`
    - accepts an Array argument, list of numbers
    - initialize an instance variable to list of numbers

  - `#to(num)`
    - requires an Integer argument, max number
    - invokes `::to(num)

  - `::to(num)`
    - requires an Integer argument, max number
    - creates an empty Array, list of multiples
    - iterates through class variable, list of numbers
      - assign a local variable to current number
      - while current number is less than max number
        - add local variable to list of mulitples
        - reassign local variable to itself plus current number
    - remove duplicate numbers from the list of multiples
    - sum all numbers in list of multiples
