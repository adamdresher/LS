# # SOLUTION 1.

# numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers << input
#   break if numbers.length == 5
# end

# puts numbers


# # SOLUTION 2.  USING DIFFERENT METHODS.  `#length` & `#size` SEEM SIMILAR.

# numbers = []

# loop do
#   puts 'Enter any number:'
#   numbers << gets.chomp.to_i
#   if numbers.size == 5
#     puts numbers.to_s
#     break
#   end
# end


# # SOLUTION 3.  REFACTORED.

# numbers = []

# loop do
#   puts 'Enter any number:'
#   numbers << gets.chomp.to_i
#   break if numbers.size == 5
# end

# puts numbers


# SOLUTION 4.  REFACTORED AGAIN.
numbers = []

loop do
  puts 'Enter any number:'
  numbers << gets.chomp.to_i
  (puts numbers ; break) if numbers.size == 5
end
