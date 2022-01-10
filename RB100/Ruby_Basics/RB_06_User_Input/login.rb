# SOLUTION 1.  VALIDATED WITH OPERATORS.

# username = 'Rick'
# password = 'wubba lubba dub dub!'
# username_input = nil
# password_input = nil

# until (username_input == username) && (password_input == password)
#   puts '>> Please enter your username:'
#   username_input = gets.chomp
#   puts '>> Please enter your password:'
#   password_input = gets.chomp
  
#   puts ">> Invalid entry\n\n" if (username_input != username) || (password_input != password)
# end
# puts 'Welcome!'


# SOLUTION 2.  VALIDATED WITH A HASH.

login = {
  user_01: ['Rick', 'wubba lubba dub dub!'],
  user_02: ['Morty', 'C-137'],
  user_03: ['Birdperson', 'Tammy']
  }

loop do
  login_check = Hash.new

  puts '>> Please enter your username:'
  username_input = gets.chomp
  puts '>> Please enter your password:'
  password_input = gets.chomp
  
  login_check[:user_input] = [username_input, password_input]

  if login.any? { |k, v| v == login_check[:user_input] }
    puts "Welcome #{login_check[:user_input][0]}!"
    break
  end
  
  puts ">> Invalid entry\n\n"
end
