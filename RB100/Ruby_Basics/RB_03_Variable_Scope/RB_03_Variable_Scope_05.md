## What's My Value (Part 5)
#### What will the following code print, and why? Don't run the code until you have tried to answer.
```ruby
a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a
```
___
#### Solution
`Xyzzy`

Although strings are mutable within a method, `=` is an assignment operator and does not mutate. This means `=` directs where to look instead of altering an actual object. So `b` doesn't influence outside local scope.
___
#### Solution, LS
`Xyzzy`
#### Discussion
This problem is nearly identical to the previous problem, except this time we are assigning directly to the variable `b`. When `my_value` begins executing, `b` is set to reference the same string that is referenced by `a`. If we modify that string by using `b`, then that modification is reflected in `a`; it's the same string.

However, we are not modifying that string in this exercise. Instead, we are assigning a completely new string to `b`. Assignment never changes the value of an object; instead, it creates a new object, and then stores a reference to that object in the variable on the left. So, at the end of `my_value`, `b` references the string `'yzzyX'`, while a remains unchanged: it still references `"Xyzzy"`.

So, how does this differ from `b[2] = '-'`? The key difference with `b[2] = '-'` is that this is not quite the same as object assignment; it is a call to a method named `[]=`, and this method updates the `String` referenced by `b`; it does not change the reference, so `a` is also referencing the modified `String`.

To summarize, assignment to a variable (an object) never mutates the object that is referenced. However, don't take that too far: if you assign to `b[2]` like we did in the previous exercise, that's a completely different operation; that actually mutates the content of the `String` referenced by `b`.
___
#### Notes
