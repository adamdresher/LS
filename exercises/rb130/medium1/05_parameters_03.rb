items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

puts 1
gather(items) do | *beginning_items, last_item|
  puts beginning_items.join(', ')
  puts last_item
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

puts "\n2"
gather(items) do | first_item, *middle_items, last_item|
  puts first_item
  puts middle_items.join(', ')
  puts last_item
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

puts "\n3"
gather(items) do | first_item, *last_items |
  puts first_item
  puts last_items.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

puts "\n4"
gather(items) do | item1, item2, item3, item4 |
  puts "#{item1}, #{item2}, #{item3}, and #{item4}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
