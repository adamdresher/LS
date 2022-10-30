# def each_with_object(arr, obj)
#   return arr.to_enum unless block_given?

#   arr.each { |ele| yield(ele, obj) }
#   obj
# end

# def each_with_object(arr, obj)
#   return arr.to_enum unless block_given?

#   arr.each_with_index { |ele, _| yield([ele, obj]) }
#   obj
# end

def each_with_object(arr, obj)
  return arr.to_enum unless block_given?

  arr.inject(obj) { |memo, ele| yield([ele, memo]) ; memo }
end

# def each_with_object(arr, obj)
#   return arr.to_enum unless block_given?
#   return obj if arr.empty?

#   idx = 0
#   loop do
#     yield([arr[idx], obj])
#     idx += 1
#     break if idx == arr.size
#   end
#   obj
# end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}
