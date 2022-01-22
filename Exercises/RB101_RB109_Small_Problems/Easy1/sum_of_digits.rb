=begin
Understanding the **Problem**:
- Write a method that takes one argument, a positive integer, and returns the sum of its digits.

Questions/Answers:
- What is the input?
    - An integer.
- What is the output?
    - An integer.
- Can the method take a negative or non-natural number?
    - It should not be accepted.
- What happens if a large number is given with underscores, `_`?
    - It should be accepted.

Mental Model:
- Create a method called, `sum`, with the parameter, `num`.  The argument must be a positive integer.  Return the sum the digits of `num`.

**Examples/Tests**:
```ruby
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
```
**Data Structures**:
- Integer.

**Algorithm**:
- Algorithm 1:
  - Create a method called, `sum`, with the parameter, `num`.
  - Return an error if the argument is not a positive integer.
  - Return the sum of the digits of `num`.

**Code**:
=end
# SOLUTION 1.
def sum(num)
  return puts("<Argument must be a positive integer>") unless num == num.to_i && num.positive?

  num.to_s.split('').map { |i| i.to_i }.sum
end


# SOLUTION 2.  REFACTORED.
def sum(num)
  return puts("<Argument must be a positive integer>") unless num == num.to_i && num.positive?

  num.digits.sum
end
