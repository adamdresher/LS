## What's My Value (Part 6)
#### What will the following code print, and why? Don't run the code until you have tried to answer.
```ruby
a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a
```
___
#### Solution
`7`

`#my_value` contains no methods which mutate the variable `a` in the outer scope.
When `my_value(a)` is invoked, the value of `a` is passed to `b`. Thus `b` has an assigned value `7`. When Ruby reaches a within `my_value(b)`'s scope, a nameError is returned. This exception is due to a having no assigned value within `my_value(b)`'s scope. Methods cannot receive local variables outside of their scope.

This wasn't what I initially expected, but actually makes sense now that I'm writing it all out. At first, I looked at this from an algebra point of view. Since `b` is evaluated to `7`, there is only one unknown variable. So in my head the statement was immediately divided by 2 and inferred that `b / 2 = (a + a)` / `2 is 7 / 2 = a`. However this was an assumption about how Ruby assignment works. Upon further testing, it seems local variables must be on the left of `=` when being assigned a value and cannot be mutated until it is assigned a value.
___
#### Solution, LS
If you said this would issue an error message or raise an exception, you are correct. The error is:
```ruby
`my_value': undefined local variable or method `a' for main:Object (NameError)
```
#### Discussion
Even though `a` is defined before `my_value` is defined, it is not visible inside `my_value`. Method definitions are self contained with respect to local variables. Local variables initialized inside the method definition are not visible outside the method definition, and local variables initialized outside the method definition are not visible inside the method definition.

Note, however, that local variables will be visible (via closures) inside blocks, procs, and lambdas.
___
#### Notes
