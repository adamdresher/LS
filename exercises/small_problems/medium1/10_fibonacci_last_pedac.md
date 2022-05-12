### Understanding the Problem
In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

**Explicit Requirements:**

- Input: An Integer.
- Return: An Integer.
- Return is the last digit of the nth Fibonacci number where nth is the argument.

**Implicit requirements:**

- new Fibonacci num == last Fibonacci num + 2nd to last Fibonacci num

**Mental Model:**

- Initialize a variable for the current fibonacci number and a variable for the previous fibonacci number.  Iterate through a range of numbers 1 to argument.  On each iteration, check if the last fibonacci number is 1.  If not 1, set it to 1.  Else assign the a new variable for the current Fibonacci number to the last and 2nd to last Fibonacci number.  If this is the last iteration, return current Fibonacci number.  Else assign the last number to the 2nd to last number, and the current number to the last number.  Next iteration.  Once the last iteration has occurred, return the last digit in the current Fibonacci number.

---
### Examples/Tests
```ruby
fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4
```
---
### Data Structures
None.

---
### Algorithm
**fibonacci_last(nth)**
- initialize 2 variables: current_num, last_num
- iterate through range of num 1..nth:
  - if current_num is 0, set to 1
  - else current_num, last_num == current_num + last_num, current_num
- current_num.digits[0]

---
### Code
*see `10_fibonacci_last.rb`*
