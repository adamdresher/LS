# SOLUTION 1.

# count = 1
# 
# loop do
#   puts count.even? ? "#{count} is even!" : "#{count} is odd!"
#   count += 1
#   break if count > 5
# end


# SOLUTION 2.  NOT REFACTORED 100%, BUT MORE READABLE.

count = 1

loop do
  puts "#{count} is even!" if count.even?
  puts "#{count} is odd!"  if count.odd?
  break if count == 5
  count += 1
end
