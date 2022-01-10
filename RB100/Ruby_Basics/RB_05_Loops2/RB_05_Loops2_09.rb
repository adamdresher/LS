# SOLUTION 1.

# number_a = 0
# number_b = 0
# 
# loop do
#   number_a += rand(2)
#   number_b += rand(2)

#   if number_a == 5 || number_b == 5
#     puts "5 was reached!"
#     break
#   else
#     puts "number_a is #{number_a} and number_b is #{number_b}"
#     next # next is redundant
#   end
# end


# SOLUTION 2.

# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)

#   next if number_a >= 5 || number_b >= 5
#   puts "5 was reached!"
#   break
# end


# SOLUTION 3.  Refactored.

# number_a = 0
# number_b = 0
# 
# loop do
#   number_a += rand(2)
#   number_b += rand(2)
# 
#   puts "number_a is #{number_a} and number_b is #{number_b}" 
#   number_a >= 5 || number_b >= 5 ? ((puts "5 was reached!") ; break) : next # next is redundant
# end

# SOLUTION.  Without `next`
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  (puts "5 was reached!" ; break) if number_a >= 5 || number_b >= 5
end