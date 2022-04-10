# frozen_string_literal: true

def show_multiplicative_average(array_of_num)
  average = array_of_num.inject(:*).to_f / array_of_num.size

  puts "The result is #{format('%.3f', average)}"
end

# Omitting `#to_f` would result in the multiplied total being an Integer.  
# Because `#/` returns an Integer if both its caller and argument are integers, 
# ommiting `#to_f` would result in outputting a number rounded to the nearest 
# integer.
# If either `#to_f`'s caller or argument are a Float, the return value will be 
# a Float.  So `#to_f` could have been invoked on either the total of the 
# array's elements multiplied (dividend), or on the array's size (divisor).

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
