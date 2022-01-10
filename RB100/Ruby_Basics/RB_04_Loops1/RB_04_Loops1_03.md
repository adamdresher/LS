## Control the Loop
#### Modify the following loop so it iterates 5 times instead of just once.
```ruby
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break
end
```
___
#### Solution
```ruby
iterations = 1

loop do
  if iterations <= 5
    puts "Number of iterations = #{iterations}"
    iterations += 1
  else
    break
  end
end
```
___
#### Solution, LS
```ruby
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end
```
#### Discussion
It's important to understand the basics when it comes to loops in Ruby. `loop` demonstrates what the simplest loop can look like. It iterates over the given block and stops only when the reserved word `break` is executed. In the original code, `break` is written with no conditions. This means the `loop` will stop after the first iteration.

To modify the `loop` so it stops only once it's iterated 5 times, we append an `if` statement to break. How do we know when the `loop` has iterated 5 times? We need to increment `iterations` by 1 each time the `loop` iterates over the block. We can then add the condition `iterations > 5` to our `if` statement.
#### Further Exploration
If the `break` statement is moved up one line so it runs before iterations is incremented, what would need to be changed?
___
#### Notes
