## Stoplight (Part 3)
#### Reformat the following `case` statement so that it only takes up 5 lines.
```ruby
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts 'Go!'
when 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end
```
___
#### Solution
```ruby
stoplight = ['green', 'yellow', 'red'].sample

stoplight
puts 'Go!'        if stoplight == 'green'
puts 'Slow down!' if stoplight == 'yellow'
puts 'Stop!'      if stoplight == 'red'
```
___
#### Solution, LS
```ruby
case stoplight
when 'green'  then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else               puts 'Stop!'
end
```
#### Discussion
Knowing how to format code properly plays a huge role in the readability of your code. In our solution, the reserved word then creates a smooth transition between the condition and operation `when` combining them on a single line. Take note that `then` isn't used for `else`, only `when`.

If you compare the before and after, you'll notice the significant difference in format. And hopefully, you can see that the latter is much easier to comprehend. This is largely due to how we spaced out each piece of code. Notice how both then keywords are aligned vertically, as well as all three `#puts`. Formatting this way may take time to get used to, but it will surely be beneficial the next time someone reads your code, even if that person is you.

One thing to keep in mind with this formatting style is that it works best when all of the `when` clauses have exactly one statement. If you have multiple statements, put them on separate lines, just like the original code:
```ruby
case stoplight
when 'green'
  puts 'Go!'
  accelerate
when 'yellow'
  puts 'Slow down!'
  decelerate
else
  puts 'Stop!'
  stop
end
```
___
#### Notes
The solution was simpler than I expected.  I thought the goal was to refactor the enter program, not just the `case` statement.  I know it literally says to refactor the `case` statement, but it seemed so obvious..

The logic behind LS's solution makes sense though and I like the reasoning.  Formating for readability is king.
