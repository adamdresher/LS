# # SOLUTION 1.  BASED ON LS'S ORIGINAL SOLUTION.
# number_of_lines = nil

# loop do
#   loop do
#     puts '>> How many output lines do you want? Enter a number >= 3 (Q to quit):'
#     number_of_lines = gets.chomp
#     number_of_lines.downcase == 'q' ? break : number_of_lines = number_of_lines.to_i
#     break if number_of_lines >= 3
#     puts ">> That's not enough lines."
#   end

#   if number_of_lines.class == Integer
#     while number_of_lines > 0
#       puts 'Launch School is the best!'
#       number_of_lines -= 1
#     end
#   else
#     break
#   end
# end


# SOLUTION 2.  USING MY ORIGINAL SOLUTION FROM `lsprint.rb`.

input = nil
message = 'Launch School is the best!'
invalid = '>> Oh, sorry I forgot to mention.  You have to pick the number 3 or higher... try again!'

loop do
  puts '>> How many output lines do you want?'
  input = gets.chomp

  if input.downcase == 'q'
    break
  elsif input.to_i < 3
    puts invalid
  else
    input.to_i.times { puts message }
  end
  
  break if input.downcase == 'q'
end
