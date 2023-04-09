def decrease(counter)
  counter -= 1
end

counter = 10

# 10.times do # doesn't link countdown to counter
until counter == 0 # links countdown to counter and is more readable
  puts counter
  counter = decrease(counter) # method doesn't mutate
end

puts 'LAUNCH!'
