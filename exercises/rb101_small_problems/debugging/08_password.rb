password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password # unnecessary assignment
end

# def verify_password # password should be defined as a parameter
def verify_password(password) # password is defined as a parameter
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password # password is an undefined variable
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  # set_password # return value is not used
  password = set_password # return value is saved
end

# verify_password # returns an undefined variable NameError
verify_password(password)
