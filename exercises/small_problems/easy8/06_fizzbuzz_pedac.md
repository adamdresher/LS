### Understanding the Problem
Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

**Explicit Requirements:**

- Input: Two integers.
- Output: Integers and Strings.
- Output second number - first number objects.
- Output objects are based on whether the current number is divisible by 3, 5, both, or none.
  - If current number is divisible by 3, then output 'Fizz'
  - If current number is divisible by 5, then output 'Buzz'
  - If current number is divisible by 3 and 5, then output 'FizzBuzz'
  - If current number is not divisible by 3 or 5, then output number.

**Implicit requirements:**

- What should the method do when the second number is less than the first number (difference is negative)?
    - The test case does not suggest this needs to be considered.
- What should the method do when first and second numbers are the same?
    - The test case does not suggest this needs to be considered.

**Mental Model:**

- Create a method that takes two integer arguments.  Iterate through numbers from the first argument to the second argument.  On each iteration, check if the current number is divisible by 3.  Print 'Fizz' if yes.  Check if the current number is divisible by 5.  Print 'Buzz' on the same line if yes.  If divisible by neither, print current number.

---
### Examples/Tests
```ruby
fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
```
---
### Data Structures
None.

---
### Algorithm
**fizzbuzz(num1, num2)**
- take two integer arguments
- initialize an empty array
- define a range of numbers from the first argument to the second argument
- iterate through the range and add the block's return value to the outer array
  - if the current number is divisible by 3 && 5
      - 'FizzBuzz'
  - if the current number is divisible by 3
    - 'Fizz' if yes
  - if the current number is divisible by 5
    - 'Buzz' if yes
  - if divisible by neither
    - current number

---
### Code
*see `06_fizzbuzz.rb`*
