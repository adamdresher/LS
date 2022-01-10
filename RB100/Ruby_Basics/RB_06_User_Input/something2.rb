# # SOLUTION 1.  USING `if/else`.
# answer = 0

# loop do
#   puts '>> Do you want me to print something? (y/n)'
#   answer = gets.chomp.downcase

#   if answer == 'y'
#     puts 'something'
#     break
#   elsif answer == 'n'
#     break
#   else
#     puts '>> Invalid input!  Please enter y or n'
#   end

# end


# # SOLUTION 2.  USING `while`, `if/else`.
# answer = nil

# while (answer != 'n') || (answer != 'y')
#   puts '>> Do you want me to print something? (y/n)'
#   answer = gets.chomp.downcase

#   if answer == 'y'
#     puts 'something'
#     break
#   elsif answer == 'n'
#     break
#   else
#     puts '>> Invalid input!  Please enter y or n'
#   end

# end


# # SOLUTION 3.  USING `while`, `break`.
# answer = nil

# while (answer != 'y') || (answer != 'n')
#   puts '>> Do you want me to print something? (y/n)'
#   answer = gets.chomp.downcase

#   puts 'something' if answer == 'y'
#   break if (answer == 'y') || (answer == 'n')
#   puts '>> Invalid input!  Please enter y or n'
# end


# # SOLUTION 4.  USING `until`.
# answer = nil

# until (answer == 'n') || (answer == 'y')
#   puts '>> Do you want me to print something? (y/n)'
#   answer = gets.chomp.downcase

#   puts '>> Invalid input!  Please enter y or n' unless (answer == 'n') || (answer == 'y')
# end

# puts 'something' if answer == 'y'


# SOLUTION 5.  USING `until`, `break`, `next`.
answer = nil

until (answer == 'y') || (answer == 'n')
  puts '>> Do you want me to print something? (y/n)'
  answer = gets.chomp.downcase

  break if answer == 'n'
  next if answer == 'y'
  puts '>> Invalid input!  Please enter y or n'
end

puts 'something' if answer == 'y'
