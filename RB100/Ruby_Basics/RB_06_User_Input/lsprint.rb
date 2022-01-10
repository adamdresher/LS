# SOLUTION.

input = nil

loop do
  puts '>> How many output lines do you want?'
  input = gets.chomp.to_i
  if input < 3
    puts '>> Oh, sorry I forgot to mention.  You have to pick the number 3 or higher... try again!'
  else
    input.times { puts 'Launch School is the best!' }
    break
  end
end
