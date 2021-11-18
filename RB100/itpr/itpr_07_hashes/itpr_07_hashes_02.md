Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.

##### MY SOLTION
```merge``` returns a new hash but doesn't mutate the original hash.
```merge!``` also returns a new hash and mutates the original hash to reflect the ```merge!``` return.

```
favorite_food = {
  adam: "pizza",
  anna: "pasta",
  dude: "everything",
  ruby: "kibble"
}

new_friends = {
  ruby: "chef Thomas Keller's ratatouille"
}

puts "\nmerge:"
p favorite_food.merge(new_friends)

puts "\nchecking favorite_food:"
p favorite_food

puts "\nmerge!:"
p favorite_food.merge!(new_friends)
puts ""
```