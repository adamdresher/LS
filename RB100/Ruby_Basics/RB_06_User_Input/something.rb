# SOLUTION 1.
puts '>> Do you want me to print something? (y/n)'
answer = gets.chomp.downcase

puts 'something' if answer == 'y'


# # SOLUTION 2.  REFACTORED.
# puts '>> Do you want me to print something? (y/n)'

# gets.chomp.downcase == 'y' ? (puts 'something') : nil
