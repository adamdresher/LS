# SOLUTION 1.

# loop do
#   number = rand(100)
#   break if 0 <= number && number <= 10
#   puts number
# end


# SOLUTION 2.  REFACTORED.

loop do
  number = rand(100)
  puts number <= 10 && number >= 0 ? break : number
end
