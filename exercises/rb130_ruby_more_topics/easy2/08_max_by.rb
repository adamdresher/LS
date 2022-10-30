# def max_by(arr)
#   return arr.to_enum unless block_given?
#   return nil if arr.empty? # arr[1..] returns nil instead of an empty array
#   max = arr.first

#   arr[1..].each { |ele| max = ele if yield(ele) > yield(max) }
#   max
# end

# def max_by(arr)
#   return arr.to_enum unless block_given?

#   arr.inject(arr[0]) { |max, ele| yield(ele) > yield(max) ? ele : max }
# end

# def max_by(arr)
#   return arr.to_enum unless block_given?

#   max_element = arr[0]
#   return max_element if arr.size <= 1 # catches empty arrays that return nil
#   max_value = yield(arr[0])

#   current_value = nil
#   idx = 1

#   loop do
#     current_value = yield(arr[idx])
#     if current_value > max_value
#       max_element = arr[idx]
#       max_value = current_value
#     end
#     idx += 1
#     break if idx == arr.size
#   end
#   max_element
# end

def max_by(arr)
  return arr.to_enum unless block_given?

  idx = 0
  max_element = arr[0]
  return max_element if arr.size <= 1

  max_value = yield(max_element)
  current_value = nil

  while idx < arr.size
    current_value = yield(arr[idx])
    if current_value > max_value
      max_element = arr[idx]
      max_value = current_value
    end
    idx = idx.next
  end
  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } # 5
p max_by([1, 5, 3]) { |value| 9 - value } # 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } # 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } # [3, 4, 5]
p max_by([-7]) { |value| value * 3 } # -7
p max_by([]) { |value| value + 5 } # nil
