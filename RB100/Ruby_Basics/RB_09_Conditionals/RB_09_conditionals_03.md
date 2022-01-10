## Unpredictable Weather (Part 3)
#### In the code below, sun is randomly assigned as 'visible' or 'hidden'.
```ruby
sun = ['visible', 'hidden'].sample
```
Write an `if` statement that prints `"The sun is so bright!"` if `sun` equals `visible`. Also, write an `unless` statement that prints `"The clouds are blocking the sun!"` unless `sun` equals `visible`.

When writing these statements, take advantage of Ruby's expressiveness and use statement modifiers instead of an `if...end` statement to print results only when some condition is met or not met.
___
#### Solution
```ruby
sun = ['visible', 'hidden'].sample

puts "The sun is so bright!" if sun == 'visible'
puts "The clouds are blocking the sun!" unless sun == 'visible'
```
___
#### Solution, LS
```ruby
puts "The sun is so bright!" if sun == 'visible'
puts "The clouds are blocking the sun!" unless sun == 'visible'
```
#### Discussion
By combining the use of `if` and `unless` in one solution, we're able to produce the same output as the previous two exercises.

This solution gives us an opportunity to take advantage of how expressive Ruby is. We can call `#puts` and simply append an `if` or `unless` condition to form a shorter, more readable expression. Such conditions, when added to the end of a statement like this, are called modifiers.
___
#### Notes
