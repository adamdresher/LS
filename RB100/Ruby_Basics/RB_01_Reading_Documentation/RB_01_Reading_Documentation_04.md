## Return Value of `break`
#### In the previous exercise, you learned that the `while` loop returns `nil` unless `break` is used. Locate the documentation for `break`, and determine what value `break` sets the return value to for the `while` loop.
___
#### Solution
`break` returns `nil` unless an argument is passed to it.
___
#### Solution, LS
`break` returns `nil` when no arguments are passed to `break`, or the value of the argument when an argument is provided.
#### Discussion
Documentation for `break` is on the "control expressions" page. It tells you that `break` returns the value of the argument when given an argument. However, it doesn't explicitly say what happens when you don't.

You have to read between the lines here; the `while` loop documentation says that `while` returns nil unless `break` receives a value. So, if `break` is not supplied a value, `while` still returns nil.

Another way of figuring out that `break` returns nil when not given an argument comes from knowing that all statements in Ruby return a value -- usually nil unless the documentation says otherwise. Since no other return value makes sense for `break`, nil is the most likely value. However, this requires a bit of looking into the mind of the designer.

You can also write and run a simple program, either in irb or as a program file, to see what the return value is:
```ruby
result = while true
  `break`
end
p result
```
That is, perhaps, the best way to determine the return value.
___
#### Notes
