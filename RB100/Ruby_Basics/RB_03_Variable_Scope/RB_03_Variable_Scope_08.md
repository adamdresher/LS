## What's My Value (Part 8)
#### What will the following code print, and why? Don't run the code until you have tried to answer.
```ruby
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a
```
___
#### Solution
`nameError` exception is returned.

This is because `puts a` is calling `a`, but `a` hasn't been defined within the main scope.  It has only been defined within the method's scope.
___
#### Solution, LS
If you said this would issue an error message or raise an exception, you are correct. The error is:
```
undefined local variable or method `a' for main:Object (NameError)
```
#### Discussion
Compared to the previous exercise, the difference here is that we removed the initialization of the local variable `a` in the outer-most scope before invoking the `each` method and passing in a block. This leads to a completely different result. We now get an exception when the `puts` method is invoked with the local variable `a` as an argument on line 7 because the local variable `a` is not defined in this scope.

The local variable `a` that is initialized in the block passed to the `each` method has a scope that is local to that block. Since there is no local variable named `a` initialized in a scope external to the scope of that block, the expression `a = element` on line 4 is initialization and not reassignment.
___
#### Notes
