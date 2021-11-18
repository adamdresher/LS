Look at the following programs...

```
x = 0
3.times do
  x += 1
end
puts x
```
and
```
y = 0
3.times do
  y += 1
  x = y
end
puts x
```
What does x print to the screen in each case? Do they both give errors? Are the errors different? Why?

##### MY SOLUTIONS
In the first program, ```x``` should print 3.
There shouldn't be any errors.
```x``` is defined outside the scope of the method, then the method returns an updated value for ```x``` after iterating, and then outputs the value.

In the second program, ```x``` has an inner scope value of 3 and is undefined outside the scope of the method.
This means ```puts x``` will create an error.
It should say something about the variable ```x``` being undefined.  A solution for this would to define ```x``` outside the scope and before the method.
