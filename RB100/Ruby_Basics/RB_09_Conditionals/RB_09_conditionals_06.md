## Stoplight (Part 1)
#### In the code below, `stoplight` is randomly assigned as `'green'`, `'yellow'`, or `'red'`.
```ruby
stoplight = ['green', 'yellow', 'red'].sample
```
Write a `case` statement that prints `"Go!"` if stoplight equals `'green'`, `"Slow down!"` if `stoplight` equals `'yellow'`, and `"Stop!"` if `stoplight` equals `'red'`.
___
#### Solution
```ruby
stoplight = ['green', 'yellow', 'red'].sample

case
when stoplight == 'green'
  puts 'Go!'
when stoplight == 'yellow'
  puts 'Slow down!'
when stoplight == 'red'
  puts 'Stop!'
end
```
___
#### Solution, LS
```ruby
case stoplight
when 'green'
  puts 'Go!'
when 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end
```
#### Discussion
`case` statements are typically used when comparing multiple values to a single case. For each comparison, we use the reserve word `when`, like this:
```ruby
when <condition>
```
Following the condition, we add the operation that should be performed if the condition evaluates as `true`. We can repeat this pattern as many times as we'd like. For this exercise, however, we only need to repeat it three times.
___
#### Notes
LS's solution is both more concise and allows for the `case` condition to be called on, `stoplight`.

Interesting point to note is that `stoplight` will return the same value when passed to `#puts` and `case` (it doesn't seem to matter the order which `#puts` and `case` are invoked).
```ruby
stoplight = ['green', 'yellow', 'red'].sample

puts stoplight
case stoplight
when 'green'
  puts 'Go!'
when 'yellow'
  puts 'Slow down!'
when 'red'
  puts 'Stop!'
end
```
