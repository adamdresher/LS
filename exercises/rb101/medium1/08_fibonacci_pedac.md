### Understanding the Problem
Write a recursive method that computes the `nth` Fibonacci number, where `nth` is an argument to the method.

Recursive methods have three primary qualities:

They call themselves at least once.
They have a condition that stops the recursion (`n == 1` above).
They use the result returned by themselves.
In the code above, `sum` calls itself once; it uses a condition of `n == 1` to stop recursing; and, `n + sum(n - 1)` uses the return value of the recursive call to compute a new return value.

**Explicit Requirements:**

- Input: An Integer.
- Return: An Integer.
- Use recursion to determine the method's return value.

**Implicit requirements:**

- How is a negative argument handled?
    - The test cases don't suggest this needs to be considered.
- How is an argument value of `0` handled?
    - The test cases don't suggest this needs to be considered.

**Mental Model:**

- Return the argument if the argument is less than or equal to `1`.  Else, sum the two previous fibonacci numbers.  Return the sum.

---
### Examples/Tests
```ruby
fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765

fibonacci(1) == 1
fibonacci(2) == 1 + 0
fibonacci(3) == 1 + 1
```
---
### Data Structures
None.

---
### Algorithm
**fibonacci(nth)**
- return argument if argument <= 1
- else sum fibonacci(nth - 1) and fibonacci(nth - 2)
- return sum

---
### Code
*see `08_fibonacci.rb`*
