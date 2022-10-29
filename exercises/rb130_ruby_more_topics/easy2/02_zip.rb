# stops combining at arr1's last element
# if arr2 has more elements than arr1, arr2's extra elements are ignored
# if arr2 has less elements than arr1, nil is used for arr2's missing elements

# def zip(arr1, arr2)
#   combined_arr = []
#   arr1.each_with_index { |ele, idx| combined_arr << [ele, arr2[idx]] }
#   combined_arr
# end

# def zip(arr1, arr2)
#   combined_arr = []

#   0.upto(arr1.size - 1) do |idx|
#     combined_arr << [arr1[idx], arr2[idx]]
#   end

#   combined_arr
# end

# def zip(arr1, arr2) # each_with_index returns an Enumerator of 2 ele arrays
#   arr1.each_with_index.each_with_object([]) do |(ele, idx), arr|
#     arr << [ele, arr2[idx]]
#   end
# end

def zip(arr1, arr2)
  arr1.each_index.inject([]) do |zipped_arr, idx|
    zipped_arr  << [arr1[idx], arr2[idx]]
  end
end

# def zip(arr1, arr2)
#   idx = 0
#   combined_arr = []

#   until idx == arr1.size
#     combined_arr << [arr1[idx], arr2[idx]]
#     idx += 1
#   end
#   combined_arr
# end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
p zip([1, 2, 3], [4]) == [[1, 4], [2, nil], [3, nil]]
p zip([1, 2, 3], [4, 5, 6, 7]) == [[1, 4], [2, 5], [3, 6]]
