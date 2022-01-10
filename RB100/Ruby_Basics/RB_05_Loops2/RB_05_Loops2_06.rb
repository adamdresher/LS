# # SOLUTION 1.

# names = ['Sally', 'Joe', 'Lisa', 'Henry']
# 
# loop do
#   puts names.shift
#   break if names == []
# end


# SOLUTION 2.  REFACTORED.

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop { puts names.empty? ? break : names.shift }
