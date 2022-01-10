# SOLUTION 1.

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
  
#   puts "That's correct!" && break if answer == 4
#   puts "Wrong answer.  Try again!" if answer != 4
# end


# SOLUTION 2.  USING TERNARY FORM.

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  
  puts answer == 4 ? "That's correct!" && break : "Wrong answer.  Try again!"
end
