=begin
Understanding the **Problem**:
- Create a method that takes two arguments, multiplies them together, and returns the result.

Questions/Answers:
- What is the input?
    - Two integer arguments.
- What is the output?
    - An integer returned.
        
Mental Model:
- Create a method that accepts two integers as arguments, multiplies them together and returns the result.

**Examples/Tests**:
```ruby
multiply(5, 3) == 15
```
**Data Structures**:
None

**Algorithm**:
- START

- IF (num1 == integer || float) && (num2 == integer || float)
  - multiply parameter1 with parameter2
- ELSE
  - PRINT error

- END

**Code**:
=end

def multiply(num1, num2)
  num1 * num2
end

=begin
`*()` is a class method.  So depending on the caller's object class, the method will function differently (or not at all if the method isn't available for the class).

For instance with `Integer` and `Float` objects, `*()` functions like an operator and multiplying its operands.

For `String` objects, `*()` concatenates its caller with self 'x' times ('x' being its argument which must be an integer).

For `Array` objects, `*()` functions differently based on its argument.  If the argument is a number, `Array#*()` returns a new array with the caller's elements duplicated 'x' times ('x' being its argument).  If the argument is a string, `Array#*()` returns a string where the elements are joined together with the argument as a delimiter (functioning similarly to `#join()`).
=end