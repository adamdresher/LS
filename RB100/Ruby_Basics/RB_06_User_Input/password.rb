password = 'wubba lubba dub dub!'
user_input = nil

until user_input == password
  puts '>> Please enter your password:'
  user_input = gets.chomp
  puts '>> Invalid entry' if user_input != password
end

puts 'Welcome!'
