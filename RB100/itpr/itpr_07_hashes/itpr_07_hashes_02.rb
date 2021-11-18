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