# OBJECTIVES
# 2 user inputs.
# both inputs must be integers, use given method to check.
# second input cannot be zero.
# divide first integer by the second.

# RESOURCE: OUTPUT FORMAT
# puts '>> 10 / 5 is 2'
# RESOURCE: ERRORS
# puts '>> Invalid input. Only integers are allowed.'
# puts '>> Invalid input. A denominator of 0 is not allowed.'

# ALGORITHM
# Define valid_number?, numerator, & denominator in outer scope.
# Use loop/s to ask user for numerator & denominator.
# Loop back if user input doesn't meet requirements, else break the loop.
# Output the division result.

# SOLUTION.

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end
numerator = nil
denominator = nil

loop do
  puts '>> Please enter the numerator:'
  numerator = gets.chomp
  valid_number?(numerator) ? break : (puts '>> Invalid input. Only integers are allowed.' ; next)
end

loop do
  puts '>> Please enter the denominator:'
  denominator = gets.chomp
  (puts '>> Invalid input.  Only integers are allowed.' ; next) if valid_number?(denominator) == false
  (puts '>> Invalid input.  A denominator of 0 is not allowed.' ; next) if denominator == "0"
  break
end

# result = numerator.to_i / denominator.to_i  # This works, but is unnecessarily less accurate.
result = numerator.to_f / denominator.to_f
puts ">> #{numerator} / #{denominator} is #{result}"

# SOLUTION, ONE LOOP.
# It works, but degrades UX.  If denominator is invalid, numerator must be entered again.

# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string
# end
# numerator = nil
# denominator = nil

# loop do
#   puts '>> Please enter the numerator:'
#   numerator = gets.chomp
#   (puts '>> Invalid input. Only integers are allowed.' ; next) if valid_number?(numerator) == false

#   puts '>> Please enter the denominator:'
#   denominator = gets.chomp
#   (puts '>> Invalid input.  Only integers are allowed.' ; next) if valid_number?(denominator) == false
#   (puts '>> Invalid input.  A denominator of 0 is not allowed.' ; next) if denominator == "0"
#   break
# end

# # result = numerator.to_i / denominator.to_i  # This works, but is unnecessarily less accurate.
# result = numerator.to_f / denominator.to_f
# puts ">> #{numerator} / #{denominator} is #{result}"
