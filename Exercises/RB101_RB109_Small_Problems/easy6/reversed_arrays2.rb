# frozen_string_literal: true

# def reverse(arr)
#   new_arr = []

#   arr.reverse_each { |ele| new_arr << ele }

#   new_arr
# end

# Solutio 2.
# frozen_string_literal: true

# def reverse(arr)
#   new_arr = []
#   counter = arr.size

#   loop do
#     break if counter.empty?

#     counter -= 1
#     new_arr << arr[counter]
#   end

#   new_arr
# end

# Solution 3.  Further Exploration.
#frozen_string_literal: true

# def reverse(arr)
#   arr.each_with_object([]) { |i, a| a.unshift(i) }
# end

# Solution 4.  Further Exploration.
# frozen_string_literal: true

def reverse(arr)
  arr.inject([], :unshift)
end
