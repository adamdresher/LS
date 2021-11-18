Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. Then write a program that does the same thing except printing the values. Finally, write a program that prints both.

##### MY SOLUTION
```
favorite_food = {
  adam: "pizza",
  anna: "pasta",
  dude: "everything",
  ruby: "kibble"
}

puts "\nkeys:"
p favorite_food.keys
puts "\nkeys, alternative 1:"
favorite_food.each { |k, v| p k }
puts "\nkeys, alternative 2:"
favorite_food.each_key { |k| p k }


puts "\n values:"
p favorite_food.values
puts "\n values, alterative 1:"
favorite_food.each { |k, v| p v }
puts "\nvalue, alternative 2:"
favorite_food.each_value { |v| p v }

puts "\nkeys and values:"
p favorite_food
puts "\nkeys and values, alternative:"
favorite_food.each { |k, v| p "#{k.capitalize}'s favorite food is #{v}."}
```
