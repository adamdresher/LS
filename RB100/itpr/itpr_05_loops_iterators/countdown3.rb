# This program converts user input to an integer, then uses 'for' to output down from input to 0.

x = gets.chomp.to_i

for i in 1..x do
  puts x - i
end

puts "Done!"
