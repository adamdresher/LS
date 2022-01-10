## What's My Value (Part 9)
#### What will the following code print, and why? Don't run the code until you have tried to answer.
```ruby
a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a
```
___
#### Solution
`7`

This is another tricky question by LS.  `a` is defined as a local variable in the main scope, then defined again as a parameter/local variable for the `#each` method.  Because `#each` takes a block of code, it can access the main scope's `a` variable.  However the parameter `a` takes priority and thus within `#each`, `a` has a value of `array`'s element.  As a result, `a` in the main scope is not reassigned and `puts a` outputs its original value, `7`.
___
#### Solution, LS
`7`
#### Discussion
This problem demonstrates *shadowing*. Shadowing occurs when a block argument hides a local variable that is defined outside the block. Since the outer a is shadowed, the a += 1 has no effect on it. In fact, that statement has no effect at all.
___
#### Notes
