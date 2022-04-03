# frozen_string_literal: true

# def reverse(arr)
#   new_arr = []

#   arr.reverse_each { |ele| new_arr << ele }

#   new_arr
# end

# Solution 2.
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

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
