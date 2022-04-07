=begin
Understanding the **Problem**:
- Create a method with one integer parameter that checks if the integer is odd.

Questions/Answers:
- Is the argument always an integer?
    - Yes.  The test cases always provide an integer.
- Is the argument ever a float?
    - No.  The test cases do not give float or rational numbers.
- Is the argument ever a non-natural number?
    - Yes.  Evaluate the absolute value of the argument.
- Is there more than one argument given?
    - No.  The test cases only pass one argument.
- What format is the output?
    - There is no output, only a boolean return.  True, if odd. 

Mental Model:
- Create a method that accepts a single integer as a parameter and returns a boolean `true` if the absolute value is odd.

- **Examples/Tests**:
```ruby
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
```
**Data Structures**:
- None required.

**Algorithm**:
- Create a method named `is_odd` with one parameter.
- Convert the parameter to an absolute value.
- Return `true` if the parameter's modulo of `2` is `1`.

**Code**:
=end
def is_odd?(num)
  (num.abs % 2 == 1) ? true : false
end
