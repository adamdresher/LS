### Understanding the Problem
Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is `true`, the bonus should be half of the salary. If the boolean is `false`, the bonus should be `0`.

**Explicit Requirements:**

- Input: Two parameters, a positive integer and a boolean.
- Output: An integer.

**Implicit requirements:**

- What is the first parameter?
    - The salary, which is double the bonus.
- What is the second parameter?
    - Whether or not bonus is given.
- Are the parameters' order important?
    - Yes.
- Is there a scenario with zero or negative salary?
    - That's a disturbing thought.  No, thank goodness.  But might as well consider zero as valid, maybe someone's doing volunteer work.
- Are there any default values for the parameters?
    - The problem doesn't mention any default values.

**Mental Model:**

- Create a method that uses two parameters to return a salary's bonus.  The first parameter is salary, given as a positive integer.  The second parameter verifies if a bonus is given, given as a boolean.  If the bonus is false, the method returns a zero bonus.  If the bonus is true, the method returns a bonus of half the given salary.

---
### Examples/Tests
```ruby
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
```
---
### Data Structures
None.

---
### Algorithm
Algorithm 1:
- Create a method, `calculate_bonus` with two parameters, `salary` and `bonus`.
- Check that `salary` is a natural number, return an error if false.
- Check that `bonus` is a boolean, return an error if false.
- If `bonus` is `false`, return `0`.
- If `bonus` is `true`, return `salary` divided by `2`.

---
### Code
*see `10_calculate_bonus.rb`*
