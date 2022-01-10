# # SOLUTION 1.
# name = 'Roger'

# puts name.downcase == 'RoGeR'.downcase
# puts name.downcase == 'DAVE'.downcase

# SOLUTION 2.
name = 'Roger'

puts name.casecmp('RoGeR') == 0
puts name.casecmp('DAVE') == 0
