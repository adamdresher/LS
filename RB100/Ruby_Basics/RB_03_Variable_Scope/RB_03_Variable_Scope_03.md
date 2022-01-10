## What's My Value (Part 3)
#### What will the following code print, and why? Don't run the code until you have tried to answer.
```ruby
a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a
```
___
#### Solution
`7`

Again, LS is trying to trick us by using `a` to define a variable in the outer scope, as an argument passed to a method, and as a local variable within a method.  The variable `a` can be an argument passed into the method as a parameter.  However within the method, `a` replaces the parameter `b` (not `a`).  In this example, the expression `a + 5` is passed to `b`.  This means `b = a + 5`.  Thus `12` is passed into `#my_value`.  The statement `a = b` within `#my_value` does not mutate `a`, rather it assigns the value (or object) of `b` to `a` and returns the value.
___
#### Solution, LS
`7`
#### Discussion
Once again, the result is `7`. Once again, the local variable `a` inside the `my_value` method definition is not visible outside the `my_value` method definition. Furthermore, the local variable `a` at the top level is not visible inside `my_value` because method definitions are self-contained with respect to local variables.
___
#### Notes
