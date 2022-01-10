## Only Even
#### Using `next`, modify the code below so that it only prints even numbers.
```ruby
number = 0

until number == 10
  number += 1
  puts number
end
```
___
#### Solution
```ruby
number = 0

until number == 10
  number += 1
  puts number.even? ? number : next
end
```
___
#### Solution, LS
```ruby
number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end
```
#### Discussion
Sometimes when using a loop, you need to skip to the next iteration. That's where `next` comes in. `next` lets you skip to the next iteration based on certain conditions. In this exercise, we use `next` to skip to the next iteration when number is odd. We can use the method `Integer#odd?` to evaluate `number` and return `true` if it's an odd number.
#### Further Exploration
Why did `next` have to be placed after the incrementation of number and before `#puts`?
#### Solution
`next` has to be placed after the incrementation otherwise it will create an infinite loop once `next` encounters a value that is `true` (in the case of the LS example, when the iteration is an odd number).
`next` has to be placed before `puts` otherwise it will output the number it is trying to skip.  Putting `next` after `puts` also means there is no expression for `next` to skip before the next iteration, in other words its redundant.
___
#### Notes
