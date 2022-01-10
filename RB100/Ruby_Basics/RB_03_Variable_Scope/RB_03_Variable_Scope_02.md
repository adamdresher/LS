## What's My Value (Part 2)
#### What will the following code print, and why? Don't run the code until you have tried to answer.
```ruby
a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a
```
___
#### Solution
`7`

`#my_value` defines a parameter with the variable `a`, thus is limited to the method's scope.
The variable `a` is also defined in the outer scope as `7`.  Because a method creates its own inner scope, the variable `a` from the inner and outer scopes do not influence each other.  Thus the updated value of `a` within `#my_value` doesn't update `a` in the outer scope.
___
#### Solution, LS
`7`
#### Discussion
This problem is identical to the previous problem. The only thing we did is change the name `b` to `a`. Note that we can do this because method definitions are self-contained with respect to local variables. Local variables outside the method definition are not visible inside the method definition; so the top level `a` is not available inside `my_value`. Furthermore, local variables inside the method definition are not visible outside the method definition; so the `a` inside `my_value` is a local variable with no top-level visibility.
___
#### Notes
