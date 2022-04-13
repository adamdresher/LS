# def teddy
#   age = rand(20..200)
#   puts "Teddy is #{age} years old!"
# end

# Solution 2.
# def teddy
#   puts "Teddy is #{rand(20..200)} years old!"
# end

# Solution 3.
# def teddy
#   age = [(20..200)].sample
#   puts "Teddy is #{age} years old!"
# end

# Solution.  Further Exploration.
# def teddy
#   puts "Give me a name, any name:"
#   name = gets.chomp
#   (name = 'Teddy') if name == ''
#   age = [(20..200)].sample
#   puts "#{name} is #{age} years old!"
# end

# Solution 2.  Further Exploration.
def teddy
  puts "Give me a name, any name:"
  if (name = gets.chomp) == '' then name = 'Teddy' end
  age = [(20..200)].sample
  puts "#{name} is #{age} years old!"
end

p teddy
