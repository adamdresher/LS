arr = ["Rick", "Birdman", "a packet of Szechuan sauce", "Morty", "Summer", "Beth", "Jerry"]

print "\nMorty: 'Yo- y- you know this is just great Rick.  It really tops the cake, you know?'\n\n"
puts "Rick: 'Wha- wha- what are you- Bwaaaaaa! talking about now Morty?'\n\n"
puts "Morty: 'Your list.  I found it on your desk after you passed out this morning.  It says here you value a packet of Szechuan sauce more than me? Really??  I- I- I thought you got all that Szechuan craving out of your system in season 1'\n\n"

arr.each_with_index { |v, i| puts "#{i}: #{v}" }

puts "\nRick: 'Ooobviously that's forged Morty.  Why would I bother putting Jerry on the list?'\n\n"
puts "Morty: '... good point.'\n\n"
