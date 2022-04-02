# frozen_string_literal: true

# def include?(search_arr, search_val)
#   counter = 0

#   loop do
#     return false if counter == search_arr.size

#     search_arr[counter] == search_val ? (return true) : counter += 1
#   end
# end

# Solution 2.
# frozen_string_literal: true

def include?(search_arr, search_val)
  [search_val] == search_arr.select { |ele| ele == search_val }
end

# def include?(search_arr, search_val)
#   result = search_arr.each { |ele| return true if ele == search_val }
#   # p result
#   result ? true : false
# end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false