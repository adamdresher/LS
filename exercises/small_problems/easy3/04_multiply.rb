def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3) == 15

=begin
`#*` is an instance method available to multiple object classes. So the method functions differently based on its caller.

For `Integer` and `Float` object callers, `#*` functions like an arithmetic operator, multiplying its operands.

For `String` object callers, `#*` concatenates its caller with self 'number' times ('number' being the method's argument, which must be an integer).

For `Array` object callers, `#*` functions differently based on its argument.  If the argument is a number, `Array#*` returns a new array with the caller's elements duplicated 'number' times ('number' being its argument).  If the argument is a string, `Array#*` returns a string where the elements are joined together with the argument as a delimiter (functioning similarly to `#join`).
=end
