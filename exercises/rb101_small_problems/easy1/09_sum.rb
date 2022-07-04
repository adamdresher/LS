# def sum(num)
#   return puts("<Argument must be a positive integer>") unless num == num.to_i && num.positive?

#   num.to_s.split('').map { |i| i.to_i }.sum
# end

# Solution 2.
def sum(num)
  return puts("<Argument must be a positive integer>") unless num == num.to_i && num.positive?

  num.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
