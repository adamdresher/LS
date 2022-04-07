def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

# Solution.  Further Exploration.
# def powered_by_n(number, n) # edge case of n < 0 caught, but not resolved
#   result = number
#   counter = 0

#   if n == 1
#     result
#   elsif n == 0
#     result = 1
#   elsif counter < 0
#     return '<ARGUMENT ERROR; n must be a natural number>'
#   else
#     until counter == n
#       result = multiply(result, number)
#       counter += 1
#     end
#   end

#   result
# end

# Solution 2.  Further Exploration.
def powered_by_n(number, n) # edge case of n < 0 caught, but not resolved
  if n < 0 then return '<ARGUMENT ERROR; n must be a natural number>' end

  result = number
  (n + 1).times do |n|
    n == 0 ? result = 1 : result = multiply(result, number)
  end
  result
end

p square(5) == 25
p square(-8) == 64
