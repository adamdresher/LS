## Multiply the Sum
#### Write the following methods so that each output is `true`.
```
puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
```
___
#### Solution
```ruby
def add(num1, num2)
  result = num1 + num2
end

def multiply(num1, num2)
  result = num1 * num2
end

# TEST CASES
puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
```
___
#### Solution, LS
```ruby
def add(num1, num2)
  num1 + num2
end

def multiply(num1, num2)
  num1 * num2
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
```
#### Discussion
The goal here is to write two methods, `add` and `multiply`, that do simple math operations. We use the `+` and `*` operators inside the methods to `add` or `multiply` the numbers then we return the results. By returning the results, we can use the `add` method as an argument for `multiply` just like we would with a variable.
___
#### Notes
