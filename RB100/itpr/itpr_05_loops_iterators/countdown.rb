# This program converts user input to an integer, then uses 'while' to output down from input to 0.

x = gets.chomp.to_i

while x >= 0
  puts x
  x -= 1
end

puts "done!"
