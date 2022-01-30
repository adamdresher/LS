=begin
Understanding the **Problem**:
- Using the previously made `multiply()` method, create a new method that squares a single number.

Questions/Answers:
- What is the input?
    - One number.
- What is the output?
    - One number.
        
Mental Model:
- Create a method that squares a number argument by passing to a nested method, `multiply()`.

**Examples/Tests**:
```ruby
square(5) == 25
square(-8) == 64

powered_by_n(3, 2) == 9
```
**Data Structures**:

**Algorithm**:
- START

- READ `multiply()`
- pass it the same variable for both parameters.

- END
**Code**:
=end
```ruby
# def square(num) # Maybe it's bad form to nest methods- doing too many things at once.
#   def multiply(num1, num2)
#     num1 * num2
#   end

#   multiply(num, num)
# end

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def powered_by_n(number, n) # edge case of n < 0 caught, but not resolved
  result = number
  counter = 0

  if n == 1
    result
  elsif n == 0
    result = 1
  elsif counter < 0
    return '<ARGUMENT ERROR; n must be a natural number>'
  else
    until counter == n
      result = multiply(result, number)
      counter += 1
    end
  end

  result
end

def powered_by_n(number, n) # edge case of n < 0 caught, but not resolved
  if n < 0 then return '<ARGUMENT ERROR; n must be a natural number>' end

  result = number
  (n + 1).times do |n|
    n == 0 ? result = 1 : result = multiply(result, number)
  end
  result
end
