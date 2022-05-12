### Understanding the Problem
In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow and require massive quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result, the Fibonacci solution is only useful up to about `fibonacci(40)`. With higher values of `nth`, the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around `fibonacci(8200)`.)

Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive `fibonacci` method so that it computes its results without recursion.

**Explicit Requirements:**

- Input: An integer.
- Return: An integer.
- Return value is the Fibonacci number(argument)
- Don't use recursion for the solution.

**Implicit requirements:**

- Return value is the previous two fibonacci numbers.
- Argument is an Integer 1 or greater.

**Mental Model:**

- Sum Fibonacci(argument - 1) + Fibonacci(argument - 2)

- Initialize a counter to `0`.  Start a loop. Determine the Fibonacci number for counter.  Add 1 to the counter.  Continue until the counter reaches the argument.  Return the current Fibonacci number.

---
### Examples/Tests
```ruby
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501
```
---
### Data Structures
Array.

---
### Algorithm
**fibonacci(nth)**
- initialize a counter variable to 0
- initialize a sequence variable to an empty Array
- loop:
  - append the sequence with 1 if sequence has less than 2 numbers
  - else
    - sum the sequence's last two numbers
    - append the sequence with the sum
  - break if counter reaches the argument
  - add 1 the counter
- return the last number of sequence

---
### Code
*see `09_fibonacci.rb`*
