# def running_total(arr)
  # arr.map.with_index { |_num, i| arr[0..i].sum }
# end

# Solution 2.  Further Exploration.
# def running_total(arr)
#   arr.each_with_object([]) { |num, new_arr| new_arr << new_arr.sum + num }
# end

# Solution 3.  Further Exploration.
def running_total(arr)
  arr.inject([]) { |new_arr, num| new_arr << new_arr.sum + num }
end

p running_total([2, 5, 13]) # [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) # [14, 25, 32, 47, 67]
p running_total([3]) # [3]
p running_total([]) # []
