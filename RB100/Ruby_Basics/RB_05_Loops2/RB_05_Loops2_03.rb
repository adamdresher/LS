# SOLUTION 1.

# loop do
#   process_the_loop = [true, false].sample
#   if process_the_loop
#     puts 'The loop was processed'
#     break
#   else
#     puts 'The loop wasn't processed!'
#   end
# end


# SOLUTION 2. USING LS HINT.

if process_the_loop
  process_the_loop = [true, false].sample
  loop do
    puts 'The loop was processed'
    break
  end
else
  puts 'The loop wasn't processed!'
end
