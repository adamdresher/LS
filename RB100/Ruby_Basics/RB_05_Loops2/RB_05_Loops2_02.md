## Catch the Number
#### Modify the following code so that the loop stops if `number` is equal to or between `0` and `10`.
```ruby
loop do
  number = rand(100)
  puts number
end
```
___
#### Solution
```ruby
# SOLUTION 1.

loop do
  number = rand(100)
  break if 0 <= number && number <= 10
  puts number
end


# SOLUTION 2. REFACTORED.

loop do
  number = rand(100)
  puts number <= 10 && number >= 0 ? break : number
end
```
___
#### Solution, LS
```ruby
loop do
  number = rand(100)
  puts number

  if number.between?(0, 10)
    break
  end
end
```
#### Solution, LS, Refectored
```ruby
loop do
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end
```
**Solution, LS, w Range**
```ruby
loop do
  number = rand(100)
  puts number
  break if (0..10)include? number
end
```
#### Discussion
Inside the `loop`, we're assigning a random integer to number upon each iteration. Our goal for this exercise is to create a condition that stops the `loop` if `number` is equal to or between 0 and 10. There are a couple ways we could have implemented this, however, we chose to use the `Comparable#between?` method. `#between?` takes two arguments and returns a boolean, `true` or `false`, if the caller's value is between the two integers provided. In this case, we use it in an `if` condition that will execute break when `#between?` returns `true`.
___
#### Notes
