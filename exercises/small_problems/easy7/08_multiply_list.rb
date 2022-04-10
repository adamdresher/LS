# frozen_string_literal: true

# def multiply_list(arr1, arr2)
#   arr1.map.with_index { |num, i| num * arr2[i] }
# end

# Solution 2.
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |arr| arr.inject(:*) }
end

# Solution 3.
# def multiply_list(arr1, arr2)
#   return_list = []
#   arr1.zip(arr2) { |arr| return_list << arr.reduce(:*) }
#   return_list
# end

p multiply_list([3, 5, 7], [9, 10, 11]) # [27, 50, 77]
