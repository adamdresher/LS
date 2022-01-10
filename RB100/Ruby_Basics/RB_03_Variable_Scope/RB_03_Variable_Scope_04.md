## What's My Value (Part 4)
#### What will the following code print, and why? Don't run the code until you have tried to answer.
```ruby
a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a
```
___
#### ~~Solution~~
`Xyzzy`

The same logic plays out as in previous exercises.  The only difference is variables are defined by letters and special characters rather than numbers.

The return value of `#my_value(a)` is `Xy-zy`.

I'm wrong.  It returns `-`.  `a` is mutated to `Xy-zy`.  This must have something to do with `a` being assigned a string vs numbers.

Okay.  So the takeaway here is that mutatable methods within a method can affect variables outside its scope.  In this case, the string method `String#[]` is mutable and thus updates the variable `a` outside of `#my_value` method.  In previous exercises, the `=` operator is not mutable, or it's not mutable on integers.
___
#### Solution, LS
`Xy-zy`
#### Discussion
This problem looks remarkably similar to the first problem in this set. However, this time we are working with a string, and we are assigning to `b[2]` instead of `b`.

The result is quite different. When we were working with a numeric variable, no changes were made to `a`. This was due to the fact that numbers are immutable, and assignment merely changes the object that a variable references. Now, though, `Strings` are mutable - they can be modified - and, in particular, the method `String#[]=` is a mutating method; it actually modifies the string. Since we are actually modifying the string referenced by `b`, and `b` references the same string as `a`, the result from printing `a` shows an update to the value of the string.
___
#### Notes
