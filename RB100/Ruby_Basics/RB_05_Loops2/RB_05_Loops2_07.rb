# # SOLUTION 1.  STOPS ITERATING AT `2`, BUT DOESN'T OUTPUT `2`.

# Stops interating at `2`, but doesn't output `2`.
# 5.times do |index|
#   puts index == 2 ? break : index
# end


# # SOLUTION 2.  OUTPUTS `2`, BUT BEGINS THE ITERATION FOR `3`.

# 5.times do |index|
#   puts index > 2 ? break : index
# end


# SOLUTION 3.  100% MEETS REQUIREMENTS.

5.times do |index|
  puts index
  break if index == 2
end
