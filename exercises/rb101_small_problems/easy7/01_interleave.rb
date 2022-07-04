# frozen_string_literal: true

# def interleave(arr1, arr2)
#   combined_arr = []
#   counter = 0

#   until counter == arr1.size
#     combined_arr << arr1[counter]
#     combined_arr << arr2[counter]
#     counter += 1
#   end

#   return combined_arr
# end

# Solution 2.
# frozen_string_literal: true

# def interleave(arr1, arr2)
#   combined_arr = []
#   arr1.each_index do |i|
#     combined_arr << arr1[i]
#     combined_arr << arr2[i]
#   end

#   combined_arr
# end

# Solution 3.
# frozen_string_literal: true

# def interleave(arr1, arr2)
#   arr1.map.with_index { |ele, i| [ele, arr2[i]] }.flatten
# end

# Solution 4.
# frozen_string_literal: true

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
