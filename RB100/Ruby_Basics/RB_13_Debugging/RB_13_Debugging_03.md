## Multiply By Five
#### When the user inputs `10`, we expect the program to print `The result is 50!`, but that's not the output we see. Why not?
```ruby
def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp

puts "The result is #{multiply_by_five(number)}!"
```
___
#### Solution
`number = gets.chomp` returns a string due to `#gets` and is passed to `*`.  While there is a `String#*`, it doesn't act the same way an `Integer#*`.  `String#*` returns `Self` number of copies of `Self` concatenated to themselves.

This could be resolved by replacing `#chomp` with `#to_i` or appending `n` within `multiply_by_five`.
___
#### Solution, LS
```ruby
def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp.to_i

puts "The result is #{multiply_by_five(number)}!"
```
#### Discussion
We can fix this problem on line 6 by calling `String#to_i` on the user input.
___
#### Notes
